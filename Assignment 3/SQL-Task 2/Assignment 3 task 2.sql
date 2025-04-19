use HMBank
go
--1. Write a SQL query to retrieve the name, account type and email of all customers.
select c.first_name+''+c.last_name as 'Name', a.account_type, c.email 
from customers c
full join
accounts a
on c.customer_id=a.customer_id

--2. Write a SQL query to list all transaction corresponding customer.
select c.first_name+''+c.last_name as 'Name' , t.transaction_id, t.transaction_type,t.amount,t.transaction_date 
from customers c
full join
accounts a
on c.customer_id=a.customer_id
join
transactions t
on t.account_id=a.account_id

--3. Write a SQL query to increase the balance of a specific account by a certain amount.
select * from Accounts
update Accounts
set balance =balance+5000
where customer_id=3

--4. Write a SQL query to Combine first and last names of customers as a full_name
select first_name+''+last_name as 'full_name' from Customers

--5. Write a SQL query to remove accounts with a balance of zero where the account type is savings.
delete Accounts
where balance=0 and account_type='savings'

--6. Write a SQL query to Find customers living in a specific city.
select * from customers
where address='Chennai, Tamil Nadu'

--7. Write a SQL query to Get the account balance for a specific account.
select balance from accounts
where account_id=2

--8. Write a SQL query to List all current accounts with a balance greater than $1,000.
select * from accounts
where  account_type='current' and balance>1000

--9. Write a SQL query to Retrieve all transactions for a specific account.
select *   from Transactions
where amount >5000

--10. Write a SQL query to Calculate the interest accrued on savings accounts based on a given interest rate.
declare @intrestrate float =0.05
select balance as 'current_balance' , customer_id ,
 balance+(balance * @intrestrate) as ' new_intrest_balance'
from accounts
where account_type='savings'


--11. Write a SQL query to Identify accounts where the balance is less than a specifiedoverdraft limit.
select * from accounts
where balance < 5000

--12. Write a SQL query to Find customers not living in a specific city.
select * from Customers
where address <> 'Chennai, Tamil Nadu'