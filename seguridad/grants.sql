-- Databricks notebook source
GRANT USE CATALOG ON CATALOG bronze TO "Developers"
GRANT USE CATALOG ON CATALOG bronze TO "Project RL - Data Engineers"

GRANT USE CATALOG ON CATALOG silver TO "Developers"
GRANT USE CATALOG ON CATALOG silver TO "Project RL - Data Engineers"

GRANT USE CATALOG ON CATALOG gold TO "Developers"
GRANT USE CATALOG ON CATALOG gold TO "Project RL - Data Engineers"

-- COMMAND ----------

GRANT USE SCHEMA ON SCHEMA bronze.adventureworks TO "Developers"
GRANT USE SCHEMA ON SCHEMA bronze.adventureworks TO "Project RL - Data Engineers"
GRANT CREATE ON SCHEMA bronze.adventureworks TO "Project RL - Data Engineers"

GRANT USE SCHEMA ON SCHEMA silver.adventureworks TO "Developers"
GRANT USE SCHEMA ON SCHEMA silver.adventureworks TO "Project RL - Data Engineers"
GRANT CREATE ON SCHEMA silver.adventureworks TO "Project RL - Data Engineers"

GRANT USE SCHEMA ON SCHEMA gold.adventureworks TO "Developers"
GRANT USE SCHEMA ON SCHEMA gold.adventureworks TO "Project RL - Data Engineers"
GRANT SELECT ON TABLE bronze.adventureworks.products TO "Developers"
GRANT SELECT ON TABLE bronze.adventureworks.products TO "Project RL - Data Engineers"GRANT CREATE ON SCHEMA gold.adventureworks TO "Project RL - Data Engineers"

-- COMMAND ----------

GRANT SELECT ON TABLE bronze.adventureworks.products TO "Developers"
GRANT SELECT ON TABLE bronze.adventureworks.products TO "Project RL - Data Engineers"

GRANT SELECT ON TABLE bronze.adventureworks.sales_order_header TO "Developers"
GRANT SELECT ON TABLE bronze.adventureworks.sales_order_header TO "Project RL - Data Engineers"

GRANT SELECT ON TABLE bronze.adventureworks.sales_order_detail TO "Developers"
GRANT SELECT ON TABLE bronze.adventureworks.sales_order_detail TO "Project RL - Data Engineers"

GRANT SELECT ON TABLE silver.adventureworks.products TO "Developers"
GRANT SELECT ON TABLE silver.adventureworks.products TO "Project RL - Data Engineers"

GRANT SELECT ON TABLE silver.adventureworks.sales_order_header TO "Developers"
GRANT SELECT ON TABLE silver.adventureworks.sales_order_header TO "Project RL - Data Engineers"

GRANT SELECT ON TABLE silver.adventureworks.sales_order_detail TO "Developers"
GRANT SELECT ON TABLE silver.adventureworks.sales_order_detail TO "Project RL - Data Engineers"

GRANT SELECT ON TABLE gold.adventureworks.sales TO "Developers"
GRANT SELECT ON TABLE gold.adventureworks.sales TO "Project RL - Data Engineers"
