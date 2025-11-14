-- Databricks notebook source
-- MAGIC %md
-- MAGIC Este notebook tiene como objetivo guiar la creación de las tablas necesarias para implementar un pipeline ETL utilizando datos de AdventureWorks. El flujo sigue la arquitectura medallion recomendada por Databricks, organizando los datos en capas Bronze, Silver y Gold para facilitar la ingestión, transformación y análisis eficiente de la información.

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## Crear External Table

-- COMMAND ----------

CREATE EXTERNAL LOCATION IF NOT EXISTS adventureworks
URL 'abfss://adventureworks@adlsdsgcsmartdata.dfs.core.windows.net/'
WITH (STORAGE CREDENTIAL credential)
COMMENT 'Ubicación externa para datos raw en Azure Data Lake';

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## Crear Catalogo

-- COMMAND ----------

CREATE CATALOG IF NOT EXISTS adventureworks;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## Creacion de Schema

-- COMMAND ----------

CREATE SCHEMA IF NOT EXISTS adventureworks.bronze;
CREATE SCHEMA IF NOT EXISTS adventureworks.silver;
CREATE SCHEMA IF NOT EXISTS adventureworks.gold;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## Bronze Tables

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Sales Order Detail

-- COMMAND ----------

DROP TABLE IF EXISTS adventureworks.bronze.sales_order_detail

-- COMMAND ----------

CREATE TABLE IF NOT EXISTS adventureworks.bronze.sales_order_detail (
    sales_order_id INT NOT NULL,
    sales_order_detail_id INT NOT NULL,
    carrier_tracking_number STRING,
    order_qty INT NOT NULL,
    product_id INT NOT NULL,
    special_offer_id INT,
    unit_price DOUBLE NOT NULL,
    unit_price_discount DOUBLE,
    line_total DOUBLE,
    rowguid STRING,
    modified_date TIMESTAMP,
    ingestion_timestamp_utc TIMESTAMP
)

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Sales Order Header

-- COMMAND ----------

DROP TABLE IF EXISTS adventureworks.bronze.sales_order_header

-- COMMAND ----------

CREATE TABLE IF NOT EXISTS adventureworks.bronze.sales_order_header (
    sales_order_id INT,
    revision_number INT,
    order_date TIMESTAMP,
    due_date TIMESTAMP,
    ship_date TIMESTAMP,
    status INT,
    online_order_flag INT,
    sales_order_number STRING,
    purchase_order_number STRING,
    account_number STRING,
    customer_id INT,
    sales_person_id INT,
    territory_id INT,
    bill_to_address_id INT,
    ship_to_address_id INT,
    ship_method_id INT,
    credit_card_id INT,
    credit_card_approval_code STRING,
    currency_rate_id INT,
    sub_total DOUBLE,
    tax_amt DOUBLE,
    freight DOUBLE,
    total_due DOUBLE,
    comment STRING,
    rowguid STRING,
    modified_date TIMESTAMP,
    ingestion_timestamp_utc TIMESTAMP
)

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Products

-- COMMAND ----------

DROP TABLE IF EXISTS adventureworks.bronze.products

-- COMMAND ----------

CREATE TABLE IF NOT EXISTS adventureworks.bronze.products (
    product_id INT NOT NULL,
    name STRING NOT NULL,
    product_number STRING NOT NULL,
    make_flag INT,
    finished_goods_flag INT,
    color STRING,
    safety_stock_level INT,
    reorder_point INT,
    standard_cost DOUBLE,
    list_price DOUBLE,
    size STRING,
    size_unit_measure_code STRING,
    weight_unit_measure_code STRING,
    weight DOUBLE,
    days_to_manufacture INT,
    product_line STRING,
    class STRING,
    style STRING,
    product_subcategory_id INT,
    product_model_id INT,
    sell_start_date TIMESTAMP,
    sell_end_date TIMESTAMP,
    discontinued_date TIMESTAMP,
    rowguid STRING,
    modified_date TIMESTAMP,
    ingestion_timestamp_utc TIMESTAMP NOT NULL
)

-- COMMAND ----------

-- MAGIC %md
-- MAGIC # Silver Tables

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Sales Order Detail

-- COMMAND ----------

DROP TABLE IF EXISTS adventureworks.silver.sales_order_detail

-- COMMAND ----------

CREATE TABLE IF NOT EXISTS adventureworks.silver.sales_order_detail (
  sales_order_detail_id INT,
  sales_order_id INT,
  product_id INT,
  order_qty INT,
  unit_price DOUBLE,
  product_discount_percentage DOUBLE,
  line_total DOUBLE,
  order_total_products INT,
  product_discount DOUBLE,
  order_total DOUBLE,
  order_total_discount DOUBLE,
  ingestion_timestamp_utc TIMESTAMP
)

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Sales Order Header

-- COMMAND ----------

DROP TABLE IF EXISTS adventureworks.silver.sales_order_header

-- COMMAND ----------

CREATE TABLE IF NOT EXISTS adventureworks.silver.sales_order_header (
    sales_order_id INT,
    revision_number INT,
    order_date TIMESTAMP,
    due_date TIMESTAMP,
    ship_date TIMESTAMP,
    status INT,
    online_order_flag INT,
    sales_order_number STRING,
    purchase_order_number STRING,
    account_number STRING,
    customer_id INT,
    sales_person_id INT,
    territory_id INT,
    bill_to_address_id INT,
    ship_to_address_id INT,
    ship_method_id INT,
    credit_card_id INT,
    credit_card_approval_code STRING,
    currency_rate_id INT,
    sub_total DOUBLE,
    tax_amt DOUBLE,
    freight DOUBLE,
    total_due DOUBLE,
    comment STRING,
    rowguid STRING,
    modified_date TIMESTAMP,
    total_orders_by_customer BIGINT,
    days_between_order_and_ship INT,
    ingestion_timestamp_utc TIMESTAMP
)

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Products

-- COMMAND ----------

DROP TABLE IF EXISTS adventureworks.silver.products

-- COMMAND ----------

CREATE TABLE IF NOT EXISTS adventureworks.silver.products (
  product_id INTEGER NOT NULL,
  name STRING NOT NULL,
  product_number STRING NOT NULL,
  is_active BOOLEAN NOT NULL,
  list_price DOUBLE,
  standard_cost DOUBLE,
  margin DOUBLE,
  margin_percentage DOUBLE,
  ingestion_timestamp_utc TIMESTAMP NOT NULL
)

-- COMMAND ----------

-- MAGIC %md
-- MAGIC # Gold Table

-- COMMAND ----------

DROP TABLE IF EXISTS adventureworks.gold.sales

-- COMMAND ----------

CREATE TABLE IF NOT EXISTS adventureworks.gold.sales (
  product_id INT,
  name STRING NOT NULL,
  total_sales_amount DOUBLE,
  total_quantity_sold BIGINT,
  unique_customers BIGINT NOT NULL,
  ingestion_timestamp_utc TIMESTAMP NOT NULL
)
