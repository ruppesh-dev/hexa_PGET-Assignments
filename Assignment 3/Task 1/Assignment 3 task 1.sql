create database HMBank
go

CREATE TABLE Customers (
    customer_id INT IDENTITY(1,1) PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    DOB DATE,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(10) UNIQUE NOT NULL,
    address VARCHAR(255)
)
CREATE TABLE Accounts (
    account_id INT IDENTITY(1,1) PRIMARY KEY,
    customer_id INT NOT NULL,
    balance MONEY,
    account_type VARCHAR(20) NOT NULL CHECK(ACCOUNT_TYPE IN ('savings', 'current', 'zero_balance'))
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON DELETE CASCADE
)
CREATE TABLE Transactions(
 transaction_id iNT IDENTITY(1,1) Primary Key,
 account_id INT NOT NULL,
 transaction_type VARCHAR(25)CHECK(transaction_type IN ('deposit', 'withdrawal', 'transfer')),
 amount MONEY NOT NULL CHECK(AMOUNT >0),
 transaction_date DATE DEFAULT GETDATE(),     FOREIGN KEY (account_id) REFERENCES Accounts(account_id) ON DELETE CASCADE
)

INSERT INTO Customers (first_name, last_name, DOB, email, phone_number, address)
VALUES
('Arun', 'Kumar', '1992-06-15', 'arun.kumar@gmail.com', '9876543210', 'Chennai, Tamil Nadu'),
('Priya', 'Ravi', '1995-02-10', 'priya.ravi@yahoo.com', '9876543211', 'Madurai, Tamil Nadu'),
('Suresh', 'Venkatesh', '1990-08-25', 'suresh.venkat@gmail.com', '9876543212', 'Coimbatore, Tamil Nadu'),
('Divya', 'Balaji', '1998-12-12', 'divya.balaji@hotmail.com', '9876543213', 'Trichy, Tamil Nadu'),
('Karthik', 'Mohan', '1993-05-20', 'karthik.mohan@gmail.com', '9876543214', 'Salem, Tamil Nadu'),
('Meena', 'Sivakumar', '1996-04-18', 'meena.siva@yahoo.com', '9876543215', 'Erode, Tamil Nadu'),
('Vijay', 'Kannan', '1991-09-05', 'vijay.kannan@gmail.com', '9876543216', 'Tirunelveli, Tamil Nadu'),
('Lakshmi', 'Murugan', '1994-07-14', 'lakshmi.murugan@gmail.com', '9876543217', 'Vellore, Tamil Nadu'),
('Ganesh', 'Raj', '1997-03-09', 'ganesh.raj@gmail.com', '9876543218', 'Kanyakumari, Tamil Nadu'),
('Anitha', 'Selvam', '1999-11-30', 'anitha.selvam@gmail.com', '9876543219', 'Dindigul, Tamil Nadu')

INSERT INTO Accounts (customer_id, balance, account_type)
VALUES
(1, 50000, 'savings'),
(2, 150000, 'current'),
(3, 30000, 'savings'),
(4, 80000, 'current'),
(5, 0, 'zero_balance'),
(6, 20000, 'savings'),
(7, 100000, 'current'),
(8, 0, 'zero_balance'),
(9, 25000, 'savings'),
(10, 70000, 'current')

INSERT INTO Transactions (account_id, transaction_type, amount, transaction_date)
VALUES
(1, 'deposit', 10000, '2025-03-01'),
(2, 'withdrawal', 5000, '2025-03-05'),
(3, 'deposit', 15000, '2025-03-10'),
(4, 'transfer', 20000, '2025-03-12'),
(5, 'deposit', 5000, '2025-03-15'),
(6, 'withdrawal', 3000, '2025-03-18'),
(7, 'deposit', 40000, '2025-03-20'),
(8, 'transfer', 2500, '2025-03-22'),
(9, 'withdrawal', 10000, '2025-03-25'),
(10, 'deposit', 30000, '2025-03-28')

select * from Transactions
select * from Customers
select * from Accounts