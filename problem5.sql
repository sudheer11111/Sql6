WITH CTE AS (
SELECT customer_id, substr(order_date,1,4) as o_date, sum(price) as total FROM Orders
Group by substr(order_date,1,4), customer_id
)

SELECT a.customer_id FROM CTE a LEFT JOIN CTE b ON a.customer_id = b.customer_id and a.o_date + 1 = b.o_date and a.total < b.total
Group by a.customer_id
Having count(distinct b.o_date) = max(a.o_date) - min(a.o_date)
