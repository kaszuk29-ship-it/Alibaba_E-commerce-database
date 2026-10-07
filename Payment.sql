create table payment (
    payment_id number(10) primary key,
    order_id number(10) not null,
    payment_method varchar2(50) not null,
    payment_status varchar2(20) not null,
    payment_date date not null,
    amount number(10,2) not null,
    constraint fk_payment_order
        foreign key (order_id) references orders (order_id),
    constraint chk_payment_status
        check (payment_status in ('successful', 'failed', 'pending', 'refunded')),
    constraint chk_payment_amount
        check (amount >= 0)
);

insert into payment values
(1, 1001, 'credit card', 'successful', date '2026-09-20', 49.99);

insert into payment values
(2, 1002, 'paypal', 'pending', date '2026-09-21', 125.50);

insert into payment values
(3, 1003, 'debit card', 'successful', date '2026-09-22', 32.00);

insert into payment values
(4, 1004, 'bank transfer', 'failed', date '2026-09-23', 210.75);

insert into payment values
(5, 1005, 'cash', 'successful', date '2026-09-24', 75.00);

insert into payment values
(6, 1006, 'credit card', 'pending', date '2026-09-25', 89.99);

insert into payment values
(7, 1007, 'paypal', 'successful', date '2026-09-26', 150.00);

insert into payment values
(8, 1008, 'debit card', 'failed', date '2026-09-27', 45.25);

insert into payment values
(9, 1009, 'bank transfer', 'successful', date '2026-09-28', 300.00);

insert into payment values
(10, 1010, 'credit card', 'refunded', date '2026-09-29', 60.50);

commit;
select * from payment;

select * from payment
where payment_status in ('successful', 'failed');

select payment_method, count(*) as total
from payment
group by payment_method;

select payment_id, order_id, payment_method, payment_status, payment_date, amount
from payment
order by payment_date;