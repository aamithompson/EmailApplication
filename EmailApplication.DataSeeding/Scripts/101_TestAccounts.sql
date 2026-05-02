USE EmailApplicationDB;
GO

INSERT INTO Account (EmailAddress, AccountName, PasswordHash, DateCreated, DateLastLogin)
VALUES 
    ('alice@example.com', 'Alice', 'placeholder_hash', GETDATE(), GETDATE()),
    ('bob@example.com', 'Bob', 'placeholder_hash', GETDATE(), GETDATE()),
    ('carol@example.com', 'Carol', 'placeholder_hash', GETDATE(), GETDATE()),
    ('dave@example.com', 'Dave', 'placeholder_hash', GETDATE(), GETDATE());