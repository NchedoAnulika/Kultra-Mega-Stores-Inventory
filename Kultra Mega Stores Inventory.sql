SELECT TOP (1000) [row_id]
      ,[order_id]
      ,[order_date]
      ,[order_priority]
      ,[order_quantity]
      ,[Sales]
      ,[Discount]
      ,[ship_mode]
      ,[Profit]
      ,[unit_price]
      ,[shipping_cost]
      ,[customer_name]
      ,[Province]
      ,[Region]
      ,[customer_segment]
      ,[product_category]
      ,[product_sub_category]
      ,[product_name]
      ,[product_container]
      ,[product_base_margin]
      ,[ship_date]
  FROM [KMS_Inventory].[dbo].[KMS_Orders]

  EXEC sp_rename 'Order_Status.[Order ID]', 'order_id', 'COLUMN';

  SELECT * FROM KMS_Orders

  SELECT * FROM Order_Status

SELECT [Sales]
FROM KMS_Orders
WHERE TRY_CAST([Sales] AS FLOAT) IS NULL AND [Sales] IS NOT NULL;

SELECT [Profit]
FROM KMS_Orders
WHERE TRY_CAST([Profit] AS FLOAT) IS NULL AND [Profit] IS NOT NULL;

SELECT [Discount]
FROM KMS_Orders
WHERE TRY_CAST([Discount] AS FLOAT) IS NULL AND [Discount] IS NOT NULL;

SELECT [unit_price]
FROM KMS_Orders
WHERE TRY_CAST([unit_price] AS FLOAT) IS NULL AND [unit_price] IS NOT NULL;

SELECT [shipping_cost]
FROM KMS_Orders
WHERE TRY_CAST([shipping_cost] AS FLOAT) IS NULL AND [shipping_cost] IS NOT NULL;

----CASE SCENARIO I
----1. Product Category with Highest Sales
SELECT 
  product_category, 
  SUM(TRY_CAST(Sales AS FLOAT)) AS total_sales
FROM KMS_Orders
GROUP BY product_category
ORDER BY total_sales DESC;

----2. Top 3 and Bottom 3 Regions by Sales
-- Top 3
SELECT Region, SUM(TRY_CAST(Sales AS FLOAT)) AS total_sales
FROM KMS_Orders
GROUP BY Region
ORDER BY total_sales DESC
OFFSET 0 ROWS FETCH NEXT 3 ROWS ONLY;


-- Bottom 3
SELECT Region, SUM(TRY_CAST(Sales AS FLOAT)) AS total_sales
FROM KMS_Orders
GROUP BY Region
ORDER BY total_sales ASC
OFFSET 0 ROWS FETCH NEXT 3 ROWS ONLY;

----3. Total Sales of Appliances in Ontario
SELECT SUM(TRY_CAST(Sales AS FLOAT)) AS total_appliance_sales
FROM KMS_Orders
WHERE product_category = 'Appliances'
  AND province = 'Ontario';

----4. Bottom 10 Customers (to advise on revenue growth)
SELECT customer_name, SUM(TRY_CAST(Sales AS FLOAT)) AS total_sales
FROM KMS_Orders
GROUP BY customer_name
ORDER BY total_sales ASC
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;

----5. Shipping Method with Highest Total Shipping Cost
SELECT ship_mode, SUM(TRY_CAST(shipping_cost AS FLOAT)) AS total_shipping_cost
FROM KMS_Orders
GROUP BY ship_mode
ORDER BY total_shipping_cost DESC;

---CASE SCENARIO II

----6. Most Valuable Customers + What They Buy
-- Top 10 Customers by Total Sales
SELECT customer_name, SUM(TRY_CAST(shipping_cost AS FLOAT)) AS total_sales
FROM KMS_Orders
GROUP BY customer_name
ORDER BY total_sales DESC
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;

-- What they buy
SELECT customer_name, product_category, SUM(TRY_CAST(shipping_cost AS FLOAT)) AS total_sales
FROM KMS_Orders
WHERE customer_name IN (
    SELECT TOP 10 customer_name
    FROM KMS_Orders
    GROUP BY customer_name
    ORDER BY SUM(TRY_CAST(shipping_cost AS FLOAT)) DESC
)
GROUP BY customer_name, product_category;

----7. Small Business Customer with Highest Sales
SELECT customer_name, SUM(TRY_CAST(Sales AS FLOAT)) AS total_sales
FROM KMS_Orders
WHERE customer_segment = 'Small Business'
GROUP BY customer_name
ORDER BY total_sales DESC;

----8. Corporate Customer with Most Orders (2009–2012)
SELECT customer_name, COUNT(DISTINCT order_id) AS order_count
FROM KMS_Orders
WHERE customer_segment = 'Corporate'
  AND YEAR(order_date) BETWEEN 2009 AND 2012
GROUP BY customer_name
ORDER BY order_count DESC;

----9. Most Profitable Consumer Customer
SELECT customer_name, SUM(TRY_CAST(Profit AS FLOAT)) AS total_profit
FROM KMS_Orders
WHERE customer_segment = 'Consumer'
GROUP BY customer_name
ORDER BY total_profit DESC;

----10. Customers Who Returned Items and Their Segment
SELECT DISTINCT o.customer_name, o.customer_segment
FROM KMS_Orders o
JOIN Order_Status s ON o.order_id = s.order_id
WHERE s.Status = 'Returned';

----11. Is Shipping Cost Aligned with Order Priority?
SELECT 
    order_priority,
    ship_mode,
    COUNT(*) AS num_orders,
    AVG(TRY_CAST(shipping_cost AS FLOAT)) AS avg_shipping_cost
FROM KMS_Orders
GROUP BY order_priority, ship_mode
ORDER BY order_priority, avg_shipping_cost DESC;

SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Order_Status';

SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'KMS_Orders';


