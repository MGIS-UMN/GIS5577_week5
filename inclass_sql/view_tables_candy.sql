CREATE candy_sales AS
SELECT *
FROM candy_purchases

SELECT *
FROM candy_sales

SELECT date_part('year', purchased_date) as year, count(1)
FROM candy_sales
GROUP BY date_part('year', purchased_date)

CREATE VIEW candy_sales_2018 AS
SELECT *
FROM candy_sales 
WHERE date_part('year', purchased_date) = 2018

SELECT *
FROM candy_sales_2018

INSERT INTO candy_sales (candy_type, candy_owner, purchased_date, candy_id) VALUES ('ju-ju', 'Maxine', '06-06-2018', 55),('ju-ju', 'Maxine', '06-06-2018', 55),('ju-ju', 'Maxine', '06-06-2018', 55)