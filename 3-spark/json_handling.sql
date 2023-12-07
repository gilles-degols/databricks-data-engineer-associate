-- Databricks notebook source
CREATE TABLE IF NOT EXISTS orders AS SELECT * EXCEPT (_rescued_data) FROM read_files('/repo/data/orders.json');

-- COMMAND ----------

SELECT metadata.delivery_speed FROM orders;

-- COMMAND ----------

CREATE TABLE orders_raw AS SELECT * EXCEPT (_rescued_data) FROM read_files('/repo/data/orders.csv', sep => ';');

-- COMMAND ----------

SELECT metadata:delivery_speed FROM orders_raw;

-- COMMAND ----------

DESCRIBE EXTENDED orders_raw;

-- COMMAND ----------

SELECT buyer, metadata.locations FROM orders;

-- COMMAND ----------

SELECT buyer, explode(metadata.locations) FROM orders;

-- COMMAND ----------

SELECT flatten(array(array(1, 2), array(3, 4)));
