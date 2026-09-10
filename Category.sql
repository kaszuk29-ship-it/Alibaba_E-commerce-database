create table Category(
Category_ID int primary key,
Category_name varchar(40) unique,
Description varchar(40)
);

INSERT INTO Category VALUES (1, 'Electronics', 'Electronic devices and accessories');

INSERT INTO Category VALUES (2, 'Clothing', 'Men and women clothing products');

INSERT INTO Category VALUES (3, 'Books', 'Books and educational materials');

INSERT INTO Category VALUES (4, 'Home Appliances', 'Appliances used at home');

INSERT INTO Category VALUES (5, 'Sports', 'Sports equipment and accessories');

INSERT INTO Category VALUES (6, 'Beauty', 'Beauty and personal care products');

INSERT INTO Category VALUES (7, 'Groceries', 'Daily food and grocery products');

INSERT INTO Category VALUES (8, 'Furniture', 'Home and office furniture');

INSERT INTO Category VALUES (9, 'Toys', 'Toys and games for children');

INSERT INTO Category VALUES (10, 'Footwear', 'Shoes, sandals and other footwear');
commit;


SELECT * FROM Category;
