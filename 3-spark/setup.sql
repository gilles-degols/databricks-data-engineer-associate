-- Databricks notebook source
-- MAGIC %sh git clone https://github.com/gilles-degols/databricks-data-engineer-associate

-- COMMAND ----------

-- MAGIC %python dbutils.fs.cp("file:/databricks/driver/databricks-data-engineer-associate", "dbfs:/repo", True)

-- COMMAND ----------

-- MAGIC %fs ls dbfs:/repo
