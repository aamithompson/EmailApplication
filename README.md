# Desktop Email Application (WPF, C#, T-SQL)
## 1. Overview
A desktop email application built with **WPF (C#)**, **SQL Server** and **AWS**, designed using a **layered client-server architecture** to separate presentation, business logic, and data access across two distinct tiers.

The client implements **MVVM**, along with **mapper** and **API service** layers, to support authentication, email composition, and inbox management. The server exposes HTTP endpoints consumed by the client, backed by **service** and **repository** layers and a **normalized relational database schema** designed to efficiently handle multi-recipient email delivery.

## 2. Features

### Login / Account Creation

- **Login** - Through the login screen, you can sign in to an existing account, which authenticates against the server and returns a JWT used for subsequent requests.

- **Account** - Can create a new account with an associated name, email address, and password, which is securely hashed with BCrypt on the server before storage.

### Inbox

- **Top Navigation Bar** - Serves as the core anchor throughout the application. It will in the future support advanced user querying

- **Side Bar** - A quick way for users to filter their mail as well as access other important pages such as settings, help or creating new mail.

- **Inbox Panel** - The crux of the inbox page, it displays a dynamically loaded list of emails for the authenticated user including sender, subject, timestamp, and a preview of the body.

### Sending/Receiving Mail
- **Sending Mail** - Contained in its own page, mail can be created by users and sent to other users. This includes subject and body as well.

- **Receiving Mail** - Similarly with its own page, users can view the mail entirely they have been sent after clicking on the respective preview mail in their inbox.

### File Attachments
- **Uploading** - Files are uploaded immediately upon selection before the email is sent, displaying in a wrap panel with truncated filenames. Each file is stored in AWS S3 and tracked in the database with a reference counter.

- **Downloading** - Recipients can download individual attachments via presigned S3 URLs generated on demand by the server, allowing direct client-to-S3 transfers without proxying through the server.

- **Security** - Ownership is verified on both upload and download. Files are tied to the uploading account to prevent fileID injection attacks during the window between upload and send.

### Multi-Recipient Support

- **One-to-Many** - The databases have been setup to provide support for multiple recipients to receive the same mail sent by a user.

- **Separate Tracking** - Each recipient has their own mail tracked with a status, if it is marked, if it is trashed, and the dates for their actions.

### Query Optimizations
- **Indexing** - Improves database performance by adding indexes on frequently queried columns. Examples of this are `idx_receiver_date` which is the composition of `(ReceiverID, DateReceived DESC)` on `EmailToReceiver`, and `UNIQUE (AccountID, Category)` on `AccountInboxState` which has an index added since it is unique.

- **Lazy Loading** – Loads inbox data in batches as the user scrolls, reducing initial load time and bandwidth usage.
  
- **Client-Side Caching** – Caches previously retrieved data and invalidates it based on server-side update timestamps to minimize redundant queries.

## 3. Screenshots

### Login Screen
*User authentication interface for existing accounts*

![Login Screen](Screenshots/SignIn.png)

### Account Creation
*Form for registering new users with securely hashed credentials*

![Account Creation](Screenshots/CreateAccount.png)

### Inbox
*Displays received emails with sender, subject and preview*

![Inbox](Screenshots/Inbox.png)

### Viewing Mail
*Full email content view after selecting a message*

![Viewing Mail](Screenshots/ViewMail.png)

### Creating Mail
*Compose interface supporting multi-recipient email sending*

![Creating Mail](Screenshots/CreateMail.png)
## 4. Installation & Usage (Docker)

### Prerequisites
- [Docker Desktop](https://www.docker.com/products/docker-desktop/)
- [.NET 10 SDK](https://dotnet.microsoft.com/download) (for the WPF client)

### Setup
1. Clone the repository

2. Copy `.env.example` to `.env` and fill in your credentials:
```bash
cp .env.example .env
```

3. Run the following from the solution root:
```bash
docker-compose up --build
```

4. Wait for both containers to show as running. You can verify the server is up at:
- http://localhost:5139/swagger

### Running the Client
Build and launch the WPF client from Visual Studio, or run multiple instances via PowerShell:
```powershell
Start-Process ".\EmailApplication.Client\bin\Debug\net10.0-windows7.0\EmailApplication.Client.exe"
```

### Resetting the Database
To wipe the database and start fresh:
```bash
docker-compose down -v
docker-compose up
```

### Stopping
```bash
docker-compose down
```

## 5. Architecture
```text
*WPF Client*
 ├── *Views*
 ├── *ViewModels*
 ├── *API Services*
 ↓
 
*ASP.NET API*
 ├── *Controllers*
 ├── *Services*
 ├── *Repositories*
 ↓
 
*SQL Server*

*S3 Bucket*
```

The application is split into a client and a server that communicate over HTTP. The client sends requests with a JWT for authentication; the server validates the token before processing.

### Client
*View → View Model → Mapper → API Services*

- **View** – WPF UI components responsible for rendering the user interface.

- **View Model** – MVVM layer managing state and commands, binding the view to underlying data.

- **Mapper** – Translates between server-returned DTOs and view model representations consumed by the UI.

- **API Services** – HTTP client layer responsible for constructing and dispatching requests to the server, including attaching the JWT to request headers.

### Server
*Controller → Services → Repository → Database*

- **Controller** – Exposes HTTP endpoints, handles routing, validates incoming JWTs, and delegates to the service layer.

- **Services** – Contains business logic; mediates between the controller and repository, and organizes data before returning responses.

- **Repository** – Mediates between the service layer and the database, executing queries and mapping results to data models.

- **Database** – SQL Server instance storing all application data.

### DTOs, Data Models, View Models, and View

- **Data Transfer Objects (DTOs)** - An object utilized to help with transferring data between the client and server. This object is what is received between communication between the two before translating it for the next layer.

- **Data Models** - A direct interface with the data representation of an arbitrary record of a specific table. These were kept simple with only simple fields that correspond with the attributes of the table these classes represented.

- **View Models** - A projection of the data models into a user relevant representation. An example is the `EmailViewModel` class which takes from `EmailData` and `AccountData` which comprises of the following:

| Field Name | Data Type | Derived From |
|-|-|-|
| Subject | `string` | `EmailData` |
| Sender | `string` | `EmailData` -> `AccountData` |
| Recipients | `List<string>` | `EmailData` -> `AccountData` |
| Body | `string` | `EmailData` |
| DateCreated | `DateTime` | `EmailData` |
| DateReceived | `DateTime` | `EmailToReceiverData` |
| DateRead | `DateTime` | `EmailToReceiverData` |

- **View** - The user interface representation of data. The examples of this is the display of a collection of email previews in the inbox, or the mail being displayed in the view mail page.

### Services

- The service layer serves as a mediator between the layers of data such as taking requests then calling for the repository to fetch data it needs and then organizes that data. Another example is taking user input, organizing it into a data representation then sending it to the repository to insert into the database.

- The current services are `EmailService`, `AccountService`,  `FileService`, `FileRecordService`, and `FileStorageService`.

### Repositories

- The repository serves as the mediator between the data model and the actual records in the database.

- The current repositories are the `AccountRepository`, `EmailRepository`, `EmailToReceiverRepository`, and `InboxEmailRepository`.

### Cloud (AWS S3)
File attachments are stored in an Amazon S3 bucket. The server generates presigned URLs on demand, granting temporary direct access to specific files. Credentials are never exposed to the client.

## 6. Database Design
The database is designed using a normalized relational schema to minimize redundancy and support efficient querying. In addition, the database supports one account sending many emails and one email being received by many accounts.

### Account:
Stores user credentials and account information.

| Attribute Name | Data Type | Constraint |
|-|-|-|
| AccountID | `INT` | `PRIMARY KEY` |
| EmailAddress | `NVARCHAR(255)` | `NOT NULL`, `UNIQUE` |
| AccountName | `NVARCHAR(255)` | `NOT NULL` |
| PasswordHash | `VARCHAR(255)` | `NOT NULL` |
| DateCreated | `DATETIME` | `NOT NULL` |
| DateLastLogin | `DATETIME` | `NOT NULL` |

### Email:
Stores core email data. 

| Attribute Name | Data Type | Constraint |
|-|-|-|
| MailID | `INT` | `PRIMARY KEY` |
| SenderID | `INT` | `FOREIGN KEY` -> `Account(AccountID)` |
| Subject | `NVARCHAR(255)` | `NOT NULL` |
| Body | `VARCHAR(MAX)` | `NOT NULL` |
| DateCreated | `DATETIME` | `NOT NULL` |

### EmailToReceiver:
Junction table mapping emails to recipients, enabling one-to-many relationships and per-recipient metadata tracking.

| Attribute Name | Data Type | Constraint |
|-|-|-|
| MailID | `INT` | `FOREIGN KEY` -> `Email(MailID)` |
| ReceiverID | `INT` | `FOREIGN KEY` -> `Account(AccountID)` |
| MailStatus | `INT` | `NOT NULL` |
| Marked | `BIT` | `NOT NULL` |
| Trashed | `BIT` | `NOT NULL` |
| DateTrashed | `DATETIME` |  |
| DateSent | `DATETIME` | `NOT NULL` |
| DateReceived | `DATETIME` |  |
| DateRead | `DATETIME` |  |

As to note, `MailStatus` is represented as an `INT` but in the application casts to an Enum which has the following:

| Name | Value |
| - | - |
| Failed | -1 |
| Draft | 0 |
| Sending | 1 |
| Sent | 2 |
| Received | 3 |
| Read | 4 |

### AccountInboxState:
Table which keeps track of changes in a user inbox with the availabity of attaching a category such as `All` or `Sent`.

| Attribute Name | Data Type | Constraint |
|-|-|-|
| StateID | `INT` | `PRIMARY KEY` |
| AccountID | `INT` | `FOREIGN KEY` -> `Account(AccountID)` |
| Category | `INT` | `NOT NULL` |
| MailCount | `INT` | `NOT NULL` |
| DateLastModified | `DATETIME` | `NOT NULL` |

This also has the composition key `UNIQUE (AccountID, Category)`.

### FileAttachment:
Stores metadata for uploaded file attachments.

| Attribute Name | Data Type | Constraint |
|-|-|-|
| FileID | `INT` | `PRIMARY KEY` |
| BucketKey | `NVARCHAR(255)` | S3 object key, format: `attachments/{FileID}/{FileName}` |
| UploaderID | `INT` | `FOREIGN KEY` -> `Account(AccountID)` |
| FileName | `NVARCHAR(255)` | `NOT NULL` |
| FileSize | `BIGINT` | `NOT NULL` |
| DateUploaded | `DATETIME` | `NOT NULL` |
| DateLastReferenced | `DATETIME` | `NOT NULL` |
| ReferenceCount | `INT` | `NOT NULL` |

### FileAttachmentToEmail:
Junction table mapping file attachments to emails, enabling file reuse across forwards 
and replies without duplication in S3.

| Attribute Name | Data Type | Constraint |
|-|-|-|
| FileID | `INT` | `FOREIGN KEY` -> `FileAttachment(FileID)` |
| MailID | `INT` | `FOREIGN KEY` -> `Email(MailID)` |

## 7. Security

### JWT (JSON Web Token)
After the server validates user credentials at login, it issues a signed JWT. The client stores this token and attaches it to the `Authorization` header of every subsequent HTTP request. The server validates the token on each request before allowing access to protected endpoints. This token on the client side is also stored in `Session` and default `Authorization` header.

### BCrypt
User passwords are hashed using BCrypt before storage, ensuring no plaintext credentials are stored.

### File Attachment Security
Uploaded files are tied to the uploading account via `UploaderID`. On send, every fileID in the request is verified to belong to the sender, preventing users from injecting foreign fileIDs to attach files they do not own. Presigned URLs are generated at download time rather than ahead of time, minimizing the window of URL validity to seconds.

## 8. Future Work / Optimization Considerations

### JWT Refresh Tokens
Implement refresh token rotation so that short-lived access tokens can be renewed without requiring the user to re-authenticate, improving both security and session continuity.

### Asynchronous Processing
Introduce asynchronous operations on the server side to handle multiple client requests efficiently. This would improve responsiveness and prevent blocking during database or network operations.

### File Attachment Cleanup Service
A background hosted service to periodically remove orphaned S3 files where `ReferenceCount = 0` beyond a grace period, handling cases where uploads were initiated but the email was never sent.

### Recipient Download Verification
Currently download access checks uploader ownership. Full implementation would additionally verify the requester is a recipient of the email the file is attached to, using a join across `FileAttachmentToEmail` and `EmailToReceiver`.

### Forward / Reply
Implement forwarding and replying to emails. File attachments are already designed to support this, forwarding an email inserts a new `FileAttachmentToEmail` row rather than duplicating the S3 object, with the reference counter tracking active references.

### Advanced Querying & Filtering
Implement flexible querying capabilities for inbox management, including:
- Filtering by status (e.g., read, marked, trashed, sent).
  
- Search by sender, subject, body, and date ranges.
  
- Support for compound queries (AND, OR, negation).
### Drafts & Trash Management
- **Drafts** – Allow users to save, edit, and send emails at a later time
  
- **Trash System** – Move deleted emails to a temporary storage with automatic cleanup after a defined retention period  

## 9. License
This project is licensed under the MIT License - see the `LICENSE` file for details.
