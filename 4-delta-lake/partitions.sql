-- Databricks notebook source
CREATE TABLE IF NOT EXISTS books 
AS SELECT * EXCEPT (_rescued_data) FROM read_files('/repo/data/books.csv');

-- COMMAND ----------

CREATE TABLE IF NOT EXISTS partitioned_books PARTITIONED BY (country) 
AS SELECT * EXCEPT (_rescued_data) FROM read_files('/repo/data/books.csv');

-- COMMAND ----------

-- MAGIC %fs ls /user/hive/warehouse/books

-- COMMAND ----------

-- MAGIC %fs ls /user/hive/warehouse/partitioned_books

-- COMMAND ----------

EXPLAIN SELECT * FROM books WHERE country='Argentina';

-- COMMAND ----------

EXPLAIN SELECT * FROM partitioned_books WHERE country='Argentina';

-- COMMAND ----------

SELECT * FROM partitioned_books;
