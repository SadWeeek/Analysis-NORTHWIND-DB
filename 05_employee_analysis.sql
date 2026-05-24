Блок 5. Анализ сотрудников


Сотрудник с максимальным числом заказов с группировкой по месяцам:

    select date_trunc('month', o.order_date), 
    count(order_id), 
    e.employee_id 
    from orders o join employees e on e.employee_id = o.employee_id 
    group by date_trunc('month', o.order_date), e.employee_id 
    order by count(order_id) desc

Сотрудник с максимальным числом заказов:

    select count(order_id), 
    e.employee_id 
    from orders o join employees e on e.employee_id = o.employee_id 
    group by e.employee_id 
    order by count(order_id) desc

Сотрудник, работавший с клиентом Francisco Chang:

    select e.last_name, e.first_name
    from orders o join employees e on o.employee_id = e.employee_id 
                  join customers c on o.customer_id = c.customer_id 
    where c.contact_name = 'Francisco Chang'


Гендерное распределение сотрудников:
 
    with t as
        (
        select first_name, last_name, e.title_of_courtesy,
        case when e.title_of_courtesy = 'Ms.' or title_of_courtesy = 'Mrs.' then 'Women' else 'Men' end as gender 
        from employees e 
        )   
    select gender, count(gender)
    from t
    group by gender