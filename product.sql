CREATE TABLE Product (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(50) NOT NULL,
    Category_ID INT,
    Price DECIMAL(10,2),
    MOQ INT NOT NULL,
    Listing_Type VARCHAR(20),
    Key_Features VARCHAR(100),
    Units_Sold INT,
    Stock INT,
    FOREIGN KEY (Category_ID) REFERENCES Category(Category_ID)
);
insert into Product VALUES (101, 'JBL Earbuds', 1, 2499.00, 10, 'Wholesale', 'Bluetooth wireless earbuds', 250, 50);

insert into Product VALUES (102, 'Bluetooth Speaker', 1, 3999.00, 5, 'Wholesale', 'Portable wireless speaker', 180, 30);

insert into Product VALUES (103, 'Wireless Headphones', 1, 5999.00, 5, 'Wholesale', 'Noise cancelling headphones', 120, 20);

insert into Product VALUES (104, 'Cotton Shirt', 2, 999.00, 10, 'Wholesale', 'Comfortable cotton shirt', 150, 40);

insert into Product VALUES (105, 'Denim Jeans', 2, 1499.00, 10, 'Wholesale', 'Blue denim jeans', 100, 25);

insert into Product VALUES (106, 'Python Programming Book', 3, 699.00, 5, 'Wholesale', 'Python programming guide', 80, 15);

insert into Product VALUES (107, 'DBMS Fundamentals', 3, 799.00, 5, 'Wholesale', 'Database management book', 70, 20);

insert into Product VALUES (108, 'Mixer Grinder', 4, 3499.00, 5, 'Wholesale', 'Kitchen mixer grinder', 60, 10);

insert into Product VALUES (109, 'Electric Kettle', 4, 1999.00, 5, 'Wholesale', 'Stainless steel electric kettle', 90, 18);

insert into Product VALUES (110, 'Football', 5, 899.00, 10, 'Wholesale', 'Professional football', 130, 35);

commit;

SELECT * FROM Product;

UPDATE Product
SET Price = 2299.00
WHERE Product_ID = 101;

SELECT * FROM Product
WHERE Product_ID = 101;

UPDATE Product
SET Stock = 60
WHERE Product_ID = 101;

COMMIT;

DELETE FROM Product
WHERE Product_ID = 110;

SELECT * FROM Product;

SELECT
    Category.Category_Name,
    Product.Product_Name,
    Product.Price,
    Product.Stock
FROM Category
JOIN Product
ON Category.Category_ID = Product.Category_ID;
