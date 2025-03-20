use TechShop

--1. Write an SQL query to retrieve the names and emails of all customers.
select firstname,lastname,email from Customers

--2. Write an SQL query to list all orders with their order dates and corresponding customer names.
 SELECT OrderID, OrderDate, FirstName, LastName
  FROM Orders, CUSTOMERS
  WHERE Orders.CustomerID = CUSTOMERS.CustomerID

--3. Write an SQL query to insert a new customer record into the "Customers" table. Include customer information such as name, email, and address.
INSERT INTO Customers (FirstName, LastName, Email, Phone, Address) 
VALUES ('kavin', 'lawrence', 'kavin.lawrence@email.com', '9876543210', '567 kodambakkam');

--4. Write an SQL query to update the prices of all electronic gadgets in the "Products" table by increasing them by 10%.
UPDATE Products SET Price = Price * 1.10;
select * from Products

--5. Write an SQL query to delete a specific order and its associated order details from the "Orders" and "OrderDetails" tables. Allow users to input the order ID as a parameter.
delete from Order where OrderID=1

--6. Write an SQL query to insert a new order into the "Orders" table. Include the customer ID, order date, and any other necessary information.
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount) VALUES (1, 08-03-2021, 250.00);

--7. Write an SQL query to update the contact information (e.g., email and address) of a specific customer in the "Customers" table. Allow users to input the customer ID and new contact information.
select* from Customers
update  customers 
set email ='arun@gmail.com' ,phone =6783999992
where customerid=1

--8. Write an SQL query to recalculate and update the total cost of each order in the "Orders" table based on the prices and quantities in the "OrderDetails" table.
update orders
set totalamount=(
select sum(o.quantity*p.price)
from OrderDetails o
join products p on o.ProductID=p.ProductID
where o.orderid=Orders.orderid
)
select * from Orders

--9. Write an SQL query to delete all orders and their associated order details for a specific customer from the "Orders" and "OrderDetails" tables. Allow users to input the customer ID as a parameter.
DELETE FROM OrderDetails
WHERE OrderID IN (SELECT OrderID FROM Orders WHERE CustomerID = 2);
DELETE FROM Orders
WHERE CustomerID =1;

--10. Write an SQL query to insert a new electronic gadget product into the "Products" table, including product name, category, price, and any other relevant details.
  select * from Products
  INSERT INTO Products ( ProductName, Description, Price)
  VALUES ( 'nokia 6g mobile', 'high bandwidth with snapdragon gen 11', 99999.00)

--11. Write an SQL query to update the status of a specific order in the "Orders" table (e.g., from "Pending" to "Shipped"). Allow users to input the order ID and the new status.
 ALTER TABLE Orders
  ADD Status Varchar(15) not null DEFAULT 'Pending'

  UPDATE Orders
  SET Status = 'Shipped'   
  WHERE OrderID = 3

--12. Write an SQL query to calculate and update the number of orders placed by each customer in the "Customers" table based on the data in the "Orders" table.
 ALTER TABLE Customers
  ADD NumberOfOrders INT DEFAULT 0;
  
  select * from Customers

  UPDATE Customers
  SET NumberOfOrders = (
    SELECT COUNT(*)
    FROM Orders
    WHERE Orders.CustomerID = Customers.CustomerID
  )