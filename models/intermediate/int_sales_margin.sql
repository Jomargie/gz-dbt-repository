SELECT
sales.products_id,
sales.date_date,
sales.orders_id,
sales.revenue,
sales.quantity,
products.purchase_price,
ROUND(SUM(sales.quantity*products.purchase_price),2) AS purchase_cost,
ROUND(SUM(sales.revenue) - SUM(sales.quantity * products.purchase_price), 2) AS margin
FROM {{ ref('stg_gz_raw_data__raw_gz_sales') }} AS sales
LEFT JOIN {{ ref('stg_gz_raw_data__raw_gz_product') }} AS products
USING(products_id)
GROUP BY
sales.products_id,
sales.date_date,
sales.orders_id,
sales.revenue,
sales.quantity,
products.purchase_price