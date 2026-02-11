-- Задача: Посчитать по часам: количество доставленных и отменённых заказов + долю отмен (cancel rate).
-- Решение использует: выделение часа из времени заказа, подмножества по статусам, расчёт отношения.
-- Результат: hour, successful_orders, canceled_orders, cancel_rate.
-- Примечания: cancel_rate = canceled / (successful + canceled).

WITH orders_on_hour AS 
(SELECT order_id, DATE_PART('hour', creation_time)::INT AS hour FROM orders),

count_diliver_orders AS
(SELECT hour, COUNT(DISTINCT order_id) AS count_deliver
FROM orders_on_hour
WHERE order_id IN (SELECT order_id FROM courier_actions WHERE action = 'deliver_order')
GROUP BY 1),

count_cancel_orders AS
(SELECT hour, COUNT(DISTINCT order_id) AS count_cancel
FROM orders_on_hour
WHERE order_id IN (SELECT order_id FROM user_actions WHERE action = 'cancel_order')
GROUP BY 1)

SELECT d.hour, count_deliver AS successful_orders, 
       count_cancel AS canceled_orders, 
       ROUND((count_cancel::numeric / (count_deliver + count_cancel)), 3) AS cancel_rate
FROM count_diliver_orders AS d LEFT JOIN count_cancel_orders AS c ON d.hour = c.hour
ORDER BY 1;
