# SQL / Redash Dashboard (Karpov.Courses) — учебный проект

Учебный проект по продуктовой аналитике, выполненный в **Redash** на основе SQL-запросов  
в рамках обучения на платформе **Karpov.Courses**.

Дашборд собран в учебной среде Redash, доступ к базе данных и подключениям воспроизвести локально нельзя.  
Проект оформлен в виде портфолио: описание логики, метрик и визуализаций.

## Примеры SQL-запросов (витрина)

1) **Новые пользователи и курьеры по дням + накопительные итоги**  
   → [01_new_users_couriers_daily.sql](sql_samples/01_new_users_couriers_daily.sql)

2) **Пользователей на курьера и заказов на курьера (по дням)**  
   → [02_users_orders_per_courier.sql](sql_samples/02_users_orders_per_courier.sql)

3) **Среднее время доставки по дням (accept → deliver)**  
   → [03_delivery_time_daily.sql](sql_samples/03_delivery_time_daily.sql)

4) **Cancel rate по часам**  
   → [04_cancel_rate_by_hour.sql](sql_samples/04_cancel_rate_by_hour.sql)

5) **Дневная выручка + накопительная выручка + изменение (DoD)**  
   → [05_daily_revenue_cumulative.sql](sql_samples/05_daily_revenue_cumulative.sql)


## Ниже — список метрик, которые считаются запросами и визуализируются в Redash.

- **New Users / New Couriers** — количество новых пользователей и курьеров за день  
- **Paying Users** — пользователи с хотя бы одним успешным заказом  
- **ARPU** — выручка / общее число пользователей  
- **ARPPU** — выручка / число платящих пользователей  
- **AOV** — средний чек  
- **Cancel Rate** — доля отменённых заказов  
- **Orders per Courier** — среднее число заказов на одного курьера  

## Примеры визуализаций

### Рост пользователей и курьеров
![users_growth](assets/dashboard_users.png)

### Платящие пользователи и активные курьеры
![paying_users](assets/dashboard_paying.png)

### Заказы и первые заказы
![orders](assets/dashboard_orders.png)

### Выручка
![revenue](assets/dashboard_revenue.png)

### Продуктовые метрики (ARPU / ARPPU / AOV)
![metrics](assets/dashboard_metrics.png)


