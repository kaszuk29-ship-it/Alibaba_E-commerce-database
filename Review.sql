create table review (
    review_id number primary key,
    customer_id number,
    product_id number,
    review_text varchar2(200),
    review_date date
);
Table created.

insert into review values (1, 101, 301, 'good product and quality is nice', '01-jan-2026');
1 row created.
insert into review values (2, 102, 302, 'very useful product', '02-jan-2026');
1 row created.
insert into review values (3, 103, 303, 'excellent quality', '03-jan-2026');
1 row created.
insert into review values (4, 104, 304, 'product is worth the price', '04-jan-2026');
1 row created.
insert into review values (5, 105, 305, 'average product', '05-jan-2026');
1 row created.
insert into review values (6, 106, 301, 'really satisfied with the product', '06-jan-2026');
1 row created.
insert into review values (7, 107, 302, 'good value for money', '07-jan-2026');
1 row created.
insert into review values (8, 108, 303, 'product quality is excellent', '08-jan-2026');
1 row created.
insert into review values (9, 109, 304, 'not bad and works well', '09-jan-2026');
1 row created.
insert into review values (10, 110, 305, 'very happy with this product', '10-jan-2026');
1 row created.

commit;
commit complete.

select *from review;
REVIEW_ID CUSTOMER_ID PRODUCT_ID
---------- ----------- ----------
REVIEW_TEXT
--------------------------------------------------------------------------------
REVIEW_DA
---------
         1         101        301
good product and quality is nice
01-JAN-26

         2         102        302
very useful product
02-JAN-26

 REVIEW_ID CUSTOMER_ID PRODUCT_ID
---------- ----------- ----------
REVIEW_TEXT
--------------------------------------------------------------------------------
REVIEW_DA
---------

         3         103        303
excellent quality
03-JAN-26

         4         104        304
product is worth the price

 REVIEW_ID CUSTOMER_ID PRODUCT_ID
---------- ----------- ----------
REVIEW_TEXT
--------------------------------------------------------------------------------
REVIEW_DA
---------
04-JAN-26

         5         105        305
average product
05-JAN-26

         6         106        301

 REVIEW_ID CUSTOMER_ID PRODUCT_ID
---------- ----------- ----------
REVIEW_TEXT
--------------------------------------------------------------------------------
REVIEW_DA
---------
really satisfied with the product
06-JAN-26

         7         107        302
good value for money
07-JAN-26


 REVIEW_ID CUSTOMER_ID PRODUCT_ID
---------- ----------- ----------
REVIEW_TEXT
--------------------------------------------------------------------------------
REVIEW_DA
---------
         8         108        303
product quality is excellent
08-JAN-26

         9         109        304
not bad and works well
09-JAN-26

 REVIEW_ID CUSTOMER_ID PRODUCT_ID
---------- ----------- ----------
REVIEW_TEXT
--------------------------------------------------------------------------------
REVIEW_DA
---------

        10         110        305
very happy with this product
10-JAN-26


10 rows selected.

select r.review_id,
       r.customer_id,
       r.product_id,
       r.review_text,
       a.rating
from review r
join rating a
on r.customer_id = a.customer_id
and r.product_id = a.product_id;

 REVIEW_ID CUSTOMER_ID PRODUCT_ID
---------- ----------- ----------
REVIEW_TEXT
--------------------------------------------------------------------------------
    RATING
----------
         1         101        301
good product and quality is nice
         5

         2         102        302
very useful product
         4

 REVIEW_ID CUSTOMER_ID PRODUCT_ID
---------- ----------- ----------
REVIEW_TEXT
--------------------------------------------------------------------------------
    RATING
----------

         3         103        303
excellent quality
         5

         4         104        304
product is worth the price

 REVIEW_ID CUSTOMER_ID PRODUCT_ID
---------- ----------- ----------
REVIEW_TEXT
--------------------------------------------------------------------------------
    RATING
----------
         4

         5         105        305
average product
         3

         6         106        301

 REVIEW_ID CUSTOMER_ID PRODUCT_ID
---------- ----------- ----------
REVIEW_TEXT
--------------------------------------------------------------------------------
    RATING
----------
really satisfied with the product
         5

         7         107        302
good value for money
         4


 REVIEW_ID CUSTOMER_ID PRODUCT_ID
---------- ----------- ----------
REVIEW_TEXT
--------------------------------------------------------------------------------
    RATING
----------
         8         108        303
product quality is excellent
         5

         9         109        304
not bad and works well
         3

 REVIEW_ID CUSTOMER_ID PRODUCT_ID
---------- ----------- ----------
REVIEW_TEXT
--------------------------------------------------------------------------------
    RATING
----------

        10         110        305
very happy with this product
         4


10 rows selected.

select product_id,count(*) as total_reviews
from review
group by product_id;

PRODUCT_ID TOTAL_REVIEWS
---------- -------------
       301             2
       302             2
       303             2
       304             2
       305             2