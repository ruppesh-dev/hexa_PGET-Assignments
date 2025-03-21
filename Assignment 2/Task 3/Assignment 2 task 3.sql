use SISDB
go
--1. Write an SQL query to calculate the total payments made by a specific student. You will need to join the "Payments" table with the "Students" table based on the student's ID.
select s.student_id ,sum( p.amount) as 'total payment' ,s.first_name+''+s.last_name as 'student name'
from Students s
inner join
Payments p
on s.student_id=p.student_id
where s.student_id=1
group by s.student_id,s.first_name, s.last_name

--2. Write an SQL query to retrieve a list of courses along with the count of students enrolled in each course. Use a JOIN operation between the "Courses" table and the "Enrollments" table.select c.course_name ,count(e.student_id) as 'count of student enrolled' from Courses cjoinEnrollments eon c.course_id=e.course_idgroup by c.course_name--3. Write an SQL query to find the names of students who have not enrolled in any course. Use a LEFT JOIN between the "Students" table and the "Enrollments" table to identify students without enrollments.
select s.first_name+''+s.last_name as 'student name'from Students sleft joinEnrollments eon s.student_id=e.student_idwhere e.enrollment_id is  null--4. Write an SQL query to retrieve the first name, last name of students, and the names of the courses they are enrolled in. Use JOIN operations between the "Students" table and the "Enrollments" and "Courses" tables.select s.first_name+''+s.last_name as 'student name',c.course_namefrom Students sjoinEnrollments eon s.student_id=e.student_idjoin Courses con c.course_id=e.course_idorder by c.course_name desc--5. Create a query to list the names of teachers and the courses they are assigned to. Join the "Teacher" table with the "Courses" table.
select t.first_name+''+t.last_name as 'teachersname',c.course_id,c.course_name
from Teachers t
full join
Courses c
on t.teacher_id=c.teacher_id

--6. Retrieve a list of students and their enrollment dates for a specific course. You'll need to join the "Students" table with the "Enrollments" and "Courses" tables
select s.first_name+''+s.last_name as 'student name',c.course_name,e.enrollment_date
 from Students sjoinEnrollments eon s.student_id=e.student_idjoin Courses con c.course_id=e.course_id

--7. Find the names of students who have not made any payments. Use a LEFT JOIN between the "Students" table and the "Payments" table and filter for students with NULL payment records.
select s.first_name+''+s.last_name as 'student name'from Students sleft joinPayments pon s.student_id=p.student_idwhere amount  is null

--8. Write a query to identify courses that have no enrollments. You'll need to use a LEFT JOIN between the "Courses" table and the "Enrollments" table and filter for courses with NULL enrollment records.
select c.course_name from
courses c
left join
Enrollments e
on c.course_id=e.course_id
where e.enrollment_id is  null

--9. Identify students who are enrolled in more than one course. Use a self-join on the "Enrollments" table to find students with multiple enrollment records.
select s.first_name+''+s.last_name as 'student name', count(e.course_id) as 'count'from students s join enrollments eon s.student_id=e.student_idgroup by s.first_name,s.last_name,s.student_idhaving count(e.course_id)>1--10. Find teachers who are not assigned to any courses. Use a LEFT JOIN between the "Teacher" table and the "Courses" table and filter for teachers with NULL course assignments.select t.first_name+''+t.last_name as 'teachername'
from Teachers t
left join
courses c
on t.teacher_id=c.teacher_id
where c.course_id is null





