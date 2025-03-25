-- 1. Retrieve the customer(s) with the highest account balance. 

SELECT * FROM Customers
WHERE customer_id IN (SELECT customer_id
                       FROM Accounts
					   WHERE balance = ( SELECT MAX(balance) FROM Accounts))

-- 2. Calculate the average account balance for customers who have more than one account. 

SELECT customer_id, AVG(balance) AS 'Average Account Balance'
FROM Accounts
GROUP BY customer_id
HAVING COUNT(account_id) > 1

-- 3. Retrieve accounts with transactions whose amounts exceed the average transaction amount. 

SELECT * FROM Transactions
WHERE amount > (SELECT AVG(amount) FROM Transactions)

-- 4. Identify customers who have no recorded transactions. 

SELECT * from Accounts a
LEFT JOIN Transactions t
ON a.account_id = t.account_id
WHERE t.transaction_id IS NULL

-- 5. Calculate the total balance of accounts with no recorded transactions. 

SELECT SUM(a.balance) AS 'Total Balance'
from Accounts a
LEFT JOIN Transactions t
ON a.account_id = t.account_id
WHERE t.transaction_id IS NULL

-- 6. Retrieve transactions for accounts with the lowest balance.

SELECT * FROM Transactions
WHERE account_id IN (SELECT account_id FROM Accounts
                     WHERE balance IN (SELECT MIN(balance) FROM Accounts))

-- 7. Identify customers who have accounts of multiple types. 

SELECT customer_id
FROM Accounts
GROUP BY customer_id
HAVING COUNT(DISTINCT account_type) > 1

-- 8. Calculate the percentage of each account type out of the total number of accounts. 

SELECT account_type, (COUNT(account_type) * 100.0 ) / (SELECT COUNT(*) FROM Accounts) AS Percentage
FROM Accounts
GROUP BY account_type

-- 9. Retrieve all transactions for a customer with a given customer_id. 

SELECT * FROM Transactions
WHERE account_id IN (SELECT account_id FROM Accounts
                    WHERE customer_id = 8)

-- 10. Calculate the total balance for each account type, including a subquery within the SELECT clause. 

SELECT account_type, (SELECT SUM(balance) FROM Accounts a2 WHERE a2.account_type = a1.account_type) AS total_balance
FROM Accounts a1
GROUP BY account_type