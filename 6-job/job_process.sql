-- Databricks notebook source
CREATE OR REPLACE TABLE orders_cleaned AS SELECT id, book_id, buyer, creation_time FROM orders;
