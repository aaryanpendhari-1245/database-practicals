#DATABASE CREATION
CREATE DATABASE OnlineBookstore;
USE OnlineBookstore;

#TABLE CREATION
CREATE TABLE Authors(
AuthorID INT PRIMARY KEY,
Name VARCHAR(50),
Country VARCHAR(50),
DOB DATE
);

CREATE TABLE Categories(
CategoryID INT PRIMARY KEY,
CategoryName VARCHAR(50)
);

CREATE TABLE Books(
BookID INT PRIMARY KEY,
Title VARCHAR(100),
AuthorID INT,
CategoryID INT,
Price INT,
Stock INT,
PublishedYear INT
);

CREATE TABLE Customers(
CustomerID INT PRIMARY KEY,
Name VARCHAR(50),
Email VARCHAR(50),
Phone VARCHAR(15),
Address VARCHAR(100)
);

CREATE TABLE Orders(
OrderID INT PRIMARY KEY,
CustomerID INT,
OrderDate DATE,
Status VARCHAR(20)
);
CREATE TABLE Authors(
AuthorID INT PRIMARY KEY,
Name VARCHAR(50),
Country VARCHAR(50),
DOB DATE
);

CREATE TABLE Categories(
CategoryID INT PRIMARY KEY,
CategoryName VARCHAR(50)
);

CREATE TABLE Books(
BookID INT PRIMARY KEY,
Title VARCHAR(100),
AuthorID INT,
CategoryID INT,
Price INT,
Stock INT,
PublishedYear INT
);

CREATE TABLE Customers(
CustomerID INT PRIMARY KEY,
Name VARCHAR(50),
Email VARCHAR(50),
Phone VARCHAR(15),
Address VARCHAR(100)
);

CREATE TABLE Orders(
OrderID INT PRIMARY KEY,
CustomerID INT,
OrderDate DATE,
Status VARCHAR(20)
);
CREATE TABLE Authors(
AuthorID INT PRIMARY KEY,
Name VARCHAR(50),
Country VARCHAR(50),
DOB DATE
);

CREATE TABLE Categories(
CategoryID INT PRIMARY KEY,
CategoryName VARCHAR(50)
);

CREATE TABLE Books(
BookID INT PRIMARY KEY,
Title VARCHAR(100),
AuthorID INT,
CategoryID INT,
Price INT,
Stock INT,
PublishedYear INT
);

#INSERT SAMPLE DATA
INSERT INTO Authors VALUES
(1,'Chetan Bhagat','India','1974-04-22'),
(2,'J K Rowling','UK','1965-07-31'),
(3,'Dan Brown','USA','1964-06-22'),
(4,'Amish Tripathi','India','1974-10-18'),
(5,'Paulo Coelho','Brazil','1947-08-24');

INSERT INTO Categories VALUES
(1,'Fiction'),
(2,'Mystery'),
(3,'Self Help'),
(4,'Mythology'),
(5,'Fantasy');

INSERT INTO Books VALUES
(101,'Half Girlfriend',1,1,550,8,2016),
(102,'Harry Potter Guide',2,5,700,15,2018),
(103,'Da Vinci Code',3,2,450,20,2010),
(104,'Shiva Trilogy',4,4,650,5,2015),
(105,'Alchemist Guide',5,3,500,12,2019);

INSERT INTO Customers VALUES
(1,'Amit','amit@gmail.com','9876543210','Mumbai'),
(2,'Sara','sara@gmail.com','9123456780','Delhi'),
(3,'Ravi','ravi@gmail.com','9988776655','Pune'),
(4,'John','john@gmail.com','9871234567','Mumbai'),
(5,'Neha','neha@gmail.com','9012345678','Nagpur');

INSERT INTO Orders VALUES
(1,1,'2024-01-10','Pending'),
(2,2,'2024-02-15','Completed'),
(3,1,'2024-03-20','Pending'),
(4,3,'2024-04-01','Completed'),
(5,4,'2024-04-05','Pending');

CREATE TABLE Customers(
CustomerID INT PRIMARY KEY,
Name VARCHAR(50),
Email VARCHAR(50),
Phone VARCHAR(15),
Address VARCHAR(100)
);

CREATE TABLE Orders(
OrderID INT PRIMARY KEY,
CustomerID INT,
OrderDate DATE,
Status VARCHAR(20)
);

#1️ Books price above 500
SELECT * FROM Books WHERE Price > 500;

#2Books published after 2015
SELECT * FROM Books WHERE PublishedYear > 2015;

#3Customers from specific city (Mumbai)
SELECT * FROM Customers WHERE Address='Mumbai';

#4Books by given author (Chetan Bhagat)
SELECT Title FROM Books
JOIN Authors ON Books.AuthorID=Authors.AuthorID
WHERE Authors.Name='Chetan Bhagat';

#5Top 3 expensive books
SELECT * FROM Books ORDER BY Price DESC LIMIT 3;

-- #6 Count books in each category
SELECT CategoryName, COUNT(BookID)
FROM Books JOIN Categories
ON Books.CategoryID=Categories.CategoryID
GROUP BY CategoryName;

-- #7 Orders placed in last 30 days
SELECT * FROM Orders
WHERE OrderDate >= CURDATE() - INTERVAL 30 DAY;

-- #8 Customer name and total orders
SELECT Customers.Name, COUNT(OrderID)
FROM Customers LEFT JOIN Orders
ON Customers.CustomerID=Orders.CustomerID
GROUP BY Customers.Name;

-- #9 Books with stock less than 10
SELECT * FROM Books WHERE Stock < 10;

-- #10 Authors with more than 5 books
SELECT Name
FROM Authors JOIN Books
ON Authors.AuthorID=Books.AuthorID
GROUP BY Name
HAVING COUNT(BookID) > 5;

-- #11 Books with category name
SELECT Title, CategoryName
FROM Books JOIN Categories
ON Books.CategoryID=Categories.CategoryID;

-- #12 Total sales amount per order (assumed)
SELECT OrderID, SUM(Price) TotalAmount
FROM Orders JOIN Books
GROUP BY OrderID;

-- #13 Orders with status Pending
SELECT * FROM Orders WHERE Status='Pending';

-- #14 Authors from India
SELECT * FROM Authors WHERE Country='India';

-- #15 Customers who never placed an order
SELECT Name FROM Customers
WHERE CustomerID NOT IN
(SELECT CustomerID FROM Orders);

-- #16 Average book price per category
SELECT CategoryName, AVG(Price)
FROM Books JOIN Categories
ON Books.CategoryID=Categories.CategoryID
GROUP BY CategoryName;

-- #17 Books sorted by PublishedYear DESC
SELECT * FROM Books ORDER BY PublishedYear DESC;

-- #18 Most recent order for each customer
SELECT CustomerID, MAX(OrderDate)
FROM Orders
GROUP BY CustomerID;

-- #19 Categories with no books
SELECT CategoryName FROM Categories
WHERE CategoryID NOT IN
(SELECT CategoryID FROM Books);

-- #20 List all distinct cities
SELECT DISTINCT Address FROM Customers;

-- #21 Total number of customers
SELECT COUNT(*) FROM Customers;

-- #22 Orders with customer name and order date
SELECT Orders.OrderID, Customers.Name, OrderDate
FROM Orders JOIN Customers
ON Orders.CustomerID=Customers.CustomerID;

-- #23 Cheapest book in each category
SELECT CategoryID, MIN(Price)
FROM Books
GROUP BY CategoryID;

-- #24 Customers who ordered books by Dan Brown
SELECT DISTINCT Customers.Name
FROM Customers
JOIN Orders ON Customers.CustomerID=Orders.CustomerID
JOIN Books
JOIN Authors ON Books.AuthorID=Authors.AuthorID
WHERE Authors.Name='Dan Brown';

-- #25 Books whose title contains 'Guide'
SELECT * FROM Books WHERE Title LIKE '%Guide%';

#SET 2 – Hospital Management System
CREATE DATABASE HospitalDB;
USE HospitalDB;

-- ================= TABLE CREATION =================

CREATE TABLE Doctors(
DoctorID INT PRIMARY KEY,
Name VARCHAR(50),
Specialization VARCHAR(50),
Phone VARCHAR(15),
JoiningDate DATE
);

CREATE TABLE Patients(
PatientID INT PRIMARY KEY,
Name VARCHAR(50),
DOB DATE,
Gender VARCHAR(10),
Phone VARCHAR(15)
);

CREATE TABLE Departments(
DeptID INT PRIMARY KEY,
DeptName VARCHAR(50),
Location VARCHAR(50)
);

CREATE TABLE Appointments(
AppointmentID INT PRIMARY KEY,
PatientID INT,
DoctorID INT,
Date DATE,
Time TIME,
Status VARCHAR(20)
);

CREATE TABLE Bills(
BillID INT PRIMARY KEY,
PatientID INT,
Amount INT,
BillDate DATE,
PaymentStatus VARCHAR(20)
);

-- ================= INSERT DATA =================

INSERT INTO Doctors VALUES
(1,'Dr Amit','Cardiology','9811111111','2021-01-10'),
(2,'Dr Sara','Neurology','9822222222','2019-05-15'),
(3,'Dr John','Orthopedic','9833333333','2022-03-12'),
(4,'Dr Neha','Cardiology','9844444444','2018-07-19'),
(5,'Dr Ravi','Dermatology','9855555555','2023-02-01');

INSERT INTO Patients VALUES
(1,'Anil','1950-06-10','Male','9876543210'),
(2,'Asha','1995-08-20','Female','9123456780'),
(3,'Rohan','1988-02-15','Male','9988776655'),
(4,'Sneha','2001-09-09','Female','9871234567'),
(5,'Kiran','1975-12-01','Male','9012345678');

INSERT INTO Departments VALUES
(1,'Cardiology','Block A'),
(2,'Neurology','Block B'),
(3,'Orthopedic','Block C'),
(4,'Dermatology','Block D'),
(5,'Pediatrics','Block E');

INSERT INTO Appointments VALUES
(1,1,1,'2024-04-01','10:00:00','Completed'),
(2,2,2,'2024-04-02','11:00:00','Cancelled'),
(3,3,1,'2024-04-03','12:00:00','Completed'),
(4,1,4,'2024-04-04','09:30:00','Pending'),
(5,5,3,'2024-04-05','01:00:00','Completed');

INSERT INTO Bills VALUES
(1,1,6000,'2024-04-01','Paid'),
(2,2,3000,'2024-04-02','Unpaid'),
(3,3,8000,'2024-04-03','Paid'),
(4,4,2000,'2024-04-04','Unpaid'),
(5,5,9000,'2024-04-05','Paid');



-- #1 Doctors with Cardiology specialization
SELECT * FROM Doctors WHERE Specialization='Cardiology';

-- #2 Patients above 60 years
SELECT * FROM Patients WHERE TIMESTAMPDIFF(YEAR,DOB,CURDATE()) > 60;

-- #3 Appointments scheduled today
SELECT * FROM Appointments WHERE Date = CURDATE();

-- #4 Count patients per department (assumed via doctors)
SELECT DeptName, COUNT(PatientID)
FROM Departments
LEFT JOIN Doctors ON Departments.DeptName = Doctors.Specialization
LEFT JOIN Appointments ON Doctors.DoctorID = Appointments.DoctorID
GROUP BY DeptName;

-- #5 Patients assigned to specific doctor (DoctorID=1)
SELECT Patients.Name
FROM Patients JOIN Appointments
ON Patients.PatientID=Appointments.PatientID
WHERE DoctorID=1;

-- #6 Bills amount greater than 5000
SELECT * FROM Bills WHERE Amount > 5000;

-- #7 Unpaid bills
SELECT * FROM Bills WHERE PaymentStatus='Unpaid';

-- #8 Doctor with maximum appointments
SELECT DoctorID, COUNT(*) total
FROM Appointments
GROUP BY DoctorID
ORDER BY total DESC LIMIT 1;

-- #9 Patients without appointments
SELECT Name FROM Patients
WHERE PatientID NOT IN (SELECT PatientID FROM Appointments);

-- #10 Oldest patient
SELECT * FROM Patients ORDER BY DOB LIMIT 1;

-- #11 Average bill per department (assumed)
SELECT DeptName, AVG(Amount)
FROM Bills JOIN Patients ON Bills.PatientID=Patients.PatientID
JOIN Appointments ON Patients.PatientID=Appointments.PatientID
JOIN Doctors ON Doctors.DoctorID=Appointments.DoctorID
JOIN Departments ON Departments.DeptName=Doctors.Specialization
GROUP BY DeptName;

-- #12 Doctors joined after 2020
SELECT * FROM Doctors WHERE JoiningDate > '2020-12-31';

-- #13 Patients name starts with A
SELECT * FROM Patients WHERE Name LIKE 'A%';

-- #14 Cancelled appointments
SELECT * FROM Appointments WHERE Status='Cancelled';

-- #15 Count appointments per day
SELECT Date, COUNT(*) FROM Appointments GROUP BY Date;

-- #16 Patients visited more than 3 times
SELECT PatientID, COUNT(*) total
FROM Appointments
GROUP BY PatientID
HAVING total > 3;

-- #17 Department names with doctors
SELECT DeptName, Doctors.Name
FROM Departments LEFT JOIN Doctors
ON Departments.DeptName = Doctors.Specialization;

-- #18 Doctors working in Neurology
SELECT * FROM Doctors WHERE Specialization='Neurology';

-- #19 Total bills per patient
SELECT PatientID, SUM(Amount)
FROM Bills GROUP BY PatientID;

-- #20 Top 5 highest billing patients
SELECT PatientID, SUM(Amount) total
FROM Bills GROUP BY PatientID
ORDER BY total DESC LIMIT 5;

-- #21 Appointments with doctor and patient names
SELECT Appointments.AppointmentID, Patients.Name, Doctors.Name
FROM Appointments
JOIN Patients ON Patients.PatientID=Appointments.PatientID
JOIN Doctors ON Doctors.DoctorID=Appointments.DoctorID;

-- #22 Departments without doctors
SELECT DeptName FROM Departments
WHERE DeptName NOT IN (SELECT Specialization FROM Doctors);

-- #23 Doctors phone starts with 98
SELECT * FROM Doctors WHERE Phone LIKE '98%';

-- #24 Patients admitted in last 7 days (assumed appointments)
SELECT * FROM Appointments
WHERE Date >= CURDATE() - INTERVAL 7 DAY;

-- #25 Doctors and total billing amounts
SELECT Doctors.Name, SUM(Amount)
FROM Doctors
JOIN Appointments ON Doctors.DoctorID=Appointments.DoctorID
JOIN Bills ON Bills.PatientID=Appointments.PatientID
GROUP BY Doctors.Name;

#SET 3 – University Management System
CREATE DATABASE UniversityDB;
USE UniversityDB;

-- ================= TABLE CREATION =================

CREATE TABLE Departments(
DeptID INT PRIMARY KEY,
DeptName VARCHAR(50),
HOD VARCHAR(50)
);

CREATE TABLE Students(
StudentID INT PRIMARY KEY,
Name VARCHAR(50),
DOB DATE,
Gender VARCHAR(10),
DeptID INT,
Email VARCHAR(50)
);

CREATE TABLE Courses(
CourseID INT PRIMARY KEY,
CourseName VARCHAR(50),
DeptID INT,
Credits INT
);

CREATE TABLE Faculty(
FacultyID INT PRIMARY KEY,
Name VARCHAR(50),
DeptID INT,
Email VARCHAR(50)
);

CREATE TABLE Enrollments(
EnrollmentID INT PRIMARY KEY,
StudentID INT,
CourseID INT,
Semester VARCHAR(20),
Grade INT
);

-- ================= INSERT DATA =================

INSERT INTO Departments VALUES
(1,'Computer Science','Dr Mehta'),
(2,'Physics','Dr Rao'),
(3,'Mathematics','Dr Shah'),
(4,'Commerce','Dr Jain'),
(5,'Biology','Dr Iyer');

INSERT INTO Students VALUES
(1,'Amit','2001-05-10','Male',1,'amit@gmail.com'),
(2,'Sara','1999-08-21','Female',2,'sara@gmail.com'),
(3,'Ravi','2002-01-11','Male',1,'ravi@gmail.com'),
(4,'Sneha','2003-03-09','Female',3,'sneha@gmail.com'),
(5,'Kiran','1998-12-01','Male',4,'kiran@gmail.com');

INSERT INTO Courses VALUES
(101,'DBMS',1,4),
(102,'Quantum Physics',2,5),
(103,'Algebra',3,3),
(104,'Accounts',4,4),
(105,'Genetics',5,4);

INSERT INTO Faculty VALUES
(1,'Prof A',1,'a@uni.com'),
(2,'Prof B',2,'b@uni.com'),
(3,'Prof C',3,'c@uni.com'),
(4,'Prof D',4,'d@uni.com'),
(5,'Prof E',5,'e@uni.com');

INSERT INTO Enrollments VALUES
(1,1,101,'Sem1',85),
(2,2,102,'Sem1',78),
(3,1,103,'Sem2',88),
(4,3,101,'Sem1',67),
(5,4,103,'Sem1',92);


-- #1 Students in Computer Science
SELECT Name FROM Students
JOIN Departments ON Students.DeptID=Departments.DeptID
WHERE DeptName='Computer Science';

-- #2 Courses with more than 3 credits
SELECT * FROM Courses WHERE Credits > 3;

-- #3 Students born after 2000
SELECT * FROM Students WHERE DOB > '2000-12-31';

-- #4 Average grade per course
SELECT CourseID, AVG(Grade)
FROM Enrollments GROUP BY CourseID;

-- #5 Faculty in Physics
SELECT Name FROM Faculty
JOIN Departments ON Faculty.DeptID=Departments.DeptID
WHERE DeptName='Physics';

-- #6 Total students per department
SELECT DeptName, COUNT(StudentID)
FROM Students JOIN Departments
ON Students.DeptID=Departments.DeptID
GROUP BY DeptName;

-- #7 Courses taught by given faculty (FacultyID=1 assumed Dept relation)
SELECT CourseName FROM Courses
WHERE DeptID=(SELECT DeptID FROM Faculty WHERE FacultyID=1);

-- #8 Students with no enrollments
SELECT Name FROM Students
WHERE StudentID NOT IN (SELECT StudentID FROM Enrollments);

-- #9 Top 3 scorers in course 101
SELECT StudentID, Grade
FROM Enrollments
WHERE CourseID=101
ORDER BY Grade DESC LIMIT 3;

-- #10 Students enrolled in more than 4 courses
SELECT StudentID, COUNT(*) total
FROM Enrollments
GROUP BY StudentID
HAVING total > 4;

-- #11 Courses with no enrollments
SELECT CourseName FROM Courses
WHERE CourseID NOT IN (SELECT CourseID FROM Enrollments);

-- #12 Department names with total faculty
SELECT DeptName, COUNT(FacultyID)
FROM Faculty JOIN Departments
ON Faculty.DeptID=Departments.DeptID
GROUP BY DeptName;

-- #13 Courses taken by specific student (StudentID=1)
SELECT CourseName FROM Courses
JOIN Enrollments ON Courses.CourseID=Enrollments.CourseID
WHERE StudentID=1;

-- #14 Students name starts with S
SELECT * FROM Students WHERE Name LIKE 'S%';

-- #15 Youngest student
SELECT * FROM Students ORDER BY DOB DESC LIMIT 1;

-- #16 Students and average grade
SELECT StudentID, AVG(Grade)
FROM Enrollments GROUP BY StudentID;

-- #17 Departments without students
SELECT DeptName FROM Departments
WHERE DeptID NOT IN (SELECT DeptID FROM Students);

-- #18 Faculty email addresses
SELECT Email FROM Faculty;

-- #19 Students enrolled in Mathematics course
SELECT Students.Name
FROM Students
JOIN Enrollments ON Students.StudentID=Enrollments.StudentID
JOIN Courses ON Courses.CourseID=Enrollments.CourseID
WHERE CourseName='Algebra';

-- #20 Total credits per student
SELECT StudentID, SUM(Credits)
FROM Enrollments
JOIN Courses ON Courses.CourseID=Enrollments.CourseID
GROUP BY StudentID;

-- #21 Students with failing grades (<40)
SELECT * FROM Enrollments WHERE Grade < 40;

-- #22 Course with maximum students
SELECT CourseID, COUNT(*) total
FROM Enrollments
GROUP BY CourseID
ORDER BY total DESC LIMIT 1;

-- #23 Grade distribution per course
SELECT CourseID, Grade, COUNT(*)
FROM Enrollments
GROUP BY CourseID, Grade;

-- #24 Students with department names
SELECT Students.Name, DeptName
FROM Students JOIN Departments
ON Students.DeptID=Departments.DeptID;

-- #25 Oldest faculty member (assumed by lowest ID join year not given)
SELECT * FROM Faculty ORDER BY FacultyID LIMIT 1;

#SET 4 – Airline Reservation System
CREATE DATABASE AirlineDB;
USE AirlineDB;

-- ================= TABLE CREATION =================

CREATE TABLE Airlines(
AirlineID INT PRIMARY KEY,
AirlineName VARCHAR(50),
Country VARCHAR(50)
);

CREATE TABLE Flights(
FlightID INT PRIMARY KEY,
AirlineID INT,
Source VARCHAR(50),
Destination VARCHAR(50),
DepartureTime TIME,
ArrivalTime TIME,
Price INT
);

CREATE TABLE Passengers(
PassengerID INT PRIMARY KEY,
Name VARCHAR(50),
PassportNo VARCHAR(20),
Nationality VARCHAR(50),
DOB DATE
);

CREATE TABLE Bookings(
BookingID INT PRIMARY KEY,
FlightID INT,
PassengerID INT,
BookingDate DATE,
SeatNo VARCHAR(10),
Status VARCHAR(20)
);

CREATE TABLE Payments(
PaymentID INT PRIMARY KEY,
BookingID INT,
Amount INT,
PaymentDate DATE,
Method VARCHAR(20)
);

-- ================= INSERT DATA =================

INSERT INTO Airlines VALUES
(1,'IndiGo','India'),
(2,'Air India','India'),
(3,'Emirates','UAE'),
(4,'Delta','USA'),
(5,'Lufthansa','Germany');

INSERT INTO Flights VALUES
(101,1,'Delhi','Mumbai','18:30:00','20:30:00',6000),
(102,2,'Mumbai','Dubai','09:00:00','11:30:00',15000),
(103,3,'Delhi','London','06:00:00','14:00:00',45000),
(104,4,'NYC','LA','20:00:00','23:00:00',12000),
(105,5,'Berlin','Paris','08:00:00','10:00:00',8000);

INSERT INTO Passengers VALUES
(1,'Amit','M123','India','2000-05-10'),
(2,'Sara','N234','India','1998-02-11'),
(3,'John','M567','USA','1995-03-09'),
(4,'Ravi','P890','India','2002-07-21'),
(5,'Neha','M345','India','2001-12-01');

INSERT INTO Bookings VALUES
(1,101,1,'2024-04-01','12A','Confirmed'),
(2,102,2,'2024-04-02','14B','Pending'),
(3,101,3,'2024-04-03','10C','Confirmed'),
(4,103,1,'2024-04-04','09D','Cancelled'),
(5,104,4,'2024-04-05','15E','Confirmed');

INSERT INTO Payments VALUES
(1,1,6000,'2024-04-01','Card'),
(2,2,15000,'2024-04-02','UPI'),
(3,3,6000,'2024-04-03','Cash'),
(4,4,45000,'2024-04-04','Card'),
(5,5,12000,'2024-04-05','UPI');



-- #1 Flights Delhi to Mumbai
SELECT * FROM Flights WHERE Source='Delhi' AND Destination='Mumbai';

-- #2 Flights departing after 6 PM
SELECT * FROM Flights WHERE DepartureTime > '18:00:00';

-- #3 Passengers nationality India
SELECT * FROM Passengers WHERE Nationality='India';

-- #4 Confirmed bookings
SELECT * FROM Bookings WHERE Status='Confirmed';

-- #5 Bookings for passenger Amit
SELECT * FROM Bookings
JOIN Passengers ON Bookings.PassengerID=Passengers.PassengerID
WHERE Passengers.Name='Amit';

-- #6 Flights per airline
SELECT AirlineID, COUNT(*) FROM Flights GROUP BY AirlineID;

-- #7 Passengers booked more than 3 flights
SELECT PassengerID, COUNT(*) total
FROM Bookings GROUP BY PassengerID HAVING total>3;

-- #8 Most expensive flight
SELECT * FROM Flights ORDER BY Price DESC LIMIT 1;

-- #9 Airlines in USA
SELECT * FROM Airlines WHERE Country='USA';

-- #10 Bookings last 7 days
SELECT * FROM Bookings
WHERE BookingDate >= CURDATE()-INTERVAL 7 DAY;

-- #11 Avg price per airline
SELECT AirlineID, AVG(Price)
FROM Flights GROUP BY AirlineID;

-- #12 Passengers without bookings
SELECT Name FROM Passengers
WHERE PassengerID NOT IN (SELECT PassengerID FROM Bookings);

-- #13 Flights with no bookings
SELECT * FROM Flights
WHERE FlightID NOT IN (SELECT FlightID FROM Bookings);

-- #14 Passport starts with M
SELECT * FROM Passengers WHERE PassportNo LIKE 'M%';

-- #15 Bookings with passenger & flight
SELECT BookingID, Passengers.Name, Source, Destination
FROM Bookings
JOIN Passengers ON Passengers.PassengerID=Bookings.PassengerID
JOIN Flights ON Flights.FlightID=Bookings.FlightID;

-- #16 Top 5 payments
SELECT * FROM Payments ORDER BY Amount DESC LIMIT 5;

-- #17 Passenger count per flight
SELECT FlightID, COUNT(*) FROM Bookings GROUP BY FlightID;

-- #18 Flights arriving before 10 AM
SELECT * FROM Flights WHERE ArrivalTime < '10:00:00';

-- #19 Flights with airline name
SELECT FlightID, AirlineName
FROM Flights JOIN Airlines
ON Flights.AirlineID=Airlines.AirlineID;

-- #20 Multiple bookings same date
SELECT PassengerID, BookingDate, COUNT(*)
FROM Bookings GROUP BY PassengerID, BookingDate HAVING COUNT(*)>1;

-- #21 Payment method totals
SELECT Method, SUM(Amount)
FROM Payments GROUP BY Method;

-- #22 Bookings last month
SELECT * FROM Bookings
WHERE BookingDate >= CURDATE()-INTERVAL 1 MONTH;

-- #23 Flights price between 5000 and 10000
SELECT * FROM Flights WHERE Price BETWEEN 5000 AND 10000;

-- #24 Passenger DOB after 2000
SELECT * FROM Passengers WHERE DOB > '2000-12-31';

-- #25 Airlines with no flights
SELECT AirlineName FROM Airlines
WHERE AirlineID NOT IN (SELECT AirlineID FROM Flights);

#SET 5 – Hotel Management System
CREATE DATABASE HotelDB;
USE HotelDB;

-- ================= TABLE CREATION =================

CREATE TABLE Hotels(
HotelID INT PRIMARY KEY,
HotelName VARCHAR(50),
Location VARCHAR(50),
Rating DECIMAL(2,1)
);

CREATE TABLE Rooms(
RoomID INT PRIMARY KEY,
HotelID INT,
RoomType VARCHAR(30),
PricePerNight INT,
Availability VARCHAR(20)
);

CREATE TABLE Guests(
GuestID INT PRIMARY KEY,
Name VARCHAR(50),
Phone VARCHAR(15),
Email VARCHAR(50),
Address VARCHAR(100)
);

CREATE TABLE Reservations(
ReservationID INT PRIMARY KEY,
RoomID INT,
GuestID INT,
CheckInDate DATE,
CheckOutDate DATE,
Status VARCHAR(20)
);

CREATE TABLE Payments(
PaymentID INT PRIMARY KEY,
ReservationID INT,
Amount INT,
PaymentDate DATE,
Method VARCHAR(20)
);

-- ================= INSERT DATA =================

INSERT INTO Hotels VALUES
(1,'Taj Palace','Mumbai',4.8),
(2,'Oberoi','Delhi',4.6),
(3,'Leela','Bangalore',4.5),
(4,'ITC Grand','Chennai',4.2),
(5,'Hyatt','Pune',4.0);

INSERT INTO Rooms VALUES
(101,1,'Suite',6000,'Available'),
(102,1,'Deluxe',3500,'Booked'),
(103,2,'Suite',7000,'Available'),
(104,3,'Standard',2500,'Available'),
(105,4,'Deluxe',4000,'Booked');

INSERT INTO Guests VALUES
(1,'Amit','9876543210','amit@gmail.com','Mumbai'),
(2,'Sara','9123456780','sara@gmail.com','Delhi'),
(3,'Ravi','9988776655','ravi@gmail.com','Pune'),
(4,'Neha','9871234567','neha@gmail.com','Nagpur'),
(5,'John','9012345678','john@gmail.com','Chennai');

INSERT INTO Reservations VALUES
(1,101,1,'2024-04-01','2024-04-05','Checked-In'),
(2,102,2,'2024-04-03','2024-04-06','Pending'),
(3,103,3,'2024-04-04','2024-04-10','Checked-Out'),
(4,104,1,'2024-03-20','2024-03-25','Checked-Out'),
(5,105,4,'2024-04-07','2024-04-09','Checked-In');

INSERT INTO Payments VALUES
(1,1,24000,'2024-04-01','Card'),
(2,2,10500,'2024-04-03','UPI'),
(3,3,42000,'2024-04-04','Cash'),
(4,4,12500,'2024-03-20','Card'),
(5,5,8000,'2024-04-07','UPI');



-- #1 Hotels in Mumbai
SELECT * FROM Hotels WHERE Location='Mumbai';

-- #2 Rooms price above 3000
SELECT * FROM Rooms WHERE PricePerNight > 3000;

-- #3 Available rooms in hotel 1
SELECT * FROM Rooms WHERE HotelID=1 AND Availability='Available';

-- #4 Guests with reservations in hotel 1
SELECT DISTINCT Guests.Name
FROM Guests
JOIN Reservations ON Guests.GuestID=Reservations.GuestID
JOIN Rooms ON Rooms.RoomID=Reservations.RoomID
WHERE Rooms.HotelID=1;

-- #5 Reservations Checked-In
SELECT * FROM Reservations WHERE Status='Checked-In';

-- #6 Count rooms by type per hotel
SELECT HotelID, RoomType, COUNT(*)
FROM Rooms GROUP BY HotelID, RoomType;

-- #7 Guests stayed more than 5 nights
SELECT GuestID
FROM Reservations
WHERE DATEDIFF(CheckOutDate,CheckInDate) > 5;

-- #8 Top 3 expensive room types
SELECT RoomType, PricePerNight
FROM Rooms ORDER BY PricePerNight DESC LIMIT 3;

-- #9 Reservations last month
SELECT * FROM Reservations
WHERE CheckInDate >= CURDATE()-INTERVAL 1 MONTH;

-- #10 Guests with more than 2 reservations
SELECT GuestID, COUNT(*) total
FROM Reservations GROUP BY GuestID HAVING total>2;

-- #11 Hotels avg room price above 4000
SELECT HotelID, AVG(PricePerNight)
FROM Rooms GROUP BY HotelID HAVING AVG(PricePerNight)>4000;

-- #12 Guests from Delhi
SELECT * FROM Guests WHERE Address='Delhi';

-- #13 Hotels without reservations
SELECT HotelName FROM Hotels
WHERE HotelID NOT IN (
SELECT HotelID FROM Rooms
JOIN Reservations ON Rooms.RoomID=Reservations.RoomID);

-- #14 Reservations with guest + hotel + room type
SELECT ReservationID, Guests.Name, Hotels.HotelName, RoomType
FROM Reservations
JOIN Guests ON Guests.GuestID=Reservations.GuestID
JOIN Rooms ON Rooms.RoomID=Reservations.RoomID
JOIN Hotels ON Hotels.HotelID=Rooms.HotelID;

-- #15 Total revenue per hotel
SELECT Hotels.HotelName, SUM(Amount)
FROM Payments
JOIN Reservations ON Payments.ReservationID=Reservations.ReservationID
JOIN Rooms ON Rooms.RoomID=Reservations.RoomID
JOIN Hotels ON Hotels.HotelID=Rooms.HotelID
GROUP BY Hotels.HotelName;

-- #16 Wrong date reservations
SELECT * FROM Reservations
WHERE CheckOutDate < CheckInDate;

-- #17 Payment methods used
SELECT DISTINCT Method FROM Payments;

-- #18 Guests without payments
SELECT Name FROM Guests
WHERE GuestID NOT IN (
SELECT GuestID FROM Reservations
JOIN Payments ON Reservations.ReservationID=Payments.ReservationID);

-- #19 Reservations sorted by checkin
SELECT * FROM Reservations ORDER BY CheckInDate;

-- #20 Hotels rating above 4
SELECT * FROM Hotels WHERE Rating > 4;

-- #21 Guests who booked suites
SELECT DISTINCT Guests.Name
FROM Guests
JOIN Reservations ON Guests.GuestID=Reservations.GuestID
JOIN Rooms ON Rooms.RoomID=Reservations.RoomID
WHERE RoomType='Suite';

-- #22 Available rooms in Delhi
SELECT Rooms.*
FROM Rooms JOIN Hotels
ON Hotels.HotelID=Rooms.HotelID
WHERE Location='Delhi' AND Availability='Available';

-- #23 Total nights per guest
SELECT GuestID, SUM(DATEDIFF(CheckOutDate,CheckInDate))
FROM Reservations GROUP BY GuestID;

-- #24 Overlapping reservations same room
SELECT * FROM Reservations r1
JOIN Reservations r2
ON r1.RoomID=r2.RoomID
AND r1.ReservationID<>r2.ReservationID
AND r1.CheckInDate < r2.CheckOutDate
AND r2.CheckInDate < r1.CheckOutDate;

-- #25 Distinct hotel cities
SELECT DISTINCT Location FROM Hotels;

#SET 6 – Library Management System
CREATE DATABASE LibraryDB;
USE LibraryDB;

-- ================= TABLE CREATION =================

CREATE TABLE Authors(
AuthorID INT PRIMARY KEY,
Name VARCHAR(50),
Nationality VARCHAR(50)
);

CREATE TABLE Books(
BookID INT PRIMARY KEY,
Title VARCHAR(100),
AuthorID INT,
Category VARCHAR(50),
Price INT,
Stock INT
);

CREATE TABLE Members(
MemberID INT PRIMARY KEY,
Name VARCHAR(50),
Email VARCHAR(50),
Phone VARCHAR(15),
Address VARCHAR(100)
);

CREATE TABLE Loans(
LoanID INT PRIMARY KEY,
BookID INT,
MemberID INT,
IssueDate DATE,
ReturnDate DATE,
Status VARCHAR(20)
);

CREATE TABLE Fines(
FineID INT PRIMARY KEY,
LoanID INT,
Amount INT,
PaymentStatus VARCHAR(20)
);

-- ================= INSERT DATA =================

INSERT INTO Authors VALUES
(1,'Chetan Bhagat','India'),
(2,'Dan Brown','USA'),
(3,'J K Rowling','UK'),
(4,'Amish Tripathi','India'),
(5,'Paulo Coelho','Brazil');

INSERT INTO Books VALUES
(101,'History of India',1,'History',400,3),
(102,'Inferno',2,'Thriller',600,10),
(103,'Harry Potter',3,'Fantasy',800,7),
(104,'Shiva Trilogy',4,'Mythology',500,2),
(105,'Alchemist',5,'Fiction',350,12);

INSERT INTO Members VALUES
(1,'Amit','amit@gmail.com','9876543210','Mumbai'),
(2,'Sara','sara@gmail.com','9123456780','Delhi'),
(3,'Ravi','ravi@gmail.com','9988776655','Pune'),
(4,'Neha','neha@gmail.com','9871234567','Nagpur'),
(5,'John','john@gmail.com','9012345678','Chennai');

INSERT INTO Loans VALUES
(1,101,1,'2024-03-01','2024-03-10','Returned'),
(2,102,2,'2024-03-05',NULL,'Pending'),
(3,103,1,'2024-03-07','2024-03-15','Returned'),
(4,104,3,'2024-03-10',NULL,'Pending'),
(5,105,4,'2024-03-12','2024-03-20','Returned');

INSERT INTO Fines VALUES
(1,2,200,'Unpaid'),
(2,4,150,'Unpaid'),
(3,1,50,'Paid'),
(4,3,0,'Paid'),
(5,5,0,'Paid');

-- ================= HASHTAG QUESTIONS =================

-- #1 Books in Science Fiction
SELECT * FROM Books WHERE Category='Science Fiction';

-- #2 Books stock less than 5
SELECT * FROM Books WHERE Stock < 5;

-- #3 Members with overdue books
SELECT Members.Name
FROM Members JOIN Loans
ON Members.MemberID=Loans.MemberID
WHERE ReturnDate IS NULL;

-- #4 Top 3 expensive books
SELECT * FROM Books ORDER BY Price DESC LIMIT 3;

-- #5 Authors from India
SELECT * FROM Authors WHERE Nationality='India';

-- #6 Books by Dan Brown
SELECT Title FROM Books
JOIN Authors ON Books.AuthorID=Authors.AuthorID
WHERE Authors.Name='Dan Brown';

-- #7 Total books per category
SELECT Category, COUNT(*) FROM Books GROUP BY Category;

-- #8 Members borrowed more than 5 books
SELECT MemberID, COUNT(*) total
FROM Loans GROUP BY MemberID HAVING total > 5;

-- #9 Loans returned
SELECT * FROM Loans WHERE Status='Returned';

-- #10 Members never borrowed
SELECT Name FROM Members
WHERE MemberID NOT IN (SELECT MemberID FROM Loans);

-- #11 Unpaid fines
SELECT * FROM Fines WHERE PaymentStatus='Unpaid';

-- #12 Total fines per member
SELECT MemberID, SUM(Amount)
FROM Loans JOIN Fines
ON Loans.LoanID=Fines.LoanID
GROUP BY MemberID;

-- #13 Books issued last month
SELECT * FROM Loans
WHERE IssueDate >= CURDATE()-INTERVAL 1 MONTH;

-- #14 Members borrowed Mythology books
SELECT DISTINCT Members.Name
FROM Members
JOIN Loans ON Members.MemberID=Loans.MemberID
JOIN Books ON Books.BookID=Loans.BookID
WHERE Category='Mythology';

-- #15 Authors with more than 3 books
SELECT Authors.Name, COUNT(*)
FROM Books JOIN Authors
ON Books.AuthorID=Authors.AuthorID
GROUP BY Authors.Name HAVING COUNT(*)>3;

-- #16 Books price between 200 and 500
SELECT * FROM Books WHERE Price BETWEEN 200 AND 500;

-- #17 Average fine amount
SELECT AVG(Amount) FROM Fines;

-- #18 Members phone starts with 9
SELECT * FROM Members WHERE Phone LIKE '9%';

-- #19 Loans with book & member
SELECT LoanID, Members.Name, Title
FROM Loans
JOIN Members ON Members.MemberID=Loans.MemberID
JOIN Books ON Books.BookID=Loans.BookID;

-- #20 Books title contains History
SELECT * FROM Books WHERE Title LIKE '%History%';

-- #21 Members with more than one unpaid fine
SELECT MemberID, COUNT(*)
FROM Loans JOIN Fines
ON Loans.LoanID=Fines.LoanID
WHERE PaymentStatus='Unpaid'
GROUP BY MemberID HAVING COUNT(*)>1;

-- #22 Books with no loans
SELECT Title FROM Books
WHERE BookID NOT IN (SELECT BookID FROM Loans);

-- #23 Most borrowed book
SELECT BookID, COUNT(*) total
FROM Loans GROUP BY BookID
ORDER BY total DESC LIMIT 1;

-- #24 Top 5 members by borrowings
SELECT MemberID, COUNT(*) total
FROM Loans GROUP BY MemberID
ORDER BY total DESC LIMIT 5;

-- #25 All book categories
SELECT DISTINCT Category FROM Books;

#SET 7 – Inventory Management System
CREATE DATABASE InventoryDB;
USE InventoryDB;

-- ================= TABLE CREATION =================

CREATE TABLE Suppliers(
SupplierID INT PRIMARY KEY,
SupplierName VARCHAR(50),
Contact VARCHAR(15),
City VARCHAR(50)
);

CREATE TABLE Categories(
CategoryID INT PRIMARY KEY,
CategoryName VARCHAR(50)
);

CREATE TABLE Products(
ProductID INT PRIMARY KEY,
ProductName VARCHAR(50),
CategoryID INT,
SupplierID INT,
Price INT,
Stock INT
);

CREATE TABLE Purchases(
PurchaseID INT PRIMARY KEY,
ProductID INT,
Quantity INT,
PurchaseDate DATE,
SupplierID INT
);

CREATE TABLE Sales(
SaleID INT PRIMARY KEY,
ProductID INT,
Quantity INT,
SaleDate DATE,
CustomerName VARCHAR(50)
);

-- ================= INSERT DATA =================

INSERT INTO Suppliers VALUES
(1,'ABC Traders','9811111111','Delhi'),
(2,'Global Supply','9822222222','Mumbai'),
(3,'Prime Wholesale','9833333333','Pune'),
(4,'Metro Distributors','9844444444','Delhi'),
(5,'City Suppliers','9855555555','Chennai');

INSERT INTO Categories VALUES
(1,'Electronics'),
(2,'Furniture'),
(3,'Stationery'),
(4,'Clothing'),
(5,'Grocery');

INSERT INTO Products VALUES
(101,'Laptop',1,1,60000,8),
(102,'Chair',2,2,3000,25),
(103,'Notebook',3,3,80,100),
(104,'T-Shirt',4,4,700,50),
(105,'Rice Bag',5,5,2500,12);

INSERT INTO Purchases VALUES
(1,101,5,'2024-03-01',1),
(2,102,20,'2024-03-05',2),
(3,103,200,'2024-03-07',3),
(4,104,40,'2024-03-10',4),
(5,105,15,'2024-03-12',5);

INSERT INTO Sales VALUES
(1,101,2,'2024-04-01','Amit'),
(2,102,5,'2024-04-02','Sara'),
(3,103,30,'2024-04-03','Ravi'),
(4,101,1,'2024-04-05','Neha'),
(5,105,4,'2024-04-06','John');



-- #1 Products stock below 10
SELECT * FROM Products WHERE Stock < 10;

-- #2 Top 5 expensive products
SELECT * FROM Products ORDER BY Price DESC LIMIT 5;

-- #3 Suppliers from Delhi
SELECT * FROM Suppliers WHERE City='Delhi';

-- #4 Products by supplier 1
SELECT ProductName FROM Products WHERE SupplierID=1;

-- #5 Count products per category
SELECT CategoryID, COUNT(*) FROM Products GROUP BY CategoryID;

-- #6 Total purchases for product 101
SELECT SUM(Quantity) FROM Purchases WHERE ProductID=101;

-- #7 Products never sold
SELECT ProductName FROM Products
WHERE ProductID NOT IN (SELECT ProductID FROM Sales);

-- #8 Sales last week
SELECT * FROM Sales
WHERE SaleDate >= CURDATE()-INTERVAL 7 DAY;

-- #9 Products with sales quantity above 50
SELECT ProductID, SUM(Quantity)
FROM Sales GROUP BY ProductID HAVING SUM(Quantity)>50;

-- #10 Suppliers who supplied more than 5 products
SELECT SupplierID, COUNT(*)
FROM Products GROUP BY SupplierID HAVING COUNT(*)>5;

-- #11 Avg price per category
SELECT CategoryID, AVG(Price)
FROM Products GROUP BY CategoryID;

-- #12 Top selling product
SELECT ProductID, SUM(Quantity) total
FROM Sales GROUP BY ProductID
ORDER BY total DESC LIMIT 1;

-- #13 Categories without products
SELECT CategoryName FROM Categories
WHERE CategoryID NOT IN (SELECT CategoryID FROM Products);

-- #14 All sales with product names
SELECT SaleID, ProductName
FROM Sales JOIN Products
ON Sales.ProductID=Products.ProductID;

-- #15 Purchases with supplier names
SELECT PurchaseID, SupplierName
FROM Purchases JOIN Suppliers
ON Purchases.SupplierID=Suppliers.SupplierID;

-- #16 Suppliers with no purchases
SELECT SupplierName FROM Suppliers
WHERE SupplierID NOT IN (SELECT SupplierID FROM Purchases);

-- #17 Most recent purchase per product
SELECT ProductID, MAX(PurchaseDate)
FROM Purchases GROUP BY ProductID;

-- #18 Customers bought more than 3 products
SELECT CustomerName, COUNT(*)
FROM Sales GROUP BY CustomerName HAVING COUNT(*)>3;

-- #19 Total stock value
SELECT SUM(Price*Stock) FROM Products;

-- #20 Product with max stock
SELECT * FROM Products ORDER BY Stock DESC LIMIT 1;

-- #21 Sales grouped by customer
SELECT CustomerName, SUM(Quantity)
FROM Sales GROUP BY CustomerName;

-- #22 Top 3 customers by sales value
SELECT CustomerName, SUM(Quantity*Price) value
FROM Sales JOIN Products
ON Sales.ProductID=Products.ProductID
GROUP BY CustomerName
ORDER BY value DESC LIMIT 3;

-- #23 Monthly sales totals
SELECT MONTH(SaleDate), SUM(Quantity)
FROM Sales GROUP BY MONTH(SaleDate);

-- #24 Products purchased but not sold
SELECT ProductName FROM Products
WHERE ProductID IN (SELECT ProductID FROM Purchases)
AND ProductID NOT IN (SELECT ProductID FROM Sales);

-- #25 Suppliers supplying multiple categories
SELECT SupplierID, COUNT(DISTINCT CategoryID)
FROM Products GROUP BY SupplierID HAVING COUNT(DISTINCT CategoryID)>1;

#SET 8 – Online Food Delivery System
CREATE DATABASE FoodDeliveryDB;
USE FoodDeliveryDB;

-- ================= TABLE CREATION =================

CREATE TABLE Restaurants(
RestaurantID INT PRIMARY KEY,
RestaurantName VARCHAR(50),
City VARCHAR(50),
Rating DECIMAL(2,1)
);

CREATE TABLE Customers(
CustomerID INT PRIMARY KEY,
Name VARCHAR(50),
Phone VARCHAR(15),
Address VARCHAR(100)
);

CREATE TABLE Menu(
ItemID INT PRIMARY KEY,
RestaurantID INT,
ItemName VARCHAR(50),
Price INT,
Category VARCHAR(30)
);

CREATE TABLE Orders(
OrderID INT PRIMARY KEY,
CustomerID INT,
OrderDate DATE,
Status VARCHAR(20)
);

CREATE TABLE OrderDetails(
DetailID INT PRIMARY KEY,
OrderID INT,
ItemID INT,
Quantity INT
);

-- ================= INSERT DATA =================

INSERT INTO Restaurants VALUES
(1,'Spice Hub','Mumbai',4.5),
(2,'Pizza Town','Delhi',4.2),
(3,'Burger Point','Pune',4.0),
(4,'South Express','Chennai',4.3),
(5,'Food Factory','Bangalore',3.9);

INSERT INTO Customers VALUES
(1,'Amit','9876543210','Mumbai'),
(2,'Sara','9123456780','Delhi'),
(3,'Ravi','9988776655','Pune'),
(4,'Neha','9871234567','Nagpur'),
(5,'John','9012345678','Chennai');

INSERT INTO Menu VALUES
(101,1,'Paneer Tikka',250,'Veg'),
(102,1,'Chicken Biryani',350,'NonVeg'),
(103,2,'Margherita Pizza',300,'Veg'),
(104,3,'Cheese Burger',200,'FastFood'),
(105,4,'Masala Dosa',150,'South');

INSERT INTO Orders VALUES
(1,1,'2024-04-01','Delivered'),
(2,2,'2024-04-02','Pending'),
(3,3,'2024-04-03','Delivered'),
(4,1,'2024-04-04','Cancelled'),
(5,5,'2024-04-05','Delivered');

INSERT INTO OrderDetails VALUES
(1,1,101,2),
(2,1,102,1),
(3,2,103,3),
(4,3,104,2),
(5,5,105,4);



-- #1 Restaurants in Mumbai
SELECT * FROM Restaurants WHERE City='Mumbai';

-- #2 Menu items price above 250
SELECT * FROM Menu WHERE Price>250;

-- #3 Orders delivered
SELECT * FROM Orders WHERE Status='Delivered';

-- #4 Customers who placed orders
SELECT DISTINCT Customers.Name
FROM Customers JOIN Orders
ON Customers.CustomerID=Orders.CustomerID;

-- #5 Total items per category
SELECT Category, COUNT(*) FROM Menu GROUP BY Category;

-- #6 Top 3 expensive items
SELECT * FROM Menu ORDER BY Price DESC LIMIT 3;

-- #7 Orders last week
SELECT * FROM Orders
WHERE OrderDate>=CURDATE()-INTERVAL 7 DAY;

-- #8 Restaurants rating above 4
SELECT * FROM Restaurants WHERE Rating>4;

-- #9 Items never ordered
SELECT ItemName FROM Menu
WHERE ItemID NOT IN (SELECT ItemID FROM OrderDetails);

-- #10 Total quantity per order
SELECT OrderID, SUM(Quantity)
FROM OrderDetails GROUP BY OrderID;

-- #11 Customers with more than 2 orders
SELECT CustomerID, COUNT(*) total
FROM Orders GROUP BY CustomerID HAVING total>2;

-- #12 Orders with customer names
SELECT OrderID, Customers.Name
FROM Orders JOIN Customers
ON Orders.CustomerID=Customers.CustomerID;

-- #13 Veg items
SELECT * FROM Menu WHERE Category='Veg';

-- #14 Revenue per item
SELECT ItemID, SUM(Quantity*Price)
FROM OrderDetails JOIN Menu
ON OrderDetails.ItemID=Menu.ItemID
GROUP BY ItemID;

-- #15 Restaurants with no orders
SELECT RestaurantName FROM Restaurants
WHERE RestaurantID NOT IN (
SELECT RestaurantID FROM Menu
JOIN OrderDetails ON Menu.ItemID=OrderDetails.ItemID);

-- #16 Average item price
SELECT AVG(Price) FROM Menu;

-- #17 Customers from Delhi
SELECT * FROM Customers WHERE Address='Delhi';

-- #18 Most ordered item
SELECT ItemID, SUM(Quantity) total
FROM OrderDetails GROUP BY ItemID
ORDER BY total DESC LIMIT 1;

-- #19 Orders sorted by date
SELECT * FROM Orders ORDER BY OrderDate;

-- #20 FastFood items
SELECT * FROM Menu WHERE Category='FastFood';

-- #21 Total orders per status
SELECT Status, COUNT(*) FROM Orders GROUP BY Status;

-- #22 Orders with item names
SELECT Orders.OrderID, ItemName
FROM Orders
JOIN OrderDetails ON Orders.OrderID=OrderDetails.OrderID
JOIN Menu ON Menu.ItemID=OrderDetails.ItemID;

-- #23 Customers never ordered
SELECT Name FROM Customers
WHERE CustomerID NOT IN (SELECT CustomerID FROM Orders);

-- #24 Monthly order count
SELECT MONTH(OrderDate), COUNT(*)
FROM Orders GROUP BY MONTH(OrderDate);

-- #25 Distinct restaurant cities
SELECT DISTINCT City FROM Restaurants;

#SET 9 – Cinema Ticket Booking System
CREATE DATABASE CinemaDB;
USE CinemaDB;

-- ================= TABLE CREATION =================

CREATE TABLE Movies(
MovieID INT PRIMARY KEY,
Title VARCHAR(50),
Genre VARCHAR(30),
Duration INT,
Rating DECIMAL(2,1)
);

CREATE TABLE Theatres(
TheatreID INT PRIMARY KEY,
TheatreName VARCHAR(50),
City VARCHAR(50)
);

CREATE TABLE Shows(
ShowID INT PRIMARY KEY,
MovieID INT,
TheatreID INT,
ShowDate DATE,
ShowTime TIME,
Price INT
);

CREATE TABLE Customers(
CustomerID INT PRIMARY KEY,
Name VARCHAR(50),
Phone VARCHAR(15),
City VARCHAR(50)
);

CREATE TABLE Bookings(
BookingID INT PRIMARY KEY,
ShowID INT,
CustomerID INT,
Seats INT,
Status VARCHAR(20)
);

-- ================= INSERT DATA =================

INSERT INTO Movies VALUES
(1,'Jawan','Action',165,4.5),
(2,'Pathaan','Action',150,4.2),
(3,'Avatar','SciFi',180,4.8),
(4,'KGF','Drama',170,4.4),
(5,'Frozen','Animation',120,4.0);

INSERT INTO Theatres VALUES
(1,'PVR','Mumbai'),
(2,'INOX','Delhi'),
(3,'Cinepolis','Pune'),
(4,'Miraj','Nagpur'),
(5,'SPI','Chennai');

INSERT INTO Shows VALUES
(101,1,1,'2024-04-01','18:00',300),
(102,2,2,'2024-04-02','20:00',280),
(103,3,3,'2024-04-03','17:00',350),
(104,4,1,'2024-04-04','21:00',320),
(105,5,5,'2024-04-05','16:00',250);

INSERT INTO Customers VALUES
(1,'Amit','9876543210','Mumbai'),
(2,'Sara','9123456780','Delhi'),
(3,'Ravi','9988776655','Pune'),
(4,'Neha','9871234567','Nagpur'),
(5,'John','9012345678','Chennai');

INSERT INTO Bookings VALUES
(1,101,1,3,'Confirmed'),
(2,102,2,2,'Pending'),
(3,103,3,4,'Confirmed'),
(4,104,1,1,'Cancelled'),
(5,105,5,5,'Confirmed');



-- #1 Action movies
SELECT * FROM Movies WHERE Genre='Action';

-- #2 Movies rating above 4.5
SELECT * FROM Movies WHERE Rating>4.5;

-- #3 Shows in Mumbai
SELECT * FROM Shows
JOIN Theatres ON Shows.TheatreID=Theatres.TheatreID
WHERE City='Mumbai';

-- #4 Customers who booked tickets
SELECT DISTINCT Customers.Name
FROM Customers JOIN Bookings
ON Customers.CustomerID=Bookings.CustomerID;

-- #5 Total seats per booking
SELECT BookingID, Seats FROM Bookings;

-- #6 Top 3 expensive shows
SELECT * FROM Shows ORDER BY Price DESC LIMIT 3;

-- #7 Bookings confirmed
SELECT * FROM Bookings WHERE Status='Confirmed';

-- #8 Movies longer than 160 minutes
SELECT * FROM Movies WHERE Duration>160;

-- #9 Shows never booked
SELECT ShowID FROM Shows
WHERE ShowID NOT IN (SELECT ShowID FROM Bookings);

-- #10 Total bookings per movie
SELECT MovieID, COUNT(*)
FROM Shows JOIN Bookings
ON Shows.ShowID=Bookings.ShowID
GROUP BY MovieID;

-- #11 Customers with more than 1 booking
SELECT CustomerID, COUNT(*) total
FROM Bookings GROUP BY CustomerID HAVING total>1;

-- #12 Shows with movie titles
SELECT ShowID, Title
FROM Shows JOIN Movies
ON Shows.MovieID=Movies.MovieID;

-- #13 Average show price
SELECT AVG(Price) FROM Shows;

-- #14 Revenue per show
SELECT ShowID, SUM(Seats*Price)
FROM Bookings JOIN Shows
ON Bookings.ShowID=Shows.ShowID
GROUP BY ShowID;

-- #15 Theatres with no shows
SELECT TheatreName FROM Theatres
WHERE TheatreID NOT IN (SELECT TheatreID FROM Shows);

-- #16 Customers from Delhi
SELECT * FROM Customers WHERE City='Delhi';

-- #17 Most booked movie
SELECT MovieID, COUNT(*) total
FROM Shows JOIN Bookings
ON Shows.ShowID=Bookings.ShowID
GROUP BY MovieID
ORDER BY total DESC LIMIT 1;

-- #18 Bookings sorted by seats
SELECT * FROM Bookings ORDER BY Seats DESC;

-- #19 Total seats booked per customer
SELECT CustomerID, SUM(Seats)
FROM Bookings GROUP BY CustomerID;

-- #20 Animation movies
SELECT * FROM Movies WHERE Genre='Animation';

-- #21 Booking status count
SELECT Status, COUNT(*) FROM Bookings GROUP BY Status;

-- #22 Shows with theatre names
SELECT ShowID, TheatreName
FROM Shows JOIN Theatres
ON Shows.TheatreID=Theatres.TheatreID;

-- #23 Customers never booked
SELECT Name FROM Customers
WHERE CustomerID NOT IN (SELECT CustomerID FROM Bookings);

-- #24 Monthly shows count
SELECT MONTH(ShowDate), COUNT(*)
FROM Shows GROUP BY MONTH(ShowDate);

-- #25 Distinct theatre cities
SELECT DISTINCT City FROM Theatres;

#SET 10 – E-Learning Platform
CREATE DATABASE ElearningDB;
USE ElearningDB;


-- ================= TABLE CREATION =================

CREATE TABLE Instructors(
InstructorID INT PRIMARY KEY,
Name VARCHAR(50),
Expertise VARCHAR(50)
);

CREATE TABLE Courses(
CourseID INT PRIMARY KEY,
Title VARCHAR(100),
InstructorID INT,
Category VARCHAR(50),
Price INT
);

CREATE TABLE Students(
StudentID INT PRIMARY KEY,
Name VARCHAR(50),
Email VARCHAR(50),
City VARCHAR(50)
);

CREATE TABLE Enrollments(
EnrollmentID INT PRIMARY KEY,
CourseID INT,
StudentID INT,
EnrollDate DATE,
Status VARCHAR(20)
);

CREATE TABLE Payments(
PaymentID INT PRIMARY KEY,
EnrollmentID INT,
Amount INT,
PaymentDate DATE,
Method VARCHAR(20)
);

-- ================= INSERT DATA =================

INSERT INTO Instructors VALUES
(1,'Rahul','Data Science'),
(2,'Sneha','Web Development'),
(3,'John','AI'),
(4,'Priya','Finance'),
(5,'Amit','Marketing');

INSERT INTO Courses VALUES
(101,'Python Basics',1,'Programming',3000),
(102,'Full Stack Web',2,'Programming',5000),
(103,'Machine Learning',3,'AI',7000),
(104,'Stock Market',4,'Finance',4000),
(105,'Digital Marketing',5,'Business',2500);

INSERT INTO Students VALUES
(1,'Arjun','arjun@gmail.com','Mumbai'),
(2,'Sara','sara@gmail.com','Delhi'),
(3,'Ravi','ravi@gmail.com','Pune'),
(4,'Neha','neha@gmail.com','Nagpur'),
(5,'John','john@gmail.com','Chennai');

INSERT INTO Enrollments VALUES
(1,101,1,'2024-04-01','Active'),
(2,102,2,'2024-04-02','Completed'),
(3,103,3,'2024-04-03','Active'),
(4,104,1,'2024-04-04','Dropped'),
(5,105,5,'2024-04-05','Active');

INSERT INTO Payments VALUES
(1,1,3000,'2024-04-01','UPI'),
(2,2,5000,'2024-04-02','Card'),
(3,3,7000,'2024-04-03','NetBanking'),
(4,4,4000,'2024-04-04','UPI'),
(5,5,2500,'2024-04-05','Cash');



-- #1 Programming courses
SELECT * FROM Courses WHERE Category='Programming';

-- #2 Courses price above 4000
SELECT * FROM Courses WHERE Price>4000;

-- #3 Students from Mumbai
SELECT * FROM Students WHERE City='Mumbai';

-- #4 Active enrollments
SELECT * FROM Enrollments WHERE Status='Active';

-- #5 Total students per course
SELECT CourseID, COUNT(*) FROM Enrollments GROUP BY CourseID;

-- #6 Top 3 expensive courses
SELECT * FROM Courses ORDER BY Price DESC LIMIT 3;

-- #7 Instructors teaching AI
SELECT * FROM Instructors WHERE Expertise='AI';

-- #8 Students enrolled in more than 1 course
SELECT StudentID, COUNT(*) total
FROM Enrollments GROUP BY StudentID HAVING total>1;

-- #9 Courses never enrolled
SELECT Title FROM Courses
WHERE CourseID NOT IN (SELECT CourseID FROM Enrollments);

-- #10 Total revenue per course
SELECT CourseID, SUM(Amount)
FROM Enrollments JOIN Payments
ON Enrollments.EnrollmentID=Payments.EnrollmentID
GROUP BY CourseID;

-- #11 Completed enrollments
SELECT * FROM Enrollments WHERE Status='Completed';

-- #12 Students with course titles
SELECT Students.Name, Title
FROM Students
JOIN Enrollments ON Students.StudentID=Enrollments.StudentID
JOIN Courses ON Courses.CourseID=Enrollments.CourseID;

-- #13 Average course price
SELECT AVG(Price) FROM Courses;

-- #14 Payment methods used
SELECT DISTINCT Method FROM Payments;

-- #15 Instructors with no courses
SELECT Name FROM Instructors
WHERE InstructorID NOT IN (SELECT InstructorID FROM Courses);

-- #16 Students never enrolled
SELECT Name FROM Students
WHERE StudentID NOT IN (SELECT StudentID FROM Enrollments);

-- #17 Most popular course
SELECT CourseID, COUNT(*) total
FROM Enrollments GROUP BY CourseID
ORDER BY total DESC LIMIT 1;

-- #18 Enrollments sorted by date
SELECT * FROM Enrollments ORDER BY EnrollDate;

-- #19 Total spending per student
SELECT StudentID, SUM(Amount)
FROM Enrollments JOIN Payments
ON Enrollments.EnrollmentID=Payments.EnrollmentID
GROUP BY StudentID;

-- #20 Finance courses
SELECT * FROM Courses WHERE Category='Finance';

-- #21 Enrollment status count
SELECT Status, COUNT(*) FROM Enrollments GROUP BY Status;

-- #22 Courses with instructor names
SELECT Title, Instructors.Name
FROM Courses JOIN Instructors
ON Courses.InstructorID=Instructors.InstructorID;

-- #23 Monthly enrollments count
SELECT MONTH(EnrollDate), COUNT(*)
FROM Enrollments GROUP BY MONTH(EnrollDate);

-- #24 Students enrolled in AI courses
SELECT DISTINCT Students.Name
FROM Students
JOIN Enrollments ON Students.StudentID=Enrollments.StudentID
JOIN Courses ON Courses.CourseID=Enrollments.CourseID
WHERE Category='AI';

-- #25 Distinct course categories
SELECT DISTINCT Category FROM Courses;










