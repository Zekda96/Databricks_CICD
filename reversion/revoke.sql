-- Databricks notebook source
REVOKE USE CATALOG ON CATALOG adventureworks TO "Developers"
REVOKE USE CATALOG ON CATALOG adventureworks TO "Project RL - Data Engineers"

-- COMMAND ----------

REVOKE USE SCHEMA ON SCHEMA adventureworks.bronze TO "Developers"
REVOKE USE SCHEMA ON SCHEMA adventureworks.bronze TO "Project RL - Data Engineers"
REVOKE CREATE ON SCHEMA adventureworks.bronze TO "Project RL - Data Engineers"

REVOKE USE SCHEMA ON SCHEMA adventureworks.silver TO "Developers"
REVOKE USE SCHEMA ON SCHEMA adventureworks.silver TO "Project RL - Data Engineers"
REVOKE CREATE ON SCHEMA adventureworks.silver TO "Project RL - Data Engineers"

REVOKE USE SCHEMA ON SCHEMA adventureworks.gold TO "Developers"
REVOKE USE SCHEMA ON SCHEMA adventureworks.gold TO "Project RL - Data Engineers"
REVOKE CREATE ON SCHEMA adventureworks.gold TO "Project RL - Data Engineers"

-- COMMAND ----------

REVOKE SELECT ON TABLE adventureworks.bronze.products TO "Developers"
REVOKE SELECT ON TABLE adventureworks.bronze.products TO "Project RL - Data Engineers"

REVOKE SELECT ON TABLE adventureworks.bronze.sales_order_header TO "Developers"
REVOKE SELECT ON TABLE adventureworks.bronze.sales_order_header TO "Project RL - Data Engineers"

REVOKE SELECT ON TABLE adventureworks.bronze.sales_order_detail TO "Developers"
REVOKE SELECT ON TABLE adventureworks.bronze.sales_order_detail TO "Project RL - Data Engineers"

REVOKE SELECT ON TABLE adventureworks.silver.products TO "Developers"
REVOKE SELECT ON TABLE adventureworks.silver.products TO "Project RL - Data Engineers"

REVOKE SELECT ON TABLE adventureworks.silver.sales_order_header TO "Developers"
REVOKE SELECT ON TABLE adventureworks.silver.sales_order_header TO "Project RL - Data Engineers"

REVOKE SELECT ON TABLE adventureworks.silver.sales_order_detail TO "Developers"
REVOKE SELECT ON TABLE adventureworks.silver.sales_order_detail TO "Project RL - Data Engineers"

REVOKE SELECT ON TABLE adventureworks.gold.sales TO "Developers"
REVOKE SELECT ON TABLE adventureworks.gold.sales TO "Project RL - Data Engineers"
