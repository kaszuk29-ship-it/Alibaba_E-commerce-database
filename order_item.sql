CREATE TABLE Order_Details (
    Order_Detail_ID NUMBER PRIMARY KEY,
    Order_ID NUMBER,
    Product_ID NUMBER,
    Quantity NUMBER,
    Unit_Price NUMBER(10,2)
);

INSERT INTO Order_Details VALUES (101, 1001, 301, 5, 5000);
INSERT INTO Order_Details VALUES (102, 1002, 302, 10, 1850);
INSERT INTO Order_Details VALUES (103, 1003, 303, 8, 4000);
INSERT INTO Order_Details VALUES (104, 1004, 304, 15, 850);
INSERT INTO Order_Details VALUES (105, 1005, 305, 10, 4500);
INSERT INTO Order_Details VALUES (106, 1006, 306, 7, 1400);
INSERT INTO Order_Details VALUES (107, 1007, 307, 5, 4300);
INSERT INTO Order_Details VALUES (108, 1008, 308, 10, 3650);
INSERT INTO Order_Details VALUES (109, 1009, 309, 7, 2200);
INSERT INTO Order_Details VALUES (110, 1010, 310, 17, 1700);

commit;

UPDATE Order_Details
SET Quantity = 12,
    Unit_Price = 900
WHERE Order_Detail_ID = 4;

SELECT * FROM Order_Details
WHERE Order_Detail_ID = 4;

SELECT *
FROM Orders
WHERE Customer_ID = 201;
