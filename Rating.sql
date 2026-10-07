create table rating (
    rating_id number primary key,
    customer_id number,
    product_id number,
    rating number(1) check (rating between 1 and 5)
);

Table created.

insert into rating values (1, 101, 301, 5, '01-jan-2026');
1 row created.
insert into rating values (2, 102, 302, 4, '02-jan-2026');
1 row created.
insert into rating values (3, 103, 303, 5, '03-jan-2026');
1 row created.
insert into rating values (4, 104, 304, 4, '04-jan-2026');
1 row created.
insert into rating values (5, 105, 305, 3, '05-jan-2026');
1 row created.
insert into rating values (6, 106, 301, 5, '06-jan-2026');
1 row created.
insert into rating values (7, 107, 302, 4, '07-jan-2026');
1 row created.
insert into rating values (8, 108, 303, 5, '08-jan-2026');
1 row created.
insert into rating values (9, 109, 304, 3, '09-jan-2026');
1 row created.
insert into rating values (10, 110, 305, 4, '10-jan-2026');
1 row created.

commit;
Commit complete.


select product_id,avg(rating) as average_rating
from rating
group by product_id;

PRODUCT_ID AVERAGE_RATING
---------- --------------
       301              5
       302              4
       303              5
       304            3.5
       305            3.5

select product_id,avg(rating) as average_rating
from rating
group by product_id
having avg(rating) >= 4;

PRODUCT_ID AVERAGE_RATING
---------- --------------
       301              5
       302              4
       303              5

select product_id,avg(rating) as average_rating
from rating
group by product_id
order by avg(rating) desc;

PRODUCT_ID AVERAGE_RATING
---------- --------------
       301              5
       303              5
       302              4
       305            3.5
       304            3.5


select product_id,customer_id,rating
from rating
where rating = 5;

PRODUCT_ID CUSTOMER_ID     RATING
---------- ----------- ----------
       301         101          5
       303         103          5
       301         106          5
       303         108          5