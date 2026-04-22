-- Monthly Revenue Trend
SELECT 
    DATE_FORMAT(o.order_date, '%Y-%m') AS month,
    SUM(p.price * oi.quantity) AS revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY month
ORDER BY month;
 
-- Customer Lifetime Value (CLV)
SELECT 
    c.customer_name,
    SUM(p.price * oi.quantity) AS lifetime_value
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY c.customer_name;

-- Rank Products by Revenue
SELECT 
    p.product_name,
    SUM(p.price * oi.quantity) AS revenue,
    RANK() OVER (ORDER BY SUM(p.price * oi.quantity) DESC) AS rank_position
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name;