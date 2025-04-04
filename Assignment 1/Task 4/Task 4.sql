use TechShop
go
--task 4 (assignment 1)
-- 1 Write an SQL query to find out which customers have not placed any orders.
select * from dbo.customers c
 where c.CustomerID not in(select customerid from orders where CustomerID is not null)

 -- 2. Write an SQL query to find the total number of products available for sale. 
select sum(quantityinstock) as 'total number of product available for sale' from dbo.Inventory

select p.productname, i.quantityinstock, p.price 
from
dbo.Products p
inner join
dbo.Inventory i
on p.productid=i.ProductID

--3. Write an SQL query to calculate the total revenue generated by TechShop. 
select sum(od.quantity * p.price) as 'totalrevenue' from
dbo.Products p
inner join
dbo.OrderDetails od
on p.ProductID=od.ProductID

Select p.ProductName, od.Quantity * p.Price AS 'Revenue for Each Product'
FROM Products p
JOIN OrderDetails od
ON p.ProductID = od.ProductID

 --Write an SQL query to calculate the average quantity ordered for products in a specific category. Allow users to input the category name as a parameter.
 DECLARE @CategoryName VARCHAR(50) = 'E-Gadgets';

SELECT AVG(od.Quantity) AS AvgQuantityOrdered
FROM dbo.OrderDetails od
WHERE od.ProductID IN (
    SELECT p.ProductID
    FROM dbo.Products p
    WHERE p.Categories LIKE '%' + @CategoryName + '%'
)
--Write an SQL query to calculate the total revenue generated by a specific customer. Allow users to input the customer ID as a parameter.
Declare @customerid int =5
select sum(o.totalamount) as 'total revenue'
from dbo.orders o
 where o.CustomerID= @customerid

 --6. Write an SQL query to find the customers who have placed the most orders. List their names and the number of orders they've placed.
select top 1 with ties
 c.firstname+''+c.lastname as 'customer Name',
 count(o.orderid) as 'no of orders'
 from dbo.orders o
 join
 dbo.customers c
 on c.customerid=o.customerid
 group by c.customerid, c.firstname,c.lastname
 order by count(o.orderid) desc

 --7. Write an SQL query to find the most popular product category, which is the one with the highest total quantity ordered across all orders. select top 1 with ties sum (o.quantity) as'highest total quantity', p.categories from dbo.OrderDetails o join dbo.Products p on o.ProductID=p.ProductID group by p.Categories order by sum(o.quantity)--8 Write an SQL query to find the customer who has spent the most money (highest total revenue) on electronic gadgets. List their name and total spending.select top 1 with ties c.firstname+''+c.lastname as'customer name', sum(od.Quantity *p.Price) as 'total spending'from dbo.Customers cjoindbo.Orders oon c.CustomerID=o.CustomerIDjoin dbo.OrderDetails odon od.OrderID=o.OrderIDjoin dbo.Products pon p.ProductID=od.ProductIDgroup by c.CustomerID,c.FirstName,c.LastNameorder by sum(od.quantity*p.price) desc--9. Write an SQL query to calculate the average order value (total revenue divided by the number of orders) for all customers.SELECT  c.FirstName + ' ' + c.LastName AS 'Customer Name',
    AVG(o.TotalAmount) AS 'Average Order Value'
FROM dbo.Customers c
JOIN dbo.Orders o 
    ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName
ORDER BY AVG(o.TotalAmount) DESC;

--10. Write an SQL query to find the total number of orders placed by each customer and list their names along with the order count.
SELECT  c.FirstName + ' ' + c.LastName AS 'Customer Name', count(o.OrderID) as'total num of orders'
from dbo.Customers c
  full join
dbo.Orders o
on c.CustomerID=o.CustomerID
group by c.CustomerID,c.FirstName,c.LastName 
order by count(o.orderid) desc

SELECT  FirstName + ' ' + LastName AS 'Customer Name', numberoforders as 'total num of orders'
from dbo.Customers
order by 'total num of orders' desc-- since i have created no of order table manually