using Bogus;
using System.Text;

Faker faker = new Faker();
StringBuilder sb = new StringBuilder();

sb.AppendLine("USE EmailApplicationDB;");
sb.AppendLine("GO");
sb.AppendLine();

// Reset Tables
sb.AppendLine("DELETE FROM EmailToReceiver;");
sb.AppendLine("DELETE FROM Email;");
sb.AppendLine("DELETE FROM Account;");
sb.AppendLine("DBCC CHECKIDENT ('Account', RESEED, 0);");
sb.AppendLine("DBCC CHECKIDENT ('Email', RESEED, 0);");
sb.AppendLine("GO");
sb.AppendLine();

// Generate 10 accounts
sb.AppendLine("-- Accounts");
List<string> names = new List<string> {
    "Alice Johnson", "Bob Smith", "Carol White", "Dave Brown",
    "Eve Davis", "Frank Miller", "Grace Wilson", "Henry Moore",
    "Iris Taylor", "Jack Anderson"
};

List<string> emailAddresses = new List<string>();

foreach (string name in names)
{
    string[] parts = name.Split(' ');
    string email = $"{parts[0].ToLower()}.{parts[1].ToLower()}@example.com";
    emailAddresses.Add(email);

    sb.AppendLine($"INSERT INTO Account (EmailAddress, AccountName, PasswordHash, DateCreated, DateLastLogin)");
    sb.AppendLine($"VALUES (N'{email}', N'{name}', '{BCrypt.Net.BCrypt.HashPassword("password")}', GETDATE(), GETDATE());");
}

sb.AppendLine();
sb.AppendLine("GO");
sb.AppendLine();

// Generate emails and receiver relationships
sb.AppendLine("-- Emails and Receivers");
Random rng = new Random();

for (int account = 1; account <= 10; account++)
{
    for (int i = 0; i < 30; i++)
    {
        // Pick a random sender that isn't the receiving account
        int senderIndex = rng.Next(1, 11);
        while (senderIndex == account)
        {
            senderIndex = rng.Next(1, 11);
        }

        string subject = faker.Lorem.Sentence(5).Replace("'", "''");
        string body = faker.Lorem.Paragraphs(rng.Next(1, 4)).Replace("'", "''");
        int daysAgo = rng.Next(1, 120); // spread over past 4 months
        bool isRead = rng.NextDouble() > 0.35; // 65% read
        bool isMarked = rng.NextDouble() > 0.85; // 15% marked

        sb.AppendLine($"DECLARE @MailID_{account}_{i} INT;");
        sb.AppendLine($"INSERT INTO Email (SenderID, Subject, Body, DateCreated)");
        sb.AppendLine($"VALUES ({senderIndex}, N'{subject}', N'{body}', DATEADD(day, -{daysAgo}, GETDATE()));");
        sb.AppendLine($"SET @MailID_{account}_{i} = SCOPE_IDENTITY();");

        string dateRead = isRead
            ? $"DATEADD(day, -{daysAgo - 1}, GETDATE())"
            : "NULL";

        sb.AppendLine($"INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)");
        sb.AppendLine($"VALUES (@MailID_{account}_{i}, {account}, 3, {(isMarked ? 1 : 0)}, 0, NULL, DATEADD(day, -{daysAgo}, GETDATE()), DATEADD(day, -{daysAgo}, GETDATE()), {dateRead});");
        sb.AppendLine();
    }
}

File.WriteAllText("SeedData.sql", sb.ToString());
Console.WriteLine("SeedData.sql generated successfully.");