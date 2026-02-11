## Примеры SQL-запросов (витрина)

1) **Новые пользователи и курьеры по дням + накопительные итоги** (CTE, оконные функции)  
   → [01_new_users_couriers_daily.sql](01_new_users_couriers_daily.sql)

2) **Платящие пользователи и активные курьеры + доли** (фильтры, оконные функции, KPI)  
   → [02_users_orders_per_courier.sql](sql_samples/02_users_orders_per_courier.sql)

3) **Среднее время доставки по дням (accept → deliver)** (join, разница времён)  
   → [03_delivery_time_daily.sql](sql_samples/03_delivery_time_daily.sql)

4) **Cancel rate по часам** (группировка, доли)  
   → [04_cancel_rate_by_hour.sql](sql_samples/04_cancel_rate_by_hour.sql)

5) **Дневная выручка + накопительная выручка + изменение** (UNNEST, окна, LAG)  
   → [05_daily_revenue_cumulative.sql](sql_samples/05_daily_revenue_cumulative.sql)
