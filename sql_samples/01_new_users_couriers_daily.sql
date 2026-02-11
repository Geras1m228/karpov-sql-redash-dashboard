-- Задача: Посчитать новых пользователей и новых курьеров по дате первого действия + накопительные итоги.
-- Решение использует: CTE, объединение дат (UNION), оконная сумма SUM() OVER (ORDER BY date).
-- Результат: date, new_users, new_couriers, total_users, total_couriers.
-- Примечания: дата первого действия = MIN(time)::date для каждого user/courier.

WITH first_action_users AS (SELECT first_action, COUNT(user_id) AS new_users 
                            FROM (SELECT user_id, MIN(time)::DATE AS first_action FROM user_actions GROUP BY 1) t1
                            GROUP BY 1),
  
first_action_couriers AS (SELECT first_action , COUNT(courier_id) AS new_couriers 
                          FROM (SELECT courier_id, MIN(time)::DATE AS first_action FROM courier_actions GROUP BY 1) t2
                          GROUP BY 1),
  
total_dates AS (SELECT first_action FROM first_action_users GROUP BY 1
                UNION 
                SELECT first_action FROM first_action_couriers GROUP BY 1)

SELECT t.first_action AS date, new_users, new_couriers, 
       (SUM(new_users) OVER (ORDER BY t.first_action))::INT AS total_users,
       (SUM(new_couriers) OVER (ORDER BY t.first_action))::INT AS total_couriers
FROM total_dates AS t LEFT JOIN first_action_users AS u ON u.first_action = t.first_action
                      LEFT JOIN first_action_couriers AS c ON c.first_action = t.first_action
