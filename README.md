# Desktop Email Application (WPF, C#, T-SQL)
## 1. Overview
A desktop application which handles communication with a **normalized relational database** to create, send, and view emails to registered email accounts on a server. Implemented using **SSMS** for the database and **WPF (C#)** for the front-end, this project serves to demonstrate separation of concerns utilizing **MVVM** and layered architecture with a **services** and **repositories**.

## 2. Features

### Login / Account Creation

- **Login** - Through the login screen, you can sign in to an existing account which then takes you to your designated inbox of mail.

- **Account** - Can create a new account with an associated name, email address, and password which is taken and securely hashed with BCrypt.

### Inbox

- **Top Navigation Bar** - Serves as the core anchor throughout the application. While not yet implemented, will in the future support advanced user querying

- **Side Bar** - A quick way for users to filter their mail as well as access other important pages such as settings, help or creating new mail.

- **Inbox Panel** - The crux of the inbox page, it displays a dynamically lodaed list of emails for the autheticated user including sender, subject, timestamp, and a preview of the body.

### Sending/Receiving Mail
- **Sending Mail** - Contained in it's own page, mail can be created by users and sent to other users. This includes subject and body as well.

- **Receiving Mail** - Similarly with its own page, users can view the mail entirely they have been sent after clicking on the respective preview mail in their inbox.

### Multi-Recipient Support
- **One-to-Many** - The databases have been setup to provide support for multiple recipients to receive the same mail sent by a user.

- **Seperate Tracking** - Each recipient has their own mail tracked with a status, if it is marked, if it is trashed, and the dates for their actions.
- 
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
