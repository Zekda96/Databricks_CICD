-- Databricks notebook source
DROP TABLE IF EXISTS adventureworks.bronze.sales_order_detail
DROP TABLE IF EXISTS adventureworks.bronze.sales_order_header
DROP TABLE IF EXISTS adventureworks.bronze.products

-- COMMAND ----------

DROP TABLE IF EXISTS adventureworks.silver.sales_order_detail
DROP TABLE IF EXISTS adventureworks.silver.sales_order_header
DROP TABLE IF EXISTS adventureworks.silver.products

-- COMMAND ----------

DROP TABLE IF EXISTS adventureworks.gold.sales
