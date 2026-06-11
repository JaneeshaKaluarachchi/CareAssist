# 🏥 CareAssist — Health Appointment Management System

CareAssist is a Java-based web application that allows patients to register, log in, and book laboratory test appointments online. Built using Java Servlets, JSP, and MySQL.

---

## 📋 Table of Contents

- [Features](#features)
- [Tech Stack](#tech-stack)
- [Project Structure](#project-structure)
- [Database Setup](#database-setup)
- [Installation & Setup](#installation--setup)
- [Usage](#usage)
- [Known Issues](#known-issues)

---

## ✨ Features

- User Registration & Login
- Patient Dashboard
- Book Lab Appointments (with past-date validation)
- View, Edit & Delete Appointments
- User Profile Management (Update & Delete Account)
- Responsive UI with CSS & JSP includes

---

## 🛠️ Tech Stack

| Layer       | Technology                        |
|-------------|-----------------------------------|
| Backend     | Java Servlets (javax.servlet 3.1) |
| Frontend    | JSP, HTML, CSS, JavaScript        |
| Database    | MySQL 5.x                         |
| Server      | Apache Tomcat                     |
| IDE         | Eclipse IDE (Dynamic Web Project) |
| Libraries   | JSTL 1.2, MySQL Connector 5.1.48  |

---

## 📁 Project Structure

```
HealthDemo/
├── src/
│   └── main/
│       ├── java/com/lab/
│       │   ├── DBConnection.java              # MySQL database connection
│       │   ├── User.java                      # User model
│       │   ├── UserDBUtil.java                # User CRUD operations
│       │   ├── AppointmentModel.java          # Appointment model
│       │   ├── AppointmentController.java     # Appointment CRUD operations
│       │   ├── userLoginServlet.java          # Login handler
│       │   ├── userInsertServlet.java         # Registration handler
│       │   ├── userUpdateServlet.java         # Profile update handler
│       │   ├── userDeleteServlet.java         # Account delete handler
│       │   ├── InsertAppointmentServlet.java  # Book appointment handler
│       │   ├── UpdateAppointmentServlet.java  # Edit appointment handler
│       │   └── DeleteAppointmentServlet.java  # Delete appointment handler
│       └── webapp/
│           ├── HomePage.jsp                   # Public landing page
│           ├── userLogin.jsp                  # Login & Registration page
│           ├── dashboardPatient.jsp           # Patient dashboard
│           ├── appointment.jsp                # Appointment booking form
│           ├── userAppointments.jsp           # View all appointments
│           ├── editAppointment.jsp            # Edit appointment form
│           ├── userAccount.jsp                # User profile
│           ├── userUpdate.jsp                 # Update profile form
│           ├── userDelete.jsp                 # Delete account page
│           ├── navbarHome.jsp                 # Public navbar
│           ├── navbarPatient.jsp              # Patient navbar
│           ├── footer.jsp                     # Footer
│           ├── error.jsp                      # Error page
│           ├── css/                           # Stylesheets & JS files
│           ├── assert/                        # Images & assets
│           └── WEB-INF/
│               ├── web.xml                    # Servlet URL mappings
│               └── lib/                       # JAR dependencies
└── build/
    └── classes/                               # Compiled .class files
```

---

## 🗄️ Database Setup

1. Create a MySQL database named `careassist`.

```sql
CREATE DATABASE careassist;
USE careassist;
```

2. Create the `user` table.

```sql
CREATE TABLE user (
    uid       INT AUTO_INCREMENT PRIMARY KEY,
    username  VARCHAR(100) NOT NULL,
    email     VARCHAR(100) NOT NULL,
    password  VARCHAR(100) NOT NULL
);
```

3. Create the `lab_app` (appointments) table.

```sql
CREATE TABLE lab_app (
    appointment_id   INT AUTO_INCREMENT PRIMARY KEY,
    fullName         VARCHAR(100),
    age              INT,
    gender           VARCHAR(20),
    phone            VARCHAR(20),
    email            VARCHAR(100),
    address          VARCHAR(200),
    appointmentDate  VARCHAR(20),
    appointmentTime  VARCHAR(20),
    testType         VARCHAR(100),
    note             VARCHAR(300),
    uid              INT
);
```

---

## ⚙️ Installation & Setup

### Prerequisites

- Java JDK 8 or above
- Apache Tomcat 9.x
- MySQL Server
- Eclipse IDE (with Web Tools Platform)

### Steps

1. **Clone or extract** the project into your Eclipse workspace.

2. **Import** the project into Eclipse:
   `File → Import → Existing Projects into Workspace`

3. **Configure the database connection** in `DBConnection.java`:

```java
private static String url  = "jdbc:mysql://localhost:3306/careassist";
private static String user = "root";
private static String pass = "your_password_here";
```

4. **Run the database setup** SQL scripts from the [Database Setup](#database-setup) section.

5. **Add Tomcat server** in Eclipse and deploy the project.

6. **Start the server** and navigate to:

```
http://localhost:8080/HealthDemo/HomePage.jsp
```

---

## 🚀 Usage

### URL Mappings

| URL Pattern    | Handler Servlet          | Action                  |
|----------------|--------------------------|-------------------------|
| `/log`         | `userLoginServlet`       | User login              |
| `/insert`      | `userInsertServlet`      | User registration       |
| `/update`      | `userUpdateServlet`      | Update user profile     |
| `/delete`      | `userDeleteServlet`      | Delete user account     |
| `/appinsert`   | `AppointmentInsertServlet` | Book an appointment   |

### User Flow

```
HomePage.jsp  →  userLogin.jsp  →  Login/Register
                                        ↓
                               dashboardPatient.jsp
                               ┌────────────────────┐
                               │  Book Appointment  │ → appointment.jsp
                               │  My Appointments   │ → userAppointments.jsp
                               │  My Profile        │ → userAccount.jsp
                               └────────────────────┘
```

---

## ⚠️ Known Issues

| Issue | Description | Recommended Fix |
|-------|-------------|-----------------|
| SQL Injection | Raw string concatenation used in SQL queries | Use `PreparedStatement` |
| Plain text passwords | Passwords stored without hashing | Use `BCrypt` or `SHA-256` |
| Hardcoded DB credentials | Password in `DBConnection.java` source file | Use environment variables or a config file |
| Missing `uid` in servlet | `InsertAppointmentServlet.java` references `uid` without declaring it (compile error) | Retrieve `uid` from session |
| No admin panel | `getAllAppointments()` exists but no admin JSP view | Add an admin dashboard JSP |

---

## 📄 License

This project was created for educational/lab purposes.
