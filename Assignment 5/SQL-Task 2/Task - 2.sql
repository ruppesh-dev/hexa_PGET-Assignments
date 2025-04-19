-- SQL Queries for Task 2

-- 1. Insert Sample Records into Each Table

-- Insert into Venue
INSERT INTO Venue (venue_name, address) VALUES
('Chennai Trade Centre', 'Chennai'),
('Coimbatore Stadium', 'Coimbatore'),
('Madurai Arena', 'Madurai'),
('Trichy Hall', 'Trichy'),
('Salem Grounds', 'Salem'),
('Tirunelveli Theatre', 'Tirunelveli'),
('Vellore Plaza', 'Vellore'),
('Erode Convention Center', 'Erode'),
('Kanchipuram Kalyana Mandapam', 'Kanchipuram'),
('Thanjavur Auditorium', 'Thanjavur')

-- Insert into Event
INSERT INTO Event (event_name, event_date, event_time, venue_id, total_seats, available_seats, ticket_price, event_type) VALUES
('Ponniyin Selvan Movie', '2025-04-20', '18:30', 1, 500, 400, 150.00, 'Movie'),
('IPL Cricket Match', '2025-05-10', '19:00', 2, 30000, 25000, 1200.00, 'Sports'),
('A R Rahman Live', '2025-06-15', '20:00', 3, 5000, 4500, 2500.00, 'Concert'),
('Thalapathy Vijay Fans Meet', '2025-05-05', '16:00', 4, 1000, 800, 100.00, 'Movie'),
('Kabaddi League Finals', '2025-06-01', '18:00', 5, 8000, 7500, 800.00, 'Sports'),
('Yuvan Shankar Raja Night', '2025-07-10', '19:30', 6, 2000, 1800, 1800.00, 'Concert'),
('Master Movie', '2025-04-25', '20:00', 7, 600, 500, 160.00, 'Movie'),
('Traditional Tamil Music Fest', '2025-06-20', '17:00', 8, 1000, 900, 500.00, 'Concert'),
('Salem Marathon', '2025-05-22', '06:00', 5, 10000, 9500, 300.00, 'Sports'),
('Vadivelu Comedy Night', '2025-08-14', '19:00', 9, 1200, 1100, 900.00, 'Concert')

-- Insert into Customer
INSERT INTO Customer (customer_name, email, phone_number) VALUES
('Arun Kumar', 'arun@gmail.com', '9876543210'),
('Priya Ramesh', 'priya@gmail.com', '9876501234'),
('Karthik M', 'karthikm@gmail.com', '9988776655'),
('Divya S', 'divyas@gmail.com', '9123456789'),
('Gokul Raj', 'gokul@gmail.com', '8765432190'),
('Meena P', 'meena@gmail.com', '9999999999'),
('Ravi Chandran', 'ravi@gmail.com', '9090909090'),
('Anitha L', 'anitha@gmail.com', '9898989898'),
('Surya V', 'surya@gmail.com', '7777777777'),
('Lakshmi Devi', 'lakshmi@gmail.com', '8888888888')

-- Insert into Booking
INSERT INTO Booking (customer_id, event_id, num_tickets, total_cost, booking_date) VALUES
(1, 1, 2, 300.00, '2025-04-15'),
(2, 2, 4, 4800.00, '2025-04-18'),
(3, 3, 1, 2500.00, '2025-04-20'),
(4, 4, 3, 300.00, '2025-04-21'),
(5, 5, 5, 4000.00, '2025-04-22'),
(6, 6, 2, 3600.00, '2025-04-23'),
(7, 7, 4, 640.00, '2025-04-24'),
(8, 8, 2, 1000.00, '2025-04-25'),
(9, 9, 1, 300.00, '2025-04-26'),
(10, 10, 3, 2700.00, '2025-04-27')

-- 2. List All Events

SELECT * FROM Event

-- 3. Select Events with Available Tickets

SELECT * FROM Event WHERE available_seats > 0

-- 4. Select Events with Name Partial Match ‘cup’

SELECT * FROM Event WHERE event_name LIKE '%cup%'

-- 5. Select Events with Ticket Price Between 1000 and 2500

SELECT * FROM Event WHERE ticket_price BETWEEN 1000 AND 2500

-- 6. Retrieve Events with Dates Falling Within a Specific Range

SELECT * FROM Event 
WHERE event_date BETWEEN '2025-05-01' AND '2025-06-30';

-- 7. Retrieve Events with Available Tickets and "Concert" in Their Name

SELECT * FROM Event 
WHERE available_seats > 0 AND event_name LIKE '%Concert%'

-- 8. Retrieve Users in Batches of 5, Starting from the 6th User

SELECT * FROM Customer
ORDER BY customer_id
OFFSET 5 ROWS FETCH NEXT 5 ROWS ONLY

-- 9. Retrieve Booking Details Where Number of Tickets Booked is More Than 4

SELECT * FROM Booking
WHERE num_tickets > 4

-- 10. Retrieve Customer Information Whose Phone Number Ends with ‘000’

SELECT * FROM Customer
WHERE phone_number LIKE '%000'

-- 11. Retrieve Events in Order Whose Seat Capacity is More Than 15000

SELECT * FROM Event
WHERE total_seats > 15000
ORDER BY total_seats DESC

-- 12. Select Events Whose Name Does Not Start with ‘x’, ‘y’, or ‘z’

SELECT * FROM Event
WHERE event_name NOT LIKE 'x%' 
AND event_name NOT LIKE 'y%' 
AND event_name NOT LIKE 'z%'
