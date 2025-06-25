# LEAK-PEAK-PROJECT-DBMS-
# 🔐 Leak Peak

**Leak Peak** is a comprehensive web application designed to manage user accounts, subscription plans, and monitor data breaches. It provides a secure platform for both users and administrators, enabling them to take control of their security and data.

---

## 📌 Project Overview

Leak Peak enables:

- Secure user authentication and session management
- Subscription plan management and payment tracking
- Activity logging for user actions
- Monitoring and alerting of data breaches
- Role-based access for users and administrators

---

## 🎯 Objectives

- Develop a user-friendly interface for users and admins  
- Implement secure authentication using JWT and sessions  
- Track user activity with detailed logs  
- Manage subscription renewals and payment data  
- Alert users if their accounts are found in known breaches  

---

## 🧰 Technology Stack

| Layer         | Technologies                          |
|---------------|---------------------------------------|
| Frontend      | HTML, CSS (Tailwind CSS), JavaScript  |
| Backend       | Node.js, Express.js                   |
| Database      | MySQL                                 |
| Authentication| JWT, express-session                  |
| Email Alerts  | Nodemailer                            |
| Scheduling    | Node-Cron                             |

---

## 🚀 Key Features

### 1. User Management
- User and admin registration & login  
- Role-based access control  

### 2. Subscription Management
- View and manage subscription plans  
- Premium features with credit card payment integration  

### 3. Activity Logging
- Tracks user actions like login/logout, subscription updates  
- Admin view of full activity logs  

### 4. Breach Monitoring
- Detect compromised accounts  
- Notify affected users via email  

### 5. Email Notifications
- Subscription reminders  
- Breach alerts and warnings  

### 6. Admin Dashboard
- Manage users, subscriptions, and logs  
- View breach reports and perform administrative actions  

---

## 🧱 Database Design (ER Model)

### Key Entities

- **Users**: Stores user credentials and role  
- **Admins**: Admin-specific credentials and roles  
- **User_Logs**: Tracks user actions and timestamps  
- **Subscriptions**: Manages user subscription records  
- **Subscription_Plans**: Stores plan details and pricing  
- **Compromised_Accounts**: Breach-affected accounts  
- **Breaches**: Breach metadata including type and source  
- **Breach_Types**: Categorization of breach types  
- **Credit_Cards**: Encrypted payment info linked to users  
- **Countries**: Country information associated with users/cards  

### Relationships

- Users can have multiple logs, subscriptions, and compromised accounts  
- Admins manage multiple users and their activity  
- Subscriptions are linked to plans  
- Breaches are tied to breach types and affected users  

---

## 💻 User Interface

- **Home Page**: Intro and navigation  
- **Dashboard**: Overview of account and subscription  
- **User Logs Page**: View recent actions  
- **Subscription Page**: Upgrade/renew plans  
- **Admin Panel**: Manage users and view full logs  

---

## 🔐 Security Considerations

- JWT for secure token-based authentication  
- Session handling for sensitive actions  
- CORS restrictions on API access  
- Logged actions for audit trails  
- Email alerts for security events  

---

## 🔄 Application Flow

1. **User Registration & Login**
   - Secure form validation  
   - JWT issued on successful login  

2. **Dashboard Access**
   - Account overview and subscription summary  

3. **Subscription Management**
   - View plans, renew or upgrade  
   - Payment processing and database update  

4. **User Activity Logging**
   - Actions like login, logout, and plan changes logged with timestamps  

5. **Breach Monitoring**
   - Scan user emails for known breaches  
   - Notify users if they are affected  

6. **Admin Access**
   - Secure login for elevated control  
   - View and manage all user logs and breach data  

7. **Logout**
   - JWT invalidated, session cleared  

---

## 📈 Future Enhancements

- Dashboard charts for breach analytics  
- Two-factor authentication  
- API integration with external breach databases (e.g., HaveIBeenPwned)  
- Admin analytics and reporting tools  

---

## 📝 License

This project is developed **for educational purposes as part of coursework at FAST-NUCES**.  
It demonstrates secure web application practices including authentication, subscription handling, breach monitoring, and administrative controls.

