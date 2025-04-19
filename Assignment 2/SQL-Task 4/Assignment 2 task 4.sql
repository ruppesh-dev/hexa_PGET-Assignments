--1. Write an SQL query to calculate the average number of students enrolled in each course. Use aggregate functions and subqueries to achieve this.
SELECT course_id, AVG(Count) AS [Average number of students]
FROM ( SELECT course_id, COUNT(student_id) AS Count
       FROM Enrollments
       GROUP BY course_id ) AS Courses
GROUP BY course_id

--2. Identify the student(s) who made the highest payment. Use a subquery to find the maximum payment amount and then retrieve the student(s) associated with that amount.
select first_name+' '+ last_name as student_name
from Students
where student_id in(select  student_id from Payments
                    where amount =(select max(amount) from Payments))

--3. Retrieve a list of courses with the highest number of enrollments. Use subqueries to find the course(s) with the maximum enrollment count.
select course_name from Courses
where course_id in(select course_id from Enrollments
                   group by course_id
				   having count(enrollment_id)=
				   (select max(course_count) from 
				   (select count(enrollment_id)as course_count from Enrollments group by course_id) as course_counts))
--4. Calculate the total payments made to courses taught by each teacher. Use subqueries to sum payments for each teacher's courses.
select t.teacher_id, t.first_name + ' ' +  t.last_name AS teacher_name,
( select sum(p.amount) from Payments p
where p.student_id in(select e.student_id from Enrollments e
                      where e.course_id in(select c.course_id from Courses c
					                       where c.teacher_id=t.teacher_id)))as total_payments from teachers t

                    
--5. Identify students who are enrolled in all available courses. Use subqueries to compare a student's enrollments with the total number of courses.
SELECT 
    s.first_name + ' ' + s.last_name AS student_name
FROM 
    Students s
WHERE 
    (
        SELECT 
            COUNT(DISTINCT e.course_id)
        FROM 
            Enrollments e
        WHERE 
            e.student_id = s.student_id
    ) = (
        SELECT 
            COUNT(course_id)
        FROM 
            Courses
    );

--6. Retrieve the names of teachers who have not been assigned to any courses. Use subqueries to find teachers with no course assignments.
select 
    t.teacher_id, 
    t.first_name + ' ' + t.last_name as teacher_name
from 
    teachers t
where 
    t.teacher_id not in (
        select 
            distinct c.teacher_id
        from 
            courses c
    );


--7. Calculate the average age of all students. Use subqueries to calculate the age of each student based on their date of birth.
select 
    avg(datediff(year, s.date_of_birth, getdate())) as average_age
from 
    students s;

--8. Identify courses with no enrollments. Use subqueries to find courses without enrollment records.
select 
    c.course_id, 
    c.course_name
from 
    courses c
where 
    c.course_id not in (
        select 
            distinct e.course_id
        from 
            enrollments e
    );

--9. Calculate the total payments made by each student for each course they are enrolled in. Use subqueries and aggregate functions to sum payments.
select 
    e.student_id, 
    e.course_id,
    (
        select 
            sum(p.amount)
        from 
            payments p
        where 
            p.student_id = e.student_id
    ) as total_payments
from 
    enrollments e
group by 
    e.student_id, e.course_id;

--10. Identify students who have made more than one payment. Use subqueries and aggregate functions to count payments per student and filter for those with counts greater than one.
select 
    s.student_id, 
    s.first_name + ' ' + s.last_name as student_name
from 
    students s
where 
    (
        select 
            count(p.payment_id)
        from 
            payments p
        where 
            p.student_id = s.student_id
    ) > 1;

--11. Write an SQL query to calculate the total payments made by each student. Join the "Students" table with the "Payments" table and use GROUP BY to calculate the sum of payments for each student.
select 
    s.student_id, 
    s.first_name + ' ' + s.last_name as student_name,
    sum(p.amount) as total_payments
from 
    students s
join 
    payments p
on 
    s.student_id = p.student_id
group by 
    s.student_id, s.first_name, s.last_name;


--12. Retrieve a list of course names along with the count of students enrolled in each course. Use JOIN operations between the "Courses" table and the "Enrollments" table and GROUP BY to count enrollments.
select 
    c.course_name, 
    count(e.student_id) as student_count
from 
    courses c
left join 
    enrollments e
on 
    c.course_id = e.course_id
group by 
    c.course_name;

--13. Calculate the average payment amount made by students. Use JOIN operations between the "Students" table and the "Payments" table and GROUP BY to calculate the average.
select 
    s.student_id, 
    s.first_name + ' ' + s.last_name as student_name,
    avg(p.amount) as average_payment
from 
    students s
join 
    payments p
on 
    s.student_id = p.student_id
group by 
    s.student_id, s.first_name, s.last_name;
