-- Give the number of employees that live in Texas
select
	employee.id,
	employee.firstname,
	employee.lastname,
	address.line1,
	address.city,
	address.state,
	address.zip
FROM demodb.employee employee
INNER JOIN demodb.address_employee address_employee
ON employee.id = address_employee.employee_id
INNER JOIN demodb.address address
ON
  address_employee.address_id = address.id
  AND address.state = 'TX'
ORDER BY employee.id ASC
LIMIT 1000
;

-- List the average income of employee by state
SELECT
	address.state,
	AVG(income.income) AS avg_income
FROM demodb.address address
LEFT JOIN demodb.address_employee address_employee
ON address.id = address_employee.address_id
LEFT JOIN demodb.employee employee
ON address_employee.employee_id = employee.id
LEFT JOIN demodb.income income
ON employee.id = income.employee_id
GROUP BY 1
ORDER BY 2 DESC
;

-- List the employee(s) with the highest income
INSERT INTO 'demodb.address' ()

SELECT
	CONCAT(employee.firstname, " ", employee.lastname) AS employee_name,
	income.income
FROM demodb.employee employee
LEFT JOIN demodb.income income
ON employee.id = income.employee_id
ORDER BY 2 DESC
;

/*
Add a second address for all employees that make over 220K (it's ok to use the same value for their primary address).

1. Get addresses that aren't related to our top earners. We'll use these as second houses for our top earners so we don't have to make up new addresses.
Then, add row_num column so we can join arbitrarily later.
*/
SET @row_number = 0;
DROP TEMPORARY TABLE IF EXISTS addresses_to_add;
CREATE TEMPORARY TABLE addresses_to_add (
SELECT
	(@row_number:=@row_number + 1) AS row_num,
	address_employee.address_id AS address_id
FROM demodb.address_employee address_employee
WHERE
	address_employee.employee_id NOT IN (
	SELECT
		income.employee_id
	FROM demodb.income income
	WHERE
		income.income > 220000
	)
)
;

/*
2. Get the employee IDs of the people that need to have second houses added and add a row_num to arbitrarily join to the address_ids
*/
SET @row_number = 0;
DROP TEMPORARY TABLE IF EXISTS employees_to_add;
CREATE TEMPORARY TABLE employees_to_add (
SELECT
	(@row_number:=@row_number + 1) AS row_num,
	income.employee_id AS employee_id
FROM demodb.income income
WHERE
	income > 220000
);

/*
3. Create new links to those addresses for our top earners to give them a second house
*/
INSERT INTO demodb.address_employee (address_id, employee_id)
	SELECT
		employees.employee_id,
		addresses.address_id
	FROM employees_to_add employees
	INNER JOIN addresses_to_add addresses
	ON employees.row_num = addresses.row_num
;

-- Give everyone a 10% raise
UPDATE demodb.income
SET income.income = income.income * 1.1
;

-- Give the lowest-paid employee a $5,000 raise
SET @lowest_income_employee = (
	SELECT
		income.employee_id
	FROM demodb.income income
	WHERE
		income = (
			SELECT
				MIN(income.income) AS min_income
			FROM demodb.income income
		)
);

UPDATE demodb.income
SET income.income = income.income + 5000
WHERE
	income.employee_id = @lowest_income_employee
;

-- Delete any employee whose last name starts with a W
DROP TEMPORARY TABLE IF EXISTS w_employees;
CREATE TEMPORARY TABLE w_employees (
  SELECT
    employee.id AS id
  FROM demodb.employee
  WHERE
    employee.lastname LIKE "W%"
)
;

DELETE FROM demodb.income
WHERE income.employee_id IN (
  SELECT
    *
  FROM w_employees
)
;

DELETE FROM demodb.address_employee
WHERE address_employee.employee_id IN (
  SELECT
    *
  FROM w_employees
)
;

DELETE FROM demodb.employee
WHERE employee.id IN (
  SELECT
    *
  FROM w_employees
)
;

-- Find the number of addresses
SELECT
  count(*)
FROM demodb.address
;

SELECT
  sum(income.income)
FROM demodb.income income
;
