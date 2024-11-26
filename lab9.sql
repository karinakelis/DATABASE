-- This function takes an integer as input and returns the value increased by 10
CREATE OR REPLACE FUNCTION increase_value(input_value INT)
RETURNS INT AS $$
BEGIN
    RETURN input_value + 10;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE PROCEDURE compare_numbers(
    num1 INT,
    num2 INT,
    OUT result TEXT  --(it stores the result of the procedure)
)
LANGUAGE plpgsql
AS $$
BEGIN
    IF num1 > num2 THEN
        result := 'Greater';
    ELSIF num1 = num2 THEN
        result := 'Equal';
    ELSE
        result := 'Lesser';
    END IF;
END;
$$;





CREATE OR REPLACE FUNCTION number_series(n INT)
RETURNS SETOF INT AS $$
DECLARE
    i INT;
BEGIN
    FOR i IN 1..n LOOP
        RETURN NEXT i;
    END LOOP;
    RETURN;
END;
$$ LANGUAGE plpgsql;





CREATE OR REPLACE FUNCTION find_employee(emp_name TEXT)
RETURNS TABLE(employee_id INT, name TEXT, position TEXT, salary NUMERIC, department TEXT) AS $$
BEGIN
    RETURN QUERY
    SELECT employee_id, name, position, salary, department
    FROM employees
    WHERE name = emp_name;
END;
$$ LANGUAGE plpgsql;





CREATE OR REPLACE FUNCTION list_products(product_category TEXT)
RETURNS TABLE(product_id INT, product_name TEXT, price NUMERIC, stock INT) AS $$
BEGIN
    RETURN QUERY
    SELECT product_id, product_name, price, stock
    FROM products
    WHERE category = product_category;
END;
$$ LANGUAGE plpgsql;





-- Calculates a 10% bonus for an employee based on their salary
CREATE OR REPLACE FUNCTION calculate_bonus(emp_id INT)
RETURNS NUMERIC AS $$
DECLARE
    emp_salary NUMERIC;
    bonus NUMERIC;
BEGIN
    SELECT salary INTO emp_salary
    FROM employees
    WHERE employee_id = emp_id;

    bonus := emp_salary * 0.1;

    RETURN bonus;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION update_salary(emp_id INT)
RETURNS VOID AS $$
DECLARE
    bonus_amount NUMERIC;
    current_salary NUMERIC;
    new_salary NUMERIC;
BEGIN
    SELECT salary INTO current_salary
    FROM employees
    WHERE employee_id = emp_id;

    bonus_amount := calculate_bonus(emp_id);  --Uses the first function inside this function.

    new_salary := current_salary + bonus_amount;

    UPDATE employees
    SET salary = new_salary
    WHERE employee_id = emp_id;

    RAISE NOTICE 'Employee ID %: Updated salary to %. Bonus: %', emp_id, new_salary, bonus_amount;
END;
$$ LANGUAGE plpgsql;






CREATE OR REPLACE FUNCTION complex_calculation(
    num_input INTEGER,
    str_input VARCHAR
)
RETURNS VARCHAR AS $$
DECLARE
    numeric_result INTEGER;
    string_result VARCHAR;
    final_result VARCHAR;
BEGIN
    -- Numeric subblock
    BEGIN
        numeric_result := num_input * 10;
    END;

    -- String subblock
    BEGIN
        string_result := upper(str_input) || '_processed';
    END;

    -- Combining results
    final_result := string_result || ' with result ' || numeric_result::TEXT;

    RETURN final_result;
END;
$$ LANGUAGE plpgsql;