
SELECT * FROM Products;

SELECT product_id, product_name, price
FROM Products;

SELECT *
FROM Products
WHERE price < 1499;

SELECT *
FROM Products
WHERE price > 4000;

SELECT *
FROM Products
ORDER BY price ASC;


SELECT *
FROM Products
ORDER BY price DESC;

SELECT DISTINCT price
FROM Products;

SELECT *
FROM Products
WHERE price BETWEEN 500 AND 3000;

SELECT *
FROM Products
WHERE category = 'Electronics';

SELECT *
FROM Customers;

SELECT *
FROM Customers
WHERE customer_name = 'Aarav Sharma';

SELECT *
FROM Products
WHERE category = 'Electronics'
  AND price < 4000;

SELECT *
FROM Products
WHERE category = 'Fashion'
   OR price > 4000;

SELECT *
FROM Products
WHERE category IN ('Electronics', 'Fashion');

SELECT *
FROM Products
WHERE price BETWEEN 1000 AND 5000;


SELECT product_id, product_name, category, price
FROM Products
ORDER BY price DESC;


SELECT
    c.customer_id,
    c.customer_name,
    o.order_id,
    o.order_date
FROM Customers c
JOIN Orders o ON o.customer_id = c.customer_id
ORDER BY c.customer_id, o.order_date;

SELECT
    p.product_id,
    p.product_name,
    oi.order_id,
    oi.quantity,
    oi.unit_price
FROM Products p
JOIN Order_Items oi ON oi.product_id = p.product_id
ORDER BY p.product_id, oi.order_id;

SELECT
    c.customer_id,
    c.customer_name,
    COUNT(o.order_id) AS total_orders
FROM Customers c
LEFT JOIN Orders o ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY c.customer_id;

SELECT
    c.customer_id,
    c.customer_name,
    NVL(SUM(oi.quantity * oi.unit_price), 0) AS total_purchase_amount
FROM Customers c
LEFT JOIN Orders o ON o.customer_id = c.customer_id
LEFT JOIN Order_Items oi ON oi.order_id = o.order_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_purchase_amount DESC;