USE EmailApplicationDB;
GO

CREATE TABLE AccountInboxState (
	StateID INT PRIMARY KEY IDENTITY(1,1),
	AccountID INT NOT NULL FOREIGN KEY REFERENCES Account(AccountID),
	Category INT NOT NULL,
	MailCount INT NOT NULL,
	DateLastModified DATETIME NOT NULL,
	UNIQUE (AccountID, Category)
);

CREATE INDEX idx_receiver_date
ON EmailToReceiver (ReceiverID, DateReceived DESC);