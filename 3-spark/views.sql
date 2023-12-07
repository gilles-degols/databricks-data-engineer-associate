-- Databricks notebook source
CREATE TABLE IF NOT EXISTS books AS SELECT * EXCEPT (_rescued_data) FROM read_files('/repo/data/books.csv');

-- COMMAND ----------

CREATE VIEW view_spain AS SELECT * FROM books WHERE country = 'Spain';

-- COMMAND ----------

SELECT * FROM view_spain;

-- COMMAND ----------

CREATE VIEW view_spain AS SELECT * FROM books WHERE country = 'Spain';

-- COMMAND ----------

CREATE TEMP VIEW temp_spain AS SELECT * FROM books WHERE country = 'Spain';

-- COMMAND ----------

CREATE GLOBAL TEMP VIEW view_spain AS SELECT * FROM books WHERE country = 'Spain';

-- COMMAND ----------

SELECT * FROM global_temp.view_spain;

-- COMMAND ----------

WITH t(col1, col2) AS (SELECT 1, 2) 
SELECT * FROM t WHERE col1 = 1;
