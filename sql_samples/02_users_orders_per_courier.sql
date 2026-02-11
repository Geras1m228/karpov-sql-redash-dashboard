-- Задача: Посчитать по дням: платящих пользователей и активных курьеров, а также их доли от общего числа пользователей/курьеров.
-- Решение использует: фильтрация отменённых заказов, CTE, дневные агрегаты, объединение дат, расчёт users_per_courier и orders_per_courier.
-- Результат: DATE, users_per_courier, orders_per_courier.
-- Примечания: общая база пользователей/курьеров считается как накопление по дате первого действия.

WITH payment_users AS 
(SELECT time::DATE, COUNT(DISTINCT user_id) as users_count
 FROM user_actions
 WHERE order_id NOT IN (SELECT order_id FROM user_actions WHERE action = 'cancel_order') and action = 'create_order'
 GROUP BY 1),

active_couriers AS
(SELECT time::DATE, COUNT(DISTINCT courier_id) as couriers_count
 FROM courier_actions
 WHERE order_id NOT IN (SELECT order_id FROM user_actions WHERE action = 'cancel_order') and action IN ('deliver_order', 'accept_order')
 GROUP BY 1),

all_dates AS (SELECT time::DATE FROM payment_users
              UNION
              SELECT time::DATE FROM active_couriers),

all_orders AS (SELECT creation_time::DATE, COUNT(order_id) as orders_count
               FROM orders
               WHERE order_id NOT IN (SELECT order_id FROM user_actions WHERE action = 'cancel_order')
               GROUP BY 1)

SELECT a.time AS DATE, 
       ROUND((users_count::numeric / couriers_count), 2) AS users_per_courier,
       ROUND((orders_count::numeric / couriers_count), 2) AS orders_per_courier
FROM all_dates AS a LEFT JOIN payment_users AS u ON u.time = a.time
                    LEFT JOIN active_couriers AS c ON c.time = a.time
                    LEFT JOIN all_orders AS o ON o.creation_time = a.time
ORDER BY 1;
