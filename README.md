# Desktop Email Application (WPF, C#, T-SQL)
## 1. Overview
A desktop email application built with **WPF (C#)** and **SQL Server**, designed using a **layered architecture** to separate presentation, business logic, and data access.

The application implements **MVVM**, along with **service** and **repository** layers, to support authentication, email composition, and inbox management. It is backed by a **normalized relational database schema** designed to efficiently handle multi-recipient email delivery.

## 2. Features

### Login / Account Creation

- **Login** - Through the login screen, you can sign in to an existing account which then takes you to your designated inbox of mail.

- **Account** - Can create a new account with an associated name, email address, and password which is taken and securely hashed with BCrypt.

### Inbox

- **Top Navigation Bar** - Serves as the core anchor throughout the application. While not yet implemented, will in the future support advanced user querying

- **Side Bar** - A quick way for users to filter their mail as well as access other important pages such as settings, help or creating new mail.

- **Inbox Panel** - The crux of the inbox page, it displays a dynamically loaded list of emails for the authenticated user including sender, subject, timestamp, and a preview of the body.

### Sending/Receiving Mail
- **Sending Mail** - Contained in its own page, mail can be created by users and sent to other users. This includes subject and body as well.

- **Receiving Mail** - Similarly with its own page, users can view the mail entirely they have been sent after clicking on the respective preview mail in their inbox.

### Multi-Recipient Support

- **One-to-Many** - The databases have been setup to provide support for multiple recipients to receive the same mail sent by a user.

- **Separate Tracking** - Each recipient has their own mail tracked with a status, if it is marked, if it is trashed, and the dates for their actions.

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

## 5. Architecture

### Data Models, View Models, and View

- **Data Models** - A direct interface with the data representation of an arbitrary record of a specific table. These were kept simple with only simple fields that correspond with the attributes of the table these classes represented.

- **View Models** - A projection of the data models into a user relevant representation. An example is the `EmailViewModel` class which takes from `EmailData` and `AccountData` which comprises of the following:

| Field Name | Data Type | Derived From |
|-|-|-|
| Subject | `string` | `EmailData` |
| Sender | `string` | `Email Data` -> `AccountData` |
| Recipients | `List<string>` | `EmailData` -> `AccountData` |
| Body | `string` | `EmailData` |
| DateCreated | `DateTime` | `EmailData` |
| DateReceived | `DateTime` | `EmailToReceiverData` |
| DateRead | `DateTime` | `EmailToReceiverData` |

- **View** - The user interface representation of data. The examples of this is the display of a collection of email previews in the inbox, or the mail being displayed in the view mail page.

### Services

- The service layer serves as a mediator between the layers of data such as taking requests then calling for the repository to fetch data it needs and then organizes that data. Another example is taking user input, organizing it into a data representation then sending it to the repository to insert into the database.

- The current services are `EmailService` and `AccountService`.

### Repositories

- The repository serves as the mediator between the data model and the actual records in the database.

- The current repositories are the `AccountRepository`, `EmailRepository`, `EmailToReceiverRepository`, and `InboxEmailRepository`.

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

## 7. Security

### Session / Token
User credentials are validated securely during login then establish a session and give a token to the user for that session.

### BCrypt
User passwords are hashed using BCrypt before storage, ensuring no plaintext credentials are stored.

## 8. Future Work / Optimization Considerations
