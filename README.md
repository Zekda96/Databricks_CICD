# 🚀 Proyecto ETL en Databricks: Arquitectura Medallion
Proyecto de ETL y CI/CD en Databricks como preparación para las certificaciones Data Engineer Associate y Professional.

Este proyecto implementa un pipeline ETL (Extract, Transform, Load) para datos de ventas y productos de la base de datos de ejemplo AdventureWorks, siguiendo la arquitectura de lago de datos Medallion (Bronze, Silver, Gold) recomendada por Databricks.

La estructura del repositorio y descripción de las carpetas es la siguiente:
- .github
  - worfklows: archivo .yml para el deploy despues de un merge PR
- certificaciones: URLs a las badges de las Acreditaciones de Databricks Academy
- dashboard: Archivo .json con el dashboard que consume de la Gold Layer
- images: Imagen para el readme.md
- proceso: Notebooks para cada task del Job
- reversion: Archivos .sql con los comandos REVOKE y DROP TABLE
- scripts: Archivos .sql para la creacion de Catalogos, Esquemas, Tablas y External Tables
- seguridad: Archivos .sql para otorgar permisos a usuarios o grupos (GRANTS)

El pipeline está dividido en tres capas principales:
- Bronze (Ingesta): Contiene los datos sin procesar, tal como se extraen del origen (archivos CSV).
- Silver (Transformación): Datos limpios, enriquecidos y estructurados, listos para un análisis más detallado.
- Gold (Análisis): Tablas de agregación y vistas de negocio de alto valor, optimizadas para reportes e inteligencia de negocio.

![](images/prod pipeline.png)

El proyecto se compone de varios notebooks de Databricks, cada uno responsable de una etapa específica del flujo ETL.


### 1. Preparación del Ambiente

* `preparacion_ambiente.py`:
    * **Propósito:** Configuración inicial del ambiente de Databricks.
    * **Acciones:** Crea el catálogo `adventureworks` y los *schemas* `bronze`, `silver` y `gold`. Define las estructuras de tablas Delta en cada capa para todos los conjuntos de datos (`sales_order_detail`, `sales_order_header`, `products`).

### 2. Capa Bronze (Ingesta)

Los *notebooks* de ingesta cargan los datos desde un *data lake* (Azure Data Lake Storage) hacia las tablas de la capa Bronze, utilizando una operación **Upsert (Merge)**.

El ETL cuenta con 3 archivos source:
- Sales Order Details
- Sales Order Header
- Products

### 3. Capa Silver (Curación y Enriquecimiento)

Los *notebooks* de transformación aplican limpieza, validación y enriquecimiento de datos, moviendo los datos de Bronze a Silver, también usando **Upsert (Merge)**.

| Notebook | Propósito | Transformaciones Clave | Clave de Merge |
| :--- | :--- | :--- | :--- |
| `transform_products.py` | Datos de Productos | Cálculo de **margen** y **porcentaje de margen**. Creación del *flag* **`is_active`** y la categoría **`list_price_range`** (low, mid, high). | `product_id` |
| `transform_sales_order_detail.py` | Curación de datos de Productos por Orden. | Renombra `unit_price_discount` a `product_discount_percentage`. Calcula el total de productos por orden y el descuento total de la orden usando **Window Functions**. | `sales_order_detail_id` |
| `transform_sales_order_header.py` | Curación de datos de Ordenes. | Cálculo de **`total_orders_by_customer`** y **`days_between_order_and_ship`** usando **Window Functions**. | `sales_order_id` |

### 4. Capa Gold (Análisis)

El *notebook* de carga final agrega los datos de la capa Silver para crear métricas listas para el negocio.

* `load_sales.py`:
    * **Propósito:** Construye la tabla de agregación `sales` en la capa Gold.
    * **Acciones:** Realiza un *join* de las tablas `sales_order_detail`, `sales_order_header` y `products` de Silver.
    * **Agregaciones:** Calcula **`total_sales_amount`**, **`total_quantity_sold`** y el número de **`unique_customers`** por producto.
    * **Merge:** Utiliza **Upsert (Merge)** en la tabla `adventureworks.gold.sales` con la clave `product_id`.

## ⚙️ Servicios
- Azure Blob Storage
- Azure Key Vault
- External Tables
- Widgets
- Databricks (Jobs/Notebooks/Dashboard)
- CI/CD - Github Actions