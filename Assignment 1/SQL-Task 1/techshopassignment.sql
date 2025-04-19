use TechShop
go

create table Customers(
CustomerID int primary key identity,
FirstName varchar(25),
LastName varchar(25),
Email varchar(50),
Phone bigint,
Address varchar(250)
);

create table Products(
ProductID int Primary Key identity,
ProductName varchar(50),
Description varchar(250),
Price decimal (10,2)
);

create table Orders(
OrderID int Primary Key identity,
CustomerID int,
OrderDate datetime, 
TotalAmount decimal (10,2),
Constraint fk_custid Foreign Key (CustomerID) references Customers(CustomerID) on delete cascade
);

create table OrderDetails(
OrderDetailsID int primary key identity,
OrderID int,
ProductID int,
Quantity int,
constraint fk_orderid foreign key(OrderID) references Orders(OrderID) on delete cascade,
constraint fk_productid foreign key(ProductID) references products(ProductID) 
);

create table Inventory(
InventoryID int Primary Key identity,
ProductID int ,
QuantityInStock int,
LastStockUpdate datetime,
constraint fk_productid_inventory foreign key(ProductID) references products(ProductID) 
);

INSERT INTO Customers (FirstName, LastName, Email, Phone, Address) VALUES
('Arun', 'Kumar', 'arun.kumar@gmail.com', 9876543210, 'T.Nagar, Chennai'),
('Priya', 'Subramanian', 'priya.s@gmail.com', 9845123456, 'Gandhipuram, Coimbatore'),
('Venkatesh', 'Iyer', 'venkatesh.iyer@yahoo.com', 9963254789, 'Simmakal, Madurai'),
('Lakshmi', 'Narayanan', 'lakshmi.n@gmail.com', 9785632147, 'RS Puram, Coimbatore'),
('Karthik', 'Raja', 'karthik.raja@gmail.com', 9898765432, 'Anna Nagar, Chennai'),
('Meena', 'Sundaram', 'meena.s@gmail.com', 9847032165, 'Kumarakom, Kanyakumari'),
('Ravi', 'Chandran', 'ravi.chandran@yahoo.com', 9967543128, 'Thillai Nagar, Trichy'),
('Divya', 'Krishnan', 'divya.krishnan@gmail.com', 9784512369, 'Vadapalani, Chennai'),
('Suresh', 'P', 'suresh.p@gmail.com', 9876312450, 'Ramanathapuram, Coimbatore'),
('Anjali', 'Devi', 'anjali.devi@gmail.com', 9895412367, 'KK Nagar, Trichy');

INSERT INTO Products (ProductName, Description, Price) VALUES
('Kanchipuram Silk Saree', 'Traditional silk saree from Kanchipuram', 7500.00),
('Madurai Jasmine', 'Fragrant jasmine flowers from Madurai', 200.00),
('Tanjore Painting', 'Handmade Tanjore painting with gold foil', 12500.00),
('Coimbatore Wet Grinder', 'High-quality wet grinder from Coimbatore', 4500.00),
('Tirunelveli Halwa', 'Famous wheat halwa from Tirunelveli', 350.00),
('Chettinad Pepper Chicken Masala', 'Spicy Chettinad-style chicken masala', 250.00),
('Ooty Homemade Chocolates', 'Delicious chocolates from Ooty', 500.00),
('Thanjavur Brass Lamp', 'Traditional brass lamp from Thanjavur', 1800.00),
('Pongal Mix', 'Ready-to-cook sweet Pongal mix', 150.00),
('Kumbakonam Degree Coffee Powder', 'Authentic filter coffee powder', 600.00);

INSERT INTO Orders (CustomerID, OrderDate, TotalAmount) VALUES
(1, '2024-03-01', 8000.00),
(2, '2024-03-02', 1200.00),
(3, '2024-03-03', 14500.00),
(4, '2024-03-04', 5500.00),
(5, '2024-03-05', 450.00),
(6, '2024-03-06', 280.00),
(7, '2024-03-07', 2200.00),
(8, '2024-03-08', 9500.00),
(9, '2024-03-09', 6200.00),
(10, '2024-03-10', 3500.00);


INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES
(1, 1, 1),
(1, 5, 2), 
(2, 7, 3), 
(3, 3, 1), 
(4, 4, 1),
(5, 6, 2), 
(6, 2, 5), 
(7, 8, 1), 
(8, 9, 3),
(9, 10, 2);

INSERT INTO Inventory (ProductID, QuantityInStock, LastStockUpdate) VALUES
(1, 15, '2024-03-01'),
(2, 50, '2024-03-02'),
(3, 10, '2024-03-03'),
(4, 20, '2024-03-04'),
(5, 100, '2024-03-05'),
(6, 60, '2024-03-06'),
(7, 80, '2024-03-07'),
(8, 25, '2024-03-08'),
(9, 40, '2024-03-09'),   
(10, 30, '2024-03-10');




