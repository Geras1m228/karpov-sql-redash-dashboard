## Примеры SQL-запросов (витрина)

1) **Новые пользователи и курьеры по дням + накопительные итоги** (CTE, оконные функции)  
   → [01_new_users_couriers_daily.sql](01_new_users_couriers_daily.sql)

2) **Платящие пользователи и активные курьеры + доли** (фильтры, KPI)  
   → [02_users_orders_per_courier.sql](02_users_orders_per_courier.sql)

3) **Среднее время доставки по дням (accept → deliver)** (join, разница времён)  
   → [03_delivery_time_daily.sql](03_delivery_time_daily.sql)

4) **Cancel rate по часам** (группировка, доли)  
   → [04_cancel_rate_by_hour.sql](04_cancel_rate_by_hour.sql)

5) **Дневная выручка + накопительная выручка + изменение** (UNNEST, окна, LAG)  
   → [05_daily_revenue_cumulative.sql](05_daily_revenue_cumulative.sql)
