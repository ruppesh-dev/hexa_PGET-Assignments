create database	SISDB
USE SISDB
GO
-- Creation of Students Table

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(25),
    last_name VARCHAR(25),
    date_of_birth DATE,
    email VARCHAR(255),
    phone_number VARCHAR(15)
)

-- Creation of Teachers Table

CREATE TABLE Teachers (
    teacher_id INT PRIMARY KEY,
    first_name VARCHAR(25),
    last_name VARCHAR(25),
    email VARCHAR(255) UNIQUE
)

-- Creation of Courses Table

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(255),
    credits INT,
    teacher_id INT,
    FOREIGN KEY (teacher_id) REFERENCES Teachers(teacher_id)
)

-- Creation of Payments Table

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    student_id INT,
    amount MONEY,
    payment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
)

-- Creation of Enrollments Table

CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
)
INSERT INTO Students (student_id, first_name, last_name, date_of_birth, email, phone_number)
VALUES
(1, 'Arun', 'Kumar', '2001-05-15', 'arun.kumar@gmail.com', '9876543210'),
(2, 'Priya', 'Ravi', '2000-08-20', 'priya.ravi@gmail.com', '9867543210'),
(3, 'Vignesh', 'Sundar', '2002-01-12', 'vignesh.sundar@gmail.com', '9856543210'),
(4, 'Divya', 'Rajesh', '2001-11-09', 'divya.rajesh@gmail.com', '9846543210'),
(5, 'Karthik', 'Mohan', '2003-04-25', 'karthik.mohan@gmail.com', '9836543210'),
(6, 'Lavanya', 'Selvam', '2002-03-05', 'lavanya.selvam@gmail.com', '9826543210'),
(7, 'Hari', 'Venkatesh', '2000-12-30', 'hari.venkatesh@gmail.com', '9816543210'),
(8, 'Meena', 'Raja', '2001-09-14', 'meena.raja@gmail.com', '9806543210'),
(9, 'Sathish', 'Kumar', '2003-06-18', 'sathish.kumar@gmail.com', '9796543210'),
(10, 'Anitha', 'Murali', '2002-02-22', 'anitha.murali@gmail.com', '9786543210');

INSERT INTO Teachers (teacher_id, first_name, last_name, email)
VALUES
(1, 'Ramesh', 'Subramanian', 'ramesh.subramanian@gmail.com'),
(2, 'Lakshmi', 'Balaji', 'lakshmi.balaji@gmail.com'),
(3, 'Ganesh', 'Varadhan', 'ganesh.varadhan@gmail.com'),
(4, 'Sowmya', 'Krishnan', 'sowmya.krishnan@gmail.com'),
(5, 'Murugan', 'Selvam', 'murugan.selvam@gmail.com'),
(6, 'Padma', 'Sundaram', 'padma.sundaram@gmail.com'),
(7, 'Kannan', 'Venkatesh', 'kannan.venkatesh@gmail.com'),
(8, 'Radha', 'Gopal', 'radha.gopal@gmail.com'),
(9, 'Aravind', 'Shankar', 'aravind.shankar@gmail.com'),
(10, 'Vidhya', 'Ravi', 'vidhya.ravi@gmail.com');

INSERT INTO Courses (course_id, course_name, credits, teacher_id)
VALUES
(1, 'Mathematics', 4, 1),
(2, 'Physics', 3, 2),
(3, 'Chemistry', 3, 3),
(4, 'Computer Science', 4, 4),
(5, 'English Literature', 2, 5),
(6, 'Biology', 3, 6),
(7, 'History', 2, 7),
(8, 'Economics', 3, 8),
(9, 'Tamil Literature', 2, 9),
(10, 'Political Science', 3, 10);
INSERT INTO Payments (payment_id, student_id, amount, payment_date)
VALUES
(1, 1, 15000.00, '2024-01-10'),
(2, 2, 14000.00, '2024-02-12'),
(3, 3, 13500.00, '2024-03-15'),
(4, 4, 16000.00, '2024-01-20'),
(5, 5, 15500.00, '2024-02-25'),
(6, 6, 14500.00, '2024-03-30'),
(7, 7, 13800.00, '2024-01-05'),
(8, 8, 14200.00, '2024-02-18'),
(9, 9, 14900.00, '2024-03-10'),
(10, 10, 15200.00, '2024-04-01');

INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date)
VALUES
(1, 1, 1, '2024-01-05'),
(2, 2, 2, '2024-02-10'),
(3, 3, 3, '2024-03-12'),
(4, 4, 4, '2024-01-18'),
(5, 5, 5, '2024-02-22'),
(6, 6, 6, '2024-03-25'),
(7, 7, 7, '2024-01-08'),
(8, 8, 8, '2024-02-15'),
(9, 9, 9, '2024-03-20'),
(10, 10, 10, '2024-04-05');

select * from Students
select * from Teachers
select * from Payments
select* from Courses
select * from Enrollments

