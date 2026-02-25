# 🎓 Student Record Management System

A full-stack **web application** built with **Spring MVC** and **Core JDBC** (without Spring Boot or Hibernate) that allows managing student records — add, view, edit, update, and delete — through a clean dark-themed web interface.

---

## 🚀 Features

- **Register a Student** — Add new student with name, email, and course details
- **View All Students** — Display complete list of all registered students
- **Edit a Student** — Update existing student information
- **Delete a Student** — Remove a student record from the database
- **Redirect after action** — POST/Redirect/GET pattern followed to prevent form resubmission

---

## 🛠️ Tech Stack

| Layer | Technology |
|---|---|
| Language | Java |
| Framework | Spring MVC (without Spring Boot) |
| Database Access | Core JDBC (`DataSource`, `PreparedStatement`) |
| Database | MySQL |
| View Layer | JSP (Java Server Pages) |
| Configuration | XML-based (`dispatcher-servlet.xml`, `web.xml`) |
| Build Tool | Maven |

---

## 📁 Project Structure

```
StudentManagementSystem/
│
├── src/main/java/com/cdac/
│   ├── Student.java               # Model class (POJO)
│   ├── StudentDAO.java            # Data Access Layer (Core JDBC)
│   └── StudentController.java     # MVC Controller
│
├── src/main/webapp/
│   ├── WEB-INF/
│   │   ├── views/
│   │   │   ├── register.jsp        # Student registration form
│   │   │   ├── viewStudent.jsp     # View all students
│   │   │   └── editData.jsp        # Edit & delete student form
│   │   ├── dispatcher-servlet.xml  # Spring MVC configuration
│   │   └── web.xml                 # Web app deployment descriptor
│
└── pom.xml
```

---

## ⚙️ Setup & Run

### Prerequisites
- Java 8+
- MySQL Server running
- Apache Tomcat (9 or 10)
- Maven installed
- Eclipse IDE / IntelliJ IDEA

### Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/your-username/StudentManagementSystem.git
   ```

2. **Create the MySQL database and table**
   ```sql
   CREATE DATABASE studentdb;
   USE studentdb;

   CREATE TABLE student (
       id INT AUTO_INCREMENT PRIMARY KEY,
       name VARCHAR(100),
       email VARCHAR(100),
       course VARCHAR(100)
   );
   ```

3. **Configure DataSource** — Update `dispatcher-servlet.xml` with your DB credentials:
   ```xml
   <bean id="dataSource" class="org.springframework.jdbc.datasource.DriverManagerDataSource">
       <property name="driverClassName" value="com.mysql.cj.jdbc.Driver"/>
       <property name="url" value="jdbc:mysql://localhost:3306/studentdb"/>
       <property name="username" value="your_username"/>
       <property name="password" value="your_password"/>
   </bean>
   ```

4. **Build the project**
   ```bash
   mvn clean install
   ```

5. **Deploy** the generated `.war` file on Apache Tomcat

6. **Open in browser**
   ```
   http://localhost:8080/StudentManagementSystem/register
   ```

---

## 🔗 Application Routes

| URL | Method | Description |
|---|---|---|
| `/register` | GET | Open student registration form |
| `/registerStudent` | POST | Submit and save new student |
| `/viewStudent` | GET | View all students |
| `/edit?id={id}` | GET | Open edit form for a student |
| `/update` | POST | Save updated student details |
| `/delete` | POST | Delete a student by ID |

---

## 🗄️ Database Table — `student`

| Column | Type | Description |
|---|---|---|
| `id` | INT (Auto Increment) | Primary Key |
| `name` | VARCHAR(100) | Student name |
| `email` | VARCHAR(100) | Student email |
| `course` | VARCHAR(100) | Enrolled course |

---

## 🏗️ Architecture

This project follows the classic **MVC (Model-View-Controller)** pattern:

- **Model** → `Student.java` — Plain Java class holding student data
- **View** → JSP files — Dynamic HTML rendered on the server side
- **Controller** → `StudentController.java` — Handles all HTTP requests and maps them to DAO calls
- **DAO** → `StudentDAO.java` — Directly interacts with MySQL using Core JDBC

> **Note:** This project intentionally uses **Core JDBC** instead of Hibernate/JPA to demonstrate low-level database handling with `PreparedStatement` and `ResultSet`.

---

## 📌 How to Push to GitHub

```bash
git init
git add .
git commit -m "Initial commit - Student Management CRUD App"
git remote add origin https://github.com/your-username/StudentManagementSystem.git
git branch -M main
git push -u origin main
```

---

## 🙋‍♂️ Author

Built as a hands-on learning project to understand **Spring MVC**, **Core JDBC**, **DAO design pattern**, and **XML-based Spring configuration** without relying on Spring Boot auto-configuration.
