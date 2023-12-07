-- Databricks notebook source
SELECT * FROM csv.`/repo/data/books.csv`;

-- COMMAND ----------

SELECT * FROM read_files('/repo/data/books.csv');

-- COMMAND ----------

SELECT * FROM json.`/repo/data/books.json`;

-- COMMAND ----------

DROP TABLE IF EXISTS books;
CREATE TABLE books(id INT, title STRING, country STRING, publish_time BIGINT, pages INT, price FLOAT);

-- COMMAND ----------

DROP TABLE IF EXISTS books;
CREATE TABLE books AS SELECT * EXCEPT (_rescued_data) FROM read_files('/repo/data/books.csv');

-- COMMAND ----------

SELECT * FROM books;

-- COMMAND ----------

-- MAGIC %fs ls /user/hive/warehouse

-- COMMAND ----------

DROP TABLE IF EXISTS books;
CREATE TABLE books USING CSV LOCATION '/repo/data/books.csv';

-- COMMAND ----------

-- MAGIC %fs ls /user/hive/warehouse

-- COMMAND ----------

DESCRIBE EXTENDED books;

-- COMMAND ----------

DROP TABLE IF EXISTS books;
