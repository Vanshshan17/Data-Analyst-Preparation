USE college;

CREATE TABLE test_data(
new_id INT,
new_cat VARCHAR(25)
);

INSERT INTO test_data(new_id,new_cat)VALUES
(100,"agni"),
(200,"agni"),
(500,"dharti"),
(700,"dharti"),
(200,"vayu"),
(300,"vayu"),
(500,"vayu");

SELECT*FROM test_data;

SELECT new_id,new_cat,
SUM(new_id) OVER(PARTITION BY new_cat ORDER BY new_id) AS "total",
AVG(new_id) OVER(PARTITION BY new_cat ORDER BY new_id) AS "average",
COUNT(new_id) OVER(PARTITION BY new_cat ORDER BY new_id) AS "count",
MIN(new_id) OVER(PARTITION BY new_cat ORDER BY new_id) AS "minimum",
MAX(new_id) OVER(PARTITION BY new_cat ORDER BY new_id) AS "maximum"
FROM test_data;

SELECT new_id,new_cat,
SUM(new_id) OVER(ORDER BY new_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS "total",
AVG(new_id) OVER(ORDER BY new_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS "average",
COUNT(new_id) OVER(ORDER BY new_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS "count",
MIN(new_id) OVER(ORDER BY new_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS "minimum",
MAX(new_id) OVER(ORDER BY new_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS "maximum"
FROM test_data;

SELECT new_id,
ROW_NUMBER() OVER(ORDER BY new_id ) AS "row_number",
RANK() OVER(ORDER BY new_id ) AS "rank",
DENSE_RANK() OVER(ORDER BY new_id ) AS "dense_rank",
PERCENT_RANK() OVER(ORDER BY new_id ) AS "percent_rank"
FROM test_data;

SELECT new_id,
FIRST_VALUE(new_id) OVER(ORDER BY new_id ) AS "FIRST_VALUE",
LAST_VALUE(new_id) OVER(ORDER BY new_id ) AS "LAST_VALUE",
LEAD(new_id) OVER(ORDER BY new_id ) AS "LEAD",
LAG(new_id) OVER(ORDER BY new_id ) AS "LAG"
FROM test_data;	

SELECT new_id,
LEAD(new_id,2) OVER(ORDER BY new_id ) AS "LEAD",
LAG(new_id,2) OVER(ORDER BY new_id ) AS "LAG"
FROM test_data;	
USE college;

CREATE TABLE payment(
customer_id INT PRIMARY KEY,
amount INT
);

INSERT INTO payment(customer_id,amount) VALUES
(1,60),
(10,70),
(11,80),
(2,500),
(8,100);
SELECT*FROM payment;

											  





SELECT customer_id,amount,
CASE
WHEN amount>100 THEN "Expensive Product"
WHEN amount=100 THEN "Moderate Product"
ELSE "Inexpensive Product"
END AS ProductStatus
FROM payment;

SELECT customer_id,
CASE amount
WHEN 500 THEN "Expensive Product"
WHEN 100 THEN "Moderate Product"
ELSE "Inexpensive Product"
END AS ProductStatus
FROM payment;











