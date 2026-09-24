CREATE TABLE Orders (
    Order_ID NUMBER PRIMARY KEY,
    Customer_ID NUMBER,
    Order_Date DATE,
    Total_Amount NUMBER(10,2)
);


INSERT INTO Orders VALUES (1001, 201, TO_DATE('01-09-2026','DD-MM-YYYY'), 25000);
INSERT INTO Orders VALUES (1002, 202, TO_DATE('02-09-2026','DD-MM-YYYY'), 18500);
INSERT INTO Orders VALUES (1003, 203, TO_DATE('03-09-2026','DD-MM-YYYY'), 32000);
INSERT INTO Orders VALUES (1004, 204, TO_DATE('04-09-2026','DD-MM-YYYY'), 12750);
INSERT INTO Orders VALUES (1005, 205, TO_DATE('05-09-2026','DD-MM-YYYY'), 45000);
INSERT INTO Orders VALUES (1006, 206, TO_DATE('06-09-2026','DD-MM-YYYY'), 9800);
INSERT INTO Orders VALUES (1007, 207, TO_DATE('07-09-2026','DD-MM-YYYY'), 21500);
INSERT INTO Orders VALUES (1008, 208, TO_DATE('08-09-2026','DD-MM-YYYY'), 36500);
INSERT INTO Orders VALUES (1009, 209, TO_DATE('09-09-2026','DD-MM-YYYY'), 15400);
INSERT INTO Orders VALUES (1010, 210, TO_DATE('10-09-2026','DD-MM-YYYY'), 28900);

commit;

select*from orders;

UPDATE Orders
SET Total_Amount = 35000
WHERE Order_ID = 1007;

SELECT * FROM Orders
WHERE Order_ID = 1007;

UPDATE Orders
SET Order_Date = TO_DATE('29-04-2026','DD-MM-YYYY')
WHERE Order_ID = 1005;

SELECT * FROM Orders
WHERE Order_ID = 1005;

SELECT O.Order_ID,
       O.Customer_ID,
       O.Order_Date,
       O.Total_Amount,
       D.Product_ID,
       D.Quantity,
       D.Unit_Price
FROM Orders O
JOIN Order_Details D
ON O.Order_ID = D.Order_ID;
COMMIT;