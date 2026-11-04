SELECT COUNT(Order_ID) AS Total_Orders
FROM Orders;

TOTAL_ORDERS
------------
10

SELECT SUM(Total_Amount) AS Total_Sales
FROM Orders;

TOTAL_SALES
-----------
245350

SELECT AVG(Total_Amount) AS Average_Order_Amount
FROM Orders;

AVERAGE_ORDER_AMOUNT
--------------------
24535

SELECT MIN(Total_Amount) AS Minimum_Order
FROM Orders;

MINIMUM_ORDER
-------------
9800

SELECT MAX(Total_Amount) AS Maximum_Order
FROM Orders;

MAXIMUM_ORDER
-------------
45000

SELECT
    COUNT(Order_ID) AS Total_Orders,
    SUM(Total_Amount) AS Total_Sales,
    AVG(Total_Amount) AS Average_Order_Amount,
    MIN(Total_Amount) AS Minimum_Order,
    MAX(Total_Amount) AS Maximum_Order
FROM Orders;

TOTAL_ORDERS TOTAL_SALES AVERAGE_ORDER_AMOUNT MINIMUM_ORDER MAXIMUM_ORDER
------------ ----------- -------------------- ------------- -------------
10            245350                24535          9800         45000

SQL> SELECT
  2      c.Customer_ID,
  3      c.Business_Name,
  4      c.Country,
  5      COUNT(o.Order_ID)   AS Total_Orders,
  6      SUM(o.Total_Amount) AS Total_Purchase
  7  FROM Customer c
  8  JOIN Orders o
  9      ON c.Customer_ID = o.Customer_ID
 10  GROUP BY c.Customer_ID, c.Business_Name, c.Country
 11  ORDER BY Total_Purchase DESC;

CUSTOMER_ID BUSINESS_NAME
----------- --------------------------------------------------
COUNTRY                        TOTAL_ORDERS TOTAL_PURCHASE
------------------------------ ------------ --------------
        105 Sun Enterprises
India                                     2          73900

        103 Green Mart
India                                     2          68500

        102 Tech Solutions
India                                     2          40000


CUSTOMER_ID BUSINESS_NAME
----------- --------------------------------------------------
COUNTRY                        TOTAL_ORDERS TOTAL_PURCHASE
------------------------------ ------------ --------------
        101 ABC Traders
India                                     2          34800

        104 Royal Exports
India                                     2          28150
SQL> SELECT
  2      c.Customer_ID,
  3      c.Business_Name,
  4      SUM(o.Total_Amount) AS Total_Purchase
  5  FROM Customer c
  6  JOIN Orders o
  7      ON c.Customer_ID = o.Customer_ID
  8  GROUP BY c.Customer_ID, c.Business_Name
  9  ORDER BY Total_Purchase DESC
 10  FETCH FIRST 5 ROWS ONLY;

CUSTOMER_ID BUSINESS_NAME                                      TOTAL_PURCHASE
----------- -------------------------------------------------- --------------
        105 Sun Enterprises                                             73900
        103 Green Mart                                                  68500
        102 Tech Solutions                                              40000
        101 ABC Traders                                                 34800
        104 Royal Exports                                               28150

        SELECT
  2      p.Product_ID,
  3      p.Product_Name,
  4      SUM(od.Quantity)                 AS Total_Quantity_Sold,
  5      SUM(od.Quantity * od.Unit_Price) AS Total_Sales
  6  FROM Product p
  7  JOIN Order_Details od
  8      ON p.Product_ID = od.Product_ID
  9  GROUP BY p.Product_ID, p.Product_Name
 10  ORDER BY Total_Quantity_Sold DESC;

PRODUCT_ID PRODUCT_NAME
---------- --------------------------------------------------
TOTAL_QUANTITY_SOLD TOTAL_SALES
------------------- -----------
       102 Bluetooth Speaker
                  5        1500

       101 JBL Earbuds
                  1        1500

SELECT
  2      cat.Category_ID,
  3      cat.Category_name,
  4      SUM(od.Quantity)                 AS Total_Quantity_Sold,
  5      SUM(od.Quantity * od.Unit_Price) AS Total_Sales
  6  FROM Category cat
  7  JOIN Product p
  8      ON cat.Category_ID = p.Category_ID
  9  JOIN Order_Details od
 10      ON p.Product_ID = od.Product_ID
 11  GROUP BY cat.Category_ID, cat.Category_name
 12  ORDER BY Total_Sales DESC;


CATEGORY_ID CATEGORY_NAME                            TOTAL_QUANTITY_SOLD
----------- ---------------------------------------- -------------------
TOTAL_SALES
-----------
          1 Electronics                                                6
       3000

 SELECT
  2      c.Business_Name,
  3      o.Order_ID,
  4      o.Order_Date,
  5      p.Product_Name,
  6      cat.Category_name,
  7      od.Quantity,
  8      od.Unit_Price,
  9      od.Quantity * od.Unit_Price AS Line_Total
 10  FROM Customer c
 11  JOIN Orders o
 12      ON c.Customer_ID = o.Customer_ID
 13  JOIN Order_Details od
 14      ON o.Order_ID = od.Order_ID
 15  JOIN Product p
 16      ON od.Product_ID = p.Product_ID
 17  JOIN Category cat
 18      ON p.Category_ID = cat.Category_ID
 19  ORDER BY o.Order_ID;

BUSINESS_NAME                                        ORDER_ID ORDER_DAT
-------------------------------------------------- ---------- ---------
PRODUCT_NAME
--------------------------------------------------
CATEGORY_NAME                              QUANTITY UNIT_PRICE LINE_TOTAL
---------------------------------------- ---------- ---------- ----------
Sunrise Traders                                          1001 15-JAN-26
JBL Earbuds
Electronics                                       1       1500       1500

Sunrise Traders                                          1001 15-JAN-26
Bluetooth Speaker
Electronics                                       3        300        900

BUSINESS_NAME                                        ORDER_ID ORDER_DAT
-------------------------------------------------- ---------- ---------
PRODUCT_NAME
--------------------------------------------------
CATEGORY_NAME                              QUANTITY UNIT_PRICE LINE_TOTAL
---------------------------------------- ---------- ---------- ----------

Global Mart                                              1002 10-FEB-26
Bluetooth Speaker
Electronics                                       2        300        600
