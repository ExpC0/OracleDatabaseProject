
--Tailor shop management

--Insertion

-- Inserting data into the shop table
INSERT INTO shop (shop_id, location, mobile)
VALUES (1000001, 'Konabari', '01745678901');

INSERT INTO shop (shop_id, location, mobile)
VALUES (1000002, 'Ambag', '01765432102');

INSERT INTO shop (shop_id, location, mobile)
VALUES (1000003, 'Tetultola', '01955555553');

INSERT INTO shop (shop_id, location, mobile)
VALUES (1000004, 'Mucipara', '01911111114');

INSERT INTO shop (shop_id, location, mobile)
VALUES (1000005, 'Baghia', '01399999995');

INSERT INTO shop (shop_id, location, mobile)
VALUES (1000006, 'Kodda', '01388888886');

INSERT INTO shop (shop_id, location, mobile)
VALUES (1000007, 'Baimail', '01877777777');

INSERT INTO shop (shop_id, location, mobile)
VALUES (1000008, 'Chowrasta', '01844444448');

INSERT INTO shop (shop_id, location, mobile)
VALUES (1000009, 'Mouchak', '01622222229');

INSERT INTO shop (shop_id, location, mobile)
VALUES (1000010, 'Chandra', '01636666660');

-- Inserting data into the vacancy table

INSERT INTO vacancy (job_id, shop_id, job_title, number_of_post)
VALUES (1000011, 1000001, 'Cutting Master', 2);

INSERT INTO vacancy (job_id, shop_id, job_title, number_of_post)
VALUES (1000012, 1000001, 'Tailor', 3);

INSERT INTO vacancy (job_id, shop_id, job_title, number_of_post)
VALUES (1000013, 1000003, 'Cashier', 1);

INSERT INTO vacancy (job_id, shop_id, job_title, number_of_post)
VALUES (1000014, 1000003, 'Supervisor', 1);

INSERT INTO vacancy (job_id, shop_id, job_title, number_of_post)
VALUES (1000015, 1000005, 'Seller', 2);

INSERT INTO vacancy (job_id, shop_id, job_title, number_of_post)
VALUES (1000016, 1000006, 'Tailor', 3);

INSERT INTO vacancy (job_id, shop_id, job_title, number_of_post)
VALUES (1000017, 1000007, 'Cutting Master', 2);

INSERT INTO vacancy (job_id, shop_id, job_title, number_of_post)
VALUES (1000018, 1000008, 'Tailor', 4);

INSERT INTO vacancy (job_id, shop_id, job_title, number_of_post)
VALUES (1000019, 1000009, 'Cashier', 1);

INSERT INTO vacancy (job_id, shop_id, job_title, number_of_post)
VALUES (1000020, 1000010, 'Seller', 3);

INSERT INTO vacancy (job_id, shop_id, job_title, number_of_post)
VALUES (1000020, 3000001, 'Cuttting Master', 3);  -- this insertion will be deleted by pl/sql  procedure


-- Inserting data into the customer table
INSERT INTO customer (customer_id, name, address, mobile)
VALUES (1100001, 'Rahim', 'Ambag', '01645637890');

INSERT INTO customer (customer_id, name, address, mobile)
VALUES (1100002, 'Shafin', 'Konabari', '01606543210');

INSERT INTO customer (customer_id, name, address, mobile)
VALUES (1100003, 'Rana', 'Tetultola', '01735555555');

INSERT INTO customer (customer_id, name, address, mobile)
VALUES (1100004, 'Bijoy', 'Mucipara', '01701111111');

INSERT INTO customer (customer_id, name, address, mobile)
VALUES (1100005, 'Amzad', 'Baghia', '01819999999');

INSERT INTO customer (customer_id, name, address, mobile)
VALUES (1100006, 'Zara', 'Baimail', '01898888888');

INSERT INTO customer (customer_id, name, address, mobile)
VALUES (1100007, 'Fatema', 'Kodda', '01917777777');

INSERT INTO customer (customer_id, name, address, mobile)
VALUES (1100008, 'Nazir', 'Chandra', '01914444444');

INSERT INTO customer (customer_id, name, address, mobile)
VALUES (1100009, 'Shakil', 'Chowrasta', '01512222222');

INSERT INTO customer (customer_id, name, address, mobile)
VALUES (1100010, 'Fahmida', 'Mouchak', '01566626666');



-- Inserting data into the item table
INSERT INTO item (product_code, product_name, price, stock)
VALUES (1010001, 'Shirt', 1050.00, 15);

INSERT INTO item (product_code, product_name, price, stock)
VALUES (1010002, 'Pant', 2075.00, 10);

INSERT INTO item (product_code, product_name, price, stock)
VALUES (1010003, 'Panjabi', 1599.00, 20);

INSERT INTO item (product_code, product_name, price, stock)
VALUES (1010004, 'Pajama', 450.00, 15);

INSERT INTO item (product_code, product_name, price, stock)
VALUES (1010005, 'Three-piece', 1600.00, 13);

INSERT INTO item (product_code, product_name, price, stock)
VALUES (1010006, 'Blouse', 390.00, 10);

INSERT INTO item (product_code, product_name, price, stock)
VALUES (1010007, 'Blazer', 4900.00, 12);

INSERT INTO item (product_code, product_name, price, stock)
VALUES (1010008, 'Skirt',1200.00,18);

INSERT INTO item (product_code, product_name, price, stock)
VALUES (1010009, 'Formal Shirt', 1200.00, 12);

INSERT INTO item (product_code, product_name, price, stock)
VALUES (1010010, 'Khimar', 1700.00, 6);

-- Inserting data into the sale table
INSERT INTO sale (customer_id, product_code,shop_id, number_of_item, total_price, selling_date)
VALUES (1100003, 1010003,1000001, 3, 4797.00, '10-MAY-2023');

INSERT INTO sale (customer_id, product_code,shop_id, number_of_item, total_price, selling_date)
VALUES (1100004, 1010004,1000002, 1, 450.00, '11-May-2023');

INSERT INTO sale (customer_id, product_code,shop_id, number_of_item, total_price, selling_date)
VALUES (1100005, 1010005,1000003, 2, 3200.00, '11-May-2023');

INSERT INTO sale (customer_id, product_code,shop_id, number_of_item, total_price, selling_date)
VALUES (1100006, 1010006,1000005, 1, 390.00, '12-May-2023');

INSERT INTO sale (customer_id, product_code,shop_id, number_of_item, total_price, selling_date)
VALUES (1100007, 1010007,1000004, 3, 14700.00, '13-May-2023');

INSERT INTO sale (customer_id, product_code,shop_id, number_of_item, total_price, selling_date)
VALUES (1100008, 1010008,1000006, 2, 2400.00, '14-May-2023');

INSERT INTO sale (customer_id, product_code, shop_id,number_of_item, total_price, selling_date)
VALUES (1100009, 1010009,1000007, 4, 4800.00, '14-May-2023');

INSERT INTO sale (customer_id, product_code, shop_id, number_of_item, total_price, selling_date)
VALUES (1100010, 1010010,1000009, 1, 1700.00, '15-May-2023');

INSERT INTO sale (customer_id, product_code,shop_id, number_of_item, total_price, selling_date)
VALUES (1100001, 1010001,1000008, 2, 2100.00, '17-May-2023');

INSERT INTO sale (customer_id, product_code,shop_id, number_of_item, total_price, selling_date)
VALUES (1100002, 1010002,1000010, 3, 6225.00, '18-May-2023');



-- Inserting data into the payment table
INSERT INTO payment (payment_id, customer_id, paid_amount, due, date_of_payment)
VALUES (1300001, 1100001, 2100.00, 0.00, '19-May-2023');

INSERT INTO payment (payment_id, customer_id, paid_amount, due, date_of_payment)
VALUES (1300002, 1100002, 6000.00, 225.00, '20-May-2023');

INSERT INTO payment (payment_id, customer_id, paid_amount, due, date_of_payment)
VALUES (1300003, 1100003, 4797.00, 0.00, '21-May-2023');

INSERT INTO payment (payment_id, customer_id, paid_amount, due, date_of_payment)
VALUES (1300004, 1100004, 450.00, 0.00, '22-May-2023');

INSERT INTO payment (payment_id, customer_id, paid_amount, due, date_of_payment)
VALUES (1300005, 1100005, 3200.00, 0.00, '23-May-2023');

INSERT INTO payment (payment_id, customer_id, paid_amount, due, date_of_payment)
VALUES (1300006, 1100006, 390.00, 0.00, '24-May-2023');

INSERT INTO payment (payment_id, customer_id, paid_amount, due, date_of_payment)
VALUES (1300007, 1100007, 12000.00, 2700.00, '25-May-2023');

INSERT INTO payment (payment_id, customer_id, paid_amount, due, date_of_payment)
VALUES (1300008, 1100008,2400.00,0.00, '26-May-2023');

INSERT INTO payment (payment_id, customer_id, paid_amount, due, date_of_payment)
VALUES (1300009, 1100009, 4800.00, 0.00, '26-May-2023');

INSERT INTO payment (payment_id, customer_id, paid_amount, due, date_of_payment)
VALUES (1300010, 1100010, 1500.00, 200.00, '27-May-2023');



--showing all table values

set pagesize 1000;
set linesize 200;
set heading on;
set colsep "  ";


SELECT * FROM shop;
SELECT * FROM vacancy;
SELECT * FROM customer;
SELECT * FROM item;
SELECT * FROM sale;
SELECT * FROM payment;

--showing sale more than 2 of each item

SELECT * FROM sale 
WHERE number_of_item > 2;

--showing dues

SELECT * FROM payment WHERE due > 0;

SELECT DISTINCT product_name
FROM item;

--finding a specific customer's name

SELECT name
FROM customer
WHERE customer_id = (
  SELECT customer_id
  FROM payment
  WHERE payment_id = 1300010
);


--finding payment details from customer's mobile number

SELECT *
FROM payment
WHERE payment_id = (
  SELECT payment_id
  FROM payment
  WHERE customer_id = (
    SELECT customer_id
    FROM customer
    WHERE mobile = '01645637890'
  )
);

UPDATE vacancy SET job_title='Seller' WHERE job_id = 1000013 ;

--inserting new row in payment table 

INSERT INTO payment (payment_id, customer_id, paid_amount, due, date_of_payment)
VALUES (1300011, 1100010, 2000.00, 0.00, '28-May-23');

--deleting that newly created row

DELETE FROM payment
WHERE payment_id = 1300011;

SELECT *
FROM vacancy
WHERE job_title LIKE 'Tai%'
UNION
SELECT *
FROM vacancy
WHERE job_title LIKE '%Mas%';


WITH max_paid(val) AS (
  SELECT MAX(paid_amount) FROM payment
)
SELECT *
FROM payment, max_paid
WHERE payment.paid_amount = max_paid.val;



--creating .csv file 


SPOOL Z:\DataLabProject\file1.csv
SELECT *
FROM payment;
SPOOL OFF

--creating xml file


SPOOL  Z:\DataLabProject\file1.xml
SELECT *
FROM payment;
SPOOL OFF

SPOOL Z:\DataLabProject\file1.txt
SELECT *
FROM payment;
SPOOL OFF



-- Count all payments

SELECT COUNT(*) AS Total_payments FROM payment;

-- Count customers with alias

SELECT COUNT(name) AS number_of_customer FROM customer;

-- Count distinct customer names

SELECT COUNT(DISTINCT name) AS number_of_distinct_customer FROM customer;

-- Count average of paid_amount

SELECT AVG(paid_amount) FROM payment;

-- Count total payment

SELECT SUM(paid_amount) FROM payment;

-- Find maximum paid amount

SELECT MAX(paid_amount) FROM payment;

-- Find minimum paid amount

SELECT MIN(paid_amount) FROM payment;


-- Group by and Having

-- Find the average of paid amount grouped by payment_id

SELECT payment_id, AVG(paid_amount) FROM payment GROUP BY payment_id;

-- Find the average of paid amount greater or equal to 1000 and  grouped by payment_id 

SELECT payment_id, AVG(paid_amount) FROM payment GROUP BY payment_id HAVING AVG(paid_amount) >= 1000;

-- Nested subquery
-- Find the customer name who made the payment

SELECT name FROM customer WHERE customer_id = (
  SELECT customer_id FROM payment WHERE payment_id = 1300008
);

-- Find the shop location from where the customer will buy

SELECT location FROM shop WHERE shop_id = (
  SELECT shop_id FROM sale WHERE customer_id = (
    SELECT customer_id FROM payment WHERE payment_id = 1300008
  )
);

-- Set Membership (AND, OR, NOT)

-- Find the availabe job for tailor where requirement is greater or equal to 2

SELECT * FROM vacancy WHERE job_title = 'Tailor' AND number_of_post IN (
  SELECT number_of_post FROM vacancy WHERE number_of_post >= 2
);

-- Set Membership (Some/Any, All, Exists, Unique)

-- Find all available post greater or equal to 2

SELECT * FROM vacancy WHERE number_of_post > SOME (
  SELECT number_of_post FROM vacancy WHERE number_of_post >= 2
);

-- Find all vacancy where number of post availabe is smaller or equal to 2

SELECT * FROM vacancy WHERE number_of_post <= ALL (
  SELECT number_of_post FROM vacancy WHERE number_of_post >= 2
);

-- Exists construct

-- Find all courses where year_semester is greater than or equal to 11 and there exists a matching faculty in the dept table

SELECT * FROM vacancy WHERE number_of_post >= 3 AND EXISTS (
  SELECT * FROM vacancy WHERE job_title LIKE 'Tai%'
);

--string operations

SELECT * FROM customer WHERE name LIKE '%A%';

SELECT * FROM customer WHERE name LIKE '___';

SELECT * FROM customer WHERE name LIKE '___' and name LIKE '____' and name LIKE '_____';



--join operations

--inner join

SELECT *
FROM sale
INNER JOIN customer ON sale.customer_id = customer.customer_id;

--left join 

SELECT *
FROM shop
LEFT JOIN vacancy ON shop.shop_id = vacancy.shop_id;

--right join

SELECT *
FROM payment
RIGHT JOIN customer ON payment.customer_id = customer.customer_id;

--full outer join

SELECT *
FROM item
FULL OUTER JOIN sale ON item.product_code = sale.product_code;

--selecting shop where sale money is greater than 3000 using join operation

SELECT shop.shop_id, location
FROM shop
JOIN sale ON sale.total_price >= 3000 AND shop.shop_id = sale.shop_id;


--views

--customer details view

CREATE VIEW customer_details_view AS
SELECT customer_id, name, address, mobile
FROM customer;


SELECT * FROM customer_details_view;


DROP VIEW customer_details_view;

--item details view

CREATE VIEW item_details_view AS
SELECT product_code, product_name, price, stock
FROM item;

SELECT * FROM item_details_view;


DROP VIEW item_details_view;

--view with conditional statement

CREATE VIEW vacancy_details_view AS
SELECT job_id, shop_id, job_title, number_of_post
FROM vacancy WHERE number_of_post >= 2;


SELECT * FROM vacancy_details_view;


DROP VIEW vacancy_details_view;

--view with sub query

CREATE VIEW sale_details_view AS
SELECT shop_id,customer_id,product_code,total_price,selling_date
FROM sale WHERE total_price = ( select total_price from sale where product_code = 1010007);


SELECT * FROM sale_details_view;


DROP VIEW sale_details_view;

--for Cascading Actions in Referential Integrity

--inserting some data

-- Inserting data into parent_table
INSERT INTO parent_table (parent_id, balance)
VALUES (1, 1000.00);

INSERT INTO parent_table (parent_id, balance)
VALUES (2, 2000.00);

-- Inserting data into child_table
INSERT INTO child_table (child_id, parent_id, refer_code)
VALUES (1, 1, 1234);

INSERT INTO child_table (child_id, parent_id, refer_code)
VALUES (2, 2, 7890);


--now let's perform delete operation on  parent table
--this will delete from both tables

DELETE FROM parent_table WHERE parent_id = 1;

SELECT * FROM parent_table;
SELECT * FROM child_table;

--this will delete everything from child table too 

DELETE FROM parent_table;

SELECT * FROM parent_table;
SELECT * FROM child_table;

































