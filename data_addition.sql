--car 1
SELECT add_car(1, 1997, 'Toyota', 'Camry', 1);

--car 2
SELECT add_car(2, 2020, 'Kia', 'Niro', 1);

--car 3
SELECT add_car(3, 2018, 'Honda', 'Civic', 2);

--car 4
SELECT add_car(4, 2022, 'Jeep', 'Wrangler', 3);

--car 5, not yet sold so customer id is null
SELECT add_car(5, 2016, 'Ford', 'F150', NULL);

SELECT * 
FROM cars;

--customer 1
SELECT add_customer(1, 'John', 'Smith', '4368207985577104');

--customer 2
SELECT add_customer(2, 'Jane', 'Doe', '4539099094216664');

--customer 3
SELECT add_customer(3, 'Nick', 'Fury', '4929969064498245');

--customer 4
SELECT add_customer(4, 'Steve', 'Rogers', '4024007112905848');

SELECT *
FROM customer;

--dealer info 1 (car 2, customer 1)
SELECT add_dealership_info(1, TRUE, FALSE, 2);

--dealer info 2 (car 5)
SELECT add_dealership_info(2, FALSE, TRUE, 5);

--dealer info 3 (car 4, customer 3)
SELECT add_dealership_info(3, TRUE, TRUE, 4);

SELECT *
FROM dealership_info;

--mechanic 1
SELECT add_mechanic(1, 'Robbie', 'Reyes');

--mechanic 2
SELECT add_mechanic(2, 'Tony', 'Stark');

SELECT *
FROM mechanics;

--salesperson 1
SELECT add_salesperson(1, 'Pepper', 'Potts');

--salesperson 2
SELECT add_salesperson(2, 'Scott', 'Lang');

--salesperson 3
SELECT add_salesperson(3, 'May', 'Parker');

--salesperson 4
SELECT add_salesperson(4, 'Ben', 'Parker');

SELECT*
FROM salesperson;

--mechanic service 1
SELECT add_service_ticket(1, '2023-06-24', FALSE, 2, 4)

--mechanic service 2
SELECT add_service_ticket(2, '2023-04-04', TRUE, 1, 1)

SELECT *
FROM mechanic_service;

--invoice 1 car 2, pepper
SELECT add_invoice(1, 25000, '2022-01-17', 1, 2);

--invoice 2 car 4, scott
SELECT add_invoice(2, 23500, '2023-09-23', 2, 4);

SELECT *
FROM invoice;

--updating car is_serviced
--car 1
CALL nowServiced(1);
--car 2
CALL nowServiced(2);
--car 4
CALL nowServiced(4);

SELECT * 
FROM cars;