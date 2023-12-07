-- Databricks notebook source
CREATE OR REPLACE TABLE recent_orders AS SELECT book_id, buyer FROM orders_cleaned ORDER BY creation_time DESC LIMIT 10;
