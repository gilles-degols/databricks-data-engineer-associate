-- Databricks notebook source
CREATE TABLE IF NOT EXISTS books AS SELECT * EXCEPT (_rescued_data) FROM read_files('/repo/data/books.csv');

-- COMMAND ----------

SELECT title, COUNT(*) AS number_of_records, MAX(id) AS max_id 
  FROM books 
  GROUP BY title 
  HAVING COUNT(*) > 1;

-- COMMAND ----------

DELETE FROM books 
   WHERE id IN (
    SELECT MAX(id) AS CNT 
    FROM books 
    GROUP BY title 
    HAVING COUNT(*) > 1
);


-- COMMAND ----------

DROP TABLE IF EXISTS books;
CREATE TABLE books AS SELECT * EXCEPT (_rescued_data) FROM read_files('/repo/data/books.csv');

-- COMMAND ----------

-- MAGIC %python
-- MAGIC df = spark.table("books")
-- MAGIC df = df.dropDuplicates(["title"])
-- MAGIC df.write.mode("overwrite").saveAsTable("books")

-- COMMAND ----------

SELECT title, COUNT(*) AS number_of_records, MAX(id) AS max_id 
  FROM books 
  GROUP BY title 
  HAVING COUNT(*) > 1;
