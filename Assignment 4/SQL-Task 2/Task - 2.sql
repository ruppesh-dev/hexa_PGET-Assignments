-- 1. List all customers

SELECT * FROM Users

-- 2. List all orders for a specific customer

SELECT * FROM Courier
WHERE SenderName = 'Lakshmi'

-- 3. List all couriers.

SELECT * FROM Courier

-- 4. List all packages for a specific order.

SELECT * FROM Courier  
WHERE CourierID = 210

-- 5. List all deliveries for a specific courier.

SELECT * FROM Courier  
WHERE CourierID = 202

-- 6. List all undelivered packages.

SELECT * FROM Courier
WHERE Status = 'Pending'

-- 7. List all packages that are scheduled for delivery today

SELECT * FROM Courier
WHERE DeliveryDate = '2025-03-24'

-- 8. List all packages with a specific status.

SELECT * FROM Courier
WHERE Status = 'Delivered'

-- 9. Calculate the total number of packages for each courier.

SELECT COUNT(*) AS TotalPackages  
FROM Courier  
WHERE SenderName = 'Palanivasan';  -- (specific courier name)

-- 10. Find the average delivery time for each courier.

SELECT c.CourierID, CONCAT(ABS(AVG(DATEDIFF(DAY, c.DeliveryDate, p.PaymentDate))), ' Days') AS "Average Delivery Time"
FROM Courier c
JOIN Payment p
ON c.CourierID = p.CourierID
GROUP BY c.CourierID

-- 11. List all packages with a specific weight range.

SELECT * FROM Courier
WHERE Weight BETWEEN 2.00 AND 5.00

-- 12. Retrieve employees whose names contain 'John'.

SELECT * FROM Employee
WHERE Name = 'John'

-- 13. Retrieve all courier records with payments greater than $50. 

-- Since the amount is in INR, Let's take 1000 rupees. 

SELECT * FROM Payment
WHERE Amount > 1000