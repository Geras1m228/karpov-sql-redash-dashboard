-- Задача: Посчитать дневную выручку, накопительную выручку и дневное изменение (DoD) в процентах.
-- Решение использует: UNNEST(product_ids), join с products, оконная сумма, LAG().
-- Результат: date, revenue, total_revenue, revenue_change_pct.
-- Примечания: отменённые заказы исключаются из расчёта.

WITH daily_revenue AS
(SELECT date, SUM(price) AS revenue
 FROM (SELECT date, t1.product_id, price 
       FROM (SELECT order_id, creation_time::DATE AS date, UNNEST(product_ids) AS product_id 
             FROM orders
             WHERE order_id NOT IN (SELECT order_id FROM user_actions WHERE action = 'cancel_order')) as t1
       LEFT JOIN products AS p ON t1.product_id = p.product_id) t2
GROUP BY 1)

SELECT date, 
       revenue, 
       SUM(revenue) OVER(ORDER BY date) AS total_revenue, 
       ROUND(((revenue - LAG(revenue) OVER()::numeric) / LAG(revenue) OVER() * 100), 2) AS revenue_change
FROM daily_revenue
