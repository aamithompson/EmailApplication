USE EmailApplicationDB;
GO

INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES
    (3, 2, 1, 0, 0, NULL, GETDATE(), GETDATE(), NULL),
    (3, 3, 1, 0, 0, NULL, GETDATE(), GETDATE(), NULL);