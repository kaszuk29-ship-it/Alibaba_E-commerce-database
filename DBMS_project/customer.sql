CREATE TABLE Customer (
    Customer_ID NUMBER(5) PRIMARY KEY,
    Business_Name VARCHAR2(50) NOT NULL,
    Contact_No NUMBER(10) UNIQUE,
    Email VARCHAR2(50) UNIQUE,
    Country VARCHAR2(30),
    Address VARCHAR2(50)
);

INSERT INTO Customer VALUES (101, 'ABC Traders', 9876543210, 'abc@gmail.com', 'India', 'Chennai');

INSERT INTO Customer VALUES (102, 'Tech Solutions', 9876543211, 'tech@gmail.com', 'India', 'Bangalore');

INSERT INTO Customer VALUES (103, 'Green Mart', 9876543212, 'green@gmail.com', 'India', 'Hyderabad');

INSERT INTO Customer VALUES (104, 'Royal Exports', 9876543213, 'royal@gmail.com', 'India', 'Mumbai');

INSERT INTO Customer VALUES (105, 'Sun Enterprises', 9876543214, 'sun@gmail.com', 'India', 'Delhi');

INSERT INTO Customer VALUES (106, 'Global Imports', 9876543215, 'global@gmail.com', 'USA', 'New York');

INSERT INTO Customer VALUES (107, 'City Wholesale', 9876543216, 'city@gmail.com', 'UK', 'London');

INSERT INTO Customer VALUES (108, 'Prime Suppliers', 9876543217, 'prime@gmail.com', 'Singapore', 'Singapore');

INSERT INTO Customer VALUES (109, 'Future Electronics', 9876543218, 'future@gmail.com', 'Canada', 'Toronto');

INSERT INTO Customer VALUES (110, 'Smart Business', 9876543219, 'smart@gmail.com', 'Australia', 'Sydney');

SELECT * FROM Customer;

UPDATE Customer
SET Country = 'UAE',
    Address = 'Dubai'
WHERE Customer_ID = 105;

SELECT * FROM Customer;

UPDATE Customer
SET Business_Name = 'Sun Global Enterprises'
WHERE Customer_ID = 105;

SELECT * FROM Customer;

DELETE FROM Customer
WHERE Customer_ID = 110;

SELECT * FROM Customer;