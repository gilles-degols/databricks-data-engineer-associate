-- Databricks notebook source
CREATE TABLE IF NOT EXISTS books AS SELECT * EXCEPT (_rescued_data) FROM read_files('/repo/data/books.csv');

-- COMMAND ----------

CREATE SCHEMA demo;
USE SCHEMA demo;
CREATE TABLE IF NOT EXISTS books AS SELECT * EXCEPT (_rescued_data) FROM read_files('/repo/data/books.csv');

-- COMMAND ----------

DESCRIBE EXTENDED default.books;

-- COMMAND ----------

DESCRIBE EXTENDED demo.books;

-- COMMAND ----------

CREATE TABLE IF NOT EXISTS custom_table_books LOCATION 'dbfs:/custom-table'
AS SELECT * EXCEPT (_rescued_data) FROM read_files('/repo/data/books.csv');

-- COMMAND ----------

DESCRIBE EXTENDED custom_table_books;

-- COMMAND ----------

DROP TABLE IF EXISTS default.books;
DROP TABLE IF EXISTS demo.books;
DROP TABLE IF EXISTS demo.custom_table_books;

-- COMMAND ----------

-- MAGIC %fs ls /custom-table

-- COMMAND ----------

-- MAGIC %fs ls /user/hive/warehouse

-- COMMAND ----------

-- MAGIC %fs ls /user/hive/warehouse/demo.db
