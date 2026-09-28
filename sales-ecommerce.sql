WITH online_sales AS (
    SELECT
        sh.courier::text AS courier,
        sh.delivery_status::text AS delivery_status,
        u.loyalty_status::text AS loyalty_status,
        o.order_date::date AS order_date,
        o.order_id::text AS order_id,
        pay.payment_method::text AS payment_method,
        pay.payment_status::text AS payment_status,
        p.product_brand::text AS product_brand,
        p.product_category::text AS product_category,
        oi.product_id::numeric AS product_id,
        p.product_name::text AS product_name,
        oi.quantity::numeric AS quantity,
        'Online'::text AS sales_channel,
        p.product_price::numeric AS unit_price,
        u.user_city::text AS user_city,
        u.user_id::numeric AS user_id,
        u.user_name::text AS user_name

    FROM project.orders_sql_project AS o
    JOIN project.order_items_sql_project AS oi
        ON o.order_id = oi.order_id
    JOIN project.products_sql_project AS p
        ON oi.product_id = p.product_id
    LEFT JOIN project.users_sql_project AS u
        ON o.user_id = u.user_id
    LEFT JOIN project.payments_sql_project AS pay
        ON o.order_id = pay.order_id
    LEFT JOIN project.shipments_sql_project AS sh
        ON o.order_id = sh.order_id
),

offline_sales AS (
    SELECT
        NULL::text AS courier,
        NULL::text AS delivery_status,
        u.loyalty_status::text AS loyalty_status,
        so.order_date::date AS order_date,
        so.store_order_id::text AS order_id,
        sp.payment_method::text AS payment_method,
        sp.payment_status::text AS payment_status,
        p.product_brand::text AS product_brand,
        p.product_category::text AS product_category,
        soi.product_id::numeric AS product_id,
        p.product_name::text AS product_name,
        soi.quantity::numeric AS quantity,
        'Offline'::text AS sales_channel,
        p.product_price::numeric AS unit_price,
        u.user_city::text AS user_city,
        u.user_id::numeric AS user_id,
        u.user_name::text AS user_name

    FROM project.store_orders AS so
    JOIN project.store_order_items AS soi
        ON so.store_order_id = soi.store_order_id
    JOIN project.products_sql_project AS p
        ON soi.product_id = p.product_id
    LEFT JOIN project.users_sql_project AS u
        ON so.user_id = u.user_id
    LEFT JOIN project.store_payments AS sp
        ON so.store_order_id = sp.store_order_id
)

SELECT *
FROM online_sales

UNION ALL

SELECT *
FROM offline_sales;
	
	

