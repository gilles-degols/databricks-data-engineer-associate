-- Databricks notebook source
-- MAGIC %fs ls /

-- COMMAND ----------

-- MAGIC %sh ls -lvah

-- COMMAND ----------

-- MAGIC %sh pwd

-- COMMAND ----------

-- MAGIC %fs cp file:/databricks/driver/preload_class.lst /cp file:preload_class.lst /preload_class.lst

-- COMMAND ----------

-- MAGIC %fs ls /
