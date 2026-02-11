-- Задача: Посчитать среднее время доставки по дням (от accept_order до deliver_order).
-- Решение использует: join по order_id, разница времён, EXTRACT(EPOCH), агрегирование AVG().
-- Результат: date, minutes_to_deliver.
-- Примечания: учитываются только заказы, у которых есть событие deliver_order.

WITH order_list AS (
SELECT t1.order_id, accept_time, deliver_time FROM
    (SELECT order_id, action, time as accept_time FROM courier_actions WHERE action = 'accept_order') AS t1
LEFT JOIN 
    (SELECT order_id, action, time as deliver_time FROM courier_actions WHERE action = 'deliver_order') AS t2
ON t1.order_id = t2.order_id
WHERE deliver_time IS NOT NULL)

SELECT accept_time::DATE AS date, ROUND(AVG(EXTRACT(EPOCH FROM (deliver_time - accept_time)) / 60))::INT AS minutes_to_deliver
FROM order_list
GROUP BY 1
ORDER BY 1;
