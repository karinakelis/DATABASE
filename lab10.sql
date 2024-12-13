
BEGIN;

INSERT INTO Orders (order_id, book_id, customer_id, order_date, quantity)
VALUES (1, 1, 101, CURRENT_DATE, 2);

UPDATE Books
SET quantity = quantity - 2
WHERE book_id = 1;

COMMIT;

BEGIN;

DO $$
DECLARE
    stock_available INTEGER;
BEGIN
    SELECT quantity INTO stock_available
    FROM Books
    WHERE book_id = 3;

    IF stock_available < 10 THEN
        RAISE EXCEPTION 'Not enough stock available. Transaction rolled back.';
    ELSE
        INSERT INTO Orders (order_id, book_id, customer_id, order_date, quantity)
        VALUES (2, 3, 102, CURRENT_DATE, 10);

        UPDATE Books
        SET quantity = quantity - 10
        WHERE book_id = 3;
    END IF;
END $$;

ROLLBACK;

BEGIN;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

UPDATE Books
SET price = 38.00
WHERE book_id = 2;

COMMIT;

BEGIN;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

SELECT price
FROM Books
WHERE book_id = 2;

SELECT price
FROM Books
WHERE book_id = 2;

COMMIT;

BEGIN;

UPDATE Customers
SET email = 'newemail@example.com'
WHERE customer_id = 101;

COMMIT;

SELECT * FROM Customers WHERE customer_id = 101;
