Блок 3. Клиентский анализ

Клиенты без заказов:

    select 
    c.contact_name, 
    c.city, 
    count(o.order_id)
    from customers c left join orders o on o.customer_id = c.customer_id
    group by c.customer_id 
    having count(o.order_id) = 0

Топ‑1 клиент по количеству заказов:

    select contact_name, count(order_id)
    from customers c join orders o on c.customer_id = o.customer_id
    group by contact_name
    order by count(order_id) desc 
    limit 1

Контакты из Испании с числом заказов:

    select c.contact_name, count(order_id)
    from customers c left join orders o  on o.customer_id = c.customer_id
    where c.country = 'Spain'
    group by c.contact_name

Группировка контактов по должностям (Marketing/Sales/Other):

    select count(contact_name),
    case when c.contact_title like '%Marketing%' then 'Marketing'
         when c.contact_title like '%Sales%' then 'Sales'
         else 'Other' end as prof_group
    from customers c 
    group by prof_group

Клиенты с более чем 10 заказами (CTE):

    with t as 
        (
        select customer_id, count(order_id)
        from orders 
        group by customer_id 
        having count(order_id) > 10
        )
    select count(customer_id)
    from t