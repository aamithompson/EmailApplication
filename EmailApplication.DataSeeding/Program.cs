using Bogus;
using System.Text;

Faker faker = new Faker();
StringBuilder sb = new StringBuilder();

sb.AppendLine("USE EmailApplicationDB;");
sb.AppendLine("GO");
sb.AppendLine();

// Reset Tables
sb.AppendLine("DELETE FROM AccountInboxState;");
sb.AppendLine("DELETE FROM EmailToReceiver;");
sb.AppendLine("DELETE FROM Email;");
sb.AppendLine("DELETE FROM Account;");
sb.AppendLine("DBCC CHECKIDENT ('Account', RESEED, 0);");
sb.AppendLine("DBCC CHECKIDENT ('Email', RESEED, 0);");
sb.AppendLine("DBCC CHECKIDENT ('AccountInboxState', RESEED, 0);");
sb.AppendLine("GO");
sb.AppendLine();

// Generate 10 accounts
sb.AppendLine("-- Accounts");
List<string> names = new List<string> {
    "Alice Johnson", "Bob Smith", "Carol White", "Dave Brown",
    "Eve Davis", "Frank Miller", "Grace Wilson", "Henry Moore",
    "Iris Taylor", "Jack Anderson"
};
int n = names.Count;

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
DateTime?[] lastModification = new DateTime?[n];

for (int account = 1; account <= n; account++)
{
    int senderIndex = 0;
    for (int i = 0; i < 150; i++)
    {
        // Pick a random sender that isn't the receiving account
        senderIndex = rng.Next(1, n+1);
        while (senderIndex == account)
        {
            senderIndex = rng.Next(1, n+1);
        }

        //Email
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

        //EmailToReceiver
        sb.AppendLine($"INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)");
        sb.AppendLine($"VALUES (@MailID_{account}_{i}, {account}, 3, {(isMarked ? 1 : 0)}, 0, NULL, DATEADD(day, -{daysAgo}, GETDATE()), DATEADD(day, -{daysAgo}, GETDATE()), {dateRead});");
        sb.AppendLine();

        //AccountInboxState
        DateTime date = DateTime.Now.AddDays(-daysAgo);
        if(lastModification[account-1] == null || lastModification[account-1] < date) {
            lastModification[account-1] = date;
        }
    }

    sb.AppendLine($"MERGE AccountInboxState AS target");
    sb.AppendLine($"USING (VALUES ({account}, {0}, {150}, '{lastModification[account-1]:yyyy-MM-dd HH:mm:ss}'))");
    sb.AppendLine($"    AS source (AccountID, Category, MailCount, DateLastModified)");
    sb.AppendLine($"ON target.AccountID = source.AccountID");
    sb.AppendLine($"    AND target.Category = source.Category");
    sb.AppendLine($"WHEN MATCHED THEN");
    sb.AppendLine($"    UPDATE SET DateLastModified = source.DateLastModified");
    sb.AppendLine($"WHEN NOT MATCHED THEN");
    sb.AppendLine($"    INSERT (AccountID, Category, MailCount, DateLastModified)");
    sb.AppendLine($"    VALUES (source.AccountID, source.Category, source.MailCount, source.DateLastModified);");
    sb.AppendLine();
}

File.WriteAllText("SeedData.sql", sb.ToString());
Console.WriteLine("SeedData.sql generated successfully.");