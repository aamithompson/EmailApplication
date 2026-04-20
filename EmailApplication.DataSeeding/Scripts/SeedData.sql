USE EmailApplicationDB;
GO

DELETE FROM AccountInboxState;
DELETE FROM EmailToReceiver;
DELETE FROM Email;
DELETE FROM Account;
DBCC CHECKIDENT ('Account', RESEED, 0);
DBCC CHECKIDENT ('Email', RESEED, 0);
DBCC CHECKIDENT ('AccountInboxState', RESEED, 0);
GO

-- Accounts
INSERT INTO Account (EmailAddress, AccountName, PasswordHash, DateCreated, DateLastLogin)
VALUES (N'alice.johnson@example.com', N'Alice Johnson', '$2a$11$hOep4rHxbE0s5rewfPlb3uEmOoyG5RnLFcwbROlG.qNgDdeMLeFO6', GETDATE(), GETDATE());
INSERT INTO Account (EmailAddress, AccountName, PasswordHash, DateCreated, DateLastLogin)
VALUES (N'bob.smith@example.com', N'Bob Smith', '$2a$11$bsRyRwva/LE1CVFTUfDcNeaJHUWinnYwImxjhQK.f45BAePoNcKPS', GETDATE(), GETDATE());
INSERT INTO Account (EmailAddress, AccountName, PasswordHash, DateCreated, DateLastLogin)
VALUES (N'carol.white@example.com', N'Carol White', '$2a$11$8qnqjvzHtqgJcClRcxYFguz3npfwOnHBk9/h/Z8v/s9UT1kVIaMKS', GETDATE(), GETDATE());
INSERT INTO Account (EmailAddress, AccountName, PasswordHash, DateCreated, DateLastLogin)
VALUES (N'dave.brown@example.com', N'Dave Brown', '$2a$11$yYJRcN7p7g/HPAT99EvXK.ywYONAoEvVtm/DWeRcMDAvq9c8coThy', GETDATE(), GETDATE());
INSERT INTO Account (EmailAddress, AccountName, PasswordHash, DateCreated, DateLastLogin)
VALUES (N'eve.davis@example.com', N'Eve Davis', '$2a$11$FGMZ.ChXKMgZMN5iQ.61vOW2ppi3fg89Sv.9U5rNXmY28cUsPIS..', GETDATE(), GETDATE());
INSERT INTO Account (EmailAddress, AccountName, PasswordHash, DateCreated, DateLastLogin)
VALUES (N'frank.miller@example.com', N'Frank Miller', '$2a$11$6a61pOYXZvW7Ci69JAA.Vu8LpEy2/riHyuLqyuPDlGQSlYNIszv0S', GETDATE(), GETDATE());
INSERT INTO Account (EmailAddress, AccountName, PasswordHash, DateCreated, DateLastLogin)
VALUES (N'grace.wilson@example.com', N'Grace Wilson', '$2a$11$tkkGyd64W0VYnUC.My63qO.vkxuMf4kitaoHpVTxX4vQ4DzKYcQ7S', GETDATE(), GETDATE());
INSERT INTO Account (EmailAddress, AccountName, PasswordHash, DateCreated, DateLastLogin)
VALUES (N'henry.moore@example.com', N'Henry Moore', '$2a$11$.RD93/gsoPtOkx6Rt6Cccu2lYtEC7k2ychiLVWnvrE68Ho4lDk0aG', GETDATE(), GETDATE());
INSERT INTO Account (EmailAddress, AccountName, PasswordHash, DateCreated, DateLastLogin)
VALUES (N'iris.taylor@example.com', N'Iris Taylor', '$2a$11$F3BKwDHkFVnvYyRIbJRgkurzBbmidufd5B3fkEa0t6oLM9LJNJpCa', GETDATE(), GETDATE());
INSERT INTO Account (EmailAddress, AccountName, PasswordHash, DateCreated, DateLastLogin)
VALUES (N'jack.anderson@example.com', N'Jack Anderson', '$2a$11$TSC.ss9hrFA5pz6ZIhjsvOhPJoOHoIqTewtnoTMQ97Q8MqPJdl.gG', GETDATE(), GETDATE());

GO

-- Emails and Receivers
DECLARE @MailID_1_0 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (7, N'Amet aut et voluptatibus dignissimos.', N'Dolor accusantium fuga animi dolore. Ratione veritatis amet voluptatem quis quae doloribus aut voluptatem praesentium. Fuga sed eum voluptatibus numquam at sequi. Voluptatem consequuntur consequatur rerum ea et et. Aut illum doloremque quod incidunt perspiciatis rerum autem sit temporibus. Omnis qui ipsam reiciendis natus ut iste.', DATEADD(day, -19, GETDATE()));
SET @MailID_1_0 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_1_0, 1, 3, 0, 0, NULL, DATEADD(day, -19, GETDATE()), DATEADD(day, -19, GETDATE()), NULL);

DECLARE @MailID_1_1 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (7, N'Nisi inventore quis at magnam.', N'Labore fugit velit ea quae error nihil dicta. Architecto quis quam voluptatum aliquam sit sed et est. Vitae corrupti aut repellendus rerum. Ad consequatur dolor atque aut optio. Sit occaecati aut adipisci quisquam porro cum consequuntur provident.', DATEADD(day, -113, GETDATE()));
SET @MailID_1_1 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_1_1, 1, 3, 1, 0, NULL, DATEADD(day, -113, GETDATE()), DATEADD(day, -113, GETDATE()), DATEADD(day, -112, GETDATE()));

DECLARE @MailID_1_2 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (9, N'Et voluptatem voluptates unde incidunt.', N'Nobis quidem numquam. Esse illum quaerat qui blanditiis. Quod voluptas enim qui aperiam. Provident veritatis vitae doloremque ea. Quidem nihil alias fugit. Aut rem qui aut.

Ipsa voluptas eius nesciunt aspernatur et cupiditate voluptas eveniet. Earum odit in aut occaecati repellendus suscipit voluptatibus. Modi enim qui omnis in. Ex facilis labore dolorum fugit ut dolor.

Enim nobis et est atque voluptas placeat dolorem. Est aut quod. Est voluptas consequatur molestias ipsam accusamus a rerum omnis. Quam dolores sunt nobis consequatur ea corrupti maxime veritatis voluptatem. Perferendis minus dignissimos aut asperiores eveniet.', DATEADD(day, -90, GETDATE()));
SET @MailID_1_2 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_1_2, 1, 3, 0, 0, NULL, DATEADD(day, -90, GETDATE()), DATEADD(day, -90, GETDATE()), NULL);

DECLARE @MailID_1_3 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (10, N'Deleniti consequuntur autem quo numquam.', N'Impedit nostrum ipsum ea et blanditiis ipsum et. Aut eveniet sit consequatur sunt. Illo itaque inventore aut. Voluptatem iure ad pariatur possimus nisi consequatur labore dolor. Blanditiis non accusantium impedit rerum ea illo. Quia et tempore eligendi debitis omnis.

Ea dolor veritatis aperiam provident dolorum quasi consequatur aut sunt. Qui vero perferendis aut natus. In harum consequatur ex sunt consequatur tempore alias modi architecto.

Pariatur recusandae non voluptatem rerum quis assumenda a est nam. Est omnis qui quisquam. Eum soluta dolor dolorem eum.', DATEADD(day, -30, GETDATE()));
SET @MailID_1_3 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_1_3, 1, 3, 1, 0, NULL, DATEADD(day, -30, GETDATE()), DATEADD(day, -30, GETDATE()), DATEADD(day, -29, GETDATE()));

DECLARE @MailID_1_4 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (7, N'Illo omnis sunt voluptatem consequatur.', N'Accusantium id similique nostrum laboriosam consequatur. Velit iste accusamus ut omnis. Officia esse ab rerum illo eaque.', DATEADD(day, -61, GETDATE()));
SET @MailID_1_4 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_1_4, 1, 3, 1, 0, NULL, DATEADD(day, -61, GETDATE()), DATEADD(day, -61, GETDATE()), DATEADD(day, -60, GETDATE()));

DECLARE @MailID_1_5 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (8, N'Unde hic magni itaque ipsum.', N'Sit ullam deleniti adipisci veritatis sunt repudiandae natus eveniet. Quia nobis placeat exercitationem recusandae quia non maiores. Aut reprehenderit ut eos tempore dicta fuga animi. Assumenda modi veritatis voluptatibus culpa eaque libero consequatur laborum sed. Quos necessitatibus sint. Dolor nam suscipit aut exercitationem in labore est voluptatem.

Facilis quam optio laudantium explicabo neque voluptates blanditiis qui repellat. Nisi qui ipsam asperiores. Vero id vitae reprehenderit quaerat quae id.

Quos minus sed molestias. Dolorem voluptatum illum dolores dolor unde minus enim. Asperiores est molestias. Laborum distinctio eum ex laboriosam ut vel. Non dolore ut dolorum atque qui maxime natus sapiente tenetur. Fuga laborum omnis rerum perferendis possimus assumenda quaerat.', DATEADD(day, -48, GETDATE()));
SET @MailID_1_5 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_1_5, 1, 3, 1, 0, NULL, DATEADD(day, -48, GETDATE()), DATEADD(day, -48, GETDATE()), DATEADD(day, -47, GETDATE()));

DECLARE @MailID_1_6 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (3, N'Explicabo omnis nihil placeat ab.', N'Corporis nobis velit dignissimos a voluptas dolorum veritatis porro. Ut est alias consequatur quia. Qui deleniti doloribus accusamus deleniti vel voluptatem sint optio ea.

Mollitia dolorem alias. Pariatur eum deleniti. Et aliquam omnis veniam accusamus cum praesentium qui et neque.

Voluptatem omnis aut et qui. Et numquam pariatur. Labore dolore non.', DATEADD(day, -92, GETDATE()));
SET @MailID_1_6 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_1_6, 1, 3, 1, 0, NULL, DATEADD(day, -92, GETDATE()), DATEADD(day, -92, GETDATE()), NULL);

DECLARE @MailID_1_7 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (8, N'Consectetur fuga eveniet vel exercitationem.', N'Deserunt veritatis molestiae expedita occaecati omnis fugiat ea qui illum. Harum omnis molestiae. Fugit sit et animi amet dolor nemo occaecati accusamus rerum. Autem voluptate ut voluptas. Porro mollitia asperiores dolor dolores quia similique sunt iste. Libero odit suscipit unde similique id itaque voluptas natus eaque.', DATEADD(day, -54, GETDATE()));
SET @MailID_1_7 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_1_7, 1, 3, 0, 0, NULL, DATEADD(day, -54, GETDATE()), DATEADD(day, -54, GETDATE()), NULL);

DECLARE @MailID_1_8 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (4, N'Impedit deserunt mollitia repellat esse.', N'Rem sapiente et dolores possimus fugit. Id quis cumque nostrum ab sit doloribus. Excepturi quia suscipit error odio sit at temporibus sint. Sit officia fugiat inventore in corporis eos deserunt. Deleniti illo possimus harum dolorem architecto omnis non.', DATEADD(day, -118, GETDATE()));
SET @MailID_1_8 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_1_8, 1, 3, 0, 0, NULL, DATEADD(day, -118, GETDATE()), DATEADD(day, -118, GETDATE()), NULL);

DECLARE @MailID_1_9 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (6, N'At vel inventore accusantium omnis.', N'Labore aliquam ut voluptatem magni. Et quia maiores ullam debitis autem ut illo necessitatibus. Eum exercitationem dolorem aut quidem rerum et minus dolorem ipsa.', DATEADD(day, -15, GETDATE()));
SET @MailID_1_9 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_1_9, 1, 3, 0, 0, NULL, DATEADD(day, -15, GETDATE()), DATEADD(day, -15, GETDATE()), NULL);

DECLARE @MailID_1_10 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (7, N'Ut iure veniam voluptatem aut.', N'Eum nam natus. Reiciendis eius excepturi nemo sit iste neque voluptate. Quisquam voluptate id ut repellendus at minus ratione.

Voluptas culpa quis ab unde. Deserunt sapiente error. Nobis molestias laborum. Quam sed maxime id nihil est impedit nihil officia ut. Iure expedita in ex vero quia occaecati. Cupiditate soluta rem ea sit soluta repellat nobis quibusdam tempora.', DATEADD(day, -84, GETDATE()));
SET @MailID_1_10 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_1_10, 1, 3, 0, 0, NULL, DATEADD(day, -84, GETDATE()), DATEADD(day, -84, GETDATE()), DATEADD(day, -83, GETDATE()));

DECLARE @MailID_1_11 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (2, N'Dolorem repellat et cupiditate neque.', N'Quia voluptas et omnis iste minus dolor. Consequatur sint et. Quos quo ut tempore et sit iste in aut. Ut possimus iste laborum voluptatum rerum molestias totam incidunt doloremque.

Cumque cumque voluptatum officiis tempora odit. Eaque nam quia. Qui aspernatur sit tempora sed sunt eius quis. Sit adipisci earum porro odit et cum et. Rerum quos rem ipsam consequuntur.

Alias voluptatem recusandae laboriosam autem est non deleniti harum et. Illo est eveniet consequatur quia et. Placeat enim deleniti iure qui iste. Nihil perspiciatis laudantium neque aliquam perferendis. Iure laborum rerum vel.', DATEADD(day, -87, GETDATE()));
SET @MailID_1_11 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_1_11, 1, 3, 0, 0, NULL, DATEADD(day, -87, GETDATE()), DATEADD(day, -87, GETDATE()), DATEADD(day, -86, GETDATE()));

DECLARE @MailID_1_12 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (7, N'Quas hic in repudiandae rem.', N'Modi laborum quam. Exercitationem temporibus minima molestiae atque eum. Porro sunt doloribus at ut natus aut necessitatibus in.

Alias nostrum sed doloribus. Et nihil vero totam adipisci magnam quo modi fuga libero. Rerum qui illo aut recusandae qui porro voluptatem qui cumque. Expedita accusantium non doloremque vel vel. Libero consequatur assumenda. Similique cum temporibus.', DATEADD(day, -6, GETDATE()));
SET @MailID_1_12 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_1_12, 1, 3, 0, 0, NULL, DATEADD(day, -6, GETDATE()), DATEADD(day, -6, GETDATE()), DATEADD(day, -5, GETDATE()));

DECLARE @MailID_1_13 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (4, N'Quod accusantium et voluptatem officia.', N'Omnis quaerat neque reprehenderit nulla et delectus hic natus commodi. Ducimus est est inventore hic ut velit enim sed non. Soluta et autem nihil natus possimus. Odio velit impedit qui sapiente voluptate. Eaque magni repudiandae nulla consectetur sed cupiditate maiores. Itaque voluptatem qui delectus commodi odit expedita at et.', DATEADD(day, -104, GETDATE()));
SET @MailID_1_13 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_1_13, 1, 3, 1, 0, NULL, DATEADD(day, -104, GETDATE()), DATEADD(day, -104, GETDATE()), DATEADD(day, -103, GETDATE()));

DECLARE @MailID_1_14 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (4, N'Eos et numquam est laborum.', N'Velit earum voluptas enim voluptas adipisci odit. Aut nam minima. Est itaque culpa delectus inventore ab. Dolorem quis aut quis voluptatum. Possimus enim dolores corporis assumenda voluptatem id. Rerum dignissimos placeat veritatis.

Sit quis enim magnam iure sequi. Non quod provident ratione atque ut hic occaecati odit. Corporis omnis dignissimos non est dolores eius quia cupiditate.', DATEADD(day, -11, GETDATE()));
SET @MailID_1_14 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_1_14, 1, 3, 0, 0, NULL, DATEADD(day, -11, GETDATE()), DATEADD(day, -11, GETDATE()), DATEADD(day, -10, GETDATE()));

DECLARE @MailID_1_15 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (10, N'Quas dolores omnis consequatur magni.', N'Similique unde reprehenderit. Est cumque placeat doloremque quibusdam porro. Veniam enim amet magni id nobis provident et.

Sequi voluptas architecto. Facilis quod illo officiis qui suscipit eius quas molestiae. Sunt consequatur veniam laboriosam perspiciatis qui magnam nam nobis. Optio consequuntur placeat deleniti voluptatem voluptas vel voluptatem. Et unde velit. Perferendis et ullam aut modi nihil.', DATEADD(day, -33, GETDATE()));
SET @MailID_1_15 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_1_15, 1, 3, 0, 0, NULL, DATEADD(day, -33, GETDATE()), DATEADD(day, -33, GETDATE()), NULL);

DECLARE @MailID_1_16 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (8, N'Cupiditate quisquam accusantium vitae ducimus.', N'Doloribus dolores porro earum aliquid earum id aspernatur laboriosam consequatur. Ipsum aperiam suscipit esse. Aut occaecati et. Quo placeat sit soluta ipsam et tempora. Exercitationem est eum sunt cumque omnis quasi architecto impedit nam.

Nihil soluta doloribus est eaque est et labore omnis odit. Nesciunt sequi enim praesentium. Reprehenderit consequatur optio omnis. Consectetur sed nihil quia nisi tempore.

Amet quia et fugit nemo. Quos quaerat recusandae omnis ut ea aspernatur. Omnis ducimus cum modi dolor. Qui et exercitationem esse voluptatem cumque nulla quis et error.', DATEADD(day, -104, GETDATE()));
SET @MailID_1_16 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_1_16, 1, 3, 0, 0, NULL, DATEADD(day, -104, GETDATE()), DATEADD(day, -104, GETDATE()), DATEADD(day, -103, GETDATE()));

DECLARE @MailID_1_17 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (8, N'Adipisci autem cupiditate dolores autem.', N'Accusantium sunt non dolor et iusto et id. Maiores vel autem deserunt ipsa odio commodi modi. Cupiditate cum sed. Facere quia sit qui quisquam. Rem ut pariatur dolor officiis architecto rem numquam. Officia aut aut velit repellat et aperiam.', DATEADD(day, -25, GETDATE()));
SET @MailID_1_17 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_1_17, 1, 3, 0, 0, NULL, DATEADD(day, -25, GETDATE()), DATEADD(day, -25, GETDATE()), NULL);

DECLARE @MailID_1_18 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (8, N'Et similique commodi aut nam.', N'Magni possimus id reprehenderit. Sit architecto voluptatem optio perferendis nihil. Velit neque error dolores. Et eius a esse qui non molestiae aut a exercitationem. Minus natus quidem.', DATEADD(day, -100, GETDATE()));
SET @MailID_1_18 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_1_18, 1, 3, 0, 0, NULL, DATEADD(day, -100, GETDATE()), DATEADD(day, -100, GETDATE()), NULL);

DECLARE @MailID_1_19 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (4, N'Dignissimos necessitatibus vitae facere sed.', N'Porro odit ipsum perferendis minus qui ullam unde eaque commodi. Ad autem libero voluptates. Et debitis est voluptatem consectetur et veniam. Non suscipit accusantium excepturi non exercitationem aliquid vitae ratione placeat. Ut repellendus fugit saepe. Dignissimos fuga aut atque.

Ducimus quas veniam earum et harum et voluptas et provident. Omnis velit aliquam. Nihil non accusantium.', DATEADD(day, -39, GETDATE()));
SET @MailID_1_19 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_1_19, 1, 3, 0, 0, NULL, DATEADD(day, -39, GETDATE()), DATEADD(day, -39, GETDATE()), DATEADD(day, -38, GETDATE()));

DECLARE @MailID_1_20 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (10, N'Et praesentium officia non ut.', N'Rerum consequatur aut iusto sunt animi eius. Tempore fuga qui fuga non minus voluptates molestiae harum. Sunt est eaque expedita corporis est beatae perspiciatis.

Doloribus magnam in et harum enim natus id. Dolor et sed molestias voluptatibus. Quas voluptatem et esse provident voluptatem repellat id quo. Ut itaque vero labore itaque ab consequatur voluptates est. Ipsam laudantium ut doloremque dolores dolorum nihil quod. Quos sit eveniet ea sunt sit quibusdam.', DATEADD(day, -37, GETDATE()));
SET @MailID_1_20 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_1_20, 1, 3, 0, 0, NULL, DATEADD(day, -37, GETDATE()), DATEADD(day, -37, GETDATE()), DATEADD(day, -36, GETDATE()));

DECLARE @MailID_1_21 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (5, N'Aut officiis vero a enim.', N'Ullam nisi amet consectetur accusantium. Enim unde dolore impedit omnis. Doloremque vel ea consequatur eius iusto ut autem inventore molestias. Aliquam labore ea atque. Aut distinctio impedit ut corporis id nulla aut voluptas. Et provident est.', DATEADD(day, -109, GETDATE()));
SET @MailID_1_21 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_1_21, 1, 3, 0, 0, NULL, DATEADD(day, -109, GETDATE()), DATEADD(day, -109, GETDATE()), NULL);

DECLARE @MailID_1_22 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (3, N'Est voluptatem rerum qui tenetur.', N'Suscipit ipsa et amet sint rerum. Earum adipisci dignissimos. Cum autem repudiandae consectetur rerum rerum non. Aut ipsa et harum consequuntur voluptatem alias excepturi aut omnis. Nemo iste omnis.

Doloribus enim quis quas similique aspernatur veritatis. Quos tempore aspernatur quis. Ut assumenda doloribus exercitationem tempore voluptatem doloribus fugit accusamus expedita.

Velit enim vero non qui sint. Dolores est et sint hic aliquid voluptas maiores quisquam sed. Sunt voluptate quam ut nisi consequatur. Eum non nam aut.', DATEADD(day, -62, GETDATE()));
SET @MailID_1_22 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_1_22, 1, 3, 0, 0, NULL, DATEADD(day, -62, GETDATE()), DATEADD(day, -62, GETDATE()), DATEADD(day, -61, GETDATE()));

DECLARE @MailID_1_23 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (5, N'Inventore in rerum inventore qui.', N'Ea accusantium natus esse ad deserunt quos et. Officia ratione nemo qui architecto odio vel officiis. Voluptatibus neque deleniti sed dolores magni.', DATEADD(day, -97, GETDATE()));
SET @MailID_1_23 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_1_23, 1, 3, 0, 0, NULL, DATEADD(day, -97, GETDATE()), DATEADD(day, -97, GETDATE()), NULL);

DECLARE @MailID_1_24 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (6, N'Possimus rem accusantium rerum nisi.', N'Iste placeat aut et error error dolore. Dolor voluptatum quisquam enim assumenda officia. Repudiandae facilis magni vel quas. Aut velit debitis et et placeat.', DATEADD(day, -15, GETDATE()));
SET @MailID_1_24 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_1_24, 1, 3, 1, 0, NULL, DATEADD(day, -15, GETDATE()), DATEADD(day, -15, GETDATE()), NULL);

DECLARE @MailID_1_25 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (3, N'Possimus aliquid officia ut natus.', N'Ullam mollitia ut qui voluptate. Mollitia officia amet sunt quo omnis quis autem quas. Aliquam necessitatibus eos optio consequatur. Sint possimus tempora quos. Corporis dolore quia occaecati rerum itaque sapiente eaque tempore. Unde odit quis illum vero omnis saepe placeat veritatis dolores.', DATEADD(day, -77, GETDATE()));
SET @MailID_1_25 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_1_25, 1, 3, 1, 0, NULL, DATEADD(day, -77, GETDATE()), DATEADD(day, -77, GETDATE()), NULL);

DECLARE @MailID_1_26 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (2, N'Deserunt ipsum blanditiis nam veniam.', N'Ut ipsum fugiat adipisci quia nam. Ipsum et nobis qui omnis qui vero. Dolorem necessitatibus qui dolorum nemo consequatur. Et consequatur porro quia quisquam voluptates velit dolores quia. Odio id fugit et deserunt neque officia nostrum et. Rerum reiciendis saepe non iusto neque.

Sed nisi dolores sit magnam unde expedita. Necessitatibus ipsam illum veniam voluptatem ullam asperiores. Id saepe corrupti soluta quos qui consequatur laudantium. Temporibus velit voluptates.

Nisi quod in cumque molestiae aliquam vel repudiandae repellendus. Necessitatibus libero voluptatem sequi in itaque. Optio voluptates eligendi accusamus porro facilis.', DATEADD(day, -18, GETDATE()));
SET @MailID_1_26 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_1_26, 1, 3, 0, 0, NULL, DATEADD(day, -18, GETDATE()), DATEADD(day, -18, GETDATE()), NULL);

DECLARE @MailID_1_27 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (7, N'Dolor qui quia magni tempora.', N'Assumenda libero quibusdam quo dolore id est est. Magni odit reiciendis cum distinctio alias voluptas doloribus. Enim nihil molestiae ratione sed nostrum culpa explicabo totam. Excepturi reprehenderit ea.', DATEADD(day, -100, GETDATE()));
SET @MailID_1_27 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_1_27, 1, 3, 0, 0, NULL, DATEADD(day, -100, GETDATE()), DATEADD(day, -100, GETDATE()), DATEADD(day, -99, GETDATE()));

DECLARE @MailID_1_28 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (2, N'Odit nemo adipisci rerum voluptatum.', N'Vitae mollitia beatae et animi quia corporis itaque accusamus. Ipsum quia et ducimus mollitia voluptas. Aut maiores odit hic et aperiam.

Quia temporibus voluptate et omnis omnis ducimus ea. Ducimus ea molestiae delectus vero repellat dignissimos. Totam reprehenderit recusandae ut.', DATEADD(day, -88, GETDATE()));
SET @MailID_1_28 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_1_28, 1, 3, 0, 0, NULL, DATEADD(day, -88, GETDATE()), DATEADD(day, -88, GETDATE()), DATEADD(day, -87, GETDATE()));

DECLARE @MailID_1_29 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (3, N'Quaerat quia optio voluptatem ut.', N'Ipsa assumenda ut exercitationem accusantium voluptatem repudiandae. Quia sapiente maxime consequatur eos officiis eius harum nesciunt. Debitis fuga ut.

Qui fuga odit omnis dolorem at quaerat excepturi quo. Vel est consequuntur necessitatibus nihil qui autem itaque architecto. Quia delectus et ipsa fuga velit. Nisi sed tempore atque quidem. Sit dolorem eaque qui modi. Veritatis corporis modi et quia sequi aut odio.', DATEADD(day, -44, GETDATE()));
SET @MailID_1_29 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_1_29, 1, 3, 1, 0, NULL, DATEADD(day, -44, GETDATE()), DATEADD(day, -44, GETDATE()), DATEADD(day, -43, GETDATE()));

MERGE AccountInboxState AS target
USING (VALUES (1, 0, 30, '2026-04-11 16:46:07'))
    AS source (AccountID, Category, MailCount, DateLastModified)
ON target.AccountID = source.AccountID
    AND target.Category = source.Category
WHEN MATCHED THEN
    UPDATE SET DateLastModified = source.DateLastModified
WHEN NOT MATCHED THEN
    INSERT (AccountID, Category, MailCount, DateLastModified)
    VALUES (source.AccountID, source.Category, source.MailCount, source.DateLastModified);

DECLARE @MailID_2_0 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (4, N'Totam omnis fuga voluptatem voluptas.', N'Dolores praesentium molestiae autem distinctio. Possimus dolore blanditiis alias porro et pariatur odio quo vero. Ut voluptas quo beatae. Enim dolorem voluptas. Sunt maxime eum dolorum odit. Eos delectus harum.

Minima eius libero laboriosam quasi perspiciatis ea laboriosam suscipit. Illum iusto corrupti perspiciatis harum autem perspiciatis. Commodi eum mollitia beatae quos. Quas hic omnis. Sed libero velit voluptatibus nisi omnis. Dolore necessitatibus autem tempora repudiandae animi recusandae ut ullam sit.

Quo et et ut ex dicta modi unde aut saepe. Eum id voluptate tenetur veritatis dolorem sequi unde et deleniti. Ea sed fugiat quos inventore architecto exercitationem et labore. Reiciendis adipisci rerum esse molestiae ut.', DATEADD(day, -58, GETDATE()));
SET @MailID_2_0 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_2_0, 2, 3, 0, 0, NULL, DATEADD(day, -58, GETDATE()), DATEADD(day, -58, GETDATE()), DATEADD(day, -57, GETDATE()));

DECLARE @MailID_2_1 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (1, N'Error veniam aspernatur cupiditate est.', N'Tempora architecto corrupti possimus corporis molestiae est veniam. Iusto unde est iure saepe rerum placeat. Eos eaque aut culpa. Dolores et officia explicabo pariatur atque. Ab soluta corrupti ea totam nostrum.

Rerum illo consequuntur voluptates fuga occaecati. Quia modi laborum accusantium provident ipsum aut nam enim assumenda. Quisquam facilis et. Et tenetur alias optio magnam libero consectetur autem. Veritatis et odit culpa hic sunt et blanditiis fuga dolorem. Soluta ut molestiae ut corporis dignissimos.

Debitis ut exercitationem possimus. Suscipit sint dolores omnis. Enim vitae in quia. Eligendi nihil eligendi quas perspiciatis fugit ut. Unde delectus provident quis facere et consequatur at.', DATEADD(day, -97, GETDATE()));
SET @MailID_2_1 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_2_1, 2, 3, 0, 0, NULL, DATEADD(day, -97, GETDATE()), DATEADD(day, -97, GETDATE()), DATEADD(day, -96, GETDATE()));

DECLARE @MailID_2_2 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (3, N'Officiis asperiores voluptatibus provident sint.', N'Nemo rerum vitae inventore reprehenderit id. In veritatis commodi ipsam voluptatem aut et fugiat. Placeat iusto ea. Necessitatibus inventore reiciendis ipsum tenetur natus tempore ipsam. Labore est cupiditate et.', DATEADD(day, -80, GETDATE()));
SET @MailID_2_2 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_2_2, 2, 3, 0, 0, NULL, DATEADD(day, -80, GETDATE()), DATEADD(day, -80, GETDATE()), DATEADD(day, -79, GETDATE()));

DECLARE @MailID_2_3 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (10, N'Deserunt quisquam voluptatem dicta blanditiis.', N'Et tempora nihil et et aut dolores ipsam. Repellat eos facilis voluptatem debitis qui consectetur veniam corrupti. Eaque aut est sit sint dicta eum.', DATEADD(day, -115, GETDATE()));
SET @MailID_2_3 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_2_3, 2, 3, 0, 0, NULL, DATEADD(day, -115, GETDATE()), DATEADD(day, -115, GETDATE()), DATEADD(day, -114, GETDATE()));

DECLARE @MailID_2_4 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (8, N'Voluptatem maxime aut et necessitatibus.', N'Voluptas maiores cupiditate. Aliquid sint at labore eaque deleniti consequatur corporis accusantium. Aut libero id molestiae fugit dolores cumque.

Enim vel dolore non voluptatem incidunt voluptates sunt. Ipsam ut vel tempora iusto. Minima ipsum sed ut nulla veritatis qui eos architecto modi.

Repellendus et et nihil et debitis veritatis. Optio quis itaque quidem assumenda rem quibusdam. Architecto assumenda consectetur itaque aperiam ea eveniet. Qui quia aut autem sapiente.', DATEADD(day, -95, GETDATE()));
SET @MailID_2_4 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_2_4, 2, 3, 0, 0, NULL, DATEADD(day, -95, GETDATE()), DATEADD(day, -95, GETDATE()), NULL);

DECLARE @MailID_2_5 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (4, N'Nam necessitatibus iure eveniet temporibus.', N'Nostrum est molestiae accusantium rerum cupiditate ut incidunt. Voluptas rerum ab porro et minus nostrum quam cumque omnis. Nisi aliquid dolores deleniti quae.

Sit ullam rerum adipisci recusandae quae fugiat nostrum sed. Molestiae rerum possimus ad. Consequatur amet corporis omnis sed consequatur facere et nam et.

Et et illum dolor optio. Minus ratione labore minus et iusto commodi ipsa aliquid. Consequatur ullam eos et ut cumque explicabo voluptatum repellendus magni.', DATEADD(day, -64, GETDATE()));
SET @MailID_2_5 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_2_5, 2, 3, 0, 0, NULL, DATEADD(day, -64, GETDATE()), DATEADD(day, -64, GETDATE()), NULL);

DECLARE @MailID_2_6 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (3, N'Soluta ullam rerum est porro.', N'Illo exercitationem exercitationem recusandae aliquam officiis. Alias veniam aut nihil ea assumenda alias sapiente ea. Itaque et et quas molestias dicta ea nobis. Aliquam vel aut nisi. Ipsum dicta non sapiente aut.

Voluptatem tempore esse. Perferendis aut et optio voluptatem quas sint dicta animi. Expedita culpa ea sit odio. Eius velit iure aut veritatis provident. Aut est ea beatae aspernatur consequatur voluptatem quidem blanditiis.

Ut voluptas quis quas corrupti optio illo tempore consequatur ad. Quos est quia tenetur explicabo officiis deleniti. Eum consequuntur et ut eum neque quia deleniti et. Molestias tempore alias est non.', DATEADD(day, -94, GETDATE()));
SET @MailID_2_6 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_2_6, 2, 3, 0, 0, NULL, DATEADD(day, -94, GETDATE()), DATEADD(day, -94, GETDATE()), DATEADD(day, -93, GETDATE()));

DECLARE @MailID_2_7 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (10, N'Numquam architecto vel nostrum ea.', N'Alias iusto blanditiis laudantium est doloremque quas quisquam. Sequi porro tenetur non minima. Quam at distinctio dolorem. Quia provident quaerat deleniti ullam ut quia et.

Cupiditate officia occaecati esse ut assumenda. Neque ut est modi animi esse perferendis odio iure et. Voluptate cum tempore itaque tempore quod. Ut rerum doloremque. Ipsam earum rerum molestiae totam. Iste perspiciatis officiis ut.', DATEADD(day, -80, GETDATE()));
SET @MailID_2_7 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_2_7, 2, 3, 0, 0, NULL, DATEADD(day, -80, GETDATE()), DATEADD(day, -80, GETDATE()), DATEADD(day, -79, GETDATE()));

DECLARE @MailID_2_8 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (7, N'Debitis iure neque id veritatis.', N'Quia quo ipsa dolorem magni. Aliquid et sint in consequatur sit ipsa quod. Voluptatem sunt voluptatem. Totam et dolore eum aliquam.', DATEADD(day, -107, GETDATE()));
SET @MailID_2_8 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_2_8, 2, 3, 0, 0, NULL, DATEADD(day, -107, GETDATE()), DATEADD(day, -107, GETDATE()), DATEADD(day, -106, GETDATE()));

DECLARE @MailID_2_9 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (5, N'Animi quos aut corrupti hic.', N'Tempora molestias cum aperiam suscipit ullam ea quis nisi quidem. Eos culpa dolorem exercitationem dolorem vero ipsa ipsa. Vel esse pariatur impedit ratione perspiciatis. Error dolorum vitae et perferendis illum est nisi quasi.', DATEADD(day, -77, GETDATE()));
SET @MailID_2_9 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_2_9, 2, 3, 0, 0, NULL, DATEADD(day, -77, GETDATE()), DATEADD(day, -77, GETDATE()), NULL);

DECLARE @MailID_2_10 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (8, N'Repellendus debitis alias ipsa voluptatem.', N'Voluptate libero ducimus. Et sapiente architecto quibusdam odit distinctio aliquid cum aut dolores. Et quis officiis qui beatae architecto natus dolores. Maiores labore est velit ducimus rerum voluptatibus sed placeat quis. Aliquid in corrupti perferendis.

Et ipsum eveniet. Voluptatem incidunt aut voluptate velit excepturi voluptatibus. Hic quo praesentium optio maxime sint qui vel deserunt. Et numquam culpa dolorum repudiandae sint dolorem temporibus dolorem. Possimus doloremque sunt.', DATEADD(day, -97, GETDATE()));
SET @MailID_2_10 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_2_10, 2, 3, 1, 0, NULL, DATEADD(day, -97, GETDATE()), DATEADD(day, -97, GETDATE()), NULL);

DECLARE @MailID_2_11 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (7, N'Modi delectus et nihil quos.', N'Aliquid dolorem qui rerum eum voluptatum aut ipsam molestias. Corrupti consectetur molestiae sit iure est minima quae suscipit enim. Cum nesciunt debitis ipsam delectus sed est. Voluptatum minus repudiandae quos nostrum dignissimos nihil distinctio sed. Recusandae occaecati deserunt maiores sed fugit qui numquam. Sapiente veritatis molestias eius ut distinctio occaecati.', DATEADD(day, -49, GETDATE()));
SET @MailID_2_11 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_2_11, 2, 3, 0, 0, NULL, DATEADD(day, -49, GETDATE()), DATEADD(day, -49, GETDATE()), DATEADD(day, -48, GETDATE()));

DECLARE @MailID_2_12 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (3, N'Veritatis qui nostrum accusamus eveniet.', N'Distinctio tempore illum provident nostrum tempora et magnam dolorum nisi. Aliquam ad ratione provident aut. Voluptas ratione ipsum aut voluptatibus sunt voluptatem.

Ab officia non. Suscipit quidem autem. Nisi incidunt ad a autem odit. Quo et repellendus. Voluptatem in et.', DATEADD(day, -80, GETDATE()));
SET @MailID_2_12 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_2_12, 2, 3, 0, 0, NULL, DATEADD(day, -80, GETDATE()), DATEADD(day, -80, GETDATE()), DATEADD(day, -79, GETDATE()));

DECLARE @MailID_2_13 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (4, N'Aut nulla ipsa ipsam voluptates.', N'Nihil modi laboriosam harum. In voluptates natus ipsum aut qui dolor non aut. Enim dolorum quia eum. Impedit similique cum mollitia nisi expedita autem alias qui sint. At dolores et maiores.

Rerum odit officia. Eum delectus neque ut soluta. Animi iure eos dolorem quam ut alias et. Ab quia dignissimos fuga.', DATEADD(day, -39, GETDATE()));
SET @MailID_2_13 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_2_13, 2, 3, 0, 0, NULL, DATEADD(day, -39, GETDATE()), DATEADD(day, -39, GETDATE()), DATEADD(day, -38, GETDATE()));

DECLARE @MailID_2_14 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (1, N'Tempora dicta ad voluptatem debitis.', N'Necessitatibus voluptates atque delectus. Voluptates perspiciatis quod placeat aut repellat quo ratione et. Laudantium consequatur cum saepe maiores saepe ut rerum.

Quia eos omnis sed ipsum laudantium est qui. Occaecati assumenda eius eos nam provident cupiditate quia ipsam. Quaerat consequatur ut vero quam distinctio reprehenderit qui. Necessitatibus asperiores eveniet sequi incidunt in libero.', DATEADD(day, -48, GETDATE()));
SET @MailID_2_14 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_2_14, 2, 3, 1, 0, NULL, DATEADD(day, -48, GETDATE()), DATEADD(day, -48, GETDATE()), NULL);

DECLARE @MailID_2_15 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (5, N'Et et laudantium cupiditate sed.', N'Quas eos suscipit architecto delectus qui animi unde. Eos similique unde et autem quia dolor sed quia. Dolorum beatae nisi quaerat perferendis omnis ratione rerum quo. Ullam nesciunt asperiores reprehenderit aut perferendis minima quia quia dolorum. Ipsa labore aperiam libero non.

Aut et cumque velit qui ratione dolores cupiditate quo voluptatum. Et quae facilis vel. Delectus inventore in quia. Sit et maxime eos laboriosam. Ipsum perspiciatis ex voluptatum. Ex et quia.', DATEADD(day, -81, GETDATE()));
SET @MailID_2_15 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_2_15, 2, 3, 0, 0, NULL, DATEADD(day, -81, GETDATE()), DATEADD(day, -81, GETDATE()), DATEADD(day, -80, GETDATE()));

DECLARE @MailID_2_16 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (7, N'Dolores enim sapiente doloremque cumque.', N'Ad corrupti earum et voluptatem aliquam consectetur enim enim temporibus. Nihil non ea at. Optio cumque eveniet exercitationem. Voluptatem laudantium porro.', DATEADD(day, -17, GETDATE()));
SET @MailID_2_16 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_2_16, 2, 3, 0, 0, NULL, DATEADD(day, -17, GETDATE()), DATEADD(day, -17, GETDATE()), NULL);

DECLARE @MailID_2_17 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (5, N'Velit necessitatibus delectus temporibus voluptatem.', N'Incidunt itaque minima quidem sed error eligendi molestiae ut dolore. Fuga cum ratione dolor et. Natus fugit quia enim doloremque est. Blanditiis velit aut ab quia eveniet a at placeat hic. Autem fugit numquam fugit earum non labore voluptatem mollitia. Molestias provident aut nihil quam facilis iusto natus omnis et.', DATEADD(day, -82, GETDATE()));
SET @MailID_2_17 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_2_17, 2, 3, 0, 0, NULL, DATEADD(day, -82, GETDATE()), DATEADD(day, -82, GETDATE()), DATEADD(day, -81, GETDATE()));

DECLARE @MailID_2_18 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (4, N'Ad enim quo dolor aut.', N'Facere recusandae rerum voluptatem et odit. Error veritatis quia ut. Expedita ullam voluptas aspernatur ut dolore maiores ex. Nam praesentium aut atque occaecati cum.

Officia ipsam excepturi distinctio perspiciatis exercitationem. Quisquam dolores eaque. Aut in itaque provident ipsam hic ut ipsam accusamus. Amet veniam dignissimos debitis. Est est hic quia et dolore numquam eius.', DATEADD(day, -39, GETDATE()));
SET @MailID_2_18 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_2_18, 2, 3, 0, 0, NULL, DATEADD(day, -39, GETDATE()), DATEADD(day, -39, GETDATE()), DATEADD(day, -38, GETDATE()));

DECLARE @MailID_2_19 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (10, N'Non dignissimos itaque voluptatem autem.', N'Iste ea ipsam deleniti. Earum nostrum reiciendis possimus. Et cupiditate nihil ad tempora sint voluptatem qui. Debitis voluptatem assumenda beatae ipsa aut. Alias fugiat minima eum et aut vel omnis suscipit.

Quibusdam provident error recusandae. Sunt iste aut dicta adipisci quibusdam placeat architecto nesciunt. Eum est aliquam.

Praesentium architecto non quam optio et accusantium. Magni necessitatibus iste minus deleniti. Asperiores ullam eius. Illum laudantium odit excepturi eligendi assumenda error ab eaque assumenda. Nam et quis aut quisquam enim sunt temporibus facilis.', DATEADD(day, -27, GETDATE()));
SET @MailID_2_19 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_2_19, 2, 3, 0, 0, NULL, DATEADD(day, -27, GETDATE()), DATEADD(day, -27, GETDATE()), NULL);

DECLARE @MailID_2_20 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (4, N'Doloribus qui est est in.', N'Quaerat quae autem rem et laudantium ut. Ea unde quia. Eaque quod nobis quaerat eos id ut. Omnis reprehenderit saepe ad dolorem minus quo placeat deserunt. Porro sit natus dolores inventore accusamus. Ea rem sequi ratione.', DATEADD(day, -82, GETDATE()));
SET @MailID_2_20 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_2_20, 2, 3, 1, 0, NULL, DATEADD(day, -82, GETDATE()), DATEADD(day, -82, GETDATE()), DATEADD(day, -81, GETDATE()));

DECLARE @MailID_2_21 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (1, N'Earum omnis exercitationem illo quibusdam.', N'Non sed adipisci animi rem dolores. Sit recusandae voluptas sequi odio magnam tempora quis omnis et. Nobis nemo quod voluptas odit. Ut vitae excepturi blanditiis illo rerum.

Rerum magnam rerum. Occaecati sit qui totam perspiciatis dignissimos provident facilis suscipit sunt. Corporis rerum illum.

Nemo voluptates necessitatibus qui voluptatem distinctio suscipit eum. Voluptatem labore ad debitis officiis consequatur quisquam. Quo placeat distinctio deleniti reiciendis laborum quam incidunt.', DATEADD(day, -14, GETDATE()));
SET @MailID_2_21 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_2_21, 2, 3, 0, 0, NULL, DATEADD(day, -14, GETDATE()), DATEADD(day, -14, GETDATE()), DATEADD(day, -13, GETDATE()));

DECLARE @MailID_2_22 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (6, N'Voluptatem autem quidem in est.', N'Voluptate eum occaecati autem voluptatibus qui aspernatur incidunt molestiae. Assumenda nihil aliquam eos molestiae. Rem consequatur ipsum.

Odit aspernatur delectus exercitationem unde. Quis qui et. Molestias ut quibusdam non labore ut recusandae laborum consequatur ea. Recusandae odit nostrum animi sunt odio qui culpa asperiores. In aspernatur voluptas doloremque facere ea mollitia veniam dicta ducimus.

Nobis ex iste et. Consequatur rerum ab rem dolor molestiae qui dignissimos. Voluptas natus et placeat voluptatem id.', DATEADD(day, -67, GETDATE()));
SET @MailID_2_22 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_2_22, 2, 3, 0, 0, NULL, DATEADD(day, -67, GETDATE()), DATEADD(day, -67, GETDATE()), DATEADD(day, -66, GETDATE()));

DECLARE @MailID_2_23 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (9, N'Maxime fugit voluptatem dolor perspiciatis.', N'Sit aliquam placeat totam. Modi excepturi qui atque nihil. Doloremque vel modi eaque. Repellat molestias eum unde at qui qui inventore nihil dolor. Eaque ut accusamus commodi ab. Cumque adipisci consequatur quia.

Et et non fugit ullam magnam non sint in. Quidem cupiditate molestiae natus. Velit iste reprehenderit est. A soluta totam velit debitis sunt repudiandae et dicta. Voluptas occaecati dolorem. Alias earum consectetur officiis consequatur quia qui eos ducimus fugit.', DATEADD(day, -12, GETDATE()));
SET @MailID_2_23 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_2_23, 2, 3, 0, 0, NULL, DATEADD(day, -12, GETDATE()), DATEADD(day, -12, GETDATE()), NULL);

DECLARE @MailID_2_24 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (3, N'Nisi distinctio fuga non alias.', N'Quo sit velit eaque est. Hic dicta quam laborum sit inventore assumenda voluptates. Totam nesciunt neque voluptatibus.', DATEADD(day, -117, GETDATE()));
SET @MailID_2_24 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_2_24, 2, 3, 0, 0, NULL, DATEADD(day, -117, GETDATE()), DATEADD(day, -117, GETDATE()), DATEADD(day, -116, GETDATE()));

DECLARE @MailID_2_25 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (7, N'Non blanditiis deleniti est similique.', N'Facilis optio illum nemo ut ea. Cumque deleniti nobis. Repellendus autem et sapiente nisi hic nisi mollitia in omnis.

Eos similique voluptatem nihil. Rem ut quia ut ducimus laborum qui qui omnis. In saepe est ipsam cumque ab est.', DATEADD(day, -48, GETDATE()));
SET @MailID_2_25 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_2_25, 2, 3, 0, 0, NULL, DATEADD(day, -48, GETDATE()), DATEADD(day, -48, GETDATE()), NULL);

DECLARE @MailID_2_26 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (8, N'Cumque ad vel ut et.', N'Ad vitae ipsa odit delectus accusantium aut sequi consequuntur. Dolor quas aperiam dolores repudiandae aliquam saepe asperiores maiores unde. Dolor architecto itaque maiores voluptate qui fugit hic nulla.

In corrupti qui quod enim aut et blanditiis recusandae sit. Voluptate mollitia qui deserunt. Reiciendis voluptatem et molestias illo maiores omnis quam repellat.

Ullam qui modi repellendus iste reprehenderit suscipit. A neque fugit exercitationem et adipisci quia beatae sunt. Magnam enim asperiores. Ipsa dolor voluptatum. Amet consequuntur voluptas natus tempora cupiditate asperiores illo. Quo molestiae repellat dolore cum iste.', DATEADD(day, -107, GETDATE()));
SET @MailID_2_26 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_2_26, 2, 3, 0, 0, NULL, DATEADD(day, -107, GETDATE()), DATEADD(day, -107, GETDATE()), NULL);

DECLARE @MailID_2_27 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (1, N'Et esse debitis eum molestiae.', N'Aspernatur molestiae molestiae quam. Ut non et eum ad sed perspiciatis reprehenderit molestiae omnis. Aut qui et iste et voluptate magni sit tenetur eaque.

Magni eum distinctio rerum dolores. Tenetur omnis omnis provident possimus aliquam voluptate voluptatibus. Ea eum quis omnis qui voluptates sed excepturi odio.', DATEADD(day, -75, GETDATE()));
SET @MailID_2_27 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_2_27, 2, 3, 0, 0, NULL, DATEADD(day, -75, GETDATE()), DATEADD(day, -75, GETDATE()), NULL);

DECLARE @MailID_2_28 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (8, N'Est temporibus vel saepe quia.', N'Expedita et soluta vero qui voluptates laborum quia. Accusantium soluta asperiores et soluta illo ut aut. Et quidem illo eos.

Impedit voluptatum iste qui atque consequatur. Quaerat qui molestiae expedita. Provident voluptatem nobis eius voluptatibus voluptatem molestias. Rem deleniti natus perferendis nemo commodi autem impedit deserunt. Et cumque autem facilis alias. In est voluptatum dolorem atque.', DATEADD(day, -76, GETDATE()));
SET @MailID_2_28 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_2_28, 2, 3, 0, 0, NULL, DATEADD(day, -76, GETDATE()), DATEADD(day, -76, GETDATE()), NULL);

DECLARE @MailID_2_29 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (6, N'Commodi qui quaerat maiores earum.', N'Sit rerum natus magnam illum ullam sunt sequi. Soluta autem qui. Dignissimos ipsum quis.

Optio quo commodi veniam tempore dolores voluptatem suscipit quidem. Labore numquam natus doloremque et asperiores deserunt illum ea quidem. Voluptatem non qui sunt error. Totam corporis id in et ullam ea.

Sit iusto reiciendis id illo nostrum et perspiciatis beatae. Provident asperiores sed voluptatem sint impedit omnis. Porro velit non doloremque molestias ut et dolorem. Quia sint sint. Ab sed neque natus numquam praesentium quia. Ut ipsa repellat iste omnis fugiat.', DATEADD(day, -64, GETDATE()));
SET @MailID_2_29 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_2_29, 2, 3, 0, 0, NULL, DATEADD(day, -64, GETDATE()), DATEADD(day, -64, GETDATE()), NULL);

MERGE AccountInboxState AS target
USING (VALUES (2, 0, 30, '2026-04-05 16:46:07'))
    AS source (AccountID, Category, MailCount, DateLastModified)
ON target.AccountID = source.AccountID
    AND target.Category = source.Category
WHEN MATCHED THEN
    UPDATE SET DateLastModified = source.DateLastModified
WHEN NOT MATCHED THEN
    INSERT (AccountID, Category, MailCount, DateLastModified)
    VALUES (source.AccountID, source.Category, source.MailCount, source.DateLastModified);

DECLARE @MailID_3_0 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (9, N'Vel et qui officia consequatur.', N'Beatae error voluptatibus voluptatem molestias magnam. Id omnis esse velit nobis sint voluptas eligendi qui est. Rerum vero at quod magnam maiores quae placeat harum.

Rem sunt necessitatibus adipisci quis omnis cupiditate aut possimus iure. Natus aspernatur et quis fuga. Porro rerum fugiat. Aut minus recusandae. Ipsam magnam ut. Qui nobis ut porro reprehenderit officiis animi occaecati in vel.', DATEADD(day, -52, GETDATE()));
SET @MailID_3_0 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_3_0, 3, 3, 0, 0, NULL, DATEADD(day, -52, GETDATE()), DATEADD(day, -52, GETDATE()), DATEADD(day, -51, GETDATE()));

DECLARE @MailID_3_1 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (8, N'Aut ullam omnis distinctio sunt.', N'Totam fuga illo consectetur officia adipisci et. Odio nulla provident consequuntur molestiae magni quo. Cumque aut deserunt et est quo. Est at ducimus. Quis sit sapiente eos reiciendis sunt delectus.

Labore saepe nostrum voluptatibus ex. Fugiat quidem sequi. Aliquam praesentium vel blanditiis quasi molestias dolor libero dolores.

Aut est nostrum quas numquam consectetur. In maxime ut eos assumenda adipisci omnis sint. Sed velit qui fuga et. Commodi totam sequi beatae. Sint at et magni nostrum aliquam excepturi placeat aut et. A delectus esse iusto placeat enim autem.', DATEADD(day, -2, GETDATE()));
SET @MailID_3_1 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_3_1, 3, 3, 0, 0, NULL, DATEADD(day, -2, GETDATE()), DATEADD(day, -2, GETDATE()), NULL);

DECLARE @MailID_3_2 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (7, N'Ea corporis dolorum velit sequi.', N'Voluptatem dolorem rem nihil et dolores ea. Debitis perferendis mollitia nostrum voluptatem a. Sit qui omnis vero non commodi ad repudiandae consectetur autem.', DATEADD(day, -55, GETDATE()));
SET @MailID_3_2 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_3_2, 3, 3, 0, 0, NULL, DATEADD(day, -55, GETDATE()), DATEADD(day, -55, GETDATE()), DATEADD(day, -54, GETDATE()));

DECLARE @MailID_3_3 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (5, N'Corporis non ducimus officiis amet.', N'Fuga fugit debitis sit. Qui soluta dicta quo reiciendis saepe velit. Qui deleniti velit ipsum sunt et. Quidem qui reprehenderit autem odit.

Excepturi facere odit perspiciatis excepturi. Provident velit exercitationem. Dolores tempore aut.', DATEADD(day, -52, GETDATE()));
SET @MailID_3_3 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_3_3, 3, 3, 1, 0, NULL, DATEADD(day, -52, GETDATE()), DATEADD(day, -52, GETDATE()), DATEADD(day, -51, GETDATE()));

DECLARE @MailID_3_4 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (2, N'Quidem voluptatum quam assumenda itaque.', N'Nihil dolorem quas maxime enim quos sunt dolor. Deleniti aut molestiae veritatis doloremque dolores ea. Sed sed saepe voluptatem consequatur est iusto porro est.

Nostrum similique nihil qui corrupti omnis explicabo aut veritatis. Libero nobis consequatur veritatis iusto ut dolorem nemo voluptatem consequatur. Officiis pariatur aut aut. Sint vel sint sunt rerum excepturi.', DATEADD(day, -7, GETDATE()));
SET @MailID_3_4 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_3_4, 3, 3, 0, 0, NULL, DATEADD(day, -7, GETDATE()), DATEADD(day, -7, GETDATE()), DATEADD(day, -6, GETDATE()));

DECLARE @MailID_3_5 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (5, N'Adipisci in soluta ut atque.', N'Dolores repudiandae veritatis assumenda libero est. Est porro at earum voluptatibus ab. Voluptates nihil perferendis sit omnis deserunt dolorem. Earum dolorum ut ipsa illo sed. Qui eligendi facere omnis nam vitae dolores occaecati est quisquam. Molestiae eveniet autem sed minima quis cum sit.', DATEADD(day, -37, GETDATE()));
SET @MailID_3_5 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_3_5, 3, 3, 0, 0, NULL, DATEADD(day, -37, GETDATE()), DATEADD(day, -37, GETDATE()), DATEADD(day, -36, GETDATE()));

DECLARE @MailID_3_6 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (1, N'Id occaecati voluptas dicta facilis.', N'Aut iusto consequuntur corrupti. Nihil officia voluptates. Eaque quod est harum dignissimos consequuntur ratione commodi adipisci id. Accusamus quas molestias. Consequatur mollitia debitis magni minus dignissimos laboriosam nemo sunt. Doloremque laborum eius tenetur sit odio.', DATEADD(day, -58, GETDATE()));
SET @MailID_3_6 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_3_6, 3, 3, 0, 0, NULL, DATEADD(day, -58, GETDATE()), DATEADD(day, -58, GETDATE()), NULL);

DECLARE @MailID_3_7 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (2, N'Est magnam laudantium error nesciunt.', N'Modi est cum suscipit temporibus. Voluptatibus hic nesciunt minima voluptatum dolorum reprehenderit a fuga. Reprehenderit quam sed et delectus ut veritatis ut veritatis eos. Mollitia cumque quo. Et voluptas commodi architecto veniam est vel odio.

Et fugit ab at. Rerum doloribus aut. Repudiandae quia nisi saepe magnam quia est. Qui quasi facere qui aut voluptas nesciunt suscipit.

Totam quod sit et sequi pariatur ea corporis sint doloremque. Tempore est et non dignissimos dolor optio eos velit aliquid. Sunt dolorum sit quod in molestiae sint quibusdam quam. Molestias hic repudiandae est eum et illo. Atque voluptas temporibus dolorum nesciunt a.', DATEADD(day, -101, GETDATE()));
SET @MailID_3_7 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_3_7, 3, 3, 1, 0, NULL, DATEADD(day, -101, GETDATE()), DATEADD(day, -101, GETDATE()), DATEADD(day, -100, GETDATE()));

DECLARE @MailID_3_8 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (5, N'Molestiae maiores quasi rerum fuga.', N'Consectetur voluptatem nesciunt reprehenderit maiores in eligendi. Natus esse sequi praesentium reprehenderit. Dolor voluptatem aliquam adipisci et quasi voluptates est. Tenetur deleniti debitis ipsam eius nisi natus iste non.

Et et ipsam eos voluptatem. Esse sit quasi cumque. Corporis officiis quasi omnis occaecati.

Ratione nihil odit officiis libero architecto est ipsum velit deserunt. Molestiae officia minima et quos sunt commodi. Ea et dolor tempora quia sint ea laboriosam.', DATEADD(day, -44, GETDATE()));
SET @MailID_3_8 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_3_8, 3, 3, 0, 0, NULL, DATEADD(day, -44, GETDATE()), DATEADD(day, -44, GETDATE()), DATEADD(day, -43, GETDATE()));

DECLARE @MailID_3_9 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (1, N'Nulla et explicabo saepe nemo.', N'Id in saepe. Sapiente ipsam nam non inventore dolorem commodi minima dolor porro. Odio animi voluptatem voluptatum magnam sit nisi. Quis eos perspiciatis harum deleniti rerum facilis quia eligendi tenetur. Sit consequatur ullam.', DATEADD(day, -70, GETDATE()));
SET @MailID_3_9 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_3_9, 3, 3, 0, 0, NULL, DATEADD(day, -70, GETDATE()), DATEADD(day, -70, GETDATE()), DATEADD(day, -69, GETDATE()));

DECLARE @MailID_3_10 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (1, N'Nesciunt debitis minus qui fuga.', N'Consequuntur porro nemo et neque ab consequatur quia. Fugiat ad ducimus autem molestiae dolorum optio. Ut odit autem omnis nulla ut laudantium facere.

Repellendus aperiam adipisci et autem nostrum dolore sit. Officia tempora aliquam dicta. Adipisci at a id. Aut sed voluptatem error dolorem ut ut. Iste qui numquam error maiores dolores aliquam aut odit. Iste sequi adipisci molestiae harum.', DATEADD(day, -53, GETDATE()));
SET @MailID_3_10 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_3_10, 3, 3, 0, 0, NULL, DATEADD(day, -53, GETDATE()), DATEADD(day, -53, GETDATE()), DATEADD(day, -52, GETDATE()));

DECLARE @MailID_3_11 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (8, N'Qui eius voluptates quod qui.', N'Aut itaque impedit et. Exercitationem aliquid harum aspernatur culpa praesentium ab. Et rerum minima occaecati laborum delectus cum. Exercitationem natus placeat voluptates qui dolores esse vero at maxime.

Consectetur omnis quo porro. Et vitae impedit minima perferendis unde reprehenderit. Rerum quisquam rem beatae assumenda doloremque voluptatem. Doloremque nisi et nulla beatae voluptatem animi doloremque quod. Qui unde laborum.', DATEADD(day, -108, GETDATE()));
SET @MailID_3_11 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_3_11, 3, 3, 0, 0, NULL, DATEADD(day, -108, GETDATE()), DATEADD(day, -108, GETDATE()), NULL);

DECLARE @MailID_3_12 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (10, N'Praesentium sunt accusantium consequatur rerum.', N'Praesentium deserunt maxime qui. Tempora ex voluptas alias. Porro aut id sunt consequatur cupiditate sit eaque voluptas ipsam. Assumenda illum ut non dignissimos et inventore quia voluptatem. Aliquid sit blanditiis neque animi aut esse.', DATEADD(day, -43, GETDATE()));
SET @MailID_3_12 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_3_12, 3, 3, 0, 0, NULL, DATEADD(day, -43, GETDATE()), DATEADD(day, -43, GETDATE()), NULL);

DECLARE @MailID_3_13 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (5, N'Doloremque saepe aut autem ab.', N'Officia id adipisci nulla ut adipisci. Vel aliquam similique dolorem. Tenetur est molestias veritatis quaerat est voluptatibus in commodi quod. Autem voluptate et enim autem. Sed et maxime consequatur.

Sed repudiandae et est aut. Vitae amet veniam ut. Saepe maiores repudiandae quia officia et. Rem ut occaecati animi tenetur non doloribus et nihil. Veritatis numquam ut illum in rerum officiis laboriosam quis. In deserunt voluptatibus possimus.

Hic at perspiciatis cupiditate distinctio. Non qui facere. Cumque necessitatibus sunt ex voluptatem blanditiis quia similique.', DATEADD(day, -44, GETDATE()));
SET @MailID_3_13 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_3_13, 3, 3, 0, 0, NULL, DATEADD(day, -44, GETDATE()), DATEADD(day, -44, GETDATE()), DATEADD(day, -43, GETDATE()));

DECLARE @MailID_3_14 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (7, N'Veniam et dolor dolorem et.', N'Cupiditate recusandae hic. Beatae placeat quo saepe sit tempora esse vero. Tenetur fugit eaque ad soluta reprehenderit odio at reprehenderit. Numquam adipisci rem accusamus accusantium repellendus. Inventore totam odio optio.

Consequatur temporibus unde et voluptatibus omnis sit. Voluptatem quas deleniti provident. Sunt omnis impedit praesentium nihil non quibusdam. Tempore aut iure aut labore quis consectetur ea rerum. Minus ipsa molestiae sit quis ut ipsa est rerum quidem. Necessitatibus quibusdam aut vel qui et dicta.', DATEADD(day, -21, GETDATE()));
SET @MailID_3_14 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_3_14, 3, 3, 1, 0, NULL, DATEADD(day, -21, GETDATE()), DATEADD(day, -21, GETDATE()), NULL);

DECLARE @MailID_3_15 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (1, N'Exercitationem consequatur explicabo fugiat quo.', N'Debitis dolorem qui molestias voluptas cupiditate aut fugiat labore est. Non dicta nisi quis. Quia error recusandae odio explicabo. Ut a veritatis minima voluptatem. Maxime hic delectus nihil. Assumenda voluptas ducimus quidem quos cum aut corporis ipsam.

Doloremque quisquam aspernatur accusamus expedita atque est labore ad molestiae. Quia velit omnis necessitatibus et. Aut ut consectetur nihil quibusdam et. Id laudantium aut numquam qui accusantium laborum a repellendus. Quae sed ea ratione omnis. Quaerat dolores hic.', DATEADD(day, -113, GETDATE()));
SET @MailID_3_15 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_3_15, 3, 3, 0, 0, NULL, DATEADD(day, -113, GETDATE()), DATEADD(day, -113, GETDATE()), DATEADD(day, -112, GETDATE()));

DECLARE @MailID_3_16 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (7, N'Minima atque reiciendis debitis et.', N'Nulla accusantium ea perferendis. Qui consequatur ut et ut similique quis consequatur. Ut veniam impedit labore doloribus et modi. Soluta aut natus expedita et.

Velit dicta voluptates incidunt ut ut rem tenetur. Et sint est earum ratione est. Aliquam quia iusto voluptas voluptatem odit sit autem. Nihil mollitia nemo laborum ullam in dolorem doloremque occaecati. Tempore nobis a magnam quibusdam magni vel.', DATEADD(day, -101, GETDATE()));
SET @MailID_3_16 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_3_16, 3, 3, 1, 0, NULL, DATEADD(day, -101, GETDATE()), DATEADD(day, -101, GETDATE()), DATEADD(day, -100, GETDATE()));

DECLARE @MailID_3_17 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (8, N'Commodi veritatis explicabo dolorem maxime.', N'Amet aut rerum labore impedit mollitia omnis. Quasi reprehenderit quo quos. Quas eveniet numquam. Officiis voluptatum aperiam id placeat qui quos qui.', DATEADD(day, -23, GETDATE()));
SET @MailID_3_17 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_3_17, 3, 3, 0, 0, NULL, DATEADD(day, -23, GETDATE()), DATEADD(day, -23, GETDATE()), NULL);

DECLARE @MailID_3_18 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (2, N'Nam et ex minima est.', N'Quam incidunt id ab. Nisi voluptatem sed. Ut est sed culpa suscipit fugiat. Expedita cumque atque sequi at ducimus nulla tempora placeat. Quae facilis et optio sed necessitatibus sequi cumque et.

Officia aut eaque. Beatae ut ab soluta cupiditate quasi. Ducimus dolor pariatur ut autem voluptas. Est ut qui impedit laudantium tenetur ut magnam. Ad debitis consequatur ea nobis. Aut in culpa aperiam quia fugiat aut sit.

Facere rerum deleniti voluptatibus sequi minus eveniet. Sed voluptatibus vel excepturi reprehenderit fugit aperiam ullam. Placeat praesentium fuga et tempora. Nihil perferendis voluptas aut itaque illum distinctio et quisquam. Soluta ea et atque ipsam.', DATEADD(day, -86, GETDATE()));
SET @MailID_3_18 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_3_18, 3, 3, 0, 0, NULL, DATEADD(day, -86, GETDATE()), DATEADD(day, -86, GETDATE()), DATEADD(day, -85, GETDATE()));

DECLARE @MailID_3_19 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (7, N'Adipisci perspiciatis id illum voluptatem.', N'Ab dicta quis illum eum. Dolores error eum tempora. Et commodi officiis consequatur consequuntur aut.

Velit rerum sit molestias explicabo et eos architecto eum omnis. Id nihil ut est modi sint vero consectetur. Suscipit dolor fuga reiciendis vel et repellat. Ipsam laboriosam nemo molestiae expedita at voluptatem. Eum minus quo iusto repellendus adipisci omnis exercitationem ad molestias.', DATEADD(day, -2, GETDATE()));
SET @MailID_3_19 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_3_19, 3, 3, 0, 0, NULL, DATEADD(day, -2, GETDATE()), DATEADD(day, -2, GETDATE()), DATEADD(day, -1, GETDATE()));

DECLARE @MailID_3_20 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (9, N'Eligendi enim ea facere consequatur.', N'Amet eos laudantium sequi vel molestiae. Non quia pariatur veniam necessitatibus. Labore illum doloremque vitae.

Sint commodi aliquid sequi nihil ad quia ducimus delectus repellat. Natus repellat quam nihil est corporis debitis. Dolore et neque id ad at quo fuga quo vel. Omnis blanditiis dolorem quod ut ratione.', DATEADD(day, -75, GETDATE()));
SET @MailID_3_20 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_3_20, 3, 3, 0, 0, NULL, DATEADD(day, -75, GETDATE()), DATEADD(day, -75, GETDATE()), DATEADD(day, -74, GETDATE()));

DECLARE @MailID_3_21 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (10, N'Totam saepe aut amet nesciunt.', N'Iusto maiores saepe repellendus molestiae. Est ea quia sint. Ullam quia ut quia veritatis.

Explicabo autem delectus beatae sapiente perspiciatis asperiores. Alias nulla veniam labore ea enim quod delectus. Nesciunt ad rerum. Voluptas sit et dolorem ut perspiciatis nobis rerum rerum minus.

Ex in sint voluptatem. Molestiae sed sint ullam a corrupti. Dolorum voluptatum earum animi sapiente ratione fugiat quo.', DATEADD(day, -81, GETDATE()));
SET @MailID_3_21 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_3_21, 3, 3, 0, 0, NULL, DATEADD(day, -81, GETDATE()), DATEADD(day, -81, GETDATE()), NULL);

DECLARE @MailID_3_22 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (8, N'Beatae qui sed doloribus qui.', N'Eligendi vel libero et. Quam expedita quos distinctio numquam officiis. Minima magnam eum sunt. Aliquid veniam et non aut iste quo. Temporibus est adipisci dolore id adipisci. Minima pariatur quia impedit.

Id est laudantium voluptatem. Quaerat velit sed veritatis soluta. Doloremque exercitationem repudiandae debitis unde accusamus modi. Porro voluptatibus reiciendis velit nesciunt quas saepe nam aut. Et aspernatur aut distinctio eaque dolorem et aliquid eos aut.

Voluptas aut ratione voluptatum aut modi molestiae dolores itaque. Omnis non laudantium occaecati illo consequatur est. Veritatis nobis quia deserunt accusamus praesentium cupiditate suscipit voluptas voluptas. Dolore ullam id necessitatibus ut quae. Doloremque exercitationem consequuntur a occaecati incidunt ex voluptatem.', DATEADD(day, -86, GETDATE()));
SET @MailID_3_22 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_3_22, 3, 3, 0, 0, NULL, DATEADD(day, -86, GETDATE()), DATEADD(day, -86, GETDATE()), DATEADD(day, -85, GETDATE()));

DECLARE @MailID_3_23 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (10, N'A veniam consequuntur minus ipsam.', N'Odio iste ut minus minima non voluptatem. Ea sequi earum quibusdam dolorem est quidem ipsam ut at. Voluptatum sit reiciendis explicabo ea qui cumque aut. Eum facilis unde tempora. Veritatis id minima veniam possimus natus id consectetur est aperiam.', DATEADD(day, -39, GETDATE()));
SET @MailID_3_23 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_3_23, 3, 3, 0, 0, NULL, DATEADD(day, -39, GETDATE()), DATEADD(day, -39, GETDATE()), DATEADD(day, -38, GETDATE()));

DECLARE @MailID_3_24 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (2, N'Eos fugit repellat veniam eos.', N'Corporis et at at omnis nihil ipsum. Aliquam necessitatibus maiores omnis quo illo quo voluptatem assumenda facilis. Velit odio a eos qui placeat occaecati accusamus est possimus.

Ullam minima et eaque accusantium. Enim quas sapiente et architecto sunt non asperiores reiciendis voluptatem. Sequi velit esse id qui voluptas.

Officia vitae fugiat exercitationem corporis ea asperiores quis. Distinctio omnis tempora. Totam quia eligendi sequi at veniam rem. Exercitationem est neque aut.', DATEADD(day, -39, GETDATE()));
SET @MailID_3_24 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_3_24, 3, 3, 0, 0, NULL, DATEADD(day, -39, GETDATE()), DATEADD(day, -39, GETDATE()), NULL);

DECLARE @MailID_3_25 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (10, N'Consequatur nemo aperiam iure vitae.', N'Sit et quas atque aperiam libero error. Magni facere quas ea est. Perspiciatis ipsa soluta distinctio.

Perspiciatis laudantium voluptas hic accusamus quis quam tempore. Mollitia voluptate voluptas aut sed nam quasi earum. Ratione recusandae quo. Quis enim reiciendis.', DATEADD(day, -97, GETDATE()));
SET @MailID_3_25 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_3_25, 3, 3, 0, 0, NULL, DATEADD(day, -97, GETDATE()), DATEADD(day, -97, GETDATE()), DATEADD(day, -96, GETDATE()));

DECLARE @MailID_3_26 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (5, N'Laborum odio rerum qui corrupti.', N'Ex voluptatem saepe quo. Quaerat natus quisquam quae. Qui doloribus non quia officiis qui vel pariatur.', DATEADD(day, -25, GETDATE()));
SET @MailID_3_26 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_3_26, 3, 3, 0, 0, NULL, DATEADD(day, -25, GETDATE()), DATEADD(day, -25, GETDATE()), DATEADD(day, -24, GETDATE()));

DECLARE @MailID_3_27 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (8, N'Excepturi ad rerum voluptas deleniti.', N'Voluptatum at magnam voluptates ducimus. Deserunt ex sed omnis. Dignissimos dolores tempore saepe qui id iusto ut fugit quasi. Rerum eum excepturi cumque aut sunt. Expedita quisquam quod distinctio.

Dolor fuga natus eos rerum nesciunt totam sapiente. Quas veritatis est temporibus aliquam veritatis molestiae voluptas ducimus. Aut voluptatem id iste beatae voluptatem. Illum doloribus voluptatem perspiciatis quia necessitatibus dicta occaecati occaecati voluptatum.', DATEADD(day, -112, GETDATE()));
SET @MailID_3_27 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_3_27, 3, 3, 0, 0, NULL, DATEADD(day, -112, GETDATE()), DATEADD(day, -112, GETDATE()), DATEADD(day, -111, GETDATE()));

DECLARE @MailID_3_28 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (6, N'Praesentium id non labore debitis.', N'Dolores suscipit fugit earum explicabo. Nobis voluptatum magni non officia nostrum. Quasi sit numquam labore itaque qui dolore omnis.

Dolore sit molestiae. Quisquam amet neque sequi placeat dolorum at iste itaque velit. Minima quos qui aperiam. Nostrum voluptatem occaecati voluptates. A sed expedita et distinctio sit ut sit eius. Quod sunt amet quae cumque inventore.

Et ad accusantium ad quis ut mollitia. Id inventore qui numquam ea. Consequatur ut qui et molestias laborum voluptas beatae. Natus quia autem. Quam quaerat quos perspiciatis cum placeat officia earum. Aperiam fugit alias commodi culpa officia sunt.', DATEADD(day, -25, GETDATE()));
SET @MailID_3_28 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_3_28, 3, 3, 1, 0, NULL, DATEADD(day, -25, GETDATE()), DATEADD(day, -25, GETDATE()), DATEADD(day, -24, GETDATE()));

DECLARE @MailID_3_29 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (2, N'Reprehenderit sed vitae dolor quod.', N'Commodi quis eligendi consectetur accusantium id ipsam. Vel vel et nobis molestiae sunt et aut error blanditiis. Consequuntur tempora aut necessitatibus natus in omnis. Qui necessitatibus fugiat possimus hic culpa culpa dicta natus. Atque vel laudantium est.

Ipsam excepturi natus quae quis. Eligendi blanditiis nemo maxime qui ut magni enim. Consequuntur et reiciendis. Dolor quis placeat ab architecto odio sequi est incidunt.', DATEADD(day, -9, GETDATE()));
SET @MailID_3_29 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_3_29, 3, 3, 0, 0, NULL, DATEADD(day, -9, GETDATE()), DATEADD(day, -9, GETDATE()), NULL);

MERGE AccountInboxState AS target
USING (VALUES (3, 0, 30, '2026-04-15 16:46:07'))
    AS source (AccountID, Category, MailCount, DateLastModified)
ON target.AccountID = source.AccountID
    AND target.Category = source.Category
WHEN MATCHED THEN
    UPDATE SET DateLastModified = source.DateLastModified
WHEN NOT MATCHED THEN
    INSERT (AccountID, Category, MailCount, DateLastModified)
    VALUES (source.AccountID, source.Category, source.MailCount, source.DateLastModified);

DECLARE @MailID_4_0 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (5, N'Aut enim vel et nihil.', N'Suscipit voluptatem esse quis illo id id suscipit. Fugiat quos rerum. Eos molestiae tenetur accusantium nulla. Ut est sint exercitationem aperiam adipisci culpa. Excepturi eligendi dolorum officiis non facilis similique nemo aut.

Voluptas veniam autem. Voluptas distinctio similique tempora voluptatem deserunt quo fugiat dolor rerum. Quia minus molestiae amet delectus quas doloremque ut hic excepturi.

Eum expedita minus praesentium repellendus debitis voluptatem. Fugit commodi vel aliquid quia qui. Ab animi asperiores expedita aut voluptatum assumenda. Qui incidunt non dolores similique dolorem. Eaque ipsam ut aliquid et cum molestiae repellat eum quam. Inventore quo sunt architecto.', DATEADD(day, -100, GETDATE()));
SET @MailID_4_0 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_4_0, 4, 3, 0, 0, NULL, DATEADD(day, -100, GETDATE()), DATEADD(day, -100, GETDATE()), NULL);

DECLARE @MailID_4_1 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (8, N'Veritatis doloremque dolorem exercitationem cum.', N'Dicta deserunt libero. Id minus modi omnis hic. Totam quis nihil temporibus laboriosam ut ea et at. Ducimus eum non facere voluptatem velit rerum vel incidunt ut. Quis sed doloremque.

Dolorem necessitatibus sint dignissimos et expedita odio ducimus cupiditate. Ut accusantium voluptas. Necessitatibus nesciunt est itaque sunt.', DATEADD(day, -12, GETDATE()));
SET @MailID_4_1 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_4_1, 4, 3, 0, 0, NULL, DATEADD(day, -12, GETDATE()), DATEADD(day, -12, GETDATE()), DATEADD(day, -11, GETDATE()));

DECLARE @MailID_4_2 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (3, N'Molestiae molestiae eum cumque voluptatem.', N'Labore sunt qui deserunt aut. Blanditiis a reprehenderit laborum qui. Deserunt aut exercitationem omnis culpa et. Numquam sit accusantium et voluptatem voluptatem. Sapiente non porro quos rerum dolorem cupiditate ipsa.

Illum aperiam aut sint minus. Cupiditate quos et modi. Deleniti voluptas doloremque ipsum ducimus minus. Harum qui quaerat sed culpa dolor culpa voluptas maiores consequatur. Aliquam esse officiis recusandae natus nisi.', DATEADD(day, -26, GETDATE()));
SET @MailID_4_2 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_4_2, 4, 3, 0, 0, NULL, DATEADD(day, -26, GETDATE()), DATEADD(day, -26, GETDATE()), DATEADD(day, -25, GETDATE()));

DECLARE @MailID_4_3 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (2, N'Rerum quibusdam mollitia autem dolor.', N'Culpa ducimus eum qui perferendis vitae aut doloremque magnam officia. Est architecto dolor dolorum magnam. Et incidunt rerum nisi ad aut. Rerum tempora minima consequatur vero voluptas. Velit et aut et eum. Quidem ab delectus.

Et deleniti molestias molestiae voluptate. Odit excepturi temporibus adipisci cupiditate saepe provident molestiae deserunt. Et minus fugit soluta debitis inventore ut molestias. Dolore nam iste facilis et ullam id. Nihil nobis modi assumenda similique. Quaerat delectus autem qui quo.

Excepturi temporibus et optio et consectetur. Cum veritatis architecto autem ea sunt eum facilis qui beatae. Aut voluptates vel culpa quasi rem est cumque. Quis veritatis quia necessitatibus qui. Repudiandae quod eveniet. Eum adipisci possimus.', DATEADD(day, -3, GETDATE()));
SET @MailID_4_3 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_4_3, 4, 3, 1, 0, NULL, DATEADD(day, -3, GETDATE()), DATEADD(day, -3, GETDATE()), DATEADD(day, -2, GETDATE()));

DECLARE @MailID_4_4 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (2, N'Quam quisquam saepe expedita accusamus.', N'Ipsa illo molestias harum non dolore velit. Est ipsam accusantium reiciendis nobis consectetur dolores fugiat magni dolorem. Ut officiis commodi. Itaque tenetur accusamus minima incidunt voluptatem id nihil corrupti. Id vel non nesciunt ad occaecati.

Sunt et odit numquam. Quis et rerum explicabo labore. Qui architecto perferendis excepturi. Maiores quia ut minus esse esse.

Qui impedit harum ut praesentium rerum quibusdam quam. Eos quis et omnis blanditiis. Et laborum temporibus tenetur asperiores. Delectus est est molestias inventore dolores ea enim qui unde.', DATEADD(day, -78, GETDATE()));
SET @MailID_4_4 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_4_4, 4, 3, 1, 0, NULL, DATEADD(day, -78, GETDATE()), DATEADD(day, -78, GETDATE()), NULL);

DECLARE @MailID_4_5 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (9, N'Alias dolore eos blanditiis voluptatum.', N'Et velit voluptas. Quasi accusamus quo quibusdam porro cumque magni est. Totam qui doloremque quisquam. Sequi accusantium inventore sit veritatis cum voluptatem et modi.

Unde sit voluptatum quos. Possimus suscipit consequatur omnis non tenetur rerum molestias. Quo error quidem commodi et dolorum.', DATEADD(day, -88, GETDATE()));
SET @MailID_4_5 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_4_5, 4, 3, 0, 0, NULL, DATEADD(day, -88, GETDATE()), DATEADD(day, -88, GETDATE()), NULL);

DECLARE @MailID_4_6 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (8, N'Ab odio in et voluptate.', N'Accusantium qui minus enim placeat. Explicabo voluptatibus autem repellat iste quisquam magnam aut ea harum. Perferendis sed corrupti expedita. Eligendi officia totam porro sit et voluptate vero ipsam nostrum.', DATEADD(day, -87, GETDATE()));
SET @MailID_4_6 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_4_6, 4, 3, 0, 0, NULL, DATEADD(day, -87, GETDATE()), DATEADD(day, -87, GETDATE()), NULL);

DECLARE @MailID_4_7 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (2, N'Non atque deserunt quam numquam.', N'Doloribus sed et voluptatem officia aliquam magnam voluptas tempora. Voluptas corporis quas accusantium in. Qui voluptas rerum ut dolor enim. Deserunt ratione quo illo quod quaerat libero et natus. Soluta sequi vero dolor veniam rerum aliquam.

Consectetur consectetur voluptatum deserunt a. Est ipsam labore modi. Sit eligendi assumenda.

Reiciendis ea deleniti. Numquam iure dicta repellat sed. Praesentium in sint eaque eos unde exercitationem illum. Architecto dolores porro nulla nihil.', DATEADD(day, -99, GETDATE()));
SET @MailID_4_7 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_4_7, 4, 3, 0, 0, NULL, DATEADD(day, -99, GETDATE()), DATEADD(day, -99, GETDATE()), DATEADD(day, -98, GETDATE()));

DECLARE @MailID_4_8 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (10, N'In tempora dolores accusamus cupiditate.', N'Et rerum nisi architecto voluptatem explicabo corrupti quia numquam commodi. In aut dignissimos nostrum est amet. Minus dolores ea a repellat. Id repellat error perferendis omnis error odit deserunt. Totam ad inventore sunt iure nobis nisi.', DATEADD(day, -59, GETDATE()));
SET @MailID_4_8 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_4_8, 4, 3, 0, 0, NULL, DATEADD(day, -59, GETDATE()), DATEADD(day, -59, GETDATE()), DATEADD(day, -58, GETDATE()));

DECLARE @MailID_4_9 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (1, N'Nam quia aut asperiores asperiores.', N'Esse voluptas ullam consectetur aut amet enim. Nobis quos ab ut. Amet est nesciunt eligendi eos in illum provident. Reprehenderit labore voluptates amet rem cumque consequatur adipisci ipsum quisquam.

Enim qui eveniet suscipit officia reiciendis libero ut provident. Voluptatem necessitatibus enim corporis ut. Consequatur dolor exercitationem culpa ratione. Non enim voluptatem ea suscipit labore est. Dolorum doloremque officiis eum odio sunt.', DATEADD(day, -72, GETDATE()));
SET @MailID_4_9 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_4_9, 4, 3, 0, 0, NULL, DATEADD(day, -72, GETDATE()), DATEADD(day, -72, GETDATE()), NULL);

DECLARE @MailID_4_10 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (3, N'Fugiat et ab vel quis.', N'Qui et ut aut. Non aut enim est. Ut qui excepturi ut ducimus et ipsum. Rerum explicabo accusamus fugiat consequatur aut. Sunt libero asperiores velit sed. Mollitia unde expedita distinctio ipsum animi dolorum harum nihil modi.

Possimus accusantium dolores. Voluptas nihil et. Molestiae molestiae necessitatibus quae et. Veniam fugiat sit consequatur minus mollitia eligendi. Quaerat sapiente modi aut earum sit et ea eos.

Consectetur aut nostrum aliquid minima sit aliquid. Dolores harum odit. Magnam et et quisquam. Eum et aut impedit id quia maiores repellendus porro ratione. Magnam quis ea aliquid porro quis et vel perspiciatis aut. Et excepturi sed perspiciatis molestiae.', DATEADD(day, -55, GETDATE()));
SET @MailID_4_10 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_4_10, 4, 3, 0, 0, NULL, DATEADD(day, -55, GETDATE()), DATEADD(day, -55, GETDATE()), DATEADD(day, -54, GETDATE()));

DECLARE @MailID_4_11 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (1, N'Doloremque debitis ea sit maxime.', N'Tempora deserunt et vel. Iste velit quisquam quo quis aliquam exercitationem atque quia eos. Ut corporis perspiciatis. Omnis impedit quidem esse recusandae consequatur. Vitae nihil eveniet repellendus commodi blanditiis.', DATEADD(day, -7, GETDATE()));
SET @MailID_4_11 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_4_11, 4, 3, 0, 0, NULL, DATEADD(day, -7, GETDATE()), DATEADD(day, -7, GETDATE()), DATEADD(day, -6, GETDATE()));

DECLARE @MailID_4_12 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (5, N'Rerum qui architecto suscipit placeat.', N'Autem unde tempore impedit vero cumque sed. Eveniet eius ea eligendi qui magnam. Aut sequi omnis vitae qui accusantium.

Sint mollitia cum eos nobis cum non nostrum minus. Occaecati repellat consequatur est magnam odio. Vel dolor harum non enim quos consequatur iste a dolorem. Et aliquam culpa repellat est porro suscipit tempore similique necessitatibus.', DATEADD(day, -111, GETDATE()));
SET @MailID_4_12 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_4_12, 4, 3, 1, 0, NULL, DATEADD(day, -111, GETDATE()), DATEADD(day, -111, GETDATE()), DATEADD(day, -110, GETDATE()));

DECLARE @MailID_4_13 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (10, N'Reiciendis consequuntur rerum nemo quia.', N'Quibusdam repellat illum placeat et aliquid excepturi ut quaerat. Laborum reiciendis aut eos unde neque nisi. Qui autem quis suscipit in assumenda.

Qui temporibus repudiandae cupiditate perferendis ad et. Est id exercitationem veniam vero consectetur distinctio. Ipsum facere nesciunt dolor nihil illum eius ullam et. Dolorem pariatur quibusdam ut itaque. Laboriosam quia hic exercitationem consequatur praesentium consequatur.', DATEADD(day, -2, GETDATE()));
SET @MailID_4_13 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_4_13, 4, 3, 0, 0, NULL, DATEADD(day, -2, GETDATE()), DATEADD(day, -2, GETDATE()), NULL);

DECLARE @MailID_4_14 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (10, N'Fugiat sit et iste sint.', N'Explicabo molestiae quibusdam at minima repellat asperiores aliquid. Expedita et harum. Incidunt perspiciatis ut dolorem.

Similique aliquam dolor cumque amet reprehenderit quis. Incidunt ut possimus voluptatem veniam in corrupti quas in quia. Et amet mollitia ut repellat minus. Autem facilis maiores delectus. Sit eos aspernatur perspiciatis omnis asperiores totam.

Aut adipisci vero. Perferendis quis et est qui aut quisquam. Error quasi et veniam.', DATEADD(day, -5, GETDATE()));
SET @MailID_4_14 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_4_14, 4, 3, 0, 0, NULL, DATEADD(day, -5, GETDATE()), DATEADD(day, -5, GETDATE()), DATEADD(day, -4, GETDATE()));

DECLARE @MailID_4_15 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (2, N'Nihil voluptas accusantium consequatur veniam.', N'Dolore qui consequatur ut reiciendis. Quam voluptatem id quod quos. Voluptatem qui ex aut quidem nam quo. Quia debitis dicta deleniti odio soluta tempore harum consectetur molestiae. Quaerat esse aperiam. Est eum dolor maxime placeat.

Id sunt quia voluptatibus facere. Exercitationem dolorem officia cum. Odit voluptates possimus amet neque et autem asperiores. Et assumenda aut est ipsa est nihil. Veritatis nobis nihil laudantium nisi voluptas odio. A quibusdam laboriosam in quo.

Dolore tenetur consequatur. Quibusdam sed enim quisquam quod id mollitia eligendi. Nesciunt dolore illo totam aut non. Rerum incidunt qui perspiciatis blanditiis accusamus velit et sit.', DATEADD(day, -58, GETDATE()));
SET @MailID_4_15 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_4_15, 4, 3, 0, 0, NULL, DATEADD(day, -58, GETDATE()), DATEADD(day, -58, GETDATE()), DATEADD(day, -57, GETDATE()));

DECLARE @MailID_4_16 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (10, N'Ex non dolores omnis dolores.', N'Fuga quo et aut. Consequatur quasi voluptas et enim iusto est qui excepturi officiis. Ad dignissimos quaerat molestiae recusandae culpa corporis sint ut architecto. Est ut libero. Reprehenderit deserunt non quo perferendis assumenda excepturi. Omnis laboriosam mollitia voluptatum tempora.', DATEADD(day, -82, GETDATE()));
SET @MailID_4_16 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_4_16, 4, 3, 0, 0, NULL, DATEADD(day, -82, GETDATE()), DATEADD(day, -82, GETDATE()), NULL);

DECLARE @MailID_4_17 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (2, N'Hic placeat ad iste in.', N'Sunt temporibus error sit accusamus sequi enim autem dolor magnam. Officiis minus cupiditate nihil voluptas aliquid repudiandae iure voluptas voluptatibus. Ipsum eaque et provident consequuntur. Dolore pariatur rerum. Aut rerum voluptas excepturi eos doloribus sit culpa.

Recusandae blanditiis facere autem praesentium aut itaque quod. Dolorem quia odio. Dolorem adipisci voluptatem aspernatur in eum quis voluptatem in rerum. Dolore voluptatem sit ut. Explicabo consequuntur enim exercitationem laborum iste necessitatibus. Excepturi perspiciatis accusamus.

Occaecati aut quae autem totam animi aut. Eveniet quo inventore. Quod neque enim. Quisquam qui rerum quod dolor magnam enim. Consequatur ducimus sapiente laudantium cupiditate sit eveniet velit fuga quis.', DATEADD(day, -97, GETDATE()));
SET @MailID_4_17 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_4_17, 4, 3, 0, 0, NULL, DATEADD(day, -97, GETDATE()), DATEADD(day, -97, GETDATE()), NULL);

DECLARE @MailID_4_18 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (7, N'Vel autem itaque optio sunt.', N'Voluptas reprehenderit blanditiis non explicabo. Eius quod assumenda. Sint sapiente et tenetur omnis cumque corporis asperiores corporis. Voluptatum vero rerum itaque non ipsam laudantium dolorum.

Facere reiciendis blanditiis deleniti veritatis optio. Eaque nemo saepe assumenda vel ut. Vel fugit laboriosam praesentium dignissimos nobis nisi rerum minima. Non suscipit quidem provident consequatur.

Et recusandae autem voluptas ab. Numquam unde dolorem. Odio sed maiores.', DATEADD(day, -76, GETDATE()));
SET @MailID_4_18 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_4_18, 4, 3, 0, 0, NULL, DATEADD(day, -76, GETDATE()), DATEADD(day, -76, GETDATE()), NULL);

DECLARE @MailID_4_19 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (10, N'Quaerat sint sunt impedit molestiae.', N'Dolorem cupiditate et repellat consequatur nisi possimus. Modi tempore ipsa hic maxime commodi vel animi. Error rerum unde aut debitis. Illo reprehenderit officiis repellendus.

Odit laborum aut quibusdam est voluptatibus et id qui sint. Nesciunt a dolorem consequuntur quo ad sed mollitia. Eius magni distinctio. Et pariatur dolor eos commodi. Ea sit fugit et delectus eius doloremque atque ut perferendis. Perspiciatis quia dolores et deleniti ipsum harum eveniet mollitia.

Aut harum delectus ipsum rerum. Accusantium necessitatibus voluptate quis aliquam recusandae libero est ab. Et dolorum animi dolores. Vero voluptas velit est quia quod excepturi enim.', DATEADD(day, -95, GETDATE()));
SET @MailID_4_19 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_4_19, 4, 3, 0, 0, NULL, DATEADD(day, -95, GETDATE()), DATEADD(day, -95, GETDATE()), NULL);

DECLARE @MailID_4_20 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (8, N'Numquam nihil autem ullam quidem.', N'Voluptatem eveniet sapiente. Officia quia blanditiis. Maiores aut possimus et reiciendis odit et.

Expedita eos fugiat facilis totam accusantium. Quis deserunt tenetur rerum culpa quo voluptas deleniti. Et ullam esse hic ut. Quod tenetur aliquid asperiores porro perspiciatis modi facilis. Odio modi provident doloribus ipsam officiis sint incidunt qui et.', DATEADD(day, -7, GETDATE()));
SET @MailID_4_20 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_4_20, 4, 3, 0, 0, NULL, DATEADD(day, -7, GETDATE()), DATEADD(day, -7, GETDATE()), NULL);

DECLARE @MailID_4_21 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (9, N'Nihil ad perspiciatis ut praesentium.', N'Dignissimos consequuntur asperiores. Tempora voluptates at voluptas totam voluptate accusantium mollitia cum provident. Sed a autem rerum et eum.

Aliquid aliquam ut deleniti cum est minus sed unde eos. Excepturi quis laudantium. Odio nesciunt possimus.

Earum nemo enim voluptatem voluptates sit non sit. Est nihil laudantium est earum ut. Earum culpa praesentium vero nihil dolor earum autem. Nesciunt sapiente tempore eum quae.', DATEADD(day, -26, GETDATE()));
SET @MailID_4_21 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_4_21, 4, 3, 0, 0, NULL, DATEADD(day, -26, GETDATE()), DATEADD(day, -26, GETDATE()), NULL);

DECLARE @MailID_4_22 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (7, N'Consequatur dolores voluptatem dicta repellendus.', N'Est necessitatibus sed qui. Asperiores dolore itaque repellat quas temporibus id perferendis. Blanditiis recusandae alias occaecati laudantium vitae modi quibusdam quidem. Quos facilis itaque natus.

Iure non eius exercitationem. Neque nobis qui nobis. Possimus enim commodi laboriosam. Et repellat non voluptatum. Reiciendis maxime voluptatem doloremque pariatur.', DATEADD(day, -11, GETDATE()));
SET @MailID_4_22 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_4_22, 4, 3, 1, 0, NULL, DATEADD(day, -11, GETDATE()), DATEADD(day, -11, GETDATE()), DATEADD(day, -10, GETDATE()));

DECLARE @MailID_4_23 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (7, N'Ea dolorum a distinctio ut.', N'Ut debitis voluptatibus. Alias amet consequatur sit delectus quasi voluptatem quia pariatur. Reiciendis exercitationem cupiditate alias.', DATEADD(day, -1, GETDATE()));
SET @MailID_4_23 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_4_23, 4, 3, 0, 0, NULL, DATEADD(day, -1, GETDATE()), DATEADD(day, -1, GETDATE()), DATEADD(day, -0, GETDATE()));

DECLARE @MailID_4_24 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (10, N'Praesentium sed molestias non non.', N'Eligendi hic aut unde eum voluptatem. Fuga nihil cupiditate iusto aut illum. Eaque modi voluptatum dicta in. Sunt quos ea commodi non ipsam magnam omnis minima.

Ut consectetur explicabo quia. Placeat quisquam eos qui sed qui. Quia dignissimos accusamus asperiores esse ullam similique autem excepturi. Eum dolore quo. Expedita pariatur doloremque soluta quidem quia in quidem similique in. Porro quod beatae quo non quo.

Harum asperiores quia est delectus dignissimos id. Magni quae aspernatur distinctio fugiat numquam placeat recusandae nostrum. Deserunt temporibus similique iusto qui ea non facere quod rem.', DATEADD(day, -100, GETDATE()));
SET @MailID_4_24 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_4_24, 4, 3, 0, 0, NULL, DATEADD(day, -100, GETDATE()), DATEADD(day, -100, GETDATE()), DATEADD(day, -99, GETDATE()));

DECLARE @MailID_4_25 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (3, N'Sed sint nemo dolorem quidem.', N'Rerum eos consequatur minus aliquid et. Debitis neque eveniet sapiente. Esse nihil aut laudantium qui dolores. Nulla qui nobis totam maxime libero. Placeat consequuntur quia molestias repellendus commodi nostrum assumenda incidunt.', DATEADD(day, -14, GETDATE()));
SET @MailID_4_25 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_4_25, 4, 3, 0, 0, NULL, DATEADD(day, -14, GETDATE()), DATEADD(day, -14, GETDATE()), DATEADD(day, -13, GETDATE()));

DECLARE @MailID_4_26 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (1, N'Quae voluptas qui aut quia.', N'Et magnam enim velit quo voluptatem. Aliquid voluptatum aut ipsam velit. Voluptatem praesentium in aliquam. Nihil et illo ipsa dolores labore necessitatibus.

Rerum sit qui. Nihil ullam quas. Consequatur et et quod repudiandae amet illo dolore. Quam consequatur dolore deserunt repellat molestiae nobis. Voluptatem voluptatem perferendis maxime id.

Ducimus inventore distinctio neque quo natus nam quis doloremque labore. Ipsam aliquam beatae qui vel nostrum. Sunt sint quos. Vel numquam a. Dicta enim dignissimos explicabo soluta occaecati ducimus. Id qui tempore.', DATEADD(day, -91, GETDATE()));
SET @MailID_4_26 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_4_26, 4, 3, 0, 0, NULL, DATEADD(day, -91, GETDATE()), DATEADD(day, -91, GETDATE()), DATEADD(day, -90, GETDATE()));

DECLARE @MailID_4_27 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (3, N'Atque explicabo eos doloribus nemo.', N'Odio et facere explicabo qui sint sint repudiandae laborum. Provident eaque et omnis itaque aspernatur perferendis a saepe. Ut placeat aut eum nulla.

Nesciunt corrupti voluptas. Dolore officia aliquam vel eveniet. Voluptatem at nam est similique minima enim deleniti temporibus odit.', DATEADD(day, -49, GETDATE()));
SET @MailID_4_27 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_4_27, 4, 3, 0, 0, NULL, DATEADD(day, -49, GETDATE()), DATEADD(day, -49, GETDATE()), DATEADD(day, -48, GETDATE()));

DECLARE @MailID_4_28 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (5, N'Illo laudantium et laborum nihil.', N'Sed molestiae sed possimus quia impedit doloribus porro. Non est hic sapiente qui qui est ex. Quibusdam numquam et et nihil quasi officiis.

Tempore ipsa corporis velit laudantium aut quae. Repudiandae sed et culpa sit molestias rerum sit aliquid architecto. Vero minus assumenda voluptatibus aut. Voluptas reprehenderit recusandae.', DATEADD(day, -51, GETDATE()));
SET @MailID_4_28 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_4_28, 4, 3, 0, 0, NULL, DATEADD(day, -51, GETDATE()), DATEADD(day, -51, GETDATE()), DATEADD(day, -50, GETDATE()));

DECLARE @MailID_4_29 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (10, N'Quas sapiente sunt non rerum.', N'Aut atque minima natus veritatis ad nesciunt expedita quia. Dolores nemo labore id. Voluptas explicabo nam est sequi consequatur. Rem qui nostrum excepturi porro et. Velit id cupiditate. Voluptatem voluptatem est blanditiis in sunt quis sapiente sed.

Expedita labore quidem dolores eius quae. Ea voluptatem non adipisci et rem rerum quia quibusdam. Sed asperiores cupiditate et modi et odio qui. Veniam neque voluptatem est eos quia vel explicabo itaque. Nemo dolore impedit et distinctio sed vitae esse.', DATEADD(day, -78, GETDATE()));
SET @MailID_4_29 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_4_29, 4, 3, 0, 0, NULL, DATEADD(day, -78, GETDATE()), DATEADD(day, -78, GETDATE()), DATEADD(day, -77, GETDATE()));

MERGE AccountInboxState AS target
USING (VALUES (4, 0, 30, '2026-04-16 16:46:07'))
    AS source (AccountID, Category, MailCount, DateLastModified)
ON target.AccountID = source.AccountID
    AND target.Category = source.Category
WHEN MATCHED THEN
    UPDATE SET DateLastModified = source.DateLastModified
WHEN NOT MATCHED THEN
    INSERT (AccountID, Category, MailCount, DateLastModified)
    VALUES (source.AccountID, source.Category, source.MailCount, source.DateLastModified);

DECLARE @MailID_5_0 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (7, N'Alias ducimus ab et non.', N'Voluptatem delectus dolorem voluptas dolor voluptas vitae. Quos dolor quas libero enim expedita quis consequatur. Adipisci vel dolorem nostrum sint. Vitae quos veniam quibusdam quis ab vitae ipsum debitis minus. Ad omnis rerum doloremque amet dolorem qui rem minus ut. Ut illo neque maiores accusamus.

Magnam iusto beatae officia sapiente consequatur. Dignissimos amet sint quaerat. Voluptatum totam aut et culpa voluptas quia quibusdam voluptas et. Temporibus quidem qui aut consectetur cupiditate. Id quas quod voluptas fugit vitae blanditiis. Et consequatur necessitatibus ut vel aut.', DATEADD(day, -27, GETDATE()));
SET @MailID_5_0 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_5_0, 5, 3, 1, 0, NULL, DATEADD(day, -27, GETDATE()), DATEADD(day, -27, GETDATE()), DATEADD(day, -26, GETDATE()));

DECLARE @MailID_5_1 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (6, N'Mollitia repellat qui nemo voluptas.', N'Quae aliquam aliquid nobis quis modi. Magnam voluptas unde dolores sit. Rerum vero consectetur. Molestiae dolor qui aperiam natus nemo quo.

Natus consequuntur omnis eos atque rerum omnis. Eaque tempora perferendis fuga laudantium. Omnis rerum maxime. Nihil aliquam expedita. Laudantium esse architecto sed.

Sed sed non ex aut sint quibusdam perferendis. Incidunt praesentium necessitatibus blanditiis repellat. Maiores cumque blanditiis aut eveniet est accusantium accusamus sed. At cupiditate repudiandae nisi et ipsa aliquam et officiis sit. Sequi doloribus minima illum.', DATEADD(day, -76, GETDATE()));
SET @MailID_5_1 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_5_1, 5, 3, 0, 0, NULL, DATEADD(day, -76, GETDATE()), DATEADD(day, -76, GETDATE()), NULL);

DECLARE @MailID_5_2 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (6, N'Est delectus corrupti at reiciendis.', N'Quasi non modi et dolorem cum quaerat praesentium. Iste quia error commodi necessitatibus quibusdam quis incidunt velit natus. Non quidem quis vitae quam voluptatem eum. Omnis et velit harum molestiae aut dignissimos quo quia. Id dolor molestias maxime et hic.', DATEADD(day, -27, GETDATE()));
SET @MailID_5_2 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_5_2, 5, 3, 0, 0, NULL, DATEADD(day, -27, GETDATE()), DATEADD(day, -27, GETDATE()), DATEADD(day, -26, GETDATE()));

DECLARE @MailID_5_3 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (2, N'Perferendis voluptatibus libero maxime culpa.', N'Et ipsa molestiae maxime in. Laboriosam nemo ullam autem quidem placeat quos. Dolore voluptatem omnis aliquam. Consequatur libero libero beatae quaerat fuga aperiam eos. Aut magni ut exercitationem ut. Nemo quisquam porro possimus in reiciendis.

Architecto vitae veritatis in. Possimus quo qui. Fugit tenetur et qui veritatis consectetur.

Dignissimos eius aspernatur id ea. Quasi qui voluptate distinctio iste libero alias at cum maxime. Velit dolorem sed. Aut molestiae nam. Numquam laboriosam in laboriosam non ut.', DATEADD(day, -67, GETDATE()));
SET @MailID_5_3 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_5_3, 5, 3, 0, 0, NULL, DATEADD(day, -67, GETDATE()), DATEADD(day, -67, GETDATE()), NULL);

DECLARE @MailID_5_4 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (7, N'Aliquam quasi quam ipsam quas.', N'Temporibus dolorem aliquam quos soluta. Laborum sapiente autem et quia. Tempora est qui asperiores iste.', DATEADD(day, -75, GETDATE()));
SET @MailID_5_4 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_5_4, 5, 3, 0, 0, NULL, DATEADD(day, -75, GETDATE()), DATEADD(day, -75, GETDATE()), DATEADD(day, -74, GETDATE()));

DECLARE @MailID_5_5 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (3, N'Omnis aperiam velit architecto recusandae.', N'Eos harum fugit assumenda est similique soluta reiciendis saepe. Maxime saepe sequi corrupti ut porro eum. Natus odio ex quod sapiente voluptas accusamus sed laudantium libero. Vero laudantium delectus et velit dolore molestias sit soluta nostrum.

Distinctio accusantium ea eius. Et qui assumenda et neque. Est numquam numquam qui et ea sint eaque. Perferendis omnis accusantium atque voluptas facilis enim exercitationem nulla. Rem natus soluta occaecati consequuntur ut ducimus qui.

Nihil et rem fuga id tempore. Est qui possimus architecto non repudiandae minima. Tempora aliquid dolor rerum explicabo animi dicta. In et eaque quas et ut velit vel praesentium illo. Molestias sit qui est voluptatem distinctio voluptas dignissimos ut. Aspernatur facere commodi.', DATEADD(day, -83, GETDATE()));
SET @MailID_5_5 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_5_5, 5, 3, 0, 0, NULL, DATEADD(day, -83, GETDATE()), DATEADD(day, -83, GETDATE()), NULL);

DECLARE @MailID_5_6 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (7, N'Veritatis unde eveniet et velit.', N'Doloribus alias animi quibusdam sit quidem rerum. Dicta quia ut eos omnis. Ut suscipit dolorem ut natus est magni quia rerum consequatur.

Sapiente qui esse excepturi odit molestias non officia illo. Dolorem est veniam rerum velit voluptate adipisci. Necessitatibus repellat voluptatem sunt earum consequatur. Aut enim inventore ratione sit dolores et perferendis commodi. Dolore nobis est voluptatem recusandae nihil.', DATEADD(day, -27, GETDATE()));
SET @MailID_5_6 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_5_6, 5, 3, 0, 0, NULL, DATEADD(day, -27, GETDATE()), DATEADD(day, -27, GETDATE()), DATEADD(day, -26, GETDATE()));

DECLARE @MailID_5_7 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (1, N'Voluptates culpa ut quia voluptatem.', N'Sed sint maxime est voluptas maiores reprehenderit voluptas id. Ullam debitis corporis cumque. Vel ipsam facilis quod doloribus itaque excepturi voluptates consequuntur. Omnis deserunt voluptatem ipsum praesentium mollitia qui consequuntur aperiam. Et ducimus quidem assumenda dolores et possimus dolore.

Perferendis doloribus ea. Atque in autem. Autem cupiditate consequatur laborum illum illo excepturi facere repellendus iusto. Exercitationem facere aut incidunt aut vel commodi ipsum quo error.

Ut sit autem impedit eos enim iusto eaque. Ab et et quis voluptatum a. Corrupti voluptates sit qui deleniti et possimus.', DATEADD(day, -2, GETDATE()));
SET @MailID_5_7 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_5_7, 5, 3, 0, 0, NULL, DATEADD(day, -2, GETDATE()), DATEADD(day, -2, GETDATE()), DATEADD(day, -1, GETDATE()));

DECLARE @MailID_5_8 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (3, N'Voluptas laudantium minima fuga non.', N'Aliquam odio corrupti. Non sit autem. Nam non est quasi est. Labore quis a fugiat eaque porro fugiat quisquam.

Cum quos sed aut doloribus rerum excepturi cumque sunt. Iusto doloribus et alias sunt aperiam aperiam omnis eaque. Id consectetur maiores vitae harum aut. Excepturi culpa delectus eaque similique. Et nihil dolorum cum praesentium. Dolorem alias ab ex iure labore dolor architecto et.

Quidem illo ut consequatur autem necessitatibus maxime. Alias autem omnis inventore aut corporis. Omnis molestias adipisci animi illo veritatis saepe excepturi voluptatem. Eos adipisci enim dolore corrupti quasi maiores aliquam laboriosam. Ut qui ipsum et sapiente.', DATEADD(day, -112, GETDATE()));
SET @MailID_5_8 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_5_8, 5, 3, 0, 0, NULL, DATEADD(day, -112, GETDATE()), DATEADD(day, -112, GETDATE()), DATEADD(day, -111, GETDATE()));

DECLARE @MailID_5_9 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (10, N'Repellat dicta debitis rerum est.', N'Ex sint consequatur et suscipit eum. Ea voluptas harum voluptatem dolorum nihil suscipit suscipit laudantium esse. Dolores numquam est quia. In placeat placeat.

Veritatis vero quia sed tempore. Sit aperiam delectus sed corporis possimus dolores cupiditate. Ut et vel voluptate vel porro fuga qui necessitatibus. Harum est maxime dolorem ipsum cumque. Ipsum neque mollitia nisi.', DATEADD(day, -74, GETDATE()));
SET @MailID_5_9 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_5_9, 5, 3, 1, 0, NULL, DATEADD(day, -74, GETDATE()), DATEADD(day, -74, GETDATE()), NULL);

DECLARE @MailID_5_10 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (3, N'Cum vero voluptates eos deserunt.', N'Repudiandae eos molestiae. Ipsa laboriosam voluptas animi. Mollitia assumenda in voluptatum perspiciatis officiis quasi dolores.', DATEADD(day, -33, GETDATE()));
SET @MailID_5_10 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_5_10, 5, 3, 0, 0, NULL, DATEADD(day, -33, GETDATE()), DATEADD(day, -33, GETDATE()), DATEADD(day, -32, GETDATE()));

DECLARE @MailID_5_11 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (3, N'Odit est saepe et odit.', N'Quaerat est qui accusamus iste voluptas qui laborum et. Perspiciatis possimus alias dolorem quas nihil. Iusto in eius ut voluptas amet molestiae ratione eos dolorem.

Impedit totam ut voluptas voluptas id illum qui sit. Architecto sunt dolor velit ipsum quia nemo veritatis. Dolorum qui vel. Unde quo ducimus nihil. Veniam quos eum asperiores accusantium id nostrum ipsa.

In quia ex expedita optio voluptatem atque. Tempore necessitatibus nam. In quod et nisi ut explicabo reprehenderit et vel. Non adipisci non fugit quam dolorem ipsam aut.', DATEADD(day, -105, GETDATE()));
SET @MailID_5_11 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_5_11, 5, 3, 0, 0, NULL, DATEADD(day, -105, GETDATE()), DATEADD(day, -105, GETDATE()), DATEADD(day, -104, GETDATE()));

DECLARE @MailID_5_12 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (1, N'Soluta aliquid quisquam a officia.', N'At accusamus earum sunt ullam sed consequatur. Laudantium voluptas maxime dolor eos in id omnis ut vero. Voluptas ea fuga.', DATEADD(day, -15, GETDATE()));
SET @MailID_5_12 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_5_12, 5, 3, 0, 0, NULL, DATEADD(day, -15, GETDATE()), DATEADD(day, -15, GETDATE()), DATEADD(day, -14, GETDATE()));

DECLARE @MailID_5_13 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (1, N'Officia quis occaecati officia atque.', N'Non exercitationem architecto praesentium voluptatem. Corrupti animi quibusdam ullam aut. Corrupti ut ullam nulla. Accusamus pariatur sunt ut iste aperiam similique sint. Accusantium quia illum rem dolorem rem exercitationem qui itaque. Ut eligendi animi saepe provident eum.

Eveniet exercitationem et illum ullam deleniti repudiandae. Dolorem voluptatum velit provident deserunt dolorum. Eius tenetur iure vero ea.

Cum voluptatem cumque reprehenderit non architecto aut sapiente. Itaque voluptas consequatur ut minima et. Iusto laborum eius praesentium et fugit. Aut omnis in alias ducimus commodi.', DATEADD(day, -116, GETDATE()));
SET @MailID_5_13 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_5_13, 5, 3, 0, 0, NULL, DATEADD(day, -116, GETDATE()), DATEADD(day, -116, GETDATE()), DATEADD(day, -115, GETDATE()));

DECLARE @MailID_5_14 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (3, N'Est blanditiis quia cum non.', N'Voluptatem illum exercitationem sed sint in rem sapiente. Labore consequatur incidunt est. Et atque veritatis rerum aliquid molestias cumque. Et est deleniti sit perspiciatis. Ut vero doloremque et deserunt adipisci exercitationem dicta sed amet. Sunt maiores asperiores at.', DATEADD(day, -116, GETDATE()));
SET @MailID_5_14 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_5_14, 5, 3, 0, 0, NULL, DATEADD(day, -116, GETDATE()), DATEADD(day, -116, GETDATE()), DATEADD(day, -115, GETDATE()));

DECLARE @MailID_5_15 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (2, N'Mollitia consequatur qui quo consequatur.', N'Minima et veniam voluptas provident dolorem tenetur provident quasi. Voluptas quae eum nihil consectetur molestiae dolores enim et facere. Aspernatur magni maiores doloremque tenetur veniam. Odit dicta officia et velit tenetur exercitationem quia explicabo est.', DATEADD(day, -93, GETDATE()));
SET @MailID_5_15 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_5_15, 5, 3, 0, 0, NULL, DATEADD(day, -93, GETDATE()), DATEADD(day, -93, GETDATE()), DATEADD(day, -92, GETDATE()));

DECLARE @MailID_5_16 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (4, N'Dignissimos aliquam qui quidem quis.', N'Est voluptas omnis eius facilis corrupti quis porro hic fugiat. Cupiditate autem voluptatem accusantium ratione eligendi ut voluptas minus facere. Eaque hic rerum delectus quisquam aspernatur. Iusto itaque velit ipsa. Autem expedita quam ea sed debitis optio.

Est id id est. Eos repudiandae sit molestiae. Sunt facere nobis quo. Omnis eligendi tempora commodi voluptate laudantium nisi. Quis quasi doloremque voluptate minima. Suscipit qui reiciendis aspernatur sed reiciendis doloribus excepturi nobis.

Distinctio qui vero explicabo molestias eveniet doloremque perspiciatis nostrum minima. Et et sit qui. Rerum qui aperiam. Impedit et est ex veniam harum magnam enim aut.', DATEADD(day, -79, GETDATE()));
SET @MailID_5_16 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_5_16, 5, 3, 0, 0, NULL, DATEADD(day, -79, GETDATE()), DATEADD(day, -79, GETDATE()), NULL);

DECLARE @MailID_5_17 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (7, N'Occaecati dolores rerum molestiae recusandae.', N'Magnam veniam eligendi cum id atque. Eius ullam illo fuga sequi quisquam fugiat placeat omnis. Quia qui quia consequuntur magnam sed ut. Enim illo vero.

Sint occaecati est deleniti vero omnis. Suscipit eum sed tempore cumque aut. Modi animi deleniti ut et officiis. Id dignissimos quis et. Natus repudiandae est saepe repudiandae illum.

Quae porro expedita accusamus cum vitae facilis quam. Eum ullam placeat at. Et quaerat tempore amet corrupti praesentium odio numquam non nemo. Esse cum ducimus deserunt. Officiis cumque iusto occaecati aperiam eveniet nam saepe adipisci nisi.', DATEADD(day, -24, GETDATE()));
SET @MailID_5_17 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_5_17, 5, 3, 0, 0, NULL, DATEADD(day, -24, GETDATE()), DATEADD(day, -24, GETDATE()), DATEADD(day, -23, GETDATE()));

DECLARE @MailID_5_18 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (3, N'Et fuga aut quisquam cumque.', N'Sint ut commodi in incidunt. Nihil quos ut excepturi est officiis delectus. Et tempora et ea et magnam.

At ea magnam numquam et explicabo. Vel minus sunt voluptate numquam. Qui quia laboriosam voluptas eius. Sunt atque vero sed in temporibus voluptatibus. Sit doloribus nisi fugit. Perferendis modi quaerat vero nisi numquam debitis ut nostrum numquam.', DATEADD(day, -16, GETDATE()));
SET @MailID_5_18 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_5_18, 5, 3, 1, 0, NULL, DATEADD(day, -16, GETDATE()), DATEADD(day, -16, GETDATE()), DATEADD(day, -15, GETDATE()));

DECLARE @MailID_5_19 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (9, N'Reiciendis aut maxime cupiditate quia.', N'Et repudiandae explicabo qui laudantium. Et sit enim. Vitae tempora veniam omnis occaecati eaque. Voluptatum sapiente nam voluptatum qui voluptatum iure. Temporibus vel officia animi sapiente ut ratione. Recusandae mollitia beatae illo ipsam ut est est voluptatem nostrum.', DATEADD(day, -17, GETDATE()));
SET @MailID_5_19 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_5_19, 5, 3, 0, 0, NULL, DATEADD(day, -17, GETDATE()), DATEADD(day, -17, GETDATE()), NULL);

DECLARE @MailID_5_20 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (10, N'Et aut ipsa eos odit.', N'Porro cumque a a cum. Voluptatem est architecto sed inventore rerum architecto dolorem. Et iste magnam ipsam aperiam culpa quos et sint. Modi fuga et aut dolor qui rem qui nihil sint. Nulla optio dolorum possimus dolorum quia ipsum.', DATEADD(day, -100, GETDATE()));
SET @MailID_5_20 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_5_20, 5, 3, 0, 0, NULL, DATEADD(day, -100, GETDATE()), DATEADD(day, -100, GETDATE()), NULL);

DECLARE @MailID_5_21 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (7, N'Et voluptatem quia hic perspiciatis.', N'Et quod facilis dolores officia minima tenetur exercitationem. Consequatur aliquam laboriosam voluptatem. Molestiae aut libero delectus atque sunt distinctio molestiae.', DATEADD(day, -114, GETDATE()));
SET @MailID_5_21 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_5_21, 5, 3, 0, 0, NULL, DATEADD(day, -114, GETDATE()), DATEADD(day, -114, GETDATE()), DATEADD(day, -113, GETDATE()));

DECLARE @MailID_5_22 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (9, N'Doloribus porro facilis qui aut.', N'Eveniet eos praesentium exercitationem inventore itaque debitis est eum. In architecto et harum. Quae quos sit facilis fuga. Dolor voluptatem et recusandae voluptatum qui vero repudiandae fugiat. Porro rerum consequuntur ut ipsam dolorum saepe velit a.

Ducimus quo consequatur placeat in consequatur. Possimus laboriosam vel cumque fugit deserunt alias et non aspernatur. Exercitationem possimus natus expedita qui voluptatem aut incidunt. Ratione aut tempore. Inventore ullam labore quia porro qui corporis molestias. Accusamus modi tenetur voluptatem rerum et animi rem aliquid quibusdam.', DATEADD(day, -97, GETDATE()));
SET @MailID_5_22 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_5_22, 5, 3, 0, 0, NULL, DATEADD(day, -97, GETDATE()), DATEADD(day, -97, GETDATE()), NULL);

DECLARE @MailID_5_23 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (1, N'Et earum nostrum dolores nisi.', N'Blanditiis a et rerum nostrum tempore architecto ullam. Quam expedita dolor voluptates est recusandae cumque ad. Ut omnis pariatur iste. Dolores quae nesciunt fuga dolorem quia quae quaerat. Dicta et magnam exercitationem non atque harum culpa voluptatem. Quia pariatur est.

Enim in facilis doloribus aut quae numquam similique eos voluptates. Id quas iusto quia. Illum aut minus omnis et aut cupiditate.', DATEADD(day, -1, GETDATE()));
SET @MailID_5_23 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_5_23, 5, 3, 0, 0, NULL, DATEADD(day, -1, GETDATE()), DATEADD(day, -1, GETDATE()), NULL);

DECLARE @MailID_5_24 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (6, N'Blanditiis voluptate nulla perspiciatis ab.', N'Perferendis consectetur dolore beatae vel quibusdam. Quidem aut dolores culpa tempore nemo dignissimos ut ea dolores. Pariatur ut sit at eum nulla mollitia quaerat asperiores necessitatibus. Placeat doloribus exercitationem quis necessitatibus fugiat vel.', DATEADD(day, -62, GETDATE()));
SET @MailID_5_24 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_5_24, 5, 3, 0, 0, NULL, DATEADD(day, -62, GETDATE()), DATEADD(day, -62, GETDATE()), NULL);

DECLARE @MailID_5_25 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (4, N'Sint possimus itaque impedit voluptas.', N'Ad doloremque rerum reprehenderit. Voluptatem et voluptatem aspernatur facilis omnis omnis qui enim. Voluptatem laboriosam eos explicabo occaecati.

Consequuntur illo adipisci ex eius ut incidunt laboriosam voluptatem ea. Cupiditate debitis inventore pariatur quia modi occaecati quae at autem. Dignissimos aut est voluptate doloribus nihil. Id expedita aperiam possimus modi voluptas nihil consequuntur.', DATEADD(day, -19, GETDATE()));
SET @MailID_5_25 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_5_25, 5, 3, 0, 0, NULL, DATEADD(day, -19, GETDATE()), DATEADD(day, -19, GETDATE()), DATEADD(day, -18, GETDATE()));

DECLARE @MailID_5_26 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (2, N'Autem eos rem cum a.', N'Quas minima consequatur amet sunt. Doloremque ipsam debitis aspernatur facilis. Rerum sapiente consequatur sint nemo et. Eaque perferendis rerum debitis aut quia. Suscipit voluptatem veritatis consequatur eveniet dolores consequatur debitis nihil sapiente. Ducimus ut occaecati.

Laboriosam accusamus non eaque laudantium. Architecto saepe eos ut in veniam. Voluptatem minima pariatur aut a ut. Unde dolorem illum.', DATEADD(day, -19, GETDATE()));
SET @MailID_5_26 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_5_26, 5, 3, 0, 0, NULL, DATEADD(day, -19, GETDATE()), DATEADD(day, -19, GETDATE()), NULL);

DECLARE @MailID_5_27 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (2, N'Cum itaque fugit voluptatibus natus.', N'Rem sed qui nihil est temporibus. Eos rerum eos enim nulla explicabo qui cumque explicabo qui. Aut vero qui porro ipsa debitis amet cum enim exercitationem.

Hic ratione et nulla voluptatum temporibus alias ea sint magni. Natus rerum recusandae nulla et. Qui molestiae sit exercitationem voluptatem dolores excepturi. Nisi veritatis omnis ipsa voluptates repudiandae dolor rerum et.', DATEADD(day, -21, GETDATE()));
SET @MailID_5_27 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_5_27, 5, 3, 0, 0, NULL, DATEADD(day, -21, GETDATE()), DATEADD(day, -21, GETDATE()), DATEADD(day, -20, GETDATE()));

DECLARE @MailID_5_28 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (8, N'Dicta quod vitae vitae aut.', N'Quidem accusantium dolorem dolor. Tenetur placeat voluptates quas et amet repellat dicta. Maxime distinctio assumenda magnam qui. Minima soluta natus ad qui dicta.

Velit mollitia ad. Velit nihil iste aut sunt. Similique excepturi velit iste cum. Quaerat quibusdam facere eveniet dolor ut impedit suscipit. Cupiditate quam quibusdam.', DATEADD(day, -29, GETDATE()));
SET @MailID_5_28 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_5_28, 5, 3, 0, 0, NULL, DATEADD(day, -29, GETDATE()), DATEADD(day, -29, GETDATE()), DATEADD(day, -28, GETDATE()));

DECLARE @MailID_5_29 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (1, N'Quidem laboriosam neque placeat minima.', N'Est quis ut ex facilis quo nostrum corrupti. Itaque mollitia et delectus quis soluta cumque et. Commodi quaerat officia. Ut quis et in reiciendis consequatur qui blanditiis officia.

Sunt excepturi veniam quia commodi aut assumenda et. Est voluptatem atque nesciunt harum omnis possimus culpa sequi illum. Nihil qui reprehenderit aut. Et rerum doloribus in eligendi et. Exercitationem quas ex eum.

Eum ex molestiae et qui laborum. Ut sequi officiis in officiis odio sed cupiditate ut. Odio blanditiis qui commodi amet rerum et porro esse.', DATEADD(day, -110, GETDATE()));
SET @MailID_5_29 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_5_29, 5, 3, 0, 0, NULL, DATEADD(day, -110, GETDATE()), DATEADD(day, -110, GETDATE()), DATEADD(day, -109, GETDATE()));

MERGE AccountInboxState AS target
USING (VALUES (5, 0, 30, '2026-04-16 16:46:07'))
    AS source (AccountID, Category, MailCount, DateLastModified)
ON target.AccountID = source.AccountID
    AND target.Category = source.Category
WHEN MATCHED THEN
    UPDATE SET DateLastModified = source.DateLastModified
WHEN NOT MATCHED THEN
    INSERT (AccountID, Category, MailCount, DateLastModified)
    VALUES (source.AccountID, source.Category, source.MailCount, source.DateLastModified);

DECLARE @MailID_6_0 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (2, N'Voluptas porro commodi necessitatibus neque.', N'Aut placeat et reiciendis sit est ullam soluta aperiam deserunt. Eius et qui ut eos occaecati. Nisi qui id. Et provident nesciunt ut tempore ut et.

Totam hic et distinctio. Ipsam amet qui consequatur et facere. Quaerat placeat provident. Nihil praesentium expedita.', DATEADD(day, -10, GETDATE()));
SET @MailID_6_0 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_6_0, 6, 3, 0, 0, NULL, DATEADD(day, -10, GETDATE()), DATEADD(day, -10, GETDATE()), DATEADD(day, -9, GETDATE()));

DECLARE @MailID_6_1 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (1, N'Sequi beatae iusto laudantium nisi.', N'Praesentium molestiae magnam consequuntur. Assumenda et voluptatem. Non nam deserunt quam. Est eligendi placeat esse consequuntur ea aspernatur autem quas.', DATEADD(day, -68, GETDATE()));
SET @MailID_6_1 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_6_1, 6, 3, 0, 0, NULL, DATEADD(day, -68, GETDATE()), DATEADD(day, -68, GETDATE()), NULL);

DECLARE @MailID_6_2 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (3, N'Delectus velit quibusdam animi consequatur.', N'Omnis fuga voluptas velit consequatur blanditiis qui doloribus illo ut. Rerum maiores tempora est sapiente. Sapiente eligendi non. Iste accusamus sit corporis. Officia accusantium qui quo quas qui pariatur aperiam. Omnis ducimus commodi sequi deserunt et eum omnis error.

Sed assumenda rerum. Ipsam vel deleniti cum distinctio beatae reiciendis consequatur repellat. Velit consequatur et distinctio ipsam sit. Et consequatur consequatur pariatur qui. Veritatis qui et dolorem eligendi. Nihil omnis expedita eligendi modi voluptatem eveniet officia sunt.', DATEADD(day, -12, GETDATE()));
SET @MailID_6_2 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_6_2, 6, 3, 0, 0, NULL, DATEADD(day, -12, GETDATE()), DATEADD(day, -12, GETDATE()), DATEADD(day, -11, GETDATE()));

DECLARE @MailID_6_3 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (4, N'In qui eum maiores et.', N'Et incidunt harum iure corporis ea. Et quos reiciendis. Eos architecto vel.

Eaque cum alias ducimus sit consequatur omnis. Aspernatur animi adipisci sit voluptas. Omnis eos deleniti nihil et occaecati quidem quas. Et nulla minima est voluptas dolores assumenda optio quibusdam.

Suscipit sed sit. Quibusdam occaecati esse beatae quibusdam suscipit commodi cum est sint. Voluptas nihil tempora ducimus.', DATEADD(day, -111, GETDATE()));
SET @MailID_6_3 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_6_3, 6, 3, 0, 0, NULL, DATEADD(day, -111, GETDATE()), DATEADD(day, -111, GETDATE()), DATEADD(day, -110, GETDATE()));

DECLARE @MailID_6_4 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (3, N'Et blanditiis quia sunt corporis.', N'Molestias nam eveniet rerum et. Sint omnis rem ut dolorum. Voluptates doloremque deleniti dolore quaerat molestiae. Quia et architecto saepe quis. Accusamus pariatur qui consequatur. Non quis commodi iure quaerat.', DATEADD(day, -33, GETDATE()));
SET @MailID_6_4 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_6_4, 6, 3, 0, 0, NULL, DATEADD(day, -33, GETDATE()), DATEADD(day, -33, GETDATE()), DATEADD(day, -32, GETDATE()));

DECLARE @MailID_6_5 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (4, N'Exercitationem et sit ut quia.', N'Tenetur magnam aut ut architecto eaque occaecati eos. Quidem velit doloribus porro in dolor nobis id similique voluptas. Dignissimos itaque qui. Qui molestiae magnam. Voluptas nostrum eos.', DATEADD(day, -28, GETDATE()));
SET @MailID_6_5 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_6_5, 6, 3, 0, 0, NULL, DATEADD(day, -28, GETDATE()), DATEADD(day, -28, GETDATE()), DATEADD(day, -27, GETDATE()));

DECLARE @MailID_6_6 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (9, N'Quam sed officiis voluptatem odio.', N'Aliquam magni ex iure quia iure recusandae. Perspiciatis et officia voluptatem nemo quia voluptatem numquam et. Aut ex labore. Quisquam expedita laboriosam. Ullam voluptatem cupiditate rerum ipsam.

Totam modi et. Ut aut rerum. Cum quo quod quo incidunt vitae dolorem. Minima ab perspiciatis dolorem et nesciunt iste.', DATEADD(day, -64, GETDATE()));
SET @MailID_6_6 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_6_6, 6, 3, 0, 0, NULL, DATEADD(day, -64, GETDATE()), DATEADD(day, -64, GETDATE()), DATEADD(day, -63, GETDATE()));

DECLARE @MailID_6_7 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (8, N'Pariatur qui nisi facere expedita.', N'Consequatur fuga fuga sequi est ut ea temporibus enim. Fuga dolor sed non aut saepe ipsum. Omnis tempora voluptas hic. Dolor officia perferendis error. Ut itaque est perferendis consequatur numquam molestias unde corporis ratione.

Blanditiis ipsa qui labore ullam corporis distinctio corrupti debitis. Aut eligendi autem et illum omnis voluptatem nihil sit. Neque facilis sed doloribus qui ut. Repudiandae est sed quia.', DATEADD(day, -11, GETDATE()));
SET @MailID_6_7 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_6_7, 6, 3, 0, 0, NULL, DATEADD(day, -11, GETDATE()), DATEADD(day, -11, GETDATE()), DATEADD(day, -10, GETDATE()));

DECLARE @MailID_6_8 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (9, N'Dolores nostrum maxime quos minus.', N'Laboriosam perspiciatis vero et iste hic explicabo corrupti. Eligendi voluptatibus aspernatur omnis accusantium non. Ea eaque doloremque ut corrupti distinctio id eum sunt praesentium.', DATEADD(day, -67, GETDATE()));
SET @MailID_6_8 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_6_8, 6, 3, 0, 0, NULL, DATEADD(day, -67, GETDATE()), DATEADD(day, -67, GETDATE()), NULL);

DECLARE @MailID_6_9 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (4, N'Sit sed nihil illum vel.', N'Ut sed in dolores aut laboriosam et. Voluptas tempora atque sed. Error nulla minima adipisci ut. Dolor tempore eum vitae qui non et at. Illo et excepturi est odit et est porro. Repellat deserunt libero iusto id aliquam minima dignissimos velit vero.

Amet debitis et provident rerum facere. Deserunt eveniet sequi aut. Vel quod corporis. Aperiam sed odit perferendis id quas. Velit possimus unde sed quae labore animi nulla voluptatem. Hic itaque repellendus ipsa officiis omnis nobis et.', DATEADD(day, -28, GETDATE()));
SET @MailID_6_9 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_6_9, 6, 3, 0, 0, NULL, DATEADD(day, -28, GETDATE()), DATEADD(day, -28, GETDATE()), DATEADD(day, -27, GETDATE()));

DECLARE @MailID_6_10 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (10, N'Cum dolores provident qui soluta.', N'Voluptas veniam a autem corporis explicabo in illo tempore. Soluta incidunt laudantium recusandae saepe eaque dolorum nobis deserunt libero. Reiciendis et est eum perspiciatis alias sunt. Accusantium rerum consequatur molestias dolorem in sapiente.

Et quos excepturi doloremque minima tempora aut aut. Perspiciatis id eveniet ut earum ut reiciendis. Est dolores occaecati. Voluptas ut iure atque molestias perspiciatis dolor quam similique.', DATEADD(day, -116, GETDATE()));
SET @MailID_6_10 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_6_10, 6, 3, 0, 0, NULL, DATEADD(day, -116, GETDATE()), DATEADD(day, -116, GETDATE()), NULL);

DECLARE @MailID_6_11 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (7, N'Laborum rem a non est.', N'Temporibus adipisci hic inventore. Eligendi veniam cumque facere corporis neque porro sed. Laudantium magnam dolores quasi ipsam doloribus vero rerum. Ducimus est inventore. Fugiat rerum enim nulla.

Perferendis incidunt sed ipsam. Sapiente dolor dolor. Deserunt sed quia fugiat ut. Sed sit et dolor voluptatum rem vel voluptas.

Totam quaerat commodi sed animi qui aut. Unde optio vel quasi quo perferendis id. Eveniet qui expedita. Nam quaerat impedit eius distinctio non qui quia. Temporibus dolor dolor ut qui quam dolores illo necessitatibus.', DATEADD(day, -53, GETDATE()));
SET @MailID_6_11 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_6_11, 6, 3, 0, 0, NULL, DATEADD(day, -53, GETDATE()), DATEADD(day, -53, GETDATE()), DATEADD(day, -52, GETDATE()));

DECLARE @MailID_6_12 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (4, N'Qui dolor accusantium sed ut.', N'Officia ducimus quia similique voluptas laboriosam voluptas nulla. Dolorem maiores harum cupiditate fugiat nihil ipsum suscipit quia. Quia sed fuga aliquid nisi sed eos. Ut porro soluta quia eos nemo iure id. Debitis quia voluptas aliquid dolorem in. Officiis architecto et qui.', DATEADD(day, -21, GETDATE()));
SET @MailID_6_12 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_6_12, 6, 3, 0, 0, NULL, DATEADD(day, -21, GETDATE()), DATEADD(day, -21, GETDATE()), NULL);

DECLARE @MailID_6_13 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (4, N'Et rerum enim repellendus autem.', N'Consequatur vel natus. Ut provident voluptatibus quisquam consequatur perspiciatis et quod. Laboriosam ipsa et consectetur magnam.

Ea consequatur dolore quis doloribus blanditiis illo ipsum doloribus expedita. Illum expedita unde quasi mollitia inventore exercitationem repudiandae ut. Omnis nihil error vero officia reiciendis id amet et blanditiis. Id minus aut et et et quas temporibus. Nihil ipsum sunt.', DATEADD(day, -2, GETDATE()));
SET @MailID_6_13 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_6_13, 6, 3, 0, 0, NULL, DATEADD(day, -2, GETDATE()), DATEADD(day, -2, GETDATE()), DATEADD(day, -1, GETDATE()));

DECLARE @MailID_6_14 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (1, N'Odit aut error soluta incidunt.', N'Sunt unde consequuntur neque eos ipsa quidem qui magnam. Non atque et nulla temporibus. In nisi et dolorum perspiciatis hic incidunt fugiat. Qui ab minus consequuntur corporis. Rerum impedit iste ipsum. Sed unde animi eligendi excepturi et dignissimos consectetur.

Nam quasi rerum dolor. Asperiores consequatur in. Aut fugit enim eum architecto provident eum ut quis deleniti. Deserunt ullam quia sit quo voluptatibus voluptas. Ut distinctio eligendi dicta.

Qui eaque dolorem fuga corrupti dicta omnis eos. Possimus vero aut odit culpa. Iure sed neque iusto est unde voluptas dolorem pariatur.', DATEADD(day, -70, GETDATE()));
SET @MailID_6_14 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_6_14, 6, 3, 0, 0, NULL, DATEADD(day, -70, GETDATE()), DATEADD(day, -70, GETDATE()), NULL);

DECLARE @MailID_6_15 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (2, N'Pariatur incidunt ullam quam omnis.', N'Eaque labore eum deleniti dignissimos consequatur. At velit et minima rem sit autem dolores omnis. Consequuntur tenetur non excepturi dolores neque. Enim nesciunt voluptate. Eaque aut aut vel id doloremque. Incidunt dolorem suscipit qui consequuntur quod nihil.

Et et unde. Est eos accusamus. Sed nulla qui inventore non doloribus veritatis tempora occaecati beatae.

Accusantium dolores dolorem qui. Qui iusto sed illum. Est distinctio natus ut illo reprehenderit magnam nemo autem cum. Odit labore ullam sit et rerum eum. Et iste sit dolorum id consequatur enim laudantium cum. Qui quisquam temporibus.', DATEADD(day, -67, GETDATE()));
SET @MailID_6_15 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_6_15, 6, 3, 0, 0, NULL, DATEADD(day, -67, GETDATE()), DATEADD(day, -67, GETDATE()), DATEADD(day, -66, GETDATE()));

DECLARE @MailID_6_16 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (1, N'Ad dignissimos repudiandae dolorem nihil.', N'Et aliquam atque ipsam quae. Dolore similique pariatur ad asperiores. Eveniet et placeat labore aut ea accusantium ratione debitis dignissimos. Quod exercitationem harum ut.

Tenetur cum quo aut rerum. At architecto at rerum non officiis aut vitae quis. Consectetur voluptatem aliquid est non rerum quasi quia eveniet. Quidem ipsam sed ea. Sit rerum perspiciatis quia. Deleniti modi et dolorum ut consequatur vel sit.

Iusto saepe qui harum beatae nesciunt maxime. Sed nobis deleniti voluptatem. Est beatae in. Molestiae provident et omnis architecto. Quas nemo consectetur error fugiat a officia amet. Dolores et eius voluptatum quod adipisci cupiditate.', DATEADD(day, -101, GETDATE()));
SET @MailID_6_16 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_6_16, 6, 3, 0, 0, NULL, DATEADD(day, -101, GETDATE()), DATEADD(day, -101, GETDATE()), DATEADD(day, -100, GETDATE()));

DECLARE @MailID_6_17 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (3, N'Nisi omnis eaque nobis culpa.', N'Sed earum cumque sapiente in architecto hic. Quae quod ut sit sequi omnis rerum. Ut ullam consequatur eos totam facilis ad.

Voluptas eos non voluptatem laudantium quibusdam. Suscipit itaque ex et incidunt quam blanditiis delectus enim. Sed laborum ipsa natus iure sint est adipisci quia.

Qui placeat explicabo est. Tempora asperiores nesciunt repellat et. Nihil culpa quia qui vel voluptas qui. Consequatur rerum debitis quidem maiores ducimus autem doloremque aut et. Inventore est consequatur est est dolores.', DATEADD(day, -24, GETDATE()));
SET @MailID_6_17 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_6_17, 6, 3, 0, 0, NULL, DATEADD(day, -24, GETDATE()), DATEADD(day, -24, GETDATE()), DATEADD(day, -23, GETDATE()));

DECLARE @MailID_6_18 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (7, N'Accusantium numquam aliquid illum dolore.', N'Nesciunt dolorum adipisci ut et eos voluptate pariatur. Dignissimos inventore est exercitationem doloribus et. Quam id itaque repellat deserunt praesentium rerum fugit. Ut dignissimos quidem inventore quae modi.

Natus mollitia magnam blanditiis aperiam doloribus facere neque. Iusto quod eos recusandae voluptatibus minus quia vel. Officiis qui error libero qui ut.

Praesentium eum eius enim perspiciatis vel enim. Corporis accusamus autem. Ab inventore molestiae enim ipsam in ratione dolorem iste. Fugiat error voluptate consequuntur quo est laudantium magni dignissimos.', DATEADD(day, -24, GETDATE()));
SET @MailID_6_18 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_6_18, 6, 3, 0, 0, NULL, DATEADD(day, -24, GETDATE()), DATEADD(day, -24, GETDATE()), NULL);

DECLARE @MailID_6_19 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (7, N'Facere reprehenderit quaerat fugit quae.', N'Eum dolores ullam illo voluptatum. Qui excepturi itaque aut aut. Assumenda omnis est exercitationem placeat qui voluptate vel ipsam.

Consectetur qui autem rerum qui quam. Laudantium magnam reiciendis ipsum libero suscipit aut eos sequi. Sit quam sed libero rerum aut soluta. Reiciendis aliquid minima. Optio et ipsam totam non voluptatibus maiores deleniti voluptatem. Alias nemo minus ut rerum eius doloremque tenetur.

Dolorum dicta et et enim omnis. Sint voluptatem ipsum at et. Quia eaque est consequuntur. Facilis ut rerum repellat expedita sapiente.', DATEADD(day, -7, GETDATE()));
SET @MailID_6_19 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_6_19, 6, 3, 0, 0, NULL, DATEADD(day, -7, GETDATE()), DATEADD(day, -7, GETDATE()), DATEADD(day, -6, GETDATE()));

DECLARE @MailID_6_20 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (3, N'Provident minus blanditiis magnam dolores.', N'Quas iste sed provident aliquid aut asperiores sed ipsum rerum. Et consequatur laborum inventore consequatur neque quis amet eos ipsa. Distinctio aspernatur voluptatum officia. Culpa dolores alias molestiae. Assumenda quia voluptas quibusdam quia non a aut distinctio. Doloribus eum sit.', DATEADD(day, -75, GETDATE()));
SET @MailID_6_20 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_6_20, 6, 3, 0, 0, NULL, DATEADD(day, -75, GETDATE()), DATEADD(day, -75, GETDATE()), NULL);

DECLARE @MailID_6_21 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (1, N'Consequatur quae saepe aspernatur aliquid.', N'Quaerat nostrum praesentium. Illo consequatur expedita atque ipsum expedita voluptatibus dignissimos. Soluta qui sunt unde non velit aut ex iusto voluptatem. Aliquam omnis quaerat odio dolor omnis.

Et recusandae omnis ut sed quia dolor corporis. Expedita quas deserunt repudiandae porro laboriosam labore. Explicabo veritatis aut sunt esse nemo sint vitae non. At quos culpa nulla. Eveniet culpa fugit aspernatur laudantium incidunt ea. Sunt vero rerum odio.', DATEADD(day, -14, GETDATE()));
SET @MailID_6_21 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_6_21, 6, 3, 0, 0, NULL, DATEADD(day, -14, GETDATE()), DATEADD(day, -14, GETDATE()), DATEADD(day, -13, GETDATE()));

DECLARE @MailID_6_22 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (8, N'Harum quis eos voluptas sed.', N'Inventore sit non molestias ea qui sint facilis quasi. Ut pariatur et aut sequi voluptates ut necessitatibus. Atque eligendi corporis commodi eos laborum et. Odit expedita optio cupiditate. Culpa praesentium sint in sit.', DATEADD(day, -107, GETDATE()));
SET @MailID_6_22 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_6_22, 6, 3, 0, 0, NULL, DATEADD(day, -107, GETDATE()), DATEADD(day, -107, GETDATE()), NULL);

DECLARE @MailID_6_23 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (8, N'Et sapiente qui qui error.', N'Nobis quisquam placeat quod velit. Necessitatibus aut sapiente ducimus provident exercitationem deserunt. Ducimus sit eum qui maxime sequi illo at dolorum minus.', DATEADD(day, -42, GETDATE()));
SET @MailID_6_23 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_6_23, 6, 3, 1, 0, NULL, DATEADD(day, -42, GETDATE()), DATEADD(day, -42, GETDATE()), DATEADD(day, -41, GETDATE()));

DECLARE @MailID_6_24 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (2, N'Sit corrupti omnis vel nobis.', N'Quis nihil corrupti eum dolores quia ut blanditiis. Sit officia temporibus sed placeat earum consequatur cupiditate eaque. Recusandae natus est eveniet. Rerum nulla minima dolorem facilis. Esse maxime aut tenetur numquam soluta eveniet corporis provident et.', DATEADD(day, -87, GETDATE()));
SET @MailID_6_24 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_6_24, 6, 3, 0, 0, NULL, DATEADD(day, -87, GETDATE()), DATEADD(day, -87, GETDATE()), DATEADD(day, -86, GETDATE()));

DECLARE @MailID_6_25 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (4, N'Ea pariatur rerum recusandae voluptatem.', N'Alias numquam assumenda optio et. Non et nam voluptatum ullam eum quae vero tenetur eveniet. Omnis quas vitae labore consequatur porro temporibus consequatur omnis veniam. Porro ipsa atque aut.', DATEADD(day, -41, GETDATE()));
SET @MailID_6_25 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_6_25, 6, 3, 0, 0, NULL, DATEADD(day, -41, GETDATE()), DATEADD(day, -41, GETDATE()), DATEADD(day, -40, GETDATE()));

DECLARE @MailID_6_26 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (9, N'Ratione mollitia enim suscipit quisquam.', N'Adipisci voluptatem et non quia consequatur voluptate ducimus. Odio dolorem non qui qui exercitationem alias modi in. Debitis aperiam eaque distinctio dignissimos.', DATEADD(day, -107, GETDATE()));
SET @MailID_6_26 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_6_26, 6, 3, 0, 0, NULL, DATEADD(day, -107, GETDATE()), DATEADD(day, -107, GETDATE()), DATEADD(day, -106, GETDATE()));

DECLARE @MailID_6_27 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (1, N'Non molestiae aliquam maiores pariatur.', N'Sed debitis similique aut beatae. Pariatur dolor reiciendis alias corrupti id. Distinctio accusamus veniam vel ipsum voluptatibus facere eum.

Ipsum beatae et reiciendis aut. Molestiae ut eos cumque fugiat libero enim consequuntur ut. Fuga et et et culpa eligendi et qui architecto dicta. Voluptate nisi qui. Et et non dolore tempore laudantium ex. Consequuntur autem adipisci.', DATEADD(day, -108, GETDATE()));
SET @MailID_6_27 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_6_27, 6, 3, 1, 0, NULL, DATEADD(day, -108, GETDATE()), DATEADD(day, -108, GETDATE()), DATEADD(day, -107, GETDATE()));

DECLARE @MailID_6_28 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (5, N'Perspiciatis nam voluptatum alias earum.', N'Amet a sunt libero ut enim ab. Dicta et voluptatem dolores voluptatem necessitatibus laboriosam praesentium ratione. Suscipit nulla nisi tenetur sit id at. Fugit a et architecto saepe error quisquam ipsam voluptatem.

Magni pariatur recusandae architecto delectus. Voluptatem fugiat quia beatae sit error sed dolore provident. At quam esse saepe rerum pariatur dolore non.

Quis omnis officia sit est occaecati ut. Est in et modi molestiae illo. Cupiditate assumenda exercitationem aliquid quod enim. Quam est non sit ipsa est aliquam aut velit.', DATEADD(day, -3, GETDATE()));
SET @MailID_6_28 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_6_28, 6, 3, 0, 0, NULL, DATEADD(day, -3, GETDATE()), DATEADD(day, -3, GETDATE()), DATEADD(day, -2, GETDATE()));

DECLARE @MailID_6_29 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (2, N'Ipsa atque facilis ut voluptatem.', N'Non velit quis qui enim nulla. Necessitatibus non eligendi omnis consequatur debitis consectetur. Harum distinctio doloribus consequuntur ut repudiandae laudantium. Corporis praesentium minima iste officiis accusantium illo fugit. Et nobis commodi autem velit.

Et distinctio quasi rerum quos. Aliquid perspiciatis ut quam molestiae ut dolor omnis id sunt. Rerum ut beatae vel officiis optio quis nostrum labore alias. Minima quo dolores beatae sint adipisci mollitia illum illum illo. Animi ut voluptatem earum atque est quas incidunt.

Doloremque veniam nobis nulla alias rem. Ex temporibus et nobis et dolorem et iure autem dolorem. Saepe tempore quibusdam minus enim. Voluptas qui omnis qui ut. Voluptas cupiditate et accusantium.', DATEADD(day, -86, GETDATE()));
SET @MailID_6_29 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_6_29, 6, 3, 1, 0, NULL, DATEADD(day, -86, GETDATE()), DATEADD(day, -86, GETDATE()), NULL);

MERGE AccountInboxState AS target
USING (VALUES (6, 0, 30, '2026-04-15 16:46:07'))
    AS source (AccountID, Category, MailCount, DateLastModified)
ON target.AccountID = source.AccountID
    AND target.Category = source.Category
WHEN MATCHED THEN
    UPDATE SET DateLastModified = source.DateLastModified
WHEN NOT MATCHED THEN
    INSERT (AccountID, Category, MailCount, DateLastModified)
    VALUES (source.AccountID, source.Category, source.MailCount, source.DateLastModified);

DECLARE @MailID_7_0 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (5, N'Aut blanditiis rerum maiores sint.', N'Veritatis magnam quas. Ut ut voluptatibus tempore. Ut nam reprehenderit excepturi omnis id. Totam sint eveniet. Sapiente soluta tenetur et nesciunt voluptate sed vitae qui.

Consequatur velit odit ex id est modi saepe architecto. Et et culpa. Omnis ipsum quaerat inventore aperiam.', DATEADD(day, -41, GETDATE()));
SET @MailID_7_0 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_7_0, 7, 3, 0, 0, NULL, DATEADD(day, -41, GETDATE()), DATEADD(day, -41, GETDATE()), DATEADD(day, -40, GETDATE()));

DECLARE @MailID_7_1 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (9, N'Suscipit ipsa aliquid quae voluptatem.', N'Fuga et et dolore consequatur earum. Tempora voluptatum omnis quaerat omnis. Quibusdam placeat nulla quo aut et. Aut laudantium sit qui in tempore et voluptatem praesentium. Necessitatibus ea eveniet aut quae et aut.', DATEADD(day, -81, GETDATE()));
SET @MailID_7_1 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_7_1, 7, 3, 0, 0, NULL, DATEADD(day, -81, GETDATE()), DATEADD(day, -81, GETDATE()), NULL);

DECLARE @MailID_7_2 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (4, N'Cum magnam ab sit ut.', N'Vel et quia laborum quos. Id dolorem mollitia consequatur voluptatem veritatis sunt. Autem quod consequatur dignissimos magni est deserunt corporis qui. Dolore repudiandae nihil beatae soluta cum. Pariatur rerum magni. Voluptate sapiente aliquam qui sint dignissimos.', DATEADD(day, -47, GETDATE()));
SET @MailID_7_2 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_7_2, 7, 3, 0, 0, NULL, DATEADD(day, -47, GETDATE()), DATEADD(day, -47, GETDATE()), NULL);

DECLARE @MailID_7_3 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (9, N'Rerum sed quia aut dignissimos.', N'Cum maiores repellendus. Eveniet voluptas cumque deserunt tempore. Quasi quo ex quibusdam sint vel.

Et soluta nihil maiores praesentium et facilis quae dolorem. Possimus id earum. Rerum nulla fugit nostrum in numquam ut. Qui distinctio illum debitis eos ut ipsam accusamus. Nulla commodi error. Maxime qui quo praesentium voluptatem incidunt doloribus.

Quis dolor quo aut quas nobis deleniti quaerat. Asperiores sunt esse beatae. Dolor qui at.', DATEADD(day, -114, GETDATE()));
SET @MailID_7_3 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_7_3, 7, 3, 0, 0, NULL, DATEADD(day, -114, GETDATE()), DATEADD(day, -114, GETDATE()), DATEADD(day, -113, GETDATE()));

DECLARE @MailID_7_4 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (2, N'Nesciunt quo labore eaque eos.', N'Placeat cumque nihil repellendus officia rem. Numquam blanditiis fugit occaecati aspernatur. Possimus sunt voluptate aut. Possimus dolor odio inventore tenetur et. Ea assumenda debitis laudantium est. Id dolorem enim quaerat blanditiis sit.

Explicabo quia est blanditiis. Vel dolore provident est voluptatem minus eaque quae aut enim. Aut quidem reprehenderit quae cupiditate aliquid autem aliquid. Dolorem ad repudiandae eos harum maiores. Doloremque maxime sed aut qui repellendus maxime. Quo velit placeat dolores modi.', DATEADD(day, -10, GETDATE()));
SET @MailID_7_4 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_7_4, 7, 3, 0, 0, NULL, DATEADD(day, -10, GETDATE()), DATEADD(day, -10, GETDATE()), DATEADD(day, -9, GETDATE()));

DECLARE @MailID_7_5 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (8, N'Non perferendis ipsam sapiente rerum.', N'Vel aut sunt eaque voluptas quisquam id aliquid. Voluptate est adipisci non voluptas ut molestiae temporibus laboriosam consequatur. Harum incidunt ut cupiditate iusto eum voluptates ex provident. Ut omnis rem porro.

Ducimus dolor dolorem aliquam in. Omnis minus eos inventore est iste eaque incidunt. In quibusdam non. Ex dolores sed qui repellendus et. Nisi tempora ducimus reiciendis. Voluptatem temporibus omnis neque dolores sit sint.

Iste illum magnam nisi. Ipsam inventore natus perspiciatis non maxime itaque omnis. Ea harum porro recusandae quis praesentium. Delectus temporibus facilis dolor voluptate. Asperiores dolores sint et magnam nihil vel ratione. Voluptatem reprehenderit nihil ab deserunt non deleniti porro aut illum.', DATEADD(day, -1, GETDATE()));
SET @MailID_7_5 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_7_5, 7, 3, 0, 0, NULL, DATEADD(day, -1, GETDATE()), DATEADD(day, -1, GETDATE()), NULL);

DECLARE @MailID_7_6 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (9, N'Est nobis rerum voluptatem magni.', N'Dolorem voluptates id hic qui aperiam similique dolore. Ducimus error inventore. Id ipsa deserunt est.

Ut ab tempore consequatur asperiores culpa voluptatem expedita omnis. Est id porro mollitia voluptatem fuga. Impedit dolorum possimus officiis et quis. Eligendi nostrum neque consequatur. Aspernatur commodi non voluptas autem. Et aut consequatur ratione non ut iste animi quidem accusamus.

Maxime ea beatae error. Repellat placeat enim sint et. Aut perferendis sed. Et optio iusto fugiat qui culpa et nam.', DATEADD(day, -68, GETDATE()));
SET @MailID_7_6 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_7_6, 7, 3, 0, 0, NULL, DATEADD(day, -68, GETDATE()), DATEADD(day, -68, GETDATE()), DATEADD(day, -67, GETDATE()));

DECLARE @MailID_7_7 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (2, N'Sapiente qui dolores deleniti laboriosam.', N'Culpa veniam non atque est voluptatem sint repudiandae corrupti. Possimus labore consectetur ex ipsam. Hic rerum molestias.

Sint neque expedita libero quo alias eius. Vel eius doloremque neque voluptatum iusto aspernatur aut. Illum exercitationem eum enim provident molestias eum laudantium non nobis. Voluptates et suscipit accusantium consequatur quia voluptas quia ullam. Soluta autem fugit voluptate voluptas quam error iure quas. Id sint provident occaecati pariatur sit voluptate.', DATEADD(day, -82, GETDATE()));
SET @MailID_7_7 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_7_7, 7, 3, 0, 0, NULL, DATEADD(day, -82, GETDATE()), DATEADD(day, -82, GETDATE()), NULL);

DECLARE @MailID_7_8 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (10, N'Ipsam vero et est aliquam.', N'Qui odio velit excepturi. Eos iure placeat accusamus minus sed. Et velit sit voluptatibus quidem inventore. Quia nostrum doloribus. Et quo molestiae quasi est nesciunt enim debitis voluptate. Optio ad architecto aliquam a eos magni impedit molestiae eum.', DATEADD(day, -57, GETDATE()));
SET @MailID_7_8 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_7_8, 7, 3, 0, 0, NULL, DATEADD(day, -57, GETDATE()), DATEADD(day, -57, GETDATE()), NULL);

DECLARE @MailID_7_9 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (9, N'Inventore nihil maxime debitis aut.', N'Aperiam minima quidem et quo soluta fugit. Voluptate modi qui. Facere tenetur eum ea eveniet tenetur. Earum impedit molestias autem et perspiciatis nulla fuga consequatur minus.', DATEADD(day, -110, GETDATE()));
SET @MailID_7_9 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_7_9, 7, 3, 0, 0, NULL, DATEADD(day, -110, GETDATE()), DATEADD(day, -110, GETDATE()), NULL);

DECLARE @MailID_7_10 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (5, N'Eos laboriosam totam et qui.', N'Consequatur omnis ut. Iure nam in nihil. Officia quae totam ipsam tempora.', DATEADD(day, -86, GETDATE()));
SET @MailID_7_10 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_7_10, 7, 3, 0, 0, NULL, DATEADD(day, -86, GETDATE()), DATEADD(day, -86, GETDATE()), DATEADD(day, -85, GETDATE()));

DECLARE @MailID_7_11 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (10, N'Earum qui dignissimos rerum velit.', N'Est dignissimos culpa officiis placeat eum. Quia ut eos illum consequuntur. Adipisci alias totam repudiandae animi. Esse facere pariatur qui in facilis tempora maiores voluptates. Quasi voluptas explicabo doloribus quibusdam esse aut et.

Tempore facere sapiente voluptates qui veniam consequatur odit. Et id nam quibusdam occaecati et. Sapiente dolores repellat.

Voluptatem nobis eius doloremque et. Dolorum consectetur fuga id quia dignissimos commodi occaecati. Earum ad necessitatibus in omnis dolorum dolorem deleniti.', DATEADD(day, -18, GETDATE()));
SET @MailID_7_11 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_7_11, 7, 3, 1, 0, NULL, DATEADD(day, -18, GETDATE()), DATEADD(day, -18, GETDATE()), DATEADD(day, -17, GETDATE()));

DECLARE @MailID_7_12 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (8, N'Debitis modi ab ut tempora.', N'Accusamus saepe aut facere et repellat ut. Possimus eos consequatur consequatur provident. Quibusdam libero deleniti quibusdam. Ut distinctio ad consequuntur voluptatem facilis autem at. Veritatis nihil totam non deleniti at. Molestias consequatur harum laudantium suscipit aut error veritatis ut.', DATEADD(day, -108, GETDATE()));
SET @MailID_7_12 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_7_12, 7, 3, 0, 0, NULL, DATEADD(day, -108, GETDATE()), DATEADD(day, -108, GETDATE()), NULL);

DECLARE @MailID_7_13 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (3, N'Consequatur fugit sint iusto quibusdam.', N'Voluptatem possimus quod voluptate omnis eligendi aut sint recusandae. Sed tempore fugiat quis sed omnis est animi. Praesentium quas quidem velit voluptatum aut beatae voluptas aliquid soluta. Quidem sapiente enim id.

Illum numquam et sit. Nam asperiores id officia eos amet laboriosam consectetur vero aut. Rem incidunt unde quas nisi minus beatae molestias occaecati. Necessitatibus laudantium necessitatibus et qui ducimus amet similique asperiores nulla. Nisi sint doloremque consequatur ratione vel. Incidunt explicabo assumenda et voluptatem occaecati.

Fugiat aliquid id nobis maiores esse. Quos accusamus accusamus nisi nisi praesentium. Ab est odit. Earum harum aliquam occaecati illum unde.', DATEADD(day, -29, GETDATE()));
SET @MailID_7_13 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_7_13, 7, 3, 0, 0, NULL, DATEADD(day, -29, GETDATE()), DATEADD(day, -29, GETDATE()), DATEADD(day, -28, GETDATE()));

DECLARE @MailID_7_14 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (2, N'Quis dolore illo ut voluptas.', N'Repudiandae cupiditate quia odio temporibus minima cupiditate. Pariatur perferendis labore enim numquam in dolores eaque facilis consequatur. Quis itaque assumenda assumenda perspiciatis reprehenderit consequatur ut. Eligendi voluptatem laudantium voluptatem et at aut vitae officia. Nobis labore quis veniam nisi.

Placeat molestiae voluptas itaque magni asperiores dolorum est. Quaerat nam labore facere. Impedit harum dolor asperiores iste ullam nobis consequatur. Rerum unde quam ut. Voluptate possimus sed laboriosam magni. Quisquam aut aut aliquid corrupti.', DATEADD(day, -59, GETDATE()));
SET @MailID_7_14 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_7_14, 7, 3, 0, 0, NULL, DATEADD(day, -59, GETDATE()), DATEADD(day, -59, GETDATE()), NULL);

DECLARE @MailID_7_15 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (1, N'Explicabo laudantium qui repudiandae voluptates.', N'Et omnis quis et quis. Odit numquam voluptate ea qui dolorem natus ut pariatur. Vitae alias facere delectus ea dolorem. Amet cum tempora qui. Illum dolorum quo quae aliquam ut excepturi. Nam consequatur nam beatae exercitationem voluptatem fuga dolores eos.

Delectus velit quae. Culpa dolor nihil ut est provident. A assumenda eveniet harum porro quos velit.', DATEADD(day, -87, GETDATE()));
SET @MailID_7_15 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_7_15, 7, 3, 0, 0, NULL, DATEADD(day, -87, GETDATE()), DATEADD(day, -87, GETDATE()), DATEADD(day, -86, GETDATE()));

DECLARE @MailID_7_16 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (5, N'Laborum ex voluptas nihil maxime.', N'Aut nulla hic voluptates illo aliquam voluptatem sint quidem. Sunt non et ipsam cumque eius enim aliquam voluptas saepe. Est et in vero.

Odit autem quia itaque. Qui eius animi et provident nam laborum nulla officia. Ullam qui neque fugit quos quis facere voluptatem id. Odit aut est. Consectetur consequuntur ducimus quia corrupti ut perferendis harum voluptas eos.', DATEADD(day, -115, GETDATE()));
SET @MailID_7_16 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_7_16, 7, 3, 0, 0, NULL, DATEADD(day, -115, GETDATE()), DATEADD(day, -115, GETDATE()), NULL);

DECLARE @MailID_7_17 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (5, N'Consequatur dolore est inventore error.', N'At voluptatum temporibus iste laborum accusantium amet. Atque ipsam vitae excepturi assumenda doloremque nihil aut. Voluptates possimus quam omnis voluptates voluptatem. Repellendus molestias molestias quo cum alias. Reprehenderit eos rerum. Quam pariatur enim quibusdam consequatur.

Aut voluptates ea qui. Et dolore consectetur quam occaecati sed aliquid. Et voluptatibus sed repellendus at. Expedita at qui qui distinctio eaque. Ut ipsum corporis voluptas. Nesciunt libero asperiores beatae qui sint laudantium molestiae recusandae pariatur.

Facilis omnis occaecati aut eos. Minima veniam et. Omnis eligendi qui praesentium quo officiis eligendi animi eum neque. Repellat non asperiores quia quibusdam ut impedit et doloribus aut.', DATEADD(day, -39, GETDATE()));
SET @MailID_7_17 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_7_17, 7, 3, 1, 0, NULL, DATEADD(day, -39, GETDATE()), DATEADD(day, -39, GETDATE()), DATEADD(day, -38, GETDATE()));

DECLARE @MailID_7_18 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (6, N'Voluptas excepturi iure ut accusantium.', N'Est id est. Exercitationem expedita unde quasi voluptate et quia dolor. Rerum repellendus ut fugiat doloremque ipsam quod iste. Id voluptatem quia accusantium veniam eveniet harum. Debitis ut et doloribus numquam libero nam sapiente. Dolore rerum deserunt et quia voluptas qui earum.

Sequi culpa facere inventore eveniet necessitatibus. Est eum voluptatem dolores incidunt eveniet nobis blanditiis magnam placeat. Voluptate ad facilis at officia consequatur placeat sunt cupiditate.

Numquam aut sequi est aut optio non impedit impedit et. Ut beatae commodi incidunt. Nihil perspiciatis quam et ab quas asperiores occaecati in quia. A voluptatibus est ea voluptas.', DATEADD(day, -14, GETDATE()));
SET @MailID_7_18 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_7_18, 7, 3, 0, 0, NULL, DATEADD(day, -14, GETDATE()), DATEADD(day, -14, GETDATE()), DATEADD(day, -13, GETDATE()));

DECLARE @MailID_7_19 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (1, N'Atque id laborum eum facere.', N'Consequatur nihil in voluptatem sequi. Aliquam autem corrupti quis dolores voluptatem. Sequi facere et dicta magni sed voluptatibus fugit.', DATEADD(day, -50, GETDATE()));
SET @MailID_7_19 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_7_19, 7, 3, 0, 0, NULL, DATEADD(day, -50, GETDATE()), DATEADD(day, -50, GETDATE()), NULL);

DECLARE @MailID_7_20 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (5, N'Omnis laborum error eos atque.', N'Possimus ratione sed similique a voluptatem praesentium quidem. Sint nulla ipsum aut. Et facere enim. Ullam aspernatur vero et maxime blanditiis voluptas et.

Incidunt eius ipsa quia adipisci neque eveniet iste tempora nemo. Hic eum voluptatem omnis aspernatur neque debitis nulla. Ut amet totam. Dolorem quisquam maxime molestiae facere. Quo deserunt exercitationem distinctio velit.', DATEADD(day, -90, GETDATE()));
SET @MailID_7_20 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_7_20, 7, 3, 0, 0, NULL, DATEADD(day, -90, GETDATE()), DATEADD(day, -90, GETDATE()), DATEADD(day, -89, GETDATE()));

DECLARE @MailID_7_21 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (10, N'Possimus ab minus non facilis.', N'Est enim libero incidunt. Totam ratione quas et quis omnis ratione qui atque sed. Laborum quo alias porro. Consequatur beatae est neque. Molestiae non et doloribus saepe unde et illum ut. Et dolores rerum illum porro eum culpa et inventore quia.

Atque dicta quis consectetur et. Numquam sed id doloribus autem consequuntur eos. Sunt dolorum est. Neque animi eum quia harum rem illum est fugiat placeat. Animi voluptas earum consequatur recusandae esse optio quisquam.

Vero at ea quam itaque nisi qui accusantium esse vitae. Quos quod expedita sit praesentium ut nostrum doloremque sed qui. Autem tenetur accusantium est quo deserunt rerum pariatur velit vel.', DATEADD(day, -10, GETDATE()));
SET @MailID_7_21 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_7_21, 7, 3, 0, 0, NULL, DATEADD(day, -10, GETDATE()), DATEADD(day, -10, GETDATE()), NULL);

DECLARE @MailID_7_22 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (8, N'Labore tempore harum rerum iste.', N'Occaecati animi nemo vel eum et commodi est consequatur. Iste reprehenderit modi maiores cum rerum. Sed necessitatibus mollitia vitae modi quis ut sed minima.

Omnis eum qui aliquid dolorem veniam numquam aut dolor. Aut error officiis odio quas eum id. Autem quae doloremque reprehenderit fugiat ipsam fuga ut nostrum. Laudantium modi similique explicabo porro. Atque temporibus maiores perspiciatis. Necessitatibus molestiae animi id.

Architecto numquam quibusdam corrupti. Aut at qui. Debitis aliquid aut rem fugiat est assumenda. Aut velit aliquid perspiciatis aliquam explicabo eaque. Iste sit neque ut autem et quas.', DATEADD(day, -27, GETDATE()));
SET @MailID_7_22 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_7_22, 7, 3, 0, 0, NULL, DATEADD(day, -27, GETDATE()), DATEADD(day, -27, GETDATE()), DATEADD(day, -26, GETDATE()));

DECLARE @MailID_7_23 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (6, N'Aut doloribus laborum voluptatum nemo.', N'Porro nam eligendi sit qui reiciendis in blanditiis aut nulla. Delectus quasi quam molestias qui. Consequatur omnis nihil cum doloremque est itaque. Voluptatum exercitationem quae nam quibusdam iste optio et.

Quas consequuntur consequatur aut dolorem totam quo. Exercitationem unde ratione. Ut tempora vel deleniti odio magnam. Vel a fugit rerum qui accusantium eos sint.

Quis soluta doloremque nemo. Odit quia iusto laboriosam doloribus cumque laboriosam soluta dolor qui. Culpa ullam exercitationem eos qui et non. Quia eos quis eveniet unde velit harum nam. Quis quia fugit dolorem. Tempore ex corrupti.', DATEADD(day, -63, GETDATE()));
SET @MailID_7_23 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_7_23, 7, 3, 0, 0, NULL, DATEADD(day, -63, GETDATE()), DATEADD(day, -63, GETDATE()), DATEADD(day, -62, GETDATE()));

DECLARE @MailID_7_24 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (10, N'Dicta facilis labore id quos.', N'In ratione est ut provident nulla est. Deserunt qui ut rerum occaecati quas dolorem distinctio deleniti qui. Qui aut libero ut aut eos quae veritatis. Ratione dolor velit explicabo numquam libero fugit. Fugit commodi vel ut recusandae ipsum nobis.', DATEADD(day, -108, GETDATE()));
SET @MailID_7_24 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_7_24, 7, 3, 0, 0, NULL, DATEADD(day, -108, GETDATE()), DATEADD(day, -108, GETDATE()), NULL);

DECLARE @MailID_7_25 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (5, N'Maxime nemo saepe aut eveniet.', N'Libero pariatur sunt ipsum. Eum enim eaque voluptatem doloremque culpa ut nihil. Quam et voluptatem laborum quod deleniti et. Error quia totam illo est atque.

Delectus beatae earum. Voluptate cumque dolore minima architecto. Culpa dolorum hic non recusandae ut rerum aliquam cum aut. Aut omnis sed molestiae nihil unde sit. Ea rerum reiciendis voluptatem ut aut sint est.

Et perspiciatis quibusdam sed ut animi quod sunt perferendis fugiat. Sit harum sunt doloribus illo voluptatem quasi sed. Officia omnis deleniti aut corrupti omnis veritatis nesciunt consequatur ratione.', DATEADD(day, -38, GETDATE()));
SET @MailID_7_25 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_7_25, 7, 3, 0, 0, NULL, DATEADD(day, -38, GETDATE()), DATEADD(day, -38, GETDATE()), DATEADD(day, -37, GETDATE()));

DECLARE @MailID_7_26 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (9, N'Non accusantium iusto et nihil.', N'Nulla totam quos. Cum minima iste. Et et qui dolore voluptatum. Aliquam et harum officia.', DATEADD(day, -36, GETDATE()));
SET @MailID_7_26 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_7_26, 7, 3, 1, 0, NULL, DATEADD(day, -36, GETDATE()), DATEADD(day, -36, GETDATE()), DATEADD(day, -35, GETDATE()));

DECLARE @MailID_7_27 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (8, N'Accusamus ad ratione qui et.', N'Aliquid cupiditate sunt architecto. Aspernatur occaecati aut recusandae delectus dignissimos non doloribus. Ut natus ratione. Id voluptatem facere eligendi recusandae soluta sed magnam. Exercitationem occaecati minima ullam qui quos.

Consequatur non quaerat placeat. Quaerat voluptas quo et omnis quia id velit non et. Sint quas repudiandae labore consequatur est.', DATEADD(day, -99, GETDATE()));
SET @MailID_7_27 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_7_27, 7, 3, 0, 0, NULL, DATEADD(day, -99, GETDATE()), DATEADD(day, -99, GETDATE()), DATEADD(day, -98, GETDATE()));

DECLARE @MailID_7_28 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (2, N'Ea pariatur laborum quidem architecto.', N'Excepturi est et. Incidunt aut voluptatem officiis mollitia nostrum tempora quos aliquid veritatis. Nobis modi autem qui laudantium et quia in.

Repellendus exercitationem nobis iure deserunt officia vero quia sed possimus. Magni hic id atque fugiat consequatur cumque error. Ea quam qui ut tempore eveniet qui. Velit minima et earum.

Est accusamus ex iure vero est doloribus rem. Reprehenderit placeat placeat distinctio deleniti doloribus voluptas. Reprehenderit distinctio aspernatur. Itaque suscipit et quia ut porro dolores ut. Et nostrum ducimus tempora et. Et dolor dignissimos nulla magni id expedita.', DATEADD(day, -53, GETDATE()));
SET @MailID_7_28 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_7_28, 7, 3, 0, 0, NULL, DATEADD(day, -53, GETDATE()), DATEADD(day, -53, GETDATE()), DATEADD(day, -52, GETDATE()));

DECLARE @MailID_7_29 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (10, N'Voluptatem et officiis officia veniam.', N'Magni accusamus officiis est. In velit et ut quia omnis necessitatibus corporis mollitia adipisci. Maxime aut quasi iure iste fuga totam eos ut.', DATEADD(day, -3, GETDATE()));
SET @MailID_7_29 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_7_29, 7, 3, 0, 0, NULL, DATEADD(day, -3, GETDATE()), DATEADD(day, -3, GETDATE()), NULL);

MERGE AccountInboxState AS target
USING (VALUES (7, 0, 30, '2026-04-16 16:46:07'))
    AS source (AccountID, Category, MailCount, DateLastModified)
ON target.AccountID = source.AccountID
    AND target.Category = source.Category
WHEN MATCHED THEN
    UPDATE SET DateLastModified = source.DateLastModified
WHEN NOT MATCHED THEN
    INSERT (AccountID, Category, MailCount, DateLastModified)
    VALUES (source.AccountID, source.Category, source.MailCount, source.DateLastModified);

DECLARE @MailID_8_0 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (2, N'Maiores deleniti repudiandae deserunt ut.', N'Pariatur omnis quibusdam quo fugiat et ullam deleniti sunt doloremque. Quae aspernatur dolorum quo non quo. Nemo a vel voluptatum repellat animi optio reiciendis reiciendis.

Quos et sit omnis quia atque tempora esse numquam et. Praesentium laudantium cum quia asperiores eos odio odio animi. Autem voluptate dignissimos tempore rerum animi enim laboriosam et rerum. Dignissimos rem cum ipsum. Et earum et.

Ratione quia quisquam illo magnam at nobis. Id dolorem qui minima quas. Illum quidem iste aut qui est explicabo incidunt. Aut reiciendis quo sit error totam dignissimos enim. Optio et et culpa vel placeat vel qui. Nulla iste hic dicta iste itaque voluptate ea.', DATEADD(day, -25, GETDATE()));
SET @MailID_8_0 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_8_0, 8, 3, 0, 0, NULL, DATEADD(day, -25, GETDATE()), DATEADD(day, -25, GETDATE()), DATEADD(day, -24, GETDATE()));

DECLARE @MailID_8_1 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (4, N'Voluptas saepe laboriosam voluptatem facilis.', N'Cum deserunt aut minus rerum reprehenderit praesentium omnis. Ut quisquam nisi voluptatem aliquam dolorem adipisci. Delectus placeat sit rerum voluptatem sed. Ut nam eligendi ipsa deserunt possimus omnis dolores et.', DATEADD(day, -52, GETDATE()));
SET @MailID_8_1 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_8_1, 8, 3, 0, 0, NULL, DATEADD(day, -52, GETDATE()), DATEADD(day, -52, GETDATE()), NULL);

DECLARE @MailID_8_2 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (5, N'Provident odio cum amet enim.', N'Omnis deserunt natus. Qui architecto mollitia magni et perspiciatis. Assumenda dicta libero et. Odio aut deserunt. Atque minus eos eos. Aspernatur qui molestiae voluptatem sed corporis vel.

Sequi ut veniam eveniet velit et ab id temporibus. Quia et doloribus quaerat ut nulla consequatur officiis magnam. Possimus alias eum voluptate necessitatibus dolore. Quo dolores exercitationem corporis perferendis illum totam. Occaecati accusamus enim quis qui odio voluptatum quo. Aut et iure in consequatur rem quasi culpa.', DATEADD(day, -88, GETDATE()));
SET @MailID_8_2 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_8_2, 8, 3, 1, 0, NULL, DATEADD(day, -88, GETDATE()), DATEADD(day, -88, GETDATE()), DATEADD(day, -87, GETDATE()));

DECLARE @MailID_8_3 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (9, N'Laudantium quo recusandae eaque architecto.', N'Tempore ipsum magnam. Ut asperiores accusamus beatae possimus illo occaecati exercitationem enim voluptas. Omnis vel eum quibusdam laboriosam quam error. Esse neque esse ullam vel commodi. Quis voluptas alias similique ut aspernatur reiciendis. Ad quasi fugiat doloribus fugit temporibus dolores.', DATEADD(day, -12, GETDATE()));
SET @MailID_8_3 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_8_3, 8, 3, 0, 0, NULL, DATEADD(day, -12, GETDATE()), DATEADD(day, -12, GETDATE()), NULL);

DECLARE @MailID_8_4 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (1, N'Recusandae distinctio ex deserunt et.', N'Magnam et eum ipsa. Eius fugit voluptate incidunt beatae. Velit nostrum nisi ullam numquam corrupti voluptatem laborum sit. Nulla cupiditate sunt ipsum maxime corporis neque qui.', DATEADD(day, -20, GETDATE()));
SET @MailID_8_4 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_8_4, 8, 3, 0, 0, NULL, DATEADD(day, -20, GETDATE()), DATEADD(day, -20, GETDATE()), DATEADD(day, -19, GETDATE()));

DECLARE @MailID_8_5 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (7, N'Quia ducimus eum quos laudantium.', N'Voluptatibus aliquid quia dicta pariatur delectus quis vero dolor et. Et praesentium illo ut. Qui voluptas sit pariatur exercitationem rerum quod quis et et. Accusamus iusto optio sit possimus qui veniam omnis magni illum. Distinctio harum voluptatem accusamus. Suscipit animi blanditiis in ratione voluptas aliquam eveniet.', DATEADD(day, -15, GETDATE()));
SET @MailID_8_5 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_8_5, 8, 3, 0, 0, NULL, DATEADD(day, -15, GETDATE()), DATEADD(day, -15, GETDATE()), DATEADD(day, -14, GETDATE()));

DECLARE @MailID_8_6 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (1, N'Et optio aperiam delectus sunt.', N'Expedita atque iste debitis. Sed rerum perspiciatis autem odit animi non cumque unde exercitationem. Aut eum molestias ut dolores voluptas veniam. Sunt quia ut laudantium cupiditate enim ex.

Occaecati quas itaque beatae odio quae similique ducimus excepturi quasi. Qui ad omnis eum cumque possimus ipsa. Dolorem eos accusantium unde officiis facere.', DATEADD(day, -44, GETDATE()));
SET @MailID_8_6 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_8_6, 8, 3, 0, 0, NULL, DATEADD(day, -44, GETDATE()), DATEADD(day, -44, GETDATE()), NULL);

DECLARE @MailID_8_7 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (5, N'Repellendus quia sit rerum omnis.', N'Voluptas quos atque sed ab fuga voluptatibus. Sed ut et aut ad consequatur praesentium corrupti. Enim et laborum quae pariatur et. Quis quia ut sapiente qui rerum. Sunt quia blanditiis. Tempora adipisci deserunt soluta eius minus exercitationem.

Possimus id quia incidunt nulla doloribus placeat. Dolorum ut dolor culpa est dicta laudantium laudantium. Dicta aspernatur distinctio et modi dicta delectus. Iste sequi nemo minus dolor sed nobis. Dolor quis nisi optio fuga impedit voluptatum voluptates non.

In pariatur magnam assumenda ut sit. Ut commodi dignissimos ut quidem excepturi dignissimos assumenda facere quaerat. Saepe et fugit tempora mollitia velit tenetur sit. Quasi ut et officiis non nobis.', DATEADD(day, -109, GETDATE()));
SET @MailID_8_7 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_8_7, 8, 3, 1, 0, NULL, DATEADD(day, -109, GETDATE()), DATEADD(day, -109, GETDATE()), DATEADD(day, -108, GETDATE()));

DECLARE @MailID_8_8 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (1, N'Assumenda aut asperiores eos aperiam.', N'Eveniet est reprehenderit laborum amet. Nihil alias autem facere est omnis. Enim esse molestiae voluptas.

Quae ducimus perspiciatis aspernatur tempore ipsum. Consequatur numquam modi. Harum aut distinctio eos. Corporis odit repellendus fuga est accusantium. Deleniti dolor deleniti qui voluptas sequi minima voluptatibus blanditiis.

Sit itaque ut quia rerum. Non distinctio aut. Sed blanditiis eaque soluta repellat non autem voluptas quia. Quam maiores dicta distinctio distinctio aut laboriosam.', DATEADD(day, -5, GETDATE()));
SET @MailID_8_8 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_8_8, 8, 3, 0, 0, NULL, DATEADD(day, -5, GETDATE()), DATEADD(day, -5, GETDATE()), DATEADD(day, -4, GETDATE()));

DECLARE @MailID_8_9 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (2, N'Et porro eos quae minus.', N'Ut et fuga soluta aut asperiores explicabo totam nihil in. Ipsum qui molestiae sapiente cum iusto non voluptatum voluptatem. Incidunt quod expedita nulla animi cumque repudiandae a. Vel sapiente nihil tempore nisi. Earum enim impedit quisquam in aspernatur sit cumque.

Ducimus reiciendis autem laboriosam qui facilis voluptas voluptatem. Quia odit sit vitae eum voluptates velit. Accusantium quo doloribus error. Facilis eos nostrum laborum eos pariatur id beatae assumenda laudantium. Illum aut amet molestiae excepturi occaecati modi excepturi.', DATEADD(day, -64, GETDATE()));
SET @MailID_8_9 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_8_9, 8, 3, 0, 0, NULL, DATEADD(day, -64, GETDATE()), DATEADD(day, -64, GETDATE()), NULL);

DECLARE @MailID_8_10 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (10, N'In voluptatum et nemo ea.', N'Velit aut expedita dolores accusamus eveniet. Voluptas placeat pariatur recusandae id officiis totam itaque. Accusamus necessitatibus odit.

Aspernatur sit optio perferendis et. Accusantium ex similique sit totam inventore inventore. Ut repellat deleniti illo culpa minima consequatur repudiandae et. Officia nam blanditiis ducimus aut ea accusamus. Qui soluta vel labore ut quia ea reprehenderit.', DATEADD(day, -69, GETDATE()));
SET @MailID_8_10 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_8_10, 8, 3, 0, 0, NULL, DATEADD(day, -69, GETDATE()), DATEADD(day, -69, GETDATE()), DATEADD(day, -68, GETDATE()));

DECLARE @MailID_8_11 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (3, N'Soluta voluptatem et quia libero.', N'Voluptatem nemo et nostrum eveniet voluptas quo aliquid voluptate. Velit consectetur cupiditate modi et doloremque earum. Alias autem enim voluptatibus voluptas non molestias enim laborum ut. Est assumenda qui. Itaque aperiam quia ullam eum minima repellendus quam.

Ratione delectus ea ab provident enim. Eum iusto quasi ad sed ut praesentium ut dolor id. Recusandae cupiditate et qui eos. Ab vitae laboriosam illo optio non non. Omnis ut fugiat dolor nihil amet odio enim est. Totam quibusdam explicabo aliquid aut unde et sunt.

Explicabo aut iste et rerum. Aut quo incidunt qui quia debitis accusantium nihil quibusdam. Dolores hic sed quae aliquam. Fugiat blanditiis recusandae et. Temporibus aliquid distinctio soluta nostrum nesciunt vel. Asperiores dolores qui dolor quo vel et ea.', DATEADD(day, -2, GETDATE()));
SET @MailID_8_11 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_8_11, 8, 3, 1, 0, NULL, DATEADD(day, -2, GETDATE()), DATEADD(day, -2, GETDATE()), DATEADD(day, -1, GETDATE()));

DECLARE @MailID_8_12 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (2, N'Maiores tempore vero ut pariatur.', N'Id quia voluptatum natus. Eum atque aperiam ea illo. Nihil perspiciatis odit at autem corrupti.

Vero animi unde veritatis voluptatibus fugiat saepe est. Omnis et voluptate saepe eos perspiciatis aut qui distinctio vel. Quas aut dicta minima reiciendis veritatis illum. Quae fuga earum quibusdam dolore sint. Ut eveniet dolore cupiditate dolores ea sed.

Et deserunt non voluptatum rerum esse adipisci reiciendis dolorum omnis. Vel quia vitae eum quam adipisci modi numquam doloribus fugiat. Velit ea distinctio non ex cupiditate autem inventore blanditiis. Eum atque odit incidunt sed doloremque qui vitae. Ut ipsum quaerat ratione illo explicabo quos dolores odio aut.', DATEADD(day, -71, GETDATE()));
SET @MailID_8_12 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_8_12, 8, 3, 0, 0, NULL, DATEADD(day, -71, GETDATE()), DATEADD(day, -71, GETDATE()), DATEADD(day, -70, GETDATE()));

DECLARE @MailID_8_13 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (1, N'Perferendis et odio et alias.', N'Vel autem ex. Non rerum et repellat. Aut pariatur totam ut inventore corrupti possimus blanditiis. Officia veniam et est eos nulla consequuntur. Et laborum omnis.

Non sed illum adipisci harum quia. Et ducimus dolor voluptatem eum exercitationem cupiditate magnam praesentium quas. Dicta blanditiis voluptatem. Totam iure iure autem voluptatem similique dicta id dolores. Dolor dolores impedit. Corrupti libero esse aut eos eos consequatur et culpa provident.', DATEADD(day, -9, GETDATE()));
SET @MailID_8_13 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_8_13, 8, 3, 0, 0, NULL, DATEADD(day, -9, GETDATE()), DATEADD(day, -9, GETDATE()), DATEADD(day, -8, GETDATE()));

DECLARE @MailID_8_14 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (4, N'Est earum quia molestiae vitae.', N'Delectus consequatur dolores et ut. Quos at facere dolore nam possimus ut. Maiores voluptas et quidem. Ea sed porro omnis qui iusto.', DATEADD(day, -92, GETDATE()));
SET @MailID_8_14 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_8_14, 8, 3, 0, 0, NULL, DATEADD(day, -92, GETDATE()), DATEADD(day, -92, GETDATE()), DATEADD(day, -91, GETDATE()));

DECLARE @MailID_8_15 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (3, N'Accusamus labore qui ratione mollitia.', N'Beatae sapiente provident repellat. A nihil dolores enim numquam. Nihil voluptatum a in. Quos ratione velit assumenda nobis aperiam perferendis maxime accusantium. Repellat velit et pariatur.', DATEADD(day, -26, GETDATE()));
SET @MailID_8_15 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_8_15, 8, 3, 0, 0, NULL, DATEADD(day, -26, GETDATE()), DATEADD(day, -26, GETDATE()), DATEADD(day, -25, GETDATE()));

DECLARE @MailID_8_16 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (1, N'Voluptatem natus consequatur sint et.', N'Quis dolor sed. Et cupiditate iusto debitis quaerat. Ut minus molestiae et reiciendis provident aspernatur itaque sed eaque. Sunt et explicabo consequatur facilis tenetur ullam ut quis.

Aut pariatur beatae sint dolorem ut aperiam ratione animi. Adipisci quis sed non alias. Voluptas aut dolorem qui debitis illo repellendus cupiditate deserunt. Aut dolores porro impedit et illo.', DATEADD(day, -33, GETDATE()));
SET @MailID_8_16 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_8_16, 8, 3, 0, 0, NULL, DATEADD(day, -33, GETDATE()), DATEADD(day, -33, GETDATE()), DATEADD(day, -32, GETDATE()));

DECLARE @MailID_8_17 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (3, N'Vel et repudiandae nihil molestiae.', N'Vel architecto ratione est atque quo corporis. Aliquam officiis sit in qui dolor. Quam molestias inventore itaque minus molestiae asperiores. Vel qui eius ut harum expedita illum.', DATEADD(day, -103, GETDATE()));
SET @MailID_8_17 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_8_17, 8, 3, 0, 0, NULL, DATEADD(day, -103, GETDATE()), DATEADD(day, -103, GETDATE()), DATEADD(day, -102, GETDATE()));

DECLARE @MailID_8_18 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (2, N'Repellat ducimus perspiciatis officiis asperiores.', N'Occaecati est placeat quo ab voluptas illo sed est. Et beatae earum eius. Repellendus assumenda et.', DATEADD(day, -119, GETDATE()));
SET @MailID_8_18 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_8_18, 8, 3, 0, 0, NULL, DATEADD(day, -119, GETDATE()), DATEADD(day, -119, GETDATE()), DATEADD(day, -118, GETDATE()));

DECLARE @MailID_8_19 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (7, N'Corrupti eos nam quidem itaque.', N'Voluptas veritatis facere omnis iusto. Possimus accusantium dolorum facilis dolor. Rerum maiores laudantium sunt est voluptatum quisquam. Aspernatur dignissimos sed libero aut consequatur consectetur et voluptatem. Rem pariatur illum rerum nihil iste nesciunt provident sit tempora.', DATEADD(day, -99, GETDATE()));
SET @MailID_8_19 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_8_19, 8, 3, 0, 0, NULL, DATEADD(day, -99, GETDATE()), DATEADD(day, -99, GETDATE()), NULL);

DECLARE @MailID_8_20 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (5, N'Provident et in rerum neque.', N'Itaque ut alias pariatur quidem et. Soluta ratione dolor excepturi molestiae accusantium ut tempore voluptatem. Sed odio quas rerum quo.

Iusto dolores et quidem nisi facilis nostrum quae minima dolor. Quod consectetur delectus veniam unde et suscipit. Et quia non soluta rerum aut omnis explicabo et occaecati. Vel possimus est voluptas. Et et doloribus voluptatem porro quibusdam optio molestiae. Voluptatem et error in fugiat et modi voluptatem aperiam ea.

Sit minus commodi est id aliquid fugiat rem quas. Vel sunt explicabo impedit culpa veniam aut sit eos. Harum veniam soluta velit quia voluptatem hic explicabo. Velit voluptatum sit velit nemo similique enim maxime nihil. Maxime cumque culpa sunt saepe distinctio. Architecto omnis ab eos et.', DATEADD(day, -17, GETDATE()));
SET @MailID_8_20 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_8_20, 8, 3, 1, 0, NULL, DATEADD(day, -17, GETDATE()), DATEADD(day, -17, GETDATE()), DATEADD(day, -16, GETDATE()));

DECLARE @MailID_8_21 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (1, N'Ducimus voluptas aliquid quia ut.', N'Ab qui ipsum tempore eum officiis in non eos officiis. Autem vel molestiae reiciendis eveniet molestiae et. Cum doloribus beatae ab neque. In tempore ipsam illum omnis. Velit voluptatibus et fugit dolore alias et. Autem assumenda aut hic quis dolores.

Odio et eius nam velit veritatis similique eum nemo. Tenetur enim molestiae est et et laborum dolore quisquam. Adipisci fugiat aut et distinctio cumque expedita. Sit inventore repellendus voluptas exercitationem. Sunt molestias voluptatem quibusdam quis accusamus sed atque quia.

Iure facilis cumque ex magnam dolorum debitis praesentium. Officia et qui sapiente consequatur minus odit iure et. Qui facere natus. Mollitia similique pariatur reiciendis vel totam rem. Eum quia voluptatem expedita pariatur voluptas.', DATEADD(day, -103, GETDATE()));
SET @MailID_8_21 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_8_21, 8, 3, 0, 0, NULL, DATEADD(day, -103, GETDATE()), DATEADD(day, -103, GETDATE()), NULL);

DECLARE @MailID_8_22 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (2, N'Eligendi consequatur reiciendis et delectus.', N'Nihil sit quam quia expedita iusto provident. Omnis et reiciendis impedit dolor molestiae aliquid dolorem omnis quam. Error velit facilis omnis ea et hic ducimus.

Sunt odit aperiam voluptatum enim debitis laborum et quis et. Aliquam consequatur voluptate inventore quia repellat aperiam unde non. Sapiente consequatur accusantium exercitationem ratione doloremque et. Harum odit aut quaerat quidem.', DATEADD(day, -8, GETDATE()));
SET @MailID_8_22 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_8_22, 8, 3, 0, 0, NULL, DATEADD(day, -8, GETDATE()), DATEADD(day, -8, GETDATE()), DATEADD(day, -7, GETDATE()));

DECLARE @MailID_8_23 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (9, N'Quia optio ut et blanditiis.', N'Fuga nihil et aut repudiandae ullam ea. Sint doloremque qui molestiae. Laudantium eligendi in natus quod. Officia temporibus libero alias quae fugit.', DATEADD(day, -22, GETDATE()));
SET @MailID_8_23 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_8_23, 8, 3, 0, 0, NULL, DATEADD(day, -22, GETDATE()), DATEADD(day, -22, GETDATE()), DATEADD(day, -21, GETDATE()));

DECLARE @MailID_8_24 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (4, N'Aut sapiente error quis consequatur.', N'Dolorum ex voluptatem. Unde exercitationem tempora ut molestiae repudiandae assumenda qui deleniti. Itaque alias ea assumenda enim dolor rerum facilis ea. Est praesentium fuga expedita sed necessitatibus.

Enim qui ipsam sequi atque. Enim qui velit ea neque soluta consequuntur. Aut nobis ab non voluptatem quia. Pariatur quia esse doloremque unde quod. Suscipit maiores ipsam et. Perspiciatis aspernatur doloremque delectus quo dolor saepe cum.

Repudiandae rerum vero totam ab quae. Sunt modi nam corrupti dolores voluptatem. Veritatis sed temporibus magni ea quia rem odio et. Praesentium rem voluptatem ab quidem. Nostrum eaque est.', DATEADD(day, -5, GETDATE()));
SET @MailID_8_24 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_8_24, 8, 3, 0, 0, NULL, DATEADD(day, -5, GETDATE()), DATEADD(day, -5, GETDATE()), DATEADD(day, -4, GETDATE()));

DECLARE @MailID_8_25 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (9, N'Quidem vero aut qui dolore.', N'Qui officia voluptatem nihil. Quisquam earum recusandae totam commodi qui. Incidunt et corporis molestiae ut porro quis vel sint atque.

Maiores repudiandae earum. Eius minima sunt recusandae quibusdam et dolore. Amet fuga soluta quas qui est iure velit maiores. Voluptates iusto aliquid quibusdam consequatur doloribus ipsum et et.

Aut consequatur officiis impedit vel quis accusantium. Tempora sapiente ut quo non qui minus beatae dolores ipsum. Voluptatem earum et.', DATEADD(day, -29, GETDATE()));
SET @MailID_8_25 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_8_25, 8, 3, 0, 0, NULL, DATEADD(day, -29, GETDATE()), DATEADD(day, -29, GETDATE()), NULL);

DECLARE @MailID_8_26 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (5, N'Velit corporis et eaque id.', N'Aut ea aspernatur in veritatis soluta et illum corrupti nostrum. Id ipsam provident. Necessitatibus magnam amet tempora praesentium. Accusamus natus nulla sit quis. Quidem repudiandae rerum et maxime consequatur cupiditate quia dolore.

Debitis doloribus facere corporis quia repellat. Id ea soluta. Ratione illum sed sint voluptas et mollitia eveniet vel. Provident fugit explicabo non aut perspiciatis. Qui dicta dolores qui maxime in soluta velit. Quo eius quibusdam nobis.', DATEADD(day, -27, GETDATE()));
SET @MailID_8_26 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_8_26, 8, 3, 0, 0, NULL, DATEADD(day, -27, GETDATE()), DATEADD(day, -27, GETDATE()), NULL);

DECLARE @MailID_8_27 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (4, N'Vel voluptatum in et ut.', N'Rerum veritatis suscipit. Sint asperiores officia ut quae rerum aperiam. Quia qui ab aut dolorum incidunt.

Quia ut quas tenetur velit quasi. Officia consequatur voluptate nihil nulla fuga fugiat. Et repellendus repellat architecto iure voluptates aut placeat. Molestiae maiores corrupti ipsum.

Eligendi perferendis veniam voluptas ipsa. Blanditiis sit nam recusandae saepe autem quo sunt doloribus. Ab ut libero qui eveniet nostrum. Neque animi asperiores et rerum sed.', DATEADD(day, -66, GETDATE()));
SET @MailID_8_27 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_8_27, 8, 3, 0, 0, NULL, DATEADD(day, -66, GETDATE()), DATEADD(day, -66, GETDATE()), NULL);

DECLARE @MailID_8_28 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (10, N'Delectus qui ipsa eaque ut.', N'Dolor vitae dolore praesentium modi cupiditate molestiae autem quas rerum. Doloribus dicta sed. Voluptatum hic autem accusamus ut eveniet. Enim qui cum ea nostrum quasi rerum minima nam alias.

Fugiat velit optio. Quo maxime consequatur molestiae eligendi necessitatibus. Maiores cumque consequuntur. Voluptas perferendis qui est praesentium.

Labore aperiam nulla harum deserunt. Veniam et voluptatum nam perspiciatis magnam inventore rem accusamus. A quos sed qui et autem. Fugiat amet excepturi possimus in ut. Voluptas a modi illo sit. Aperiam voluptas qui.', DATEADD(day, -38, GETDATE()));
SET @MailID_8_28 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_8_28, 8, 3, 1, 0, NULL, DATEADD(day, -38, GETDATE()), DATEADD(day, -38, GETDATE()), NULL);

DECLARE @MailID_8_29 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (1, N'Cum velit veniam tempora quae.', N'Suscipit ipsam quam voluptas quo. Aut qui aut unde qui ea laudantium aperiam autem. Impedit aut aut harum et praesentium quo sit animi. Occaecati reprehenderit omnis placeat voluptatem quo enim.', DATEADD(day, -98, GETDATE()));
SET @MailID_8_29 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_8_29, 8, 3, 0, 0, NULL, DATEADD(day, -98, GETDATE()), DATEADD(day, -98, GETDATE()), DATEADD(day, -97, GETDATE()));

MERGE AccountInboxState AS target
USING (VALUES (8, 0, 30, '2026-04-15 16:46:07'))
    AS source (AccountID, Category, MailCount, DateLastModified)
ON target.AccountID = source.AccountID
    AND target.Category = source.Category
WHEN MATCHED THEN
    UPDATE SET DateLastModified = source.DateLastModified
WHEN NOT MATCHED THEN
    INSERT (AccountID, Category, MailCount, DateLastModified)
    VALUES (source.AccountID, source.Category, source.MailCount, source.DateLastModified);

DECLARE @MailID_9_0 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (7, N'Autem ut qui distinctio est.', N'Et vitae libero nam ut harum ut consequatur. Necessitatibus et deleniti voluptate ipsa aliquid ullam. Quis dignissimos voluptas. Ut quas aut est dolorem. Debitis quasi dolor incidunt tenetur eaque vitae voluptatum. Doloribus vero assumenda laborum ut voluptatem commodi.

Tempora dignissimos ullam suscipit aut neque ab. Ea corrupti voluptates eum tenetur. Omnis quia aliquid distinctio earum. Vel velit et eum explicabo. Veniam quia commodi vel. Labore qui et dolorum.

Porro corporis ea nihil id magni sint et cum eligendi. Consequuntur eum esse. Similique ipsum modi iste quia.', DATEADD(day, -82, GETDATE()));
SET @MailID_9_0 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_9_0, 9, 3, 0, 0, NULL, DATEADD(day, -82, GETDATE()), DATEADD(day, -82, GETDATE()), DATEADD(day, -81, GETDATE()));

DECLARE @MailID_9_1 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (10, N'Ut magni et nulla molestiae.', N'Iusto enim consequatur sunt. Magni beatae omnis perferendis perferendis est dolorem rem. Rerum nulla molestias eum provident aliquid quibusdam fuga amet aut. Quis unde ullam id et eius corporis tenetur labore ex.', DATEADD(day, -60, GETDATE()));
SET @MailID_9_1 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_9_1, 9, 3, 0, 0, NULL, DATEADD(day, -60, GETDATE()), DATEADD(day, -60, GETDATE()), NULL);

DECLARE @MailID_9_2 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (4, N'Soluta enim sunt quis porro.', N'Voluptate et dolorem nesciunt rerum. Sapiente iste maiores eaque eos porro magni deleniti ipsa dolores. Hic perferendis non. Ad consequatur magni consequatur iusto qui quia aut. Perspiciatis placeat velit totam quos.

Atque blanditiis blanditiis ut ut. Quod non earum labore ratione voluptate nisi odit qui. Consequuntur corporis sapiente esse consectetur nihil.

Omnis ut non magnam iure magni tempore rerum. Doloremque vel eum aliquam corrupti omnis omnis. Velit ut non sint minus enim dolorem.', DATEADD(day, -91, GETDATE()));
SET @MailID_9_2 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_9_2, 9, 3, 0, 0, NULL, DATEADD(day, -91, GETDATE()), DATEADD(day, -91, GETDATE()), DATEADD(day, -90, GETDATE()));

DECLARE @MailID_9_3 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (4, N'Ut ut nemo dolor molestiae.', N'Ut id soluta praesentium quis omnis non tenetur. Quia adipisci dolor harum earum recusandae. Quos accusantium velit expedita consequatur id nihil eum pariatur. Ut vero eos reiciendis sint dolor sequi aut praesentium illo. Quos et ut et voluptate. Est excepturi nostrum quaerat.', DATEADD(day, -83, GETDATE()));
SET @MailID_9_3 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_9_3, 9, 3, 0, 0, NULL, DATEADD(day, -83, GETDATE()), DATEADD(day, -83, GETDATE()), NULL);

DECLARE @MailID_9_4 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (7, N'Cum repellat repellendus sit a.', N'Libero ipsa suscipit amet quia fugiat. Alias sunt ipsam doloremque deleniti doloribus qui et. Architecto incidunt itaque natus perferendis tempore dolore. Distinctio sed quidem eos aut nihil atque repudiandae excepturi quo. Perferendis quos consequatur ducimus harum molestiae. Et id sed laboriosam et nostrum aperiam quia magnam.

Velit voluptatem distinctio maiores minus odit fuga. Repudiandae aut quidem ex. Dolor quia mollitia excepturi nihil adipisci provident accusamus sint.', DATEADD(day, -102, GETDATE()));
SET @MailID_9_4 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_9_4, 9, 3, 0, 0, NULL, DATEADD(day, -102, GETDATE()), DATEADD(day, -102, GETDATE()), DATEADD(day, -101, GETDATE()));

DECLARE @MailID_9_5 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (8, N'Ullam aut ut sed consequatur.', N'Quae quo corporis laboriosam doloremque. Dicta voluptatem ex ut libero. Mollitia ullam vitae molestiae in suscipit.

Quia reiciendis laborum expedita ipsa et fuga est reiciendis molestias. Eos et occaecati commodi adipisci necessitatibus amet. Exercitationem illo eum quod vitae eius.

Praesentium nostrum rerum omnis totam. A nam doloribus iusto molestiae blanditiis. Voluptates rerum in neque. Suscipit sed consequuntur magni qui recusandae. Delectus quam expedita consequatur possimus maxime eveniet.', DATEADD(day, -103, GETDATE()));
SET @MailID_9_5 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_9_5, 9, 3, 0, 0, NULL, DATEADD(day, -103, GETDATE()), DATEADD(day, -103, GETDATE()), NULL);

DECLARE @MailID_9_6 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (2, N'Eligendi asperiores illo et quia.', N'Quia sed sed sunt omnis sed est. Eum cum voluptate cum repellendus tempora ratione aspernatur. Minus molestiae laborum. Vitae earum ut quasi. Ut quasi reprehenderit autem optio. Esse ratione eveniet voluptatibus non ut amet sit qui.

Cupiditate velit molestiae voluptatem quis pariatur asperiores rem. Dolore quibusdam inventore quis harum magni. Voluptatum omnis dolores ut accusamus dignissimos. Excepturi eos ut facilis quae magni officia.', DATEADD(day, -99, GETDATE()));
SET @MailID_9_6 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_9_6, 9, 3, 0, 0, NULL, DATEADD(day, -99, GETDATE()), DATEADD(day, -99, GETDATE()), NULL);

DECLARE @MailID_9_7 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (5, N'Velit et et error minima.', N'Illo necessitatibus suscipit voluptatem quis ut illo minima. Deserunt consequatur neque quibusdam culpa qui quia. Eaque optio ad nulla velit error. Provident ipsum hic voluptatem tempora voluptatem aut velit. Porro sed dolor quia labore laboriosam reprehenderit temporibus.', DATEADD(day, -83, GETDATE()));
SET @MailID_9_7 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_9_7, 9, 3, 0, 0, NULL, DATEADD(day, -83, GETDATE()), DATEADD(day, -83, GETDATE()), NULL);

DECLARE @MailID_9_8 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (8, N'Quas laborum velit iste magni.', N'Quod repudiandae dolores deleniti expedita voluptatem maxime nostrum et. Dolorem temporibus inventore molestias animi odit reprehenderit. Et eius ad ab magnam sint vel commodi.

Molestiae modi est incidunt exercitationem. Quibusdam enim similique sapiente ut quia unde aspernatur. Quae magni dolores voluptas et itaque aut qui eum.', DATEADD(day, -22, GETDATE()));
SET @MailID_9_8 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_9_8, 9, 3, 0, 0, NULL, DATEADD(day, -22, GETDATE()), DATEADD(day, -22, GETDATE()), DATEADD(day, -21, GETDATE()));

DECLARE @MailID_9_9 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (7, N'Est possimus excepturi rerum ab.', N'Expedita facilis vero saepe ipsum cupiditate dolorum laudantium. Modi sunt mollitia ratione eum officiis recusandae qui ut et. Ipsa molestiae facilis autem. Quia dolor molestiae omnis et libero quia alias. Dolor aut quisquam officia incidunt repudiandae.', DATEADD(day, -89, GETDATE()));
SET @MailID_9_9 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_9_9, 9, 3, 1, 0, NULL, DATEADD(day, -89, GETDATE()), DATEADD(day, -89, GETDATE()), DATEADD(day, -88, GETDATE()));

DECLARE @MailID_9_10 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (10, N'Minus blanditiis similique optio autem.', N'Sit amet culpa qui. Quibusdam ut eos modi nam doloremque. Velit aliquam qui dignissimos fuga cupiditate. Voluptas saepe culpa alias ab consequuntur non corrupti optio suscipit. Voluptatem quae harum et expedita consequuntur et.

Ducimus facere facilis nihil a. Commodi est odio sit veritatis quos facere consequatur. Qui nostrum non odio eum eos totam. Sed illum ut quisquam optio deleniti ut fuga eveniet autem. Dignissimos aut exercitationem dicta sint sed eveniet consequatur.

Aut amet ullam impedit soluta harum at autem alias soluta. Ut eos quisquam et magni ut. Impedit est sed reprehenderit consequatur error ipsam odio.', DATEADD(day, -4, GETDATE()));
SET @MailID_9_10 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_9_10, 9, 3, 0, 0, NULL, DATEADD(day, -4, GETDATE()), DATEADD(day, -4, GETDATE()), DATEADD(day, -3, GETDATE()));

DECLARE @MailID_9_11 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (8, N'Quae totam cupiditate laborum enim.', N'Ipsum expedita repudiandae non fugiat. Quidem quisquam nobis omnis quidem hic beatae. Asperiores et quia minus at velit. Facere vero ex voluptatem quia sapiente dicta sed est consectetur.', DATEADD(day, -108, GETDATE()));
SET @MailID_9_11 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_9_11, 9, 3, 1, 0, NULL, DATEADD(day, -108, GETDATE()), DATEADD(day, -108, GETDATE()), NULL);

DECLARE @MailID_9_12 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (10, N'Vero accusamus aut voluptatem facilis.', N'Facere eum nesciunt consequatur incidunt consectetur. Culpa voluptas eum consequatur est. Aperiam unde ipsam nesciunt. Tenetur at veniam quia nulla aut et.

Est tempora fugit aperiam nihil neque enim assumenda minima. Nobis est quos voluptas qui sit tenetur dolorum. Officia qui rem perspiciatis occaecati voluptatibus enim.

Odio labore magni sed dignissimos earum ad delectus. Eveniet quo non et. Dolorem iure impedit.', DATEADD(day, -33, GETDATE()));
SET @MailID_9_12 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_9_12, 9, 3, 0, 0, NULL, DATEADD(day, -33, GETDATE()), DATEADD(day, -33, GETDATE()), DATEADD(day, -32, GETDATE()));

DECLARE @MailID_9_13 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (6, N'Velit sit blanditiis ab dolores.', N'Impedit eligendi aliquam in corrupti dicta fuga. Qui quaerat in ut expedita neque. Dicta perspiciatis et quia quos. Enim autem consectetur harum veritatis qui. Quidem debitis saepe iusto velit id. Numquam velit est veniam.

Dolorum commodi et consequatur et aut est. Consectetur modi voluptatum et quo quas sapiente enim. Debitis quia iste quia. Ducimus aut velit nesciunt aut velit nesciunt. Facere cum cum facilis optio possimus nostrum nulla voluptatum est. Et dolorem et sed nam.', DATEADD(day, -99, GETDATE()));
SET @MailID_9_13 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_9_13, 9, 3, 0, 0, NULL, DATEADD(day, -99, GETDATE()), DATEADD(day, -99, GETDATE()), NULL);

DECLARE @MailID_9_14 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (3, N'Autem et sint consequatur ut.', N'Voluptates cupiditate ipsam asperiores consequatur deleniti maxime eveniet neque. Voluptas est voluptatibus. Dolorem ea vel autem quas dolore asperiores modi et.

Vero debitis quo illum et est porro molestiae exercitationem sequi. Nihil voluptas ipsa. Nostrum nihil consequatur ratione sit. Molestias ratione voluptatem illum ea voluptatum. Sequi tenetur voluptatem adipisci voluptas culpa.', DATEADD(day, -48, GETDATE()));
SET @MailID_9_14 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_9_14, 9, 3, 0, 0, NULL, DATEADD(day, -48, GETDATE()), DATEADD(day, -48, GETDATE()), NULL);

DECLARE @MailID_9_15 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (8, N'Atque quas est possimus dolorem.', N'Ipsum sunt consequatur quisquam omnis accusantium ut sed sed. Voluptatem corporis a excepturi reprehenderit sed nihil quod culpa autem. Est ad qui odit et iure aut et laborum non. Iure nulla quia occaecati et accusantium et est. Accusantium dolores sequi.

Voluptas et velit. Voluptate exercitationem ratione ut. Repudiandae accusantium accusamus quaerat modi animi. Itaque repellat ad harum id quis quibusdam est ipsam veritatis. Enim reiciendis delectus. Qui necessitatibus voluptatem qui repudiandae id inventore voluptatem quia mollitia.', DATEADD(day, -99, GETDATE()));
SET @MailID_9_15 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_9_15, 9, 3, 0, 0, NULL, DATEADD(day, -99, GETDATE()), DATEADD(day, -99, GETDATE()), DATEADD(day, -98, GETDATE()));

DECLARE @MailID_9_16 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (2, N'Odit praesentium dicta libero voluptatum.', N'Ut repellendus possimus quia ipsum minima natus. Sed non ut quia et consectetur. Consequatur aliquam laborum quos in.

Eum inventore sint eos. Ut rem ab eum qui laborum hic blanditiis. Distinctio laudantium rerum aut libero nemo sunt enim. Deleniti non aspernatur.', DATEADD(day, -37, GETDATE()));
SET @MailID_9_16 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_9_16, 9, 3, 0, 0, NULL, DATEADD(day, -37, GETDATE()), DATEADD(day, -37, GETDATE()), DATEADD(day, -36, GETDATE()));

DECLARE @MailID_9_17 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (2, N'Non temporibus dolore est sit.', N'Odit quis voluptas et a laudantium culpa nulla. Rerum itaque vero quasi. Tempora ut dolorem itaque cum voluptates impedit est.

Delectus fugit beatae sed cum laboriosam quam dolorum quis. Iusto vel eum repellat excepturi aut sint ipsam nihil aliquid. Consectetur voluptatem eveniet animi alias accusamus. Sit accusantium aliquam magni deserunt explicabo ratione laudantium. Unde nemo nesciunt sunt voluptatem dolor aliquam.', DATEADD(day, -24, GETDATE()));
SET @MailID_9_17 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_9_17, 9, 3, 0, 0, NULL, DATEADD(day, -24, GETDATE()), DATEADD(day, -24, GETDATE()), DATEADD(day, -23, GETDATE()));

DECLARE @MailID_9_18 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (3, N'Earum eum nostrum et laudantium.', N'Ut atque eos quasi asperiores dolores qui enim laboriosam commodi. Aperiam voluptatum consequatur aliquam reprehenderit ut voluptatum unde. Dicta vitae asperiores praesentium fugit necessitatibus.

Nam maxime impedit debitis soluta dicta. Vitae sed dolor aut dolor unde odio eos magni recusandae. Vero aut voluptates minima sit. Voluptas at aut rerum itaque soluta non animi. Quo beatae consequatur est iste mollitia omnis. Quo accusamus aut quas qui dolor laborum.', DATEADD(day, -37, GETDATE()));
SET @MailID_9_18 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_9_18, 9, 3, 0, 0, NULL, DATEADD(day, -37, GETDATE()), DATEADD(day, -37, GETDATE()), DATEADD(day, -36, GETDATE()));

DECLARE @MailID_9_19 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (7, N'Eaque et iusto est voluptas.', N'Ratione quis laboriosam illum facere voluptas enim rerum. Ad ut possimus a at dolor cupiditate. Sit et qui eius dolore laborum. Repellendus quia qui et. Cum sint voluptas maiores qui omnis est fugiat placeat ipsa.

Debitis cupiditate blanditiis quo totam neque illum. Amet modi recusandae eius harum quia et quam non. Quia ea itaque sint facere architecto. Est dolores perspiciatis libero qui excepturi id labore. Odit ut corrupti ea quis voluptatem aperiam quae. Pariatur veniam unde.', DATEADD(day, -43, GETDATE()));
SET @MailID_9_19 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_9_19, 9, 3, 0, 0, NULL, DATEADD(day, -43, GETDATE()), DATEADD(day, -43, GETDATE()), DATEADD(day, -42, GETDATE()));

DECLARE @MailID_9_20 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (6, N'Sint ducimus mollitia pariatur quas.', N'Omnis architecto aspernatur tenetur ea. Omnis aspernatur corrupti vel illum totam cumque. Voluptatem quia impedit dolor quos nihil quae reprehenderit impedit. Est aut sequi vel dolor harum quaerat fugit accusamus.', DATEADD(day, -2, GETDATE()));
SET @MailID_9_20 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_9_20, 9, 3, 0, 0, NULL, DATEADD(day, -2, GETDATE()), DATEADD(day, -2, GETDATE()), NULL);

DECLARE @MailID_9_21 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (7, N'Harum suscipit sed quia error.', N'Adipisci aliquid esse nam. Laudantium voluptatibus consequatur iusto voluptatem qui fugit animi ut. Occaecati repellat atque eius rem distinctio et id consequatur non.

Molestiae cumque rerum. Natus non ut quia. Omnis tempore dolor nobis. Hic cupiditate dicta culpa omnis dolor velit dolorem sed.

Atque aut et cupiditate quos eaque. Est dolorum quod quibusdam delectus enim labore molestias et. Ut doloribus eos itaque ut facere. Consequuntur et et esse ut alias. Et nisi rerum ratione consequuntur.', DATEADD(day, -9, GETDATE()));
SET @MailID_9_21 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_9_21, 9, 3, 0, 0, NULL, DATEADD(day, -9, GETDATE()), DATEADD(day, -9, GETDATE()), DATEADD(day, -8, GETDATE()));

DECLARE @MailID_9_22 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (5, N'Nemo explicabo dolorem iste et.', N'Non et quas ab sequi alias consequatur pariatur autem. Alias officia in alias dolorem dicta. Nulla numquam nesciunt sed ab.

Sint quia est ullam reprehenderit. Dolores expedita exercitationem voluptatibus voluptatem. Praesentium veritatis consequuntur perspiciatis. Mollitia in qui quasi. Dignissimos excepturi repellendus mollitia assumenda tempora velit harum eius. Expedita minus est est autem expedita cum voluptas omnis incidunt.

Ex qui ab maiores aut aperiam ducimus. Quos quia assumenda. Dolor eum minima recusandae non eius voluptate quasi minus. Dignissimos tempora sapiente quidem quisquam sed. Debitis omnis soluta quia nobis veritatis rerum sapiente praesentium magnam.', DATEADD(day, -103, GETDATE()));
SET @MailID_9_22 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_9_22, 9, 3, 0, 0, NULL, DATEADD(day, -103, GETDATE()), DATEADD(day, -103, GETDATE()), DATEADD(day, -102, GETDATE()));

DECLARE @MailID_9_23 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (6, N'Ea accusamus est qui culpa.', N'Odio possimus cumque cumque. Reiciendis beatae magnam. Libero nulla blanditiis ex veniam sequi quo atque consequatur ut. Qui praesentium eveniet maxime perferendis voluptatem et quisquam sequi. Dolores deserunt nostrum quis veritatis quia id qui. Iusto molestias excepturi ipsa maxime.

Omnis voluptatem iusto rerum dolor quas sed occaecati velit similique. Non enim maiores itaque corrupti voluptas minus voluptas quia inventore. Animi optio necessitatibus sunt architecto officia.', DATEADD(day, -57, GETDATE()));
SET @MailID_9_23 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_9_23, 9, 3, 0, 0, NULL, DATEADD(day, -57, GETDATE()), DATEADD(day, -57, GETDATE()), DATEADD(day, -56, GETDATE()));

DECLARE @MailID_9_24 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (2, N'Dignissimos rerum molestiae ut quis.', N'Nisi voluptatem asperiores accusamus molestiae sed nesciunt aut commodi repellat. Aut ut praesentium qui dolorum et aut incidunt. Quia sint eveniet a et quidem.

Reiciendis repudiandae iusto necessitatibus quia velit. Aut aut ipsam voluptas dicta accusantium quos nisi. Dolores nobis ut voluptatem. Tempora quasi commodi ducimus.

Iure assumenda aut non dicta qui. Quo laborum dolorem et quis ut explicabo. Explicabo corrupti commodi. Minus sunt voluptatibus. Veniam in aut sed.', DATEADD(day, -51, GETDATE()));
SET @MailID_9_24 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_9_24, 9, 3, 0, 0, NULL, DATEADD(day, -51, GETDATE()), DATEADD(day, -51, GETDATE()), DATEADD(day, -50, GETDATE()));

DECLARE @MailID_9_25 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (6, N'Aut suscipit eos quia beatae.', N'Pariatur animi officiis aut eos hic. Voluptas minima qui. Et molestiae recusandae autem nam rerum ullam numquam rerum.

Ratione nam voluptatem est recusandae eius consequatur voluptas ut eveniet. Est ut ut. Occaecati cum corrupti aliquam vero sit. Quo delectus natus nam. Est quam aut quia deleniti eaque aperiam. Sed non quibusdam nam ex.', DATEADD(day, -114, GETDATE()));
SET @MailID_9_25 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_9_25, 9, 3, 0, 0, NULL, DATEADD(day, -114, GETDATE()), DATEADD(day, -114, GETDATE()), NULL);

DECLARE @MailID_9_26 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (7, N'Aut qui consequatur ipsum ut.', N'Fuga cum architecto nobis omnis et inventore necessitatibus ex. Repellendus aliquam deserunt. Eos fugiat eius aut ut et quia ut nemo.

Voluptatum amet fugit ut sint eum repellendus. Voluptas impedit rem omnis consequatur qui et amet libero. Dolore qui vel et distinctio facilis odit quae sed. Est exercitationem natus consequuntur laudantium aut. Saepe ratione quia nulla totam.

Modi eligendi at consequatur ea porro quam quos eos voluptatum. Aut et pariatur. Quibusdam quos et sit qui in nesciunt. Quaerat qui a sit id cupiditate quis. Repellendus eveniet iste doloribus sint vitae ut ad molestias dolorem. Harum recusandae tenetur id ut.', DATEADD(day, -61, GETDATE()));
SET @MailID_9_26 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_9_26, 9, 3, 0, 0, NULL, DATEADD(day, -61, GETDATE()), DATEADD(day, -61, GETDATE()), DATEADD(day, -60, GETDATE()));

DECLARE @MailID_9_27 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (8, N'Quibusdam possimus odit deserunt reprehenderit.', N'Velit qui provident nulla illum numquam et itaque ducimus. Repellat odio ea tempora nesciunt et sed. Maxime itaque impedit sit. Sint provident repellendus qui. Ab enim aut est.

Vel ullam voluptatem illo omnis consequatur. Est nostrum dolorem et nihil labore asperiores. Provident quam consequatur maxime explicabo itaque. Quod ut provident officiis nihil aspernatur. Ut veritatis aut. Exercitationem officiis veritatis delectus perferendis.', DATEADD(day, -51, GETDATE()));
SET @MailID_9_27 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_9_27, 9, 3, 0, 0, NULL, DATEADD(day, -51, GETDATE()), DATEADD(day, -51, GETDATE()), DATEADD(day, -50, GETDATE()));

DECLARE @MailID_9_28 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (10, N'Quidem voluptatem autem eos est.', N'Deleniti ut odio cumque veritatis temporibus. Dignissimos eum qui sunt. Voluptas deleniti doloremque minima nihil et inventore. Nihil corporis laudantium cupiditate illo excepturi deleniti. Nam error non. Vel voluptatem dolorem quidem iusto officiis enim et et.

Excepturi quaerat et quia est maiores. Mollitia blanditiis eius. Quis sed ut culpa. Quisquam consectetur non.

Vel ipsa distinctio. Quibusdam sunt nulla consequatur quas autem necessitatibus eum ad. Incidunt eos ipsa nostrum.', DATEADD(day, -58, GETDATE()));
SET @MailID_9_28 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_9_28, 9, 3, 0, 0, NULL, DATEADD(day, -58, GETDATE()), DATEADD(day, -58, GETDATE()), NULL);

DECLARE @MailID_9_29 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (6, N'Numquam similique atque omnis quia.', N'Explicabo sed qui. In autem nemo eum sit. Sequi aut ipsum. Nemo possimus ipsam quisquam voluptate. Sed non tempora voluptatem provident. Fugiat ea distinctio nihil dolores.

Quaerat ut exercitationem omnis. Assumenda est commodi est veniam quas commodi id sit in. Dolore veniam molestias.

Vel error sunt. Iure laborum praesentium error rerum hic molestias ut quam non. Doloribus dignissimos et nisi atque deleniti est in sint tempore. Et corporis dolor. Cupiditate doloribus non iste.', DATEADD(day, -22, GETDATE()));
SET @MailID_9_29 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_9_29, 9, 3, 0, 0, NULL, DATEADD(day, -22, GETDATE()), DATEADD(day, -22, GETDATE()), DATEADD(day, -21, GETDATE()));

MERGE AccountInboxState AS target
USING (VALUES (9, 0, 30, '2026-04-15 16:46:07'))
    AS source (AccountID, Category, MailCount, DateLastModified)
ON target.AccountID = source.AccountID
    AND target.Category = source.Category
WHEN MATCHED THEN
    UPDATE SET DateLastModified = source.DateLastModified
WHEN NOT MATCHED THEN
    INSERT (AccountID, Category, MailCount, DateLastModified)
    VALUES (source.AccountID, source.Category, source.MailCount, source.DateLastModified);

DECLARE @MailID_10_0 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (8, N'Adipisci similique veritatis labore debitis.', N'Nesciunt omnis adipisci mollitia nihil. Facere tempore dicta cupiditate sapiente aut enim. Enim et quia quibusdam numquam ipsum. Fugiat fugiat delectus odit iusto est. Provident ipsam officiis cumque ut quae aut eos veritatis. Quas voluptatem porro ratione.

Doloremque excepturi et est dolore iste et adipisci. Optio ut quia vitae accusantium cum ea similique. Deserunt corrupti ea hic nesciunt.

Voluptas a eveniet nesciunt quia dolore voluptatibus. Beatae suscipit et exercitationem ex molestiae sunt iusto quam. Fuga rerum non aut porro ad neque vel voluptas. Ut quibusdam ut similique dicta aut. Aspernatur laboriosam error porro.', DATEADD(day, -98, GETDATE()));
SET @MailID_10_0 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_10_0, 10, 3, 0, 0, NULL, DATEADD(day, -98, GETDATE()), DATEADD(day, -98, GETDATE()), DATEADD(day, -97, GETDATE()));

DECLARE @MailID_10_1 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (2, N'Earum distinctio nulla iusto et.', N'Eos omnis at neque. Aut quos ad nisi sit laborum est. Non facere sapiente qui voluptas eos. Adipisci quo dicta. Minus rerum aperiam voluptatem ut nemo maiores aut.', DATEADD(day, -107, GETDATE()));
SET @MailID_10_1 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_10_1, 10, 3, 0, 0, NULL, DATEADD(day, -107, GETDATE()), DATEADD(day, -107, GETDATE()), NULL);

DECLARE @MailID_10_2 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (7, N'Beatae rerum tempora repellat aut.', N'Facilis possimus sed quae omnis eaque sapiente repellat quia iste. Sint nisi rerum aut soluta est. Consectetur quod quasi sequi magnam voluptate qui.', DATEADD(day, -67, GETDATE()));
SET @MailID_10_2 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_10_2, 10, 3, 0, 0, NULL, DATEADD(day, -67, GETDATE()), DATEADD(day, -67, GETDATE()), DATEADD(day, -66, GETDATE()));

DECLARE @MailID_10_3 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (4, N'Sint et aspernatur atque perferendis.', N'Repudiandae tenetur est qui. Magnam praesentium consequuntur nulla reiciendis placeat. Omnis fugit velit et rerum aut vero sapiente necessitatibus. Repellendus harum quaerat. Aperiam ipsum harum qui.

Delectus numquam est ea earum aut officia culpa sapiente. Id sed nobis est impedit ad ducimus voluptatem. Esse est voluptatem quia animi eos commodi. Dignissimos laudantium ea. Quibusdam laborum et saepe reiciendis fugiat deserunt perspiciatis numquam explicabo.

Perferendis cupiditate voluptas ut et itaque culpa dolorem explicabo recusandae. Unde maxime cupiditate exercitationem eos. Ad doloremque ipsam facilis molestiae. Dolore laudantium rerum hic voluptatem laborum ea cumque voluptas blanditiis. Saepe deleniti soluta.', DATEADD(day, -98, GETDATE()));
SET @MailID_10_3 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_10_3, 10, 3, 0, 0, NULL, DATEADD(day, -98, GETDATE()), DATEADD(day, -98, GETDATE()), NULL);

DECLARE @MailID_10_4 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (5, N'Maxime et eveniet et quo.', N'Est qui ut autem nam velit. Adipisci aut earum blanditiis et sint at reiciendis dignissimos soluta. Accusamus iusto consequuntur quod. Pariatur iusto quo ullam sapiente delectus dolorum nihil autem. Totam nisi voluptate. Saepe qui voluptas voluptas temporibus fuga vel aut qui ea.

Aut possimus aut deleniti dolorem nemo qui. Quaerat ut et velit velit. Veniam et omnis. Qui odit quaerat dignissimos minima aliquam aut minima. Nam a temporibus est aliquam. Sunt quae fuga voluptatem in saepe dignissimos.', DATEADD(day, -33, GETDATE()));
SET @MailID_10_4 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_10_4, 10, 3, 0, 0, NULL, DATEADD(day, -33, GETDATE()), DATEADD(day, -33, GETDATE()), DATEADD(day, -32, GETDATE()));

DECLARE @MailID_10_5 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (6, N'Officia voluptate ut sit repellendus.', N'Aspernatur ipsum iusto inventore et omnis voluptatem voluptas dolores ut. Reiciendis voluptatibus sit non atque similique iusto. Est a est expedita maxime. Aut qui rerum et illum. Ratione amet exercitationem deserunt est voluptatem et.

Similique rerum dolore dolores distinctio inventore rerum ut. Ut ea est eum nam et non quia porro. Vel ullam tempore. Quis eum et. Accusantium aut et repudiandae ab dolor. Reiciendis voluptatibus vel dicta nisi consequatur ea non minus suscipit.', DATEADD(day, -47, GETDATE()));
SET @MailID_10_5 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_10_5, 10, 3, 0, 0, NULL, DATEADD(day, -47, GETDATE()), DATEADD(day, -47, GETDATE()), DATEADD(day, -46, GETDATE()));

DECLARE @MailID_10_6 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (7, N'Quo veritatis velit omnis veritatis.', N'Dignissimos et porro labore sapiente fuga sit. Temporibus vel cumque tempora quia. Libero vero id eius amet repellat dolore. Doloremque sapiente ex. Iure doloremque nihil omnis quia.

Officia inventore et voluptatem cupiditate necessitatibus et necessitatibus. Nobis explicabo sed. Fugiat voluptates unde dolorem debitis numquam dolore qui. Voluptatem ex ullam est rerum.

Similique voluptas dolor et reiciendis ab repellendus. Blanditiis eligendi id accusamus. Unde expedita voluptates unde rerum rerum sunt. Dolores et cumque. Quia consequatur sed aliquam voluptas. Dolorum dolor ut placeat et odio ut numquam minus.', DATEADD(day, -61, GETDATE()));
SET @MailID_10_6 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_10_6, 10, 3, 0, 0, NULL, DATEADD(day, -61, GETDATE()), DATEADD(day, -61, GETDATE()), DATEADD(day, -60, GETDATE()));

DECLARE @MailID_10_7 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (6, N'Ipsa omnis consequuntur est et.', N'Minima iste id. Ut et corrupti sit qui et omnis ab. Libero ut omnis aperiam repellat et qui veritatis alias assumenda. Quis sit libero ipsa. Enim dolore esse tempore nisi ab eos culpa odit impedit.', DATEADD(day, -16, GETDATE()));
SET @MailID_10_7 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_10_7, 10, 3, 0, 0, NULL, DATEADD(day, -16, GETDATE()), DATEADD(day, -16, GETDATE()), DATEADD(day, -15, GETDATE()));

DECLARE @MailID_10_8 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (2, N'Vitae quia id voluptates dolore.', N'Consequuntur et mollitia nesciunt eos et ipsam consequuntur nobis at. Rerum quia natus minima eaque. Inventore repellat et aspernatur quo aut minus nulla ratione ipsum. Iusto labore ut explicabo magni doloremque ut consectetur veniam.

Et repellendus dolorem laudantium eum facere dolor at cumque. Aperiam praesentium et modi error debitis consequuntur et pariatur laborum. Facilis sequi cupiditate quasi voluptatem.', DATEADD(day, -68, GETDATE()));
SET @MailID_10_8 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_10_8, 10, 3, 0, 0, NULL, DATEADD(day, -68, GETDATE()), DATEADD(day, -68, GETDATE()), DATEADD(day, -67, GETDATE()));

DECLARE @MailID_10_9 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (7, N'Consequatur sint quae repudiandae non.', N'Aliquid sapiente facere est consequatur dolores minus. Libero mollitia dignissimos aut id quam accusamus qui eum. Rerum alias voluptatem vel et.

A quasi labore consectetur rerum et consectetur adipisci eos aliquam. Fugiat modi sed nostrum velit eligendi ea non cum. Molestiae animi veniam et quam pariatur non. Blanditiis praesentium repellat fugiat et et est voluptas. Sint quibusdam a tempore suscipit at ducimus possimus id. Molestiae sunt neque.

Minus sunt enim maxime. Culpa ipsam nihil sed quo deleniti est corporis. Sapiente rerum ut sint quidem earum assumenda sit consequatur.', DATEADD(day, -46, GETDATE()));
SET @MailID_10_9 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_10_9, 10, 3, 0, 0, NULL, DATEADD(day, -46, GETDATE()), DATEADD(day, -46, GETDATE()), NULL);

DECLARE @MailID_10_10 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (7, N'Aut voluptatem qui accusantium molestiae.', N'Aliquam soluta quidem quod voluptatibus officiis. Et eveniet ea est sint quis quia nisi. Unde est aliquam ducimus est aut.

Aspernatur aliquam pariatur vel totam. Quia sapiente sequi numquam doloribus sint impedit ipsa nisi. Laboriosam neque numquam maiores ratione pariatur. Dolores blanditiis nulla odit quam blanditiis et. Et sint ut numquam est eum ut autem.

Est pariatur tenetur qui et. Qui sint reiciendis reiciendis aut. Rerum tenetur dolor illo. Commodi facilis et velit ut. Tenetur natus id animi eligendi sit id molestias explicabo dolor.', DATEADD(day, -57, GETDATE()));
SET @MailID_10_10 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_10_10, 10, 3, 0, 0, NULL, DATEADD(day, -57, GETDATE()), DATEADD(day, -57, GETDATE()), DATEADD(day, -56, GETDATE()));

DECLARE @MailID_10_11 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (6, N'Iusto voluptate qui repellendus aperiam.', N'Placeat excepturi beatae dolor. Dolorem ut sed nihil sint aspernatur. Doloremque ad distinctio impedit.

Non quasi laudantium reiciendis voluptatem voluptatem et fugiat. Velit voluptatem sed. Aut nam accusantium.

Omnis cupiditate excepturi culpa illo. Consequatur qui quod et. Ut voluptatibus quo nam. Qui impedit quos ut consequuntur minus. Consectetur repellat sed sapiente quia ipsum voluptas sit voluptatum consequatur. Ut quibusdam quo cupiditate quasi perferendis suscipit ipsum repellat neque.', DATEADD(day, -114, GETDATE()));
SET @MailID_10_11 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_10_11, 10, 3, 1, 0, NULL, DATEADD(day, -114, GETDATE()), DATEADD(day, -114, GETDATE()), DATEADD(day, -113, GETDATE()));

DECLARE @MailID_10_12 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (2, N'Aut natus ea blanditiis consequuntur.', N'Sit recusandae nam quia magnam ut ut. Sed libero in. Non temporibus beatae et accusantium.

Laudantium non deserunt deserunt qui quia repellat. Omnis molestias quam et rerum quod rerum sed porro. Vero dicta corrupti cumque adipisci dolor itaque et. Et ea eaque consequuntur.', DATEADD(day, -73, GETDATE()));
SET @MailID_10_12 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_10_12, 10, 3, 0, 0, NULL, DATEADD(day, -73, GETDATE()), DATEADD(day, -73, GETDATE()), DATEADD(day, -72, GETDATE()));

DECLARE @MailID_10_13 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (6, N'Libero beatae iste officia consequatur.', N'Est fuga qui explicabo accusantium eveniet atque repudiandae in est. Est est sit quis quia ipsa ullam tenetur. Qui ut omnis itaque quam qui laudantium.', DATEADD(day, -5, GETDATE()));
SET @MailID_10_13 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_10_13, 10, 3, 0, 0, NULL, DATEADD(day, -5, GETDATE()), DATEADD(day, -5, GETDATE()), DATEADD(day, -4, GETDATE()));

DECLARE @MailID_10_14 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (2, N'Quam sit est quisquam consequatur.', N'Occaecati occaecati saepe voluptatibus iusto ipsa dignissimos aut. Aut eos ipsam laborum non maxime ut odio ab est. Magni quia rerum optio labore. Facilis eius repellendus eos sint. Temporibus sit eligendi quaerat alias voluptatem porro consequatur officiis.

Ducimus quia eum omnis et beatae quo voluptatem quo. Voluptatibus rem dolores sed sed quo. Facilis laborum eum ipsa aut quisquam.

Qui corporis qui dolorem. Nostrum voluptates enim sed. Cum aperiam voluptates dolores praesentium fugiat accusamus. Occaecati quasi cumque sed. Maiores ipsa aut molestias.', DATEADD(day, -118, GETDATE()));
SET @MailID_10_14 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_10_14, 10, 3, 0, 0, NULL, DATEADD(day, -118, GETDATE()), DATEADD(day, -118, GETDATE()), DATEADD(day, -117, GETDATE()));

DECLARE @MailID_10_15 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (4, N'Et minima esse quia corrupti.', N'In saepe quia soluta quidem tempore nihil sapiente. Molestiae est quae inventore qui eius repellendus. Quisquam et dolores rerum. Aut id eius itaque perspiciatis provident et quis a et. Tempora assumenda corrupti occaecati neque tempora dolores repellat. Architecto ratione voluptates reprehenderit sed maxime recusandae.', DATEADD(day, -67, GETDATE()));
SET @MailID_10_15 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_10_15, 10, 3, 0, 0, NULL, DATEADD(day, -67, GETDATE()), DATEADD(day, -67, GETDATE()), DATEADD(day, -66, GETDATE()));

DECLARE @MailID_10_16 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (9, N'Est voluptatibus fuga quaerat voluptatem.', N'Ut officia perferendis autem ab occaecati dolores. Qui qui nobis quo. Itaque sunt est nihil dolores error non dolores consequatur non. Quo facere sit ut nisi sit omnis harum. Nobis est et nam doloribus dignissimos assumenda non ad. Accusamus sed quia iure voluptas.

Illum velit sunt hic et ipsam. Officia voluptatem in error voluptas ab fugit. Dicta incidunt dolorem repellendus nihil cum expedita voluptates sed. Dicta autem magnam ipsum. Natus modi deserunt qui a minima omnis.

Qui eligendi itaque ipsam explicabo. Eius consequuntur est harum recusandae voluptas occaecati inventore voluptatem et. Et est laboriosam in enim non magni officia culpa ex. Hic aut expedita ex.', DATEADD(day, -45, GETDATE()));
SET @MailID_10_16 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_10_16, 10, 3, 0, 0, NULL, DATEADD(day, -45, GETDATE()), DATEADD(day, -45, GETDATE()), DATEADD(day, -44, GETDATE()));

DECLARE @MailID_10_17 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (5, N'Nemo nemo rerum quia rem.', N'Nemo et rerum deserunt. Omnis architecto consequatur id magnam. Magnam inventore assumenda in labore. Eligendi atque consequatur ab repudiandae nihil veniam dolores. A recusandae recusandae atque sit molestiae. Molestias qui consectetur qui unde iusto odio a non.

Dicta quasi occaecati nesciunt temporibus itaque facilis velit earum. Labore doloribus recusandae voluptates optio ipsa aut ut labore. Rem fugiat nam ea animi rerum.', DATEADD(day, -87, GETDATE()));
SET @MailID_10_17 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_10_17, 10, 3, 0, 0, NULL, DATEADD(day, -87, GETDATE()), DATEADD(day, -87, GETDATE()), NULL);

DECLARE @MailID_10_18 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (7, N'Numquam et voluptas dolores molestiae.', N'Aut corporis et ipsam occaecati. Et voluptas aut. Minima non laudantium. Et et amet quibusdam necessitatibus voluptas et consequuntur eveniet et. Quia modi doloribus et molestiae provident inventore.

Porro magnam dolorem dolorem sed. Placeat rerum animi accusamus. Suscipit esse consequatur earum animi iste et reiciendis. Necessitatibus veritatis vitae enim velit. Omnis rerum ut quo quia sunt.', DATEADD(day, -104, GETDATE()));
SET @MailID_10_18 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_10_18, 10, 3, 0, 0, NULL, DATEADD(day, -104, GETDATE()), DATEADD(day, -104, GETDATE()), DATEADD(day, -103, GETDATE()));

DECLARE @MailID_10_19 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (3, N'Dignissimos saepe beatae suscipit quibusdam.', N'Officiis perferendis impedit et est omnis. Sapiente in voluptas qui alias ipsum. Et repellendus harum. Eveniet beatae sed dicta ut reprehenderit. Assumenda sit facere suscipit culpa officia velit.

Aliquam non nam reprehenderit vel voluptate eos sint eum quibusdam. Praesentium sunt perspiciatis ratione. Ducimus ipsam minima doloremque quibusdam et illo. Amet vitae eligendi eveniet odit. Voluptatem hic quibusdam et et ipsa fugiat. Est quae magnam et quia iure.

Error magnam a quam necessitatibus hic non aspernatur quos. Dolorem ut non amet veniam officiis adipisci cumque. Quia tempora facere tenetur beatae voluptas. Tempore et labore.', DATEADD(day, -42, GETDATE()));
SET @MailID_10_19 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_10_19, 10, 3, 0, 0, NULL, DATEADD(day, -42, GETDATE()), DATEADD(day, -42, GETDATE()), DATEADD(day, -41, GETDATE()));

DECLARE @MailID_10_20 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (4, N'Quo soluta libero repellat optio.', N'Blanditiis et fugit nobis excepturi et voluptatem eveniet blanditiis rerum. Dolorum maxime perferendis ut voluptas est odit. Magni quae voluptates culpa voluptatem corrupti atque unde velit.

Laboriosam temporibus nihil iste et quaerat ut. Quo ratione quas libero veniam distinctio voluptas necessitatibus tenetur quo. Animi enim sunt sit vero quo. Ad quo provident eos amet libero voluptatem.

Magni magni repellendus molestiae perspiciatis itaque. Velit et incidunt dolor laudantium non commodi dolor quo quasi. Est et placeat quo.', DATEADD(day, -93, GETDATE()));
SET @MailID_10_20 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_10_20, 10, 3, 1, 0, NULL, DATEADD(day, -93, GETDATE()), DATEADD(day, -93, GETDATE()), NULL);

DECLARE @MailID_10_21 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (5, N'Quo nulla quis qui dolor.', N'Vel ipsa expedita ut et asperiores porro est. Et quo quae. Officia rerum ad voluptatem nulla asperiores pariatur ex expedita a. Expedita voluptas harum doloremque tempora.

Odio expedita aut dicta nulla esse voluptas veritatis. Et optio ut voluptatem illo eveniet dolores voluptatibus. Aspernatur iste reiciendis at qui illum. Officia laudantium ea neque minima dicta magni corporis.', DATEADD(day, -35, GETDATE()));
SET @MailID_10_21 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_10_21, 10, 3, 0, 0, NULL, DATEADD(day, -35, GETDATE()), DATEADD(day, -35, GETDATE()), DATEADD(day, -34, GETDATE()));

DECLARE @MailID_10_22 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (3, N'Enim aliquid atque eos illum.', N'Id possimus et beatae voluptas optio aut consectetur consequuntur. Iure dolorum ducimus. Nobis ducimus vero autem. Error neque minus voluptatem in dolorum.

Repudiandae eos quasi est consequatur et consectetur ut. At quod ad velit. Eos perferendis et placeat aut. Ipsa ut aut ex vel magnam natus corporis. Molestias aut molestiae et aut qui necessitatibus dolorem adipisci totam. Fugiat similique nihil dolor quasi laudantium.', DATEADD(day, -43, GETDATE()));
SET @MailID_10_22 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_10_22, 10, 3, 0, 0, NULL, DATEADD(day, -43, GETDATE()), DATEADD(day, -43, GETDATE()), NULL);

DECLARE @MailID_10_23 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (2, N'Et velit in eligendi culpa.', N'Quia rerum deserunt odit ut quas aliquam hic. Ducimus quo sequi voluptatem alias commodi. Debitis est labore laboriosam impedit vitae eos perspiciatis sunt debitis. Vitae incidunt aut provident aut et est.', DATEADD(day, -53, GETDATE()));
SET @MailID_10_23 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_10_23, 10, 3, 0, 0, NULL, DATEADD(day, -53, GETDATE()), DATEADD(day, -53, GETDATE()), NULL);

DECLARE @MailID_10_24 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (8, N'Officia sunt molestias in dolores.', N'Rerum optio consectetur aut odio et voluptas aut. Et voluptas ullam tempora ad. Cum doloremque velit nisi nisi et non. Sed quasi sed est molestiae aliquam quia voluptates earum nobis. Ut dicta et non rem facere sit in. Quo est odio.

Pariatur qui eius nostrum voluptatem tenetur sapiente et voluptatem quis. Consequatur dolor id quis. Tempora autem qui aspernatur illo quis.', DATEADD(day, -32, GETDATE()));
SET @MailID_10_24 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_10_24, 10, 3, 0, 0, NULL, DATEADD(day, -32, GETDATE()), DATEADD(day, -32, GETDATE()), NULL);

DECLARE @MailID_10_25 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (1, N'Nemo similique molestias earum quod.', N'Velit aut aut officiis officia alias nihil corrupti. Labore adipisci voluptatem eveniet eos vel quod incidunt est. Voluptatem quidem rem exercitationem aut ut minima natus. Quaerat illo porro ea voluptatibus quasi vero.

Itaque non quasi. Qui voluptatem ratione saepe magni quis aliquid illum aliquid. Quis sed in laborum consequuntur ipsa ratione cum. Excepturi autem similique eveniet ullam consequuntur esse blanditiis.', DATEADD(day, -58, GETDATE()));
SET @MailID_10_25 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_10_25, 10, 3, 0, 0, NULL, DATEADD(day, -58, GETDATE()), DATEADD(day, -58, GETDATE()), DATEADD(day, -57, GETDATE()));

DECLARE @MailID_10_26 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (7, N'Voluptatem vel qui libero cupiditate.', N'Facere facere iusto qui qui doloribus nihil odit id omnis. Qui sed hic laboriosam exercitationem officia eos est molestiae. In nam modi totam itaque ut exercitationem ut laudantium.

Nulla quam in doloribus quis numquam corrupti voluptas sequi. Quia illo optio eligendi accusantium modi sunt. Nesciunt porro non nam voluptatibus.

Quo et dolor corrupti occaecati qui. Dignissimos occaecati similique maiores sed aut. Iste veritatis iure non labore recusandae ea. Soluta aut omnis a et nisi. Laudantium voluptatum illum explicabo. Rem porro fuga velit dolor placeat.', DATEADD(day, -110, GETDATE()));
SET @MailID_10_26 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_10_26, 10, 3, 0, 0, NULL, DATEADD(day, -110, GETDATE()), DATEADD(day, -110, GETDATE()), DATEADD(day, -109, GETDATE()));

DECLARE @MailID_10_27 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (4, N'Totam dolorum fugiat non molestias.', N'Iure quae velit. Dolor numquam quo error non quia exercitationem. Quaerat commodi tempore qui et. Est assumenda enim est sit. Nemo iste et sed officiis dolorum itaque totam vel aut. Quo quaerat sint consequatur sunt.

Omnis rem facilis nostrum. Ab et incidunt fugiat sed perspiciatis accusamus aut. Et cupiditate non hic necessitatibus non sed eum ipsum aspernatur.

Earum aut possimus enim consequatur possimus rerum. Quod quae tempora dignissimos omnis. Temporibus distinctio quaerat voluptatem libero consequatur. Sit autem minima nostrum quo debitis nam libero. Veritatis praesentium vel porro et sed optio veritatis eum est.', DATEADD(day, -16, GETDATE()));
SET @MailID_10_27 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_10_27, 10, 3, 0, 0, NULL, DATEADD(day, -16, GETDATE()), DATEADD(day, -16, GETDATE()), DATEADD(day, -15, GETDATE()));

DECLARE @MailID_10_28 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (4, N'Eaque tenetur explicabo at est.', N'Dolores sit autem est asperiores amet neque sint voluptate. Eum eum officia omnis quae quis perspiciatis. Aut quia ducimus explicabo debitis at rerum libero et. Reprehenderit quisquam velit quo natus modi. Quo distinctio quia architecto sint soluta et doloribus. Impedit deleniti alias.

Qui corrupti ducimus qui ut culpa repellendus praesentium unde. Asperiores magni deserunt. Voluptates omnis similique iure velit rerum ex optio. Molestias veritatis deleniti quo velit dignissimos sed ipsam id. Amet magnam voluptatum aut autem ipsa. Quod quam cumque voluptas maxime nulla nisi.

Nobis aut commodi nam non eum eligendi dolorum accusantium. Modi in sit. Fugit nemo explicabo labore quaerat dolore eligendi. Quia ipsa sequi qui ut. Illo dignissimos ut possimus voluptatem.', DATEADD(day, -29, GETDATE()));
SET @MailID_10_28 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_10_28, 10, 3, 0, 0, NULL, DATEADD(day, -29, GETDATE()), DATEADD(day, -29, GETDATE()), DATEADD(day, -28, GETDATE()));

DECLARE @MailID_10_29 INT;
INSERT INTO Email (SenderID, Subject, Body, DateCreated)
VALUES (8, N'Et a sint et eos.', N'Perferendis natus sed ullam repellendus possimus. Natus voluptatem aspernatur et ullam harum qui natus ipsum error. Enim repellendus non vero est sint provident. In laborum ea enim sed.', DATEADD(day, -32, GETDATE()));
SET @MailID_10_29 = SCOPE_IDENTITY();
INSERT INTO EmailToReceiver (MailID, ReceiverID, MailStatus, Marked, Trashed, DateTrashed, DateSent, DateReceived, DateRead)
VALUES (@MailID_10_29, 10, 3, 1, 0, NULL, DATEADD(day, -32, GETDATE()), DATEADD(day, -32, GETDATE()), DATEADD(day, -31, GETDATE()));

MERGE AccountInboxState AS target
USING (VALUES (10, 0, 30, '2026-04-12 16:46:07'))
    AS source (AccountID, Category, MailCount, DateLastModified)
ON target.AccountID = source.AccountID
    AND target.Category = source.Category
WHEN MATCHED THEN
    UPDATE SET DateLastModified = source.DateLastModified
WHEN NOT MATCHED THEN
    INSERT (AccountID, Category, MailCount, DateLastModified)
    VALUES (source.AccountID, source.Category, source.MailCount, source.DateLastModified);

