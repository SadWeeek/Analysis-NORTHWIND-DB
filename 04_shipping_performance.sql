Блок 4. Логистика и доставка

Количество просроченных заказов в 1997:

    with t as   
        (
        select order_date,
        case when shipped_date > required_date then 'delay' else 'in time' end as dostavka
        from orders 
        where order_date between '1997-01-01' and '1997-12-31'
        )
    select count(dostavka)
    from t
    where dostavka = 'delay'

Лучший перевозчик по числу заказов:

    select s.company_name, count(order_id)
    from orders o join shippers s on o.ship_via = s.shipper_id
    group by s.company_name
    order by count(order_id) desc
    limit 1;

Максимальное время доставки:

    select max(shipped_date - order_date)
    from orders
    WHERE shipped_date IS NOT null