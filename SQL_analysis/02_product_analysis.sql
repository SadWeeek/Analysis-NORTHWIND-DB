Блок 2. Товарный анализ


Топ‑5 категорий по выручке:

    select 
    c.category_name,
    sum(od.unit_price * od.quantity * (1-od.discount))
    from products p join categories c on p.category_id = c.category_id
                    join order_details od on p.product_id = od.product_id
    group by c.category_name 
    order by sum(od.unit_price * od.quantity * (1-od.discount)) desc

Количество продуктов по категориям:
  
    select 
    count(p.product_name),
    c.category_name 
    from products p join categories c on c.category_id = p.category_id 
    group by c.category_name
    order by count(p.product_name) desc

Ценовые сегменты продуктов:

    with t as
        (
        select product_name, unit_price,
        case when unit_price between 0 and 9.99 then '0-9.99'
             when unit_price between 10 and 29.99 then '10-29.99'
             when unit_price between 30 and 49.99 then '30-49.99'
             else '50+' end as segments
        from products p 
        )
    select segments, count(*)
    from t 
    group by segments