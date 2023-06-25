CREATE OR REPLACE FUNCTION add_customer(customer_id INTEGER, _first_name VARCHAR, _last_name VARCHAR, _card VARCHAR)
RETURNS void 
AS $MAIN$ 
BEGIN
	INSERT INTO customer
	VALUES(customer_id, _first_name, _last_name, _card);
END;
$MAIN$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION add_salesperson(_sales_id INTEGER, _first_name VARCHAR, _last_name VARCHAR)
RETURNS void 
AS $MAIN$ 
BEGIN
	INSERT INTO salesperson
	VALUES(_sales_id, _first_name, _last_name);
END;
$MAIN$
LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION add_mechanic(_mechanic_id INTEGER, _first_name VARCHAR, _last_name VARCHAR)
RETURNS void 
AS $MAIN$ 
BEGIN
	INSERT INTO mechanics
	VALUES(_mechanic_id, _first_name, _last_name);
END;
$MAIN$
LANGUAGE plpgsql;



CREATE OR REPLACE FUNCTION add_car(car_id INTEGER, car_year NUMERIC, car_make VARCHAR, car_model VARCHAR, customer_id INTEGER)
RETURNS void 
AS $MAIN$ 
BEGIN
	INSERT INTO cars
	VALUES(car_id, car_year, car_make, car_model, customer_id);
END;
$MAIN$
LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION add_invoice(invoice_id INTEGER, price NUMERIC, sale_date DATE, sales_id INTEGER, car_id INTEGER)
RETURNS void 
AS $MAIN$ 
BEGIN
	INSERT INTO invoice
	VALUES(invoice_id, price, sale_date, sales_id, car_id);
END;
$MAIN$
LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION add_dealership_info(dealership_id INTEGER, car_sold BOOLEAN, new_car BOOLEAN, car_id INTEGER)
RETURNS void 
AS $MAIN$ 
BEGIN
	INSERT INTO dealership_info
	VALUES(dealership_id, car_sold, new_car, car_id);
END;
$MAIN$
LANGUAGE plpgsql;



-- adds to mechanic_service table
CREATE OR REPLACE FUNCTION add_service_ticket(mechanic_service_id INTEGER, service_date DATE, parts_needed BOOLEAN, mechanic_id INTEGER, car_id INTEGER)
RETURNS void 
AS $MAIN$ 
BEGIN
	INSERT INTO mechanic_service
	VALUES(mechanic_service_id, service_date, parts_needed, mechanic_id, car_id);
END;
$MAIN$
LANGUAGE plpgsql;


--adding service column
ALTER TABLE cars
ADD COLUMN is_serviced BOOLEAN DEFAULT FALSE;

-- procedure
--where boolean false update to true

CREATE OR REPLACE PROCEDURE nowServiced(
	vin INTEGER
)
LANGUAGE plpgsql
AS $$ 
BEGIN
	UPDATE cars
	SET is_serviced = TRUE
	WHERE is_serviced = FALSE AND car_id = vin;
	COMMIT;
END;
$$