-- Databricks notebook source
GRANT USE CATALOG ON CATALOG adventureworks TO "Developers"
GRANT USE CATALOG ON CATALOG adventureworks TO "Project RL - Data Engineers"

-- COMMAND ----------

GRANT USE SCHEMA ON SCHEMA adventureworks.bronze TO "Developers"
GRANT USE SCHEMA ON SCHEMA adventureworks.bronze TO "Project RL - Data Engineers"
GRANT CREATE ON SCHEMA adventureworks.bronze TO "Project RL - Data Engineers"

GRANT USE SCHEMA ON SCHEMA adventureworks.silver TO "Developers"
GRANT USE SCHEMA ON SCHEMA adventureworks.silver TO "Project RL - Data Engineers"
GRANT CREATE ON SCHEMA adventureworks.silver TO "Project RL - Data Engineers"

GRANT USE SCHEMA ON SCHEMA adventureworks.gold TO "Developers"
GRANT USE SCHEMA ON SCHEMA adventureworks.gold TO "Project RL - Data Engineers"
GRANT CREATE ON SCHEMA adventureworks.gold TO "Project RL - Data Engineers"

-- COMMAND ----------

GRANT SELECT ON TABLE adventureworks.bronze.products TO "Developers"
GRANT SELECT ON TABLE adventureworks.bronze.products TO "Project RL - Data Engineers"

GRANT SELECT ON TABLE adventureworks.bronze.sales_order_header TO "Developers"
GRANT SELECT ON TABLE adventureworks.bronze.sales_order_header TO "Project RL - Data Engineers"

GRANT SELECT ON TABLE adventureworks.bronze.sales_order_detail TO "Developers"
GRANT SELECT ON TABLE adventureworks.bronze.sales_order_detail TO "Project RL - Data Engineers"

GRANT SELECT ON TABLE adventureworks.silver.products TO "Developers"
GRANT SELECT ON TABLE adventureworks.silver.products TO "Project RL - Data Engineers"

GRANT SELECT ON TABLE adventureworks.silver.sales_order_header TO "Developers"
GRANT SELECT ON TABLE adventureworks.silver.sales_order_header TO "Project RL - Data Engineers"

GRANT SELECT ON TABLE adventureworks.silver.sales_order_detail TO "Developers"
GRANT SELECT ON TABLE adventureworks.silver.sales_order_detail TO "Project RL - Data Engineers"

GRANT SELECT ON TABLE adventureworks.gold.sales TO "Developers"
GRANT SELECT ON TABLE adventureworks.gold.sales TO "Project RL - Data Engineers"
