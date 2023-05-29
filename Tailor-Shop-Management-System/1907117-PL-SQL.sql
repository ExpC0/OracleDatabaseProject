--PL/SQL variable declaration and print value

SET SERVEROUTPUT ON;

DECLARE
  shop_location VARCHAR(20);
  total_price NUMBER(12,2);
BEGIN
  
  shop_location := 'Main Street';
  total_price := 999;

  -- Print Variable Values
  DBMS_OUTPUT.PUT_LINE('Shop Location: ' || shop_location);
  DBMS_OUTPUT.PUT_LINE('Total Price: ' || total_price);
END;
/

SET SERVEROUTPUT ON;
DECLARE
  v_shop_id shop.shop_id%TYPE := 2000001;
  v_location shop.location%TYPE := 'Moti Market';
  v_mobile shop.mobile%TYPE := '01880081202';
BEGIN

  -- Insert data
  INSERT INTO shop (shop_id, location, mobile)
  VALUES (v_shop_id, v_location, v_mobile);
  
  DBMS_OUTPUT.PUT_LINE('Data inserted successfully.');
  

  -- Delete the inserted data
  DELETE FROM shop
  WHERE shop_id = v_shop_id
    AND location = v_location
    AND mobile = v_mobile;
    
  DBMS_OUTPUT.PUT_LINE('Data deleted successfully.');
  

END;
/


 -- Declare variables using different ROWTYPE declarations

DECLARE
 
  v_shop shop%ROWTYPE;
  v_vacancy vacancy%ROWTYPE;
  v_customer customer%ROWTYPE;
  v_item item%ROWTYPE;
  v_sale sale%ROWTYPE;
  v_payment payment%ROWTYPE;

BEGIN
  -- Fetch a row from the shop table into v_shop variable
  SELECT * INTO v_shop FROM shop WHERE shop_id = 1000001;

  -- Fetch a row from the vacancy table into v_vacancy variable
  SELECT * INTO v_vacancy FROM vacancy WHERE job_id = 1000011;

  -- Fetch a row from the customer table into v_customer variable
  SELECT * INTO v_customer FROM customer WHERE customer_id = 1100007;

  -- Fetch a row from the item table into v_item variable
  SELECT * INTO v_item FROM item WHERE product_code =1010006;

  -- Fetch a row from the sale table into v_sale variable
  SELECT * INTO v_sale FROM sale WHERE customer_id = 1100005;

  -- Fetch a row from the payment table into v_payment variable
  SELECT * INTO v_payment FROM payment WHERE payment_id = 1300002;

  -- Display the values of the fetched rows using DBMS_OUTPUT.PUT_LINE
  DBMS_OUTPUT.PUT_LINE('Shop ID: ' || v_shop.shop_id || ', Location: ' || v_shop.location || ', Mobile: ' || v_shop.mobile);
  DBMS_OUTPUT.PUT_LINE('Vacancy ID: ' || v_vacancy.job_id || ', Shop ID: ' || v_vacancy.shop_id || ', Job Title: ' || v_vacancy.job_title);
  DBMS_OUTPUT.PUT_LINE('Customer ID: ' || v_customer.customer_id || ', Name: ' || v_customer.name || ', Address: ' || v_customer.address || ', Mobile: ' || v_customer.mobile);
  DBMS_OUTPUT.PUT_LINE('Item Code: ' || v_item.product_code || ', Name: ' || v_item.product_name || ', Price: ' || v_item.price || ', Stock: ' || v_item.stock);
  DBMS_OUTPUT.PUT_LINE('Sale Customer ID: ' || v_sale.customer_id || ', Product Code: ' || v_sale.product_code || ', Number of Items: ' || v_sale.number_of_item || ', Total Price: ' || v_sale.total_price || ', Selling Date: ' || v_sale.selling_date);
  DBMS_OUTPUT.PUT_LINE('Payment ID: ' || v_payment.payment_id || ', Customer ID: ' || v_payment.customer_id || ', Shop ID: ' || v_payment.shop_id || ', Paid Amount: ' || v_payment.paid_amount || ', Due: ' || v_payment.due || ', Date of Payment: ' || v_payment.date_of_payment);

END;
/

--cursor operations

DECLARE
  -- Declare variables
  v_customer_id customer.customer_id%TYPE;
  v_customer_name customer.name%TYPE;

  -- Declare cursor
  CURSOR c_customers IS
    SELECT customer_id, name
    FROM customer;

  -- Variable to store row count
  v_row_count INTEGER := 0;

BEGIN
  -- Open the cursor
  OPEN c_customers;

  -- Loop through the cursor records
  LOOP
    -- Fetch a row from the cursor
    FETCH c_customers INTO v_customer_id, v_customer_name;

    -- Exit the loop if there are no more records
    EXIT WHEN c_customers%NOTFOUND;

    -- Increment the row count
    v_row_count := v_row_count + 1;

    -- Print the customer details
    DBMS_OUTPUT.PUT_LINE('Customer ID: ' || v_customer_id || ', Name: ' || v_customer_name);
  END LOOP;

  -- Close the cursor
  CLOSE c_customers;

  -- Print the total row count
  DBMS_OUTPUT.PUT_LINE('Total Customers: ' || v_row_count);

END;
/


--FOR LOOP/WHILE LOOP/ARRAY

DECLARE
  TYPE NAMEARRAY IS TABLE OF VARCHAR2(20) INDEX BY PLS_INTEGER; -- User-defined collection type 
  v_shop_id NUMBER(7);
  v_location VARCHAR(20);
  v_mobile VARCHAR(11);
  v_shop_array NAMEARRAY; -- Declare variable of type NAMEARRAY

BEGIN
  -- FOR LOOP to retrieve shop details
  FOR shop_rec IN (SELECT * FROM shop) LOOP
    v_shop_id := shop_rec.shop_id;
    v_location := shop_rec.location;
    v_mobile := shop_rec.mobile;

    -- Process the shop details
    DBMS_OUTPUT.PUT_LINE('Shop ID: ' || v_shop_id);
    DBMS_OUTPUT.PUT_LINE('Location: ' || v_location);
    DBMS_OUTPUT.PUT_LINE('Mobile: ' || v_mobile);
    DBMS_OUTPUT.PUT_LINE('-----------------------');
  END LOOP;

 DBMS_OUTPUT.PUT_LINE('FOR LOOP executed successfully!');

  -- WHILE LOOP

  v_shop_id := 1000001; 
  WHILE v_shop_id <= 1000005 LOOP
    SELECT location INTO v_location FROM shop WHERE shop_id = v_shop_id;

    -- Assign location to the NAMEARRAY
    --NAMEARRAY is of 5 elements , v_shop_id is so big, so subtracted to be used properly
    v_shop_array(v_shop_id-1000000) := v_location;

    v_shop_id := v_shop_id + 1; -- Increment shop ID
  END LOOP;

  -- Print the NAMEARRAY values
  DBMS_OUTPUT.PUT_LINE('Shop Locations:');
  FOR i IN 1..5 LOOP
    DBMS_OUTPUT.PUT_LINE('Shop ' || i || ': ' || v_shop_array(i));
  END LOOP;

 DBMS_OUTPUT.PUT_LINE('WHILE LOOP executed successfully!');
	

END;
/

--array without extend function

DECLARE
  TYPE NAMEARRAY IS VARRAY(5) OF VARCHAR2(20); -- Fixed-size array type
  v_shop_id NUMBER(7);
  v_location VARCHAR(20);
  v_mobile VARCHAR(11);
  v_shop_array NAMEARRAY; -- Declare variable of type NAMEARRAY

BEGIN
  -- FOR LOOP to retrieve shop details
  FOR shop_rec IN (SELECT * FROM shop) LOOP
    -- Assign values to variables
    v_shop_id := shop_rec.shop_id;
    v_location := shop_rec.location;
    v_mobile := shop_rec.mobile;

    -- Process the shop details
    DBMS_OUTPUT.PUT_LINE('Shop ID: ' || v_shop_id);
    DBMS_OUTPUT.PUT_LINE('Location: ' || v_location);
    DBMS_OUTPUT.PUT_LINE('Mobile: ' || v_mobile);
    DBMS_OUTPUT.PUT_LINE('-----------------------');
  END LOOP;

  -- Assign values to the array manually
  v_shop_array := NAMEARRAY('Location 1', 'Location 2', 'Location 3', 'Location 4', 'Location 5');

  -- Print the array values
  DBMS_OUTPUT.PUT_LINE('Shop Locations:');
  FOR i IN 1..v_shop_array.COUNT LOOP
    DBMS_OUTPUT.PUT_LINE('Shop ' || i || ': ' || v_shop_array(i));
  END LOOP;

END;
/

--array with extend function

DECLARE
  TYPE NAMEARRAY IS TABLE OF VARCHAR2(20); -- Nested table type

  v_shop_array NAMEARRAY := NAMEARRAY(); -- Declare and initialize the nested table

BEGIN

  -- Extend the nested table and assign values
  v_shop_array.EXTEND(5); -- Extend the nested table by 5 elements
  v_shop_array(1) := 'Location 1';
  v_shop_array(2) := 'Location 2';
  v_shop_array(3) := 'Location 3';
  v_shop_array(4) := 'Location 4';
  v_shop_array(5) := 'Location 5';

  -- Print the array values
  DBMS_OUTPUT.PUT_LINE('Shop Locations:');
  FOR i IN 1..v_shop_array.COUNT LOOP
    DBMS_OUTPUT.PUT_LINE('Shop ' || i || ': ' || v_shop_array(i));
  END LOOP;

END;
/


--IF /ELSEIF /ELSE statements



DECLARE
  v_customer_id NUMBER(7) :=1100002;
  v_customer_name VARCHAR2(20);
  v_customer_address VARCHAR2(20);
  v_customer_mobile VARCHAR2(11);
  v_item_price NUMBER(7, 2) := 1000.00;
  v_stock_count NUMBER(7);
BEGIN
  -- Retrieve customer details based on customer_id
  SELECT name, address, mobile
  INTO v_customer_name, v_customer_address, v_customer_mobile
  FROM customer
  WHERE customer_id = v_customer_id;

  -- Check if customer details are found
  IF v_customer_name IS NOT NULL THEN
    DBMS_OUTPUT.PUT_LINE('Customer Details:');
    DBMS_OUTPUT.PUT_LINE('Name: ' || v_customer_name);
    DBMS_OUTPUT.PUT_LINE('Address: ' || v_customer_address);
    DBMS_OUTPUT.PUT_LINE('Mobile: ' || v_customer_mobile);
  ELSE
    DBMS_OUTPUT.PUT_LINE('Customer not found!');
  END IF;

  -- Check item stock count and price
  SELECT stock
  INTO v_stock_count
  FROM item
  WHERE product_code = 1010003;

  IF v_stock_count > 0 THEN
    IF v_item_price >= 50 THEN
      DBMS_OUTPUT.PUT_LINE('Item is in stock and the price is acceptable.');
    ELSE
      DBMS_OUTPUT.PUT_LINE('Item is in stock, but the price is too low.');
    END IF;
  ELSE
    DBMS_OUTPUT.PUT_LINE('Item is out of stock.');
  END IF;

  -- Check payment amount
  DECLARE
    v_payment_amount NUMBER(12) := 1000;
    v_due_amount NUMBER(12) := 500;
  BEGIN
    IF v_payment_amount > 0 THEN
      IF v_payment_amount >= v_due_amount THEN
        DBMS_OUTPUT.PUT_LINE('Payment amount is sufficient.');
     ELSIF v_payment_amount >= v_due_amount / 2 THEN
        DBMS_OUTPUT.PUT_LINE('Payment amount is partially sufficient.');
      ELSE
        DBMS_OUTPUT.PUT_LINE('Payment amount is not sufficient. Additional amount is due.');
      END IF;
    ELSE
      DBMS_OUTPUT.PUT_LINE('Invalid payment amount.');
    END IF;
  END;
 
END;
/

 

--  PL/SQL  procedures

-- Procedure 1: Update customer address

CREATE OR REPLACE PROCEDURE update_customer_address(
  p_customer_id IN NUMBER,
  p_new_address IN VARCHAR2
) AS
BEGIN
  -- Update the customer address
  UPDATE customer
  SET address = p_new_address
  WHERE customer_id = p_customer_id;
  
  -- Display success message
  DBMS_OUTPUT.PUT_LINE('Customer address updated successfully.');
EXCEPTION
  -- Handle exceptions

  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Customer not found.');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('An error occurred. Please try again.');
END;
/

-- Procedure 2: Calculate total payment

CREATE OR REPLACE PROCEDURE calculate_total_payment(
  p_customer_id IN NUMBER
) AS
  l_total_payment NUMBER(12, 2);
BEGIN
  -- Calculate the total payment for the customer
  SELECT SUM(paid_amount)
  INTO l_total_payment
  FROM payment
  WHERE customer_id = p_customer_id;
  
  -- Display the total payment
  DBMS_OUTPUT.PUT_LINE('Total payment for Customer ' || p_customer_id || ': ' || l_total_payment);
EXCEPTION
  -- Handle exceptions
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Customer not found.');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('An error occurred. Please try again.');
END;
/

-- Procedure 3: Delete shop vacancies

CREATE OR REPLACE PROCEDURE delete_shop_vacancies(
  p_shop_id IN NUMBER
) AS
BEGIN
  -- Delete the vacancies for the shop

  DELETE FROM vacancy

  WHERE shop_id = p_shop_id;

  -- Display success message
  DBMS_OUTPUT.PUT_LINE('Shop vacancies deleted successfully.');
EXCEPTION
  -- Handle exceptions
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Shop not found.');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('An error occurred. Please try again.');
END;
/

-- Execute the procedures
BEGIN
  -- Call Procedure 1: Update customer address

  update_customer_address(1100009, 'Polli Biddut');
  
  -- Call Procedure 2: Calculate total payment

  calculate_total_payment(1100009);
  
  -- Call Procedure 3: Delete shop  vacancies
  delete_shop_and_vacancies(3000001);
END;
/


--  PL/SQL  functions

-- Function 1: Get customer name by ID

CREATE OR REPLACE FUNCTION get_customer_name(
  p_customer_id IN NUMBER
) RETURN VARCHAR2 AS
  l_customer_name VARCHAR2(50);
BEGIN
  -- Retrieve the customer name
  SELECT name
  INTO l_customer_name
  FROM customer
  WHERE customer_id = p_customer_id;
  
  -- Return the customer name
  RETURN l_customer_name;
EXCEPTION
  -- Handle exceptions
  WHEN NO_DATA_FOUND THEN
    RETURN 'Customer not found';
  WHEN OTHERS THEN
    RETURN 'An error occurred';
END;
/

-- Function 2: Calculate total stock

CREATE OR REPLACE FUNCTION calculate_total_stock RETURN NUMBER AS
  l_total_stock NUMBER(7);
BEGIN
  -- Calculate the total stock

  SELECT SUM(stock)
  INTO l_total_stock
  FROM item;
  
  -- Return the total stock
  RETURN l_total_stock;
EXCEPTION
  -- Handle exceptions
  WHEN NO_DATA_FOUND THEN
    RETURN 0;
  WHEN OTHERS THEN
    RETURN -1;
END;
/

-- Function 3: Check if shop exists

CREATE OR REPLACE FUNCTION shop_exists(
  p_shop_id IN NUMBER
) RETURN BOOLEAN AS
  l_count NUMBER;
BEGIN
  -- Check if the shop exists
  SELECT COUNT(*)
  INTO l_count
  FROM shop
  WHERE shop_id = p_shop_id;
  
  -- Return true if shop exists, otherwise false
  RETURN (l_count > 0);
EXCEPTION
  -- Handle exceptions
  WHEN NO_DATA_FOUND THEN
    RETURN FALSE;
  WHEN OTHERS THEN
    RETURN FALSE;
END;
/

-- Execute the functions

BEGIN
  -- Call Function 1: Get customer name by ID

  DBMS_OUTPUT.PUT_LINE('Customer Name: ' || get_customer_name(1100002));
  
  -- Call Function 2: Calculate total stock

  DBMS_OUTPUT.PUT_LINE('Total Stock: ' || calculate_total_stock()); --it doesn't take any parameter
  
  -- Call Function 3: Check if shop exists

  IF shop_exists(1000007) THEN
    DBMS_OUTPUT.PUT_LINE('Shop exists');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Shop does not exist');
  END IF;
END;
/


-- Drop the procedures
DROP PROCEDURE  update_customer_address;
DROP PROCEDURE calculate_total_payment;
DROP PROCEDURE delete_shop_vacancies;

-- Drop the functions
DROP FUNCTION calculate_total_stock;
DROP FUNCTION get_customer_name;
DROP FUNCTION shop_exists;






