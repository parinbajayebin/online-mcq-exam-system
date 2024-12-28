Online MCQ-Based Examination System
An online platform designed to conduct Multiple Choice Question (MCQ) based exams for students. The system allows examiners to create exams, add questions, and manage the evaluation process, while students can attempt the exams online, get instant results, and track their performance.

Features
For Admin/Examiners:
Create Exams: Create MCQ-based exams with customizable parameters (exam duration, total marks, etc.).
Add Questions: Easily add MCQs to exams, including question text, multiple options, and correct answers.
Manage Users: Add, remove, and update student profiles for exam access.
View Results: Access detailed results for each student, including correct/incorrect answers.
For Students:
Take Exams: Attempt MCQ exams with a timer for each session.
Instant Results: Receive immediate feedback after submitting the exam.
Track Performance: View individual performance statistics after each exam.
Installation
Prerequisites
PHP 7.x or later
MySQL Database
Apache Server (or any web server that supports PHP)
Steps
Clone the Repository:

bash
Copy code
git clone https://github.com/your-username/online-mcq-exam-system.git
cd online-mcq-exam-system
Set up the Database:

Import the provided database.sql file into your MySQL database using tools like phpMyAdmin or MySQL command line.
Update the database connection settings in the config.php file.
Set up the Server:

Place the project files in the htdocs directory (if using XAMPP) or the root directory of your web server.
Start the Apache and MySQL services.
Access the System:

Open a browser and navigate to http://localhost/online-mcq-exam-system to access the login page.
Configuration
Admin Panel
Login: The admin login can be accessed at http://localhost/online-mcq-exam-system/admin/login.php.
Default credentials (for the first login):
Username: admin
Password: password123
Student Panel
Students can register through the user registration page (http://localhost/online-mcq-exam-system/register.php).
After registration, students can log in and attempt available exams.
Usage
Admin Dashboard
Create exams: Navigate to Exams > Create Exam in the admin panel.
Add questions: Under Exams > Add Questions, add MCQs with options and correct answers.
View results: Go to Results > View Results to see student performance.
Student Dashboard
View available exams: Once logged in, students can see a list of available exams under Exams.
Attempt exam: Click on an exam to start attempting the MCQs.
Check results: After submitting the exam, students can view their score and feedback on their answers.
Technologies Used
Frontend: HTML, CSS, JavaScript
Backend: PHP
Database: MySQL
Server: Apache
Contributing
Contributions to improve the system are welcome! Please fork the repository and submit a pull request with the changes you made.

Steps for contributing:
Fork the repository
Create a new branch for your changes
Commit your changes
Push the changes to your fork
Create a pull request to the main repository
License
This project is licensed under the MIT License - see the LICENSE file for details.
