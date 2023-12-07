-- Databricks notebook source
CREATE TABLE IF NOT EXISTS books AS SELECT * EXCEPT (_rescued_data) FROM read_files('/repo/data/books.csv');

-- COMMAND ----------

SELECT count_if(country = 'France') FROM books;

-- COMMAND ----------

SELECT count(*) FROM VALUES (NULL), (10), (10) AS example(col);

-- COMMAND ----------

SELECT count(col) FROM VALUES (NULL), (10), (10) AS example(col);

-- COMMAND ----------

SELECT from_unixtime(publish_time) FROM books;


-- COMMAND ----------

SELECT cast(cast(publish_time AS BIGINT) AS timestamp) FROM books;

-- COMMAND ----------

SELECT * FROM books WHERE year(from_unixtime(publish_time)) > 1900;

-- COMMAND ----------

SELECT * FROM books WHERE title LIKE '%e%'
