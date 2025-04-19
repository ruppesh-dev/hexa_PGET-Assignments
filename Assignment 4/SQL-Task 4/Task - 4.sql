-- Task 4 

-- 23. Retrieve Payments with Courier Information 

SELECT p.*, c.SenderName, c.ReceiverName, c.TrackingNumber  
FROM Payment p  
INNER JOIN Courier c ON p.CourierID = c.CourierID

-- 24. Retrieve Payments with Location Information  

SELECT p.*, l.LocationName, l.Address  
FROM Payment p  
INNER JOIN Location l ON p.LocationID = l.LocationID

-- 25. Retrieve Payments with Courier and Location Information 

SELECT p.*, c.SenderName, c.ReceiverName, l.LocationName  
FROM Payment p  
INNER JOIN Courier c ON p.CourierID = c.CourierID  
INNER JOIN Location l ON p.LocationID = l.LocationID

-- 26. List all payments with courier details  

SELECT p.PaymentID, c.TrackingNumber, c.Status, p.Amount, p.PaymentDate  
FROM Payment p  
INNER JOIN Courier c ON p.CourierID = c.CourierID

-- 27. Total payments received for each courier  

SELECT c.CourierID, c.TrackingNumber, SUM(p.Amount) AS TotalAmount  
FROM Courier c  
LEFT JOIN Payment p ON c.CourierID = p.CourierID  
GROUP BY c.CourierID, c.TrackingNumber

-- 28. List payments made on a specific date  

SELECT * FROM Payment  
WHERE PaymentDate = '2025-04-10'

-- 29. Get Courier Information for Each Payment  

SELECT p.PaymentID, c.*  
FROM Payment p  
INNER JOIN Courier c ON p.CourierID = c.CourierID

-- 30. Get Payment Details with Location  

SELECT p.*, l.LocationName, l.Address  
FROM Payment p  
LEFT JOIN Location l ON p.LocationID = l.LocationID

-- 31. Calculating Total Payments for Each Courier

SELECT CourierID, SUM(Amount) AS TotalPayments  
FROM Payment  
GROUP BY CourierID

-- 32. List Payments Within a Date Range  

SELECT * FROM Payment  
WHERE PaymentDate BETWEEN '2025-04-01' AND '2025-04-15'

-- 33. Retrieve a list of all users and their corresponding courier records, including cases where there are no matches on either side  

SELECT u.*, c.*  
FROM Users u  
FULL OUTER JOIN Courier c ON u.Name = c.SenderName

-- 34. Retrieve a list of all couriers and their corresponding services, including cases where there are no matches on either side  

SELECT c.*, cs.*  
FROM Courier c  
FULL OUTER JOIN CourierServices cs ON c.Weight = cs.Cost / 100

-- 35. Retrieve a list of all employees and their corresponding payments, including cases where there are no matches on either side  

SELECT e.*, p.*  
FROM Employee e  
FULL OUTER JOIN Payment p ON e.EmployeeID = p.PaymentID

-- 36. List all users and all courier services, showing all possible combinations  

SELECT u.Name, cs.ServiceName  
FROM Users u  
CROSS JOIN CourierServices cs

-- 37. List all employees and all locations, showing all possible combinations  

SELECT e.Name, l.LocationName  
FROM Employee e  
CROSS JOIN Location l

-- 38. Retrieve a list of couriers and their corresponding sender information (if available)

SELECT c.CourierID, u.Name AS SenderName, u.Email  
FROM Courier c  
LEFT JOIN Users u ON c.SenderName = u.Name

-- 39. Retrieve a list of couriers and their corresponding receiver information (if available) 

SELECT c.CourierID, u.Name AS ReceiverName, u.Email  
FROM Courier c  
LEFT JOIN Users u ON c.ReceiverName = u.Name

-- 40. Retrieve a list of couriers along with the courier service details (if available)  

SELECT c.*, cs.ServiceName, cs.Cost  
FROM Courier c  
LEFT JOIN CourierServices cs ON c.Weight = cs.Cost / 100

-- 41. Retrieve a list of employees and the number of couriers assigned to each employee  

SELECT e.EmployeeID, e.Name, COUNT(c.CourierID) AS CourierCount  
FROM Employee e  
LEFT JOIN Courier c ON e.EmployeeID = c.CourierID  
GROUP BY e.EmployeeID, e.Name

-- 42. Retrieve a list of locations and the total payment amount received at each location 

SELECT l.LocationID, l.LocationName, SUM(p.Amount) AS TotalAmount  
FROM Location l  
LEFT JOIN Payment p ON l.LocationID = p.LocationID  
GROUP BY l.LocationID, l.LocationName

-- 43. Retrieve all couriers sent by the same sender (based on SenderName) 

SELECT *  
FROM Courier  
WHERE SenderName IN (  
    SELECT SenderName  
    FROM Courier  
    GROUP BY SenderName  
    HAVING COUNT(*) > 1  
)

-- 44. List all employees who share the same role  

SELECT *  
FROM Employee  
WHERE Role IN (  
    SELECT Role  
    FROM Employee  
    GROUP BY Role  
    HAVING COUNT(*) > 1  
)

-- 45. Retrieve all payments made for couriers sent from the same location  

SELECT p.*  
FROM Payment p  
JOIN Courier c ON p.CourierID = c.CourierID  
WHERE c.SenderAddress IN (  
    SELECT SenderAddress  
    FROM Courier  
    GROUP BY SenderAddress  
    HAVING COUNT(*) > 1  
)

-- 46. Retrieve all couriers sent from the same location (based on SenderAddress)  

SELECT *  
FROM Courier  
WHERE SenderAddress IN (  
    SELECT SenderAddress  
    FROM Courier  
    GROUP BY SenderAddress  
    HAVING COUNT(*) > 1  
)

-- 47. List employees and the number of couriers they have delivered 

SELECT e.EmployeeID, e.Name, COUNT(c.CourierID) AS DeliveredCount  
FROM Employee e  
LEFT JOIN Courier c ON e.EmployeeID = c.CourierID  
WHERE c.Status = 'Delivered'  
GROUP BY e.EmployeeID, e.Name

-- 48. Find couriers that were paid an amount greater than the cost of their respective courier services  

SELECT c.*, p.Amount, cs.Cost  
FROM Courier c  
JOIN Payment p ON c.CourierID = p.CourierID  
JOIN CourierServices cs ON c.Weight = cs.Cost / 100  
WHERE p.Amount > cs.Cost

-- 49. Find couriers that have a weight greater than the average weight of all couriers

SELECT *  
FROM Courier  
WHERE Weight > (SELECT AVG(Weight) FROM Courier)

-- 50. Find the names of all employees who have a salary greater than the average salary  

SELECT Name  
FROM Employee  
WHERE Salary > (SELECT AVG(Salary) FROM Employee)

-- 51. Find the total cost of all courier services where the cost is less than the maximum cost  

SELECT SUM(Cost) AS TotalCost  
FROM CourierServices  
WHERE Cost < (SELECT MAX(Cost) FROM CourierServices)

-- 52. Find all couriers that have been paid for  

SELECT DISTINCT c.*  
FROM Courier c  
JOIN Payment p ON c.CourierID = p.CourierID

-- 53. Find the locations where the maximum payment amount was made 

SELECT *  
FROM Location  
WHERE LocationID IN (  
    SELECT LocationID  
    FROM Payment  
    WHERE Amount = (SELECT MAX(Amount) FROM Payment)  
)

-- 54. Find all couriers whose weight is greater than the weight of all couriers sent by a specific sender

SELECT *  
FROM Courier  
WHERE Weight > ALL (  
    SELECT Weight  
    FROM Courier  
    WHERE SenderName = 'Palanivasan'  
)
