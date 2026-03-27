USE EmailApplicationDB;
GO

INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES
    (1, 'Hello Bob', 'Hey Bob, just checking in. Hope you are doing well!', GETDATE()),
    (2, 'Project Update', 'Alice, the project is on track for delivery next week.', GETDATE()),
    (3, 'Meeting Tomorrow', 'Hi everyone, reminder that we have a meeting tomorrow at 10am.', GETDATE()),
    (1, 'Quick Question', 'Bob, did you get a chance to review the documents I sent?', GETDATE());