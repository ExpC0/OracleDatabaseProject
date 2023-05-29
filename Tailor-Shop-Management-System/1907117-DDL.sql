--tailor shop management

--by Md.Raduan Islam Rian
--ID:1907117
--CSE,KUET

-- Dropping existing tables

DROP TABLE sale;
DROP TABLE payment;
DROP TABLE vacancy;
DROP TABLE item;
DROP TABLE customer;
DROP TABLE shop;
DROP TABLE child_table;
DROP TABLE parent_table;
DROP TABLE tmp_table1;
DROP TABLE tmp_table2;



-- Creating tables

CREATE TABLE shop (
  shop_id NUMBER(7),
  location VARCHAR(20),
  mobile VARCHAR(11)
);

ALTER TABLE shop
    ADD CONSTRAINT PK_shop PRIMARY KEY (shop_id);

CREATE TABLE vacancy (
  job_id NUMBER(7),
  shop_id NUMBER(7),
  post_name VARCHAR(20),
  number_of_post NUMBER(7),
  PRIMARY KEY(job_id),
  FOREIGN KEY(shop_id) REFERENCES shop(shop_id)
);

-- Renaming a column in the "vacancy" table
ALTER TABLE vacancy
    RENAME COLUMN post_name TO job_title;



CREATE TABLE customer (
  customer_id NUMBER(7),
  name VARCHAR(20),
  address VARCHAR(20),
  mobile  VARCHAR(11),
  PRIMARY KEY(customer_id)
);

CREATE TABLE item (
  product_code NUMBER(7),
  product_name VARCHAR(20),
  price NUMBER(7,2),
  stock NUMBER(7),
  PRIMARY KEY(product_code)
);

CREATE TABLE sale (
  customer_id NUMBER(7),
  product_code NUMBER(7),
  number_of_item NUMBER(12),
  total_price NUMBER(12,2),
  selling_date DATE,
  FOREIGN KEY(product_code) REFERENCES item(product_code)
);


ALTER TABLE sale
    ADD CONSTRAINT FK_sale_customer FOREIGN KEY (customer_id) REFERENCES customer(customer_id);

ALTER TABLE sale
    ADD shop_id NUMBER(7);

ALTER TABLE sale
    ADD CONSTRAINT FK_shop_id FOREIGN KEY (shop_id) REFERENCES shop(shop_id);

CREATE TABLE payment (
  payment_id NUMBER(7),
  customer_id NUMBER(7),
  shop_id NUMBER(7),
  paid_amount NUMBER(12),
  due NUMBER(12),
  date_of_payment DATE,
  PRIMARY KEY(payment_id),
  FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

ALTER TABLE payment
    ADD CONSTRAINT CHK_paid_amount CHECK (paid_amount > 0);





-- Altering the "payment" table

ALTER TABLE payment
    ADD payment_method VARCHAR(20);

ALTER TABLE payment
    MODIFY payment_method VARCHAR(23);

ALTER TABLE payment
    RENAME COLUMN payment_method TO payment_reference;

ALTER TABLE payment
    DROP COLUMN payment_reference;


-- Retrieving table names( select is not DDL command but just used for well visualization)
SELECT table_name FROM user_tables;


--constraint on single relationship

CREATE TABLE tmp_table1 (
    id INTEGER PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    age INTEGER CHECK (age >= 18)
);
CREATE TABLE tmp_table2 (
    id INTEGER PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    age INTEGER CHECK (age >= 18 AND age <= 120),
    status VARCHAR(10) CHECK (status IN ('active', 'inactive', 'pending')),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    CONSTRAINT check_age_status CHECK (
        (status = 'active' AND age >= 18 AND age <= 65) OR
        (status = 'inactive' AND age >= 18 AND age <= 120) OR
        (status = 'pending' AND age >= 18 AND age <= 100) OR
        (end_date > start_date)
    )
);



--for Cascading Actions in Referential Integrity

CREATE TABLE parent_table (
  parent_id NUMBER(7),
  balance NUMBER(7,2),
  PRIMARY KEY(parent_id)
);


CREATE TABLE child_table (
  child_id NUMBER(7),
  parent_id NUMBER(7),
  refer_code NUMBER(7),
  PRIMARY KEY(child_id),
  FOREIGN KEY(parent_id) REFERENCES parent_table(parent_id)
  ON DELETE CASCADE 
);















