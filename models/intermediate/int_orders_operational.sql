SELECT
margin.products_id,
margin.date_date,
margin.orders_id,
margin.revenue,
margin.quantity,
margin.purchase_price,
margin.purchase_cost,
margin.margin,
ship.shipping_fee,
ship.logcost,
ship.ship_cost,
ROUND(SUM(margin.margin+ship.shipping_fee-ship.logcost-ship.ship_cost),2) AS operational_margin,
FROM {{ ref('int_sales_margin') }} AS margin
LEFT JOIN {{ ref('stg_gz_raw_data__raw_gz_ship') }} AS ship
USING(orders_id)
GROUP BY
products_id,
date_date,
orders_id,
revenue,
quantity,
purchase_price,
purchase_cost,
margin,
shipping_fee,
logcost,
ship_cost