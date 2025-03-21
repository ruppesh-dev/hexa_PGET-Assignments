use SISDB
go
--1. Write an SQL query to insert a new student into the "Students" table with the following details:insert into Students (student_id, first_name, last_name, date_of_birth, email, phone_number)
VALUES( 11,'John',' Doe', '1995-08-15', 'john.doe@example.com','1234567890')--2. Write an SQL query to enroll a student in a course. Choose an existing student and course and insert a record into the "Enrollments" table with the enrollment dateINSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date)
VALUES
(11, 11, 1, '2025-03-21');

--3. Update the email address of a specific teacher in the "Teacher" table. Choose any teacher and modify their email address.update teachers set email = 'subramaniramesh@gmail.com'where teacher_id =1--4. Write an SQL query to delete a specific enrollment record from the "Enrollments" table. Select an enrollment record based on the student and coursedelete Enrollmentswhere student_id=11 and course_id=1--5. Update the "Courses" table to assign a specific teacher to a course. Choose any course and teacher from the respective tables.update Coursesset teacher_id=10where course_name='history'--6. Delete a specific student from the "Students" table and remove all their enrollment records from the "Enrollments" table. Be sure to maintain referential integrity.
delete Students
where student_id=11
delete Enrollments
where student_id=11
select * from students
select * from Enrollments

--7. Update the payment amount for a specific payment record in the "Payments" table. Choose any payment record and modify the payment amount.
update Payments
set amount='15500'
where student_id=1

select* from Payments
