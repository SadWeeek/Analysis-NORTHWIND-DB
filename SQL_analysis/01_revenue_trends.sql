Блок 1. Общая динамика продаж

Выручка за 1997 год:

    select  
    sum(od.unit_price * od.quantity * (1-od.discount)) viruchka
    from order_details od join orders o on od.order_id = o.order_id
    where order_date between '1997-01-01' and '1997-12-31'

Количество заказов по кварталам 1997 года:

    select 
    extract(quarter from order_date) as quarter,
    count(*)
    from orders o 
    where extract(year from order_date) = '1997'
    group by extract(quarter from order_date)
