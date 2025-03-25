CREATE DATABASE CMS_DB

USE CMS_DB



CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    Name VARCHAR(255),
    Email VARCHAR(255) UNIQUE,
    Password VARCHAR(255),
    ContactNumber VARCHAR(20),
    Address TEXT
);


CREATE TABLE Courier (
    CourierID INT PRIMARY KEY,
    SenderName VARCHAR(255),
    SenderAddress TEXT,
    ReceiverName VARCHAR(255),
    ReceiverAddress TEXT,
    Weight DECIMAL(5, 2),
    Status VARCHAR(50),
    TrackingNumber VARCHAR(20) UNIQUE,
    DeliveryDate DATE
);




CREATE TABLE CourierServices (
    ServiceID INT PRIMARY KEY,
    ServiceName VARCHAR(100),
    Cost DECIMAL(8, 2)
);


CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(255),
    Email VARCHAR(255) UNIQUE,
    ContactNumber VARCHAR(20),
    Role VARCHAR(50),
    Salary DECIMAL(10, 2)
);


CREATE TABLE Location (
    LocationID INT PRIMARY KEY,
    LocationName VARCHAR(100),
    Address TEXT
);


CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY,
    CourierID INT,
    LocationID INT,
    Amount DECIMAL(10, 2),
    PaymentDate DATE,
    FOREIGN KEY (CourierID) REFERENCES Courier(CourierID),
    FOREIGN KEY (LocationID) REFERENCES Location(LocationID)
);

-- User Table
INSERT INTO Users (UserID, Name, Email, Password, ContactNumber, Address)
VALUES
(1, 'Karthik Raja', 'karthik@example.com', 'pass123', '9876543210', 'Chennai, TN'),
(2, 'Vikram Kumar', 'vikram@example.com', 'vikram456', '8765432109', 'Coimbatore, TN'),
(3, 'Arun Prasad', 'arun@example.com', 'arun789', '7654321098', 'Madurai, TN'),
(4, 'Sundar Vel', 'sundar@example.com', 'sundar123', '6543210987', 'Salem, TN'),
(5, 'Priya Suresh', 'priya@example.com', 'priya456', '5432109876', 'Trichy, TN'),
(6, 'Deepak Raja', 'deepak@example.com', 'deepak789', '4321098765', 'Tirunelveli, TN'),
(7, 'Bala Murugan', 'bala@example.com', 'bala123', '3210987654', 'Erode, TN'),
(8, 'Mohan Kumar', 'mohan@example.com', 'mohan456', '2109876543', 'Vellore, TN'),
(9, 'Swetha Lakshmi', 'swetha@example.com', 'swetha789', '1098765432', 'Kanchipuram, TN'),
(10, 'Ramesh Iyer', 'ramesh@example.com', 'ramesh123', '1987654321', 'Tanjore, TN');

-- Courier Table
INSERT INTO Courier (CourierID, SenderName, SenderAddress, ReceiverName, ReceiverAddress, Weight, Status, TrackingNumber, DeliveryDate)
VALUES
(1, 'Karthik Raja', 'Chennai, TN', 'Vikram Kumar', 'Coimbatore, TN', 3.50, 'Delivered', 'TRK123001', '2025-03-10'),
(2, 'Vikram Kumar', 'Coimbatore, TN', 'Arun Prasad', 'Madurai, TN', 2.00, 'In Transit', 'TRK123002', '2025-03-12'),
(3, 'Arun Prasad', 'Madurai, TN', 'Sundar Vel', 'Salem, TN', 1.75, 'Pending', 'TRK123003', '2025-03-15'),
(4, 'Sundar Vel', 'Salem, TN', 'Priya Suresh', 'Trichy, TN', 5.00, 'Delivered', 'TRK123004', '2025-03-18'),
(5, 'Priya Suresh', 'Trichy, TN', 'Deepak Raja', 'Tirunelveli, TN', 2.25, 'Pending', 'TRK123005', '2025-03-20'),
(6, 'Deepak Raja', 'Tirunelveli, TN', 'Bala Murugan', 'Erode, TN', 3.00, 'In Transit', 'TRK123006', '2025-03-21'),
(7, 'Bala Murugan', 'Erode, TN', 'Mohan Kumar', 'Vellore, TN', 1.50, 'Delivered', 'TRK123007', '2025-03-22'),
(8, 'Mohan Kumar', 'Vellore, TN', 'Swetha Lakshmi', 'Kanchipuram, TN', 4.00, 'In Transit', 'TRK123008', '2025-03-23'),
(9, 'Swetha Lakshmi', 'Kanchipuram, TN', 'Ramesh Iyer', 'Tanjore, TN', 2.75, 'Delivered', 'TRK123009', '2025-03-24'),
(10, 'Ramesh Iyer', 'Tanjore, TN', 'Karthik Raja', 'Chennai, TN', 3.10, 'Pending', 'TRK123010', '2025-03-25');

-- CourierServices Table
INSERT INTO CourierServices (ServiceID, ServiceName, Cost)
VALUES
(1, 'Thani Oruvan Delivery', 12.00),
(2, 'Express Kaalai Vandi', 25.00),
(3, 'Overnight Natchathiram', 50.00),
(4, 'Regular Parotta Service', 15.00),
(5, 'Speed Kuthirai Express', 30.00),
(6, 'Sundhari Mega Parcel', 45.00),
(7, 'Namba Delivery', 20.00),
(8, 'Anbu Courier', 18.00),
(9, 'Vetri Delivery', 22.00),
(10, 'Flash Delivery', 35.00);

-- Employee Table
INSERT INTO Employee (EmployeeID, Name, Email, ContactNumber, Role, Salary)
VALUES
(1, 'Rajan', 'rajan@courier.com', '9876543210', 'Manager', 60000.00),
(2, 'Murugan', 'murugan@courier.com', '8765432109', 'Delivery Agent', 35000.00),
(3, 'Lakshmi', 'lakshmi@courier.com', '7654321098', 'Customer Service', 32000.00),
(4, 'Muthu', 'muthu@courier.com', '6543210987', 'Supervisor', 45000.00),
(5, 'Selvi', 'selvi@courier.com', '5432109876', 'Dispatcher', 30000.00),
(6, 'Ganesh', 'ganesh@courier.com', '4321098765', 'Field Agent', 28000.00),
(7, 'Meena', 'meena@courier.com', '3210987654', 'Office Admin', 26000.00),
(8, 'Saravanan', 'saravanan@courier.com', '2109876543', 'Technician', 29000.00),
(9, 'Kavitha', 'kavitha@courier.com', '1098765432', 'HR', 31000.00),
(10, 'Karthikeyan', 'karthikeyan@courier.com', '1987654321', 'Accountant', 34000.00);

-- Location Table
INSERT INTO Location (LocationID, LocationName, Address)
VALUES
(1, 'Chennai Hub', 'Anna Salai, Chennai'),
(2, 'Coimbatore Hub', 'Avinashi Rd, Coimbatore'),
(3, 'Madurai Hub', 'Alagarkoil Rd, Madurai'),
(4, 'Salem Hub', 'Omalur Rd, Salem'),
(5, 'Trichy Hub', 'Thillai Nagar, Trichy'),
(6, 'Tirunelveli Hub', 'Palayamkottai, Tirunelveli'),
(7, 'Erode Hub', 'Perundurai Rd, Erode'),
(8, 'Vellore Hub', 'Katpadi Rd, Vellore'),
(9, 'Kanchipuram Hub', 'Varadharaja St, Kanchipuram'),
(10, 'Tanjore Hub', 'Big Temple Rd, Tanjore');

-- Payment Table
INSERT INTO Payment (PaymentID, CourierID, LocationID, Amount, PaymentDate)
VALUES
(1, 1, 1, 12.00, '2025-03-10'),
(2, 2, 2, 25.00, '2025-03-12'),
(3, 3, 3, 15.00, '2025-03-15'),
(4, 4, 4, 20.00, '2025-03-18'),
(5, 5, 5, 18.00, '2025-03-20'),
(6, 6, 6, 22.00, '2025-03-21'),
(7, 7, 7, 19.00, '2025-03-22'),
(8, 8, 8, 25.00, '2025-03-23'),
(9, 9, 9, 23.00, '2025-03-24'),
(10, 10, 10, 30.00, '2025-03-25');


