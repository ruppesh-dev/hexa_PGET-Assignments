--1. Write a SQL query to Find the average account balance for all customers.
select avg(a.balance), c.first_name+''+c.last_name as 'customer_name'
from customers c
join
accounts a
on c.customer_id=a.customer_id
group by c.first_name,c.last_name

--2. Write a SQL query to Retrieve the top 10 highest account balances.
select top 10 balance from accounts
order by balance desc

--3. Write a SQL query to Calculate Total Deposits for All Customers in specific date.
select sum(amount) as 'total_deposits' from Transactions
where transaction_type='deposit' and transaction_date='2025-03-01'

--4. Write a SQL query to Find the Oldest and Newest Customers.
select top 1 first_name+' '+last_name, dob as 'date of birth' ,'newest' as 'type' FROM customers
order by DOB desc

select top 1 first_name+' '+last_name, dob as 'date of birth','oldest' as 'type' from Customers
order by DOB asc

--5. Write a SQL query to Retrieve transaction details along with the account type.
select t.transaction_id,t.transaction_type,t.transaction_date,t.amount,a.account_type
from Transactions t
join
Accounts a
on t.account_id=a.account_id

--6. Write a SQL query to Get a list of customers along with their account details.
select c.* ,a.* from
Customers c
join
accounts a
on c.customer_id=a.customer_id

--7. Write a SQL query to Retrieve transaction details along with customer information for a specific account.
select t.* , c.* from
Customers c
join
accounts a
on  a.customer_id=c.customer_id
join
Transactions t
on t.account_id=a.account_id

--8. Write a SQL query to Identify customers who have more than one account.
SELECT c.customer_id,c.first_name + ' ' + c.last_name AS customer_name, COUNT(a.account_id) AS account_count
FROM Customers c
INNER JOIN 
Accounts a 
ON c.customer_id = a.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING COUNT(a.account_id) > 1;

--9. Write a SQL query to Calculate the difference in transaction amounts between deposits and withdrawal amount
select
sum(case when transaction_type='deposit' then amount else 0 end)-
sum(case when transaction_type='withdrawal' then amount else 0 end)
from Transactions

--10. Write a SQL query to Calculate the average daily balance for each account over a specified period.
select avg(amount) as 'average daily balance' from Transactions
where transaction_date between '2025-03-01' and '2025-03-10'
group by account_id

--11. Calculate the total balance for each account type.
select sum(balance) as 'total_balance', account_type from Accounts
group by account_type

--12. Identify accounts with the highest number of transactions order by descending order.
select count(t.transaction_id) as highest_no_of_transaction , a.account_id 
from accounts a
join
transactions t
on t.account_id=a.account_id
group by a.account_id
order by highest_no_of_transaction desc

--13. List customers with high aggregate account balances, along with their account types.
SELECT c.customer_id, c.first_name + ' ' + c.last_name AS customer_name, SUM(a.balance) AS total_balance
FROM Customers c
JOIN 
Accounts a
ON c.customer_id = a.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING SUM(a.balance) > 50000; 

--14. Identify and list duplicate transactions based on transaction amount, date, and account
select count(transaction_id)as duplicate_count , transaction_type, transaction_date,account_id,amount from Transactions
GROUP BY account_id, amount, transaction_date,transaction_type
HAVING COUNT(transaction_id) > 1;
