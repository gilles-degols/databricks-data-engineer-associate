-- Databricks notebook source
CREATE OR REFRESH LIVE TABLE orders_raw 
AS SELECT * FROM json.`/repo/data/orders.json`;

-- COMMAND ----------

CREATE OR REFRESH LIVE TABLE orders_cleaned 
AS SELECT id, book_id, buyer, creation_time FROM live.orders_raw;

-- COMMAND ----------

CREATE OR REFRESH LIVE TABLE recent_orders
AS SELECT  book_id, buyer FROM live.orders_cleaned ORDER BY creation_time DESC LIMIT 10;
