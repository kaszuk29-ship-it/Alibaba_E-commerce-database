SQL> SELECT Order_ID, Customer_ID, Total_Amount
  2  FROM Orders
  3  WHERE Total_Amount > (SELECT AVG(Total_Amount) FROM Orders);

  ORDER_ID CUSTOMER_ID TOTAL_AMOUNT
---------- ----------- ------------
      1003         203        32000
      1004         204        12750
      1005         205        45000
      1007         207        21500
      1008         208        36500
      1009         209        15400
      1010         210        28900

7 rows selected.
SQL> SELECT Product_ID, Product_Name, Price
  2  FROM Product
  3  WHERE Price > (SELECT AVG(Price) FROM Product);

PRODUCT_ID PRODUCT_NAME                                            PRICE
---------- -------------------------------------------------- ----------
       101 JBL Earbuds                                              2499
       102 Bluetooth Speaker                                        3999
       103 Wireless Headphones                                      5999
       108 Mixer Grinder                                            3499
       111 JBL Earbuds                                              2499
       112 Bluetooth Speaker                                        3999
       113 Wireless Headphones                                      5999
       118 Mixer Grinder                                            3499

8 rows selected.
SQL> SELECT Product_ID, Product_Name, Price
  2  FROM Product
  3  WHERE Price < (SELECT AVG(Price) FROM Product);

PRODUCT_ID PRODUCT_NAME                                            PRICE
---------- -------------------------------------------------- ----------
       104 Cotton Shirt                                              999
       105 Denim Jeans                                              1499
       106 Python Programming Book                                   699
       107 DBMS Fundamentals                                         799
       109 Electric Kettle                                          1999
       110 Football                                                  899
       114 Cotton Shirt                                              999
       115 Denim Jeans                                              1499
       116 Python Programming Book                                   699
       117 DBMS Fundamentals                                         799
       119 Electric Kettle                                          1999

PRODUCT_ID PRODUCT_NAME                                            PRICE
---------- -------------------------------------------------- ----------
       120 Football                                                  899

12 rows selected.

SQL> SELECT Customer_ID, SUM(Total_Amount) AS Total_Purchase
  2  FROM Orders
  3  GROUP BY Customer_ID;

CUSTOMER_ID TOTAL_PURCHASE
----------- --------------
        203          32000
        204          12750
        205          45000
        206           9800
        207          21500
        208          36500
        209          15400
        210          28900
          1          11400
          2           4500

10 rows selected.
SQL> SELECT MAX(Total_Purchase) AS Max_Purchase
  2  FROM (
  3      SELECT Customer_ID, SUM(Total_Amount) AS Total_Purchase
  4      FROM Orders
  5      GROUP BY Customer_ID
  6  ) customer_totals;

MAX_PURCHASE
------------
       45000

SELECT c.Customer_ID, c.Business_Name, SUM(o.Total_Amount) AS Total_Purchase
  2  FROM Customer c
  3  JOIN Orders o ON c.Customer_ID = o.Customer_ID
  4  GROUP BY c.Customer_ID, c.Business_Name
  5  HAVING SUM(o.Total_Amount) = (
  6      SELECT MAX(Total_Purchase)
  7      FROM (
  8          SELECT SUM(Total_Amount) AS Total_Purchase
  9          FROM Orders
 10          GROUP BY Customer_ID
 11      ) customer_totals
 12  );

CUSTOMER_ID BUSINESS_NAME                                      TOTAL_PURCHASE
----------- -------------------------------------------------- --------------
        205 Sun Enterprises                                             45000

SQL> SELECT c.Customer_ID,
  2         c.Business_Name,
  3         o.Order_ID,
  4         o.Total_Amount
  5  FROM Customer c
  6  JOIN Orders o ON c.Customer_ID = o.Customer_ID
  7  WHERE o.Total_Amount > (SELECT AVG(Total_Amount) FROM Orders)
  8  ORDER BY o.Total_Amount DESC;

CUSTOMER_ID BUSINESS_NAME                                        ORDER_ID
----------- -------------------------------------------------- ----------
TOTAL_AMOUNT
------------
        205 Sun Enterprises                                          1005
       45000

        208 Prime Suppliers                                          1008
       36500

        203 Green Mart                                               1003
       32000


CUSTOMER_ID BUSINESS_NAME                                        ORDER_ID
----------- -------------------------------------------------- ----------
TOTAL_AMOUNT
------------
        210 Smart Business                                           1010
       28900

        207 City Wholesale                                           1007
       21500

        209 Future Electronics                                       1009
       15400


CUSTOMER_ID BUSINESS_NAME                                        ORDER_ID
----------- -------------------------------------------------- ----------
TOTAL_AMOUNT
------------
        204 Royal Exports                                            1004
       12750


7 rows selected.

SQL> SELECT p.Product_ID, p.Product_Name, SUM(od.Quantity * od.Unit_Price) AS Total_Sales
  2  FROM Product p
  3  JOIN Order_Details od ON p.Product_ID = od.Product_ID
  4  GROUP BY p.Product_ID, p.Product_Name
  5  HAVING SUM(od.Quantity * od.Unit_Price) > (
  6      SELECT AVG(Product_Sales)
  7      FROM (
  8          SELECT SUM(Quantity * Unit_Price) AS Product_Sales
  9          FROM Order_Details
 10          GROUP BY Product_ID
 11      ) product_totals
 12  )
 13  ORDER BY Total_Sales DESC;

PRODUCT_ID PRODUCT_NAME                                       TOTAL_SALES
---------- -------------------------------------------------- -----------
       105 Denim Jeans                                              45000
       108 Mixer Grinder                                            36500
       103 Wireless Headphones                                      32000
       110 Football                                                 28900
       101 JBL Earbuds                                              26500

SQL> SELECT c.Customer_ID,
  2         c.Business_Name,
  3         COUNT(o.Order_ID)   AS Total_Orders,
  4         SUM(o.Total_Amount) AS Total_Purchase,
  5         AVG(o.Total_Amount) AS Average_Order_Value
  6  FROM Customer c
  7  JOIN Orders o ON c.Customer_ID = o.Customer_ID
  8  GROUP BY c.Customer_ID, c.Business_Name
  9  ORDER BY Total_Purchase DESC;

CUSTOMER_ID BUSINESS_NAME                                      TOTAL_ORDERS
----------- -------------------------------------------------- ------------
TOTAL_PURCHASE AVERAGE_ORDER_VALUE
-------------- -------------------
        205 Sun Enterprises                                               1
         45000               45000

        208 Prime Suppliers                                               1
         36500               36500

        203 Green Mart                                                    1
         32000               32000


CUSTOMER_ID BUSINESS_NAME                                      TOTAL_ORDERS
----------- -------------------------------------------------- ------------
TOTAL_PURCHASE AVERAGE_ORDER_VALUE
-------------- -------------------
        210 Smart Business                                                1
         28900               28900

        207 City Wholesale                                                1
         21500               21500

        209 Future Electronics                                            1
         15400               15400


CUSTOMER_ID BUSINESS_NAME                                      TOTAL_ORDERS
----------- -------------------------------------------------- ------------
TOTAL_PURCHASE AVERAGE_ORDER_VALUE
-------------- -------------------
        204 Royal Exports                                                 1
         12750               12750

        206 Global Imports                                                1
          9800                9800


8 rows selected.

SQL> SELECT p.Product_ID,
  2         p.Product_Name,
  3         COUNT(od.Order_ID)               AS Number_of_Orders,
  4         SUM(od.Quantity)                 AS Total_Quantity_Sold,
  5         SUM(od.Quantity * od.Unit_Price) AS Total_Sales,
  6         AVG(od.Unit_Price)               AS Average_Price
  7  FROM Product p
  8  JOIN Order_Details od ON p.Product_ID = od.Product_ID
  9  GROUP BY p.Product_ID, p.Product_Name
 10  ORDER BY Total_Sales DESC;

PRODUCT_ID PRODUCT_NAME                                       NUMBER_OF_ORDERS
---------- -------------------------------------------------- ----------------
TOTAL_QUANTITY_SOLD TOTAL_SALES AVERAGE_PRICE
------------------- ----------- -------------
       105 Denim Jeans                                                       1
                 10       45000          4500

       108 Mixer Grinder                                                     1
                 10       36500          3650

       103 Wireless Headphones                                               1
                  8       32000          4000


PRODUCT_ID PRODUCT_NAME                                       NUMBER_OF_ORDERS
---------- -------------------------------------------------- ----------------
TOTAL_QUANTITY_SOLD TOTAL_SALES AVERAGE_PRICE
------------------- ----------- -------------
       110 Football                                                          1
                 17       28900          1700

       101 JBL Earbuds                                                       2
                  6       26500          3250

       107 DBMS Fundamentals                                                 1
                  5       21500          4300


PRODUCT_ID PRODUCT_NAME                                       NUMBER_OF_ORDERS
---------- -------------------------------------------------- ----------------
TOTAL_QUANTITY_SOLD TOTAL_SALES AVERAGE_PRICE
------------------- ----------- -------------
       102 Bluetooth Speaker                                                 3
                 15       20000    816.666667

       109 Electric Kettle                                                   1
                  7       15400          2200

       104 Cotton Shirt                                                      1
                 15       12750           850


PRODUCT_ID PRODUCT_NAME                                       NUMBER_OF_ORDERS
---------- -------------------------------------------------- ----------------
TOTAL_QUANTITY_SOLD TOTAL_SALES AVERAGE_PRICE
------------------- ----------- -------------
       106 Python Programming Book                                           1
                  7        9800          1400


10 rows selected.

SQL> SELECT cat.Category_ID,
  2         cat.Category_Name,
  3         COUNT(DISTINCT od.Order_ID)      AS Total_Orders,
  4         SUM(od.Quantity)                 AS Total_Quantity_Sold,
  5         SUM(od.Quantity * od.Unit_Price) AS Total_Sales,
  6         AVG(od.Unit_Price)               AS Average_Price
  7  FROM Category cat
  8  JOIN Product p        ON cat.Category_ID = p.Category_ID
  9  JOIN Order_Details od ON p.Product_ID = od.Product_ID
 10  GROUP BY cat.Category_ID, cat.Category_Name
 11  ORDER BY Total_Sales DESC;

CATEGORY_ID CATEGORY_NAME                            TOTAL_ORDERS
----------- ---------------------------------------- ------------
TOTAL_QUANTITY_SOLD TOTAL_SALES AVERAGE_PRICE
------------------- ----------- -------------
          1 Electronics                                         5
                 29       78500    2158.33333

          2 Clothing                                            2
                 25       57750          2675

          4 Home Appliances                                     2
                 17       51900          2925


CATEGORY_ID CATEGORY_NAME                            TOTAL_ORDERS
----------- ---------------------------------------- ------------
TOTAL_QUANTITY_SOLD TOTAL_SALES AVERAGE_PRICE
------------------- ----------- -------------
          3 Books                                               2
                 12       31300          2850

          5 Sports                                              1
                 17       28900          1700


