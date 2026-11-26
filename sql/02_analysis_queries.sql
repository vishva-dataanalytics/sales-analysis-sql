-- Sales Data Analysis Using SQL
-- Run each query separately in SQLite-compatible software.

-- 1. Overall business KPIs
SELECT
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(100.0 * SUM(profit) / NULLIF(SUM(sales), 0), 2) AS profit_margin_pct,
    COUNT(DISTINCT order_id) AS unique_orders,
    COUNT(DISTINCT customer_id) AS unique_customers,
    SUM(quantity) AS units_sold
FROM superstore;

-- 2. Yearly sales and profit trends
SELECT
    strftime('%Y', order_date) AS order_year,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    COUNT(DISTINCT order_id) AS unique_orders
FROM superstore
GROUP BY strftime('%Y', order_date)
ORDER BY order_year;

-- 3. Performance by category
SELECT
    category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    SUM(quantity) AS units_sold
FROM superstore
GROUP BY category
ORDER BY total_sales DESC;

-- 4. Sub-category profitability (loss-making groups appear first)
SELECT
    sub_category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY sub_category
ORDER BY total_profit ASC;

-- 5. Regional performance
SELECT
    region,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(100.0 * SUM(profit) / NULLIF(SUM(sales), 0), 2) AS profit_margin_pct
FROM superstore
GROUP BY region
ORDER BY total_sales DESC;

-- 6. Customer segment performance
SELECT
    segment,
    COUNT(DISTINCT customer_id) AS customers,
    COUNT(DISTINCT order_id) AS orders,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY segment
ORDER BY total_sales DESC;

-- 7. Top 10 products by sales
SELECT
    product_name,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 10;

-- 8. Products with the largest total losses
SELECT
    product_name,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY product_name
HAVING SUM(profit) < 0
ORDER BY total_profit ASC
LIMIT 10;

-- 9. Discount bands and profitability
SELECT
    CASE
        WHEN discount = 0 THEN 'No discount'
        WHEN discount <= 0.20 THEN '0.01–0.20'
        WHEN discount <= 0.40 THEN '0.21–0.40'
        ELSE 'Above 0.40'
    END AS discount_band,
    COUNT(*) AS order_lines,
    ROUND(AVG(discount) * 100, 2) AS avg_discount_pct,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY discount_band
ORDER BY MIN(discount);

-- 10. Shipping mode performance
SELECT
    ship_mode,
    COUNT(DISTINCT order_id) AS unique_orders,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(AVG(shipping_days), 2) AS avg_shipping_days
FROM superstore
GROUP BY ship_mode
ORDER BY unique_orders DESC;

-- 11. Monthly sales trend
SELECT
    strftime('%Y-%m', order_date) AS order_month,
    ROUND(SUM(sales), 2) AS monthly_sales,
    ROUND(SUM(profit), 2) AS monthly_profit
FROM superstore
GROUP BY strftime('%Y-%m', order_date)
ORDER BY order_month;

-- 12. State-level sales and profit
SELECT
    state,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY state
ORDER BY total_sales DESC
LIMIT 15;
