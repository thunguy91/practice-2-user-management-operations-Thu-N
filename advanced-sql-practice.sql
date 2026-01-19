SELECT * FROM customers;
SELECT * FROM orders;

-- Task 1: JOIN query. 
SELECT orders.id, customers.first_name, customers.last_name, orders.order_date, orders.total_amount
FROM orders
INNER JOIN customers ON orders.customer_id = customers.id;

-- Task 2: GROUP BY query.
SELECT customer_id, order_date, SUM(total_amount) AS total_spent
FROM orders
GROUP BY customer_id, order_date;

-- Task 3: Apply WHERE and HAVING clauses to filter data.
-- Filter orders placed after March 1st, 2023.
SELECT *
FROM orders
WHERE order_date > '2023-03-01';

-- Filter customers who have spent over $200
SELECT customer_id, SUM(total_amount) AS total_spent
FROM orders
GROUP BY customer_id
HAVING SUM(total_amount) > 200;

-- Task 4: SubQueries
-- Find customers who have ordered $200 or more in one order.
SELECT first_name, last_name
FROM customers
WHERE id IN (
    SELECT customer_id
    FROM orders
    WHERE total_amount >= 200
);

-- Find customers who have ordered more than once.
SELECT first_name, last_name
FROM customers
WHERE id IN (
    SELECT customer_id
    FROM orders
    GROUP BY customer_id
    HAVING COUNT(id) > 1
);