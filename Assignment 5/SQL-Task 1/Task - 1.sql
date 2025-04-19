CREATE DATABASE TicketBookingSystem

USE TicketBookingSystem

-- Table Creation - Venue
CREATE TABLE Venue (
    venue_id INT PRIMARY KEY IDENTITY(1,1),
    venue_name NVARCHAR(100) NOT NULL,
    address NVARCHAR(255) NOT NULL
)

-- Table Creation - Event
CREATE TABLE Event (
    event_id INT PRIMARY KEY IDENTITY(1,1),
    event_name NVARCHAR(100) NOT NULL,
    event_date DATE NOT NULL,
    event_time TIME NOT NULL,
    venue_id INT NOT NULL,
    total_seats INT NOT NULL,
    available_seats INT NOT NULL,
    ticket_price DECIMAL(10,2) NOT NULL,
    event_type NVARCHAR(50) CHECK (event_type IN ('Movie', 'Sports', 'Concert')),
    CONSTRAINT FK_Event_Venue FOREIGN KEY (venue_id) REFERENCES Venue(venue_id)
)

-- Table Creation - Customer
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY IDENTITY(1,1),
    customer_name NVARCHAR(100) NOT NULL,
    email NVARCHAR(100) NOT NULL UNIQUE,
    phone_number NVARCHAR(15) NOT NULL
)

-- Table Creation - Booking
CREATE TABLE Booking (
    booking_id INT PRIMARY KEY IDENTITY(1,1),
    customer_id INT NOT NULL,
    event_id INT NOT NULL,
    num_tickets INT NOT NULL,
    total_cost DECIMAL(10,2) NOT NULL,
    booking_date DATE NOT NULL,
    CONSTRAINT FK_Booking_Customer FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    CONSTRAINT FK_Booking_Event FOREIGN KEY (event_id) REFERENCES Event(event_id)
)
