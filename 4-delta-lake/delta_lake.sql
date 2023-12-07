-- Databricks notebook source
DROP TABLE IF EXISTS books;
CREATE TABLE books AS SELECT * EXCEPT (_rescued_data) FROM read_files('/repo/data/books.csv');

-- COMMAND ----------

-- MAGIC %fs ls /user/hive/warehouse/books

-- COMMAND ----------

-- MAGIC %fs ls /user/hive/warehouse/books/_delta_log

-- COMMAND ----------

-- MAGIC %fs head dbfs:/user/hive/warehouse/books/_delta_log/00000000000000000000.json

-- COMMAND ----------

UPDATE books SET price = 37 WHERE id = 0;
UPDATE books SET price = 38 WHERE id = 0;
UPDATE books SET price = 39 WHERE id = 0;
INSERT INTO books VALUES (101, 'Some title', 'Belgium', 0, 200, 15);

-- COMMAND ----------

-- MAGIC %fs ls /user/hive/warehouse/books/

-- COMMAND ----------

-- MAGIC %fs ls /user/hive/warehouse/books/_delta_log

-- COMMAND ----------

DESCRIBE HISTORY books;

-- COMMAND ----------

SELECT * FROM books VERSION AS OF 2 WHERE id = 0;

-- COMMAND ----------

-- MAGIC %python spark.conf.set("spark.databricks.delta.retentionDurationCheck.enabled", "false")

-- COMMAND ----------

VACUUM books RETAIN 0 hours;

-- COMMAND ----------

-- MAGIC %fs ls /user/hive/warehouse/books/

-- COMMAND ----------

-- MAGIC %fs ls /user/hive/warehouse/books/_delta_log/

-- COMMAND ----------

OPTIMIZE books;

-- COMMAND ----------

-- MAGIC %fs ls /user/hive/warehouse/books/

-- COMMAND ----------

-- MAGIC %fs ls /user/hive/warehouse/books/_delta_log/

-- COMMAND ----------

VACUUM books RETAIN 0 hours;

-- COMMAND ----------

-- MAGIC %fs ls /user/hive/warehouse/books/
