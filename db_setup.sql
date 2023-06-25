CREATE TABLE Customer (
  customer_id SERIAL PRIMARY KEY,
  first_name VARCHAR(30),
  last_name VARCHAR(30),
  card VARCHAR(20)
);

CREATE TABLE Salesperson (
  sales_id SERIAL PRIMARY KEY,
  first_name VARCHAR(30),
  last_name VARCHAR(30)
);

CREATE TABLE Mechanics (
  mechanic_id SERIAL PRIMARY KEY,
  first_name VARCHAR(30),
  last_name VARCHAR(30)
);

CREATE TABLE Cars (
  car_id SERIAL PRIMARY KEY,
  car_year NUMERIC(4),
  car_make VARCHAR(30),
  car_model VARCHAR(30),
  customer_id INTEGER,
    FOREIGN KEY (customer_id)
      REFERENCES Customer(customer_id)
);



CREATE TABLE Invoice (
  invoice_id SERIAL PRIMARY KEY,
  price NUMERIC(10,2),
  sale_date DATE,
  sales_id INTEGER NOT NULL,
  car_id INTEGER NOT NULL,
    FOREIGN KEY (car_id)
      REFERENCES Cars(car_id),
	FOREIGN KEY (sales_id)
      REFERENCES Salesperson(sales_id)
);

CREATE TABLE Dealership_Info (
  dealership_id INTEGER PRIMARY KEY,
  car_sold BOOLEAN,
  new_car BOOLEAN,
  car_id INTEGER NOT NULL,
    FOREIGN KEY (car_id)
      REFERENCES Cars(car_id)
);



CREATE TABLE mechanic_service (
  mechanic_service_id SERIAL PRIMARY KEY,
  service_date DATE,
  parts_needed BOOLEAN,
  mechanic_id INTEGER NOT NULL,
  car_id INTEGER NOT NULL,
    FOREIGN KEY (car_id)
      REFERENCES Cars(car_id),
	FOREIGN KEY (mechanic_id)
      REFERENCES Mechanics(mechanic_id)
);