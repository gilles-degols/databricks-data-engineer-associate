-- Databricks notebook source
CREATE OR REPLACE TABLE orders AS SELECT * FROM read_files('/repo/data/orders.json');
