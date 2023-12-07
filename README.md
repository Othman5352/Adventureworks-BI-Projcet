# Adventureworks-BI-Projcet
This repository serves as a reference and learning resource for individuals interested in BI development using AdventureWorks OLTP 2014 as a sample dataset. The code and documentation included here can be used to understand the concepts, practices, and implementation techniques related to BI projects.


## Project Overview

This BI solution aims to provide comprehensive sales analytics for Adventureworks company. The data comes from SQL Server database. The solution enables business users to gain insights into sales performance, customer behavior, and product trends.  

## Architecture
 The solution architecture consists of the following components: 
### - SQL Server database:
 Stores the normalized customer and order data. 
### - SSIS: 
Extracts data from the SQL Server database and external systems, performs data transformations and consolidation, and loads it into the data warehouse.
### - SSAS: 
Creates Tabular models. 
### - Power BI: 
Develops reports and dashboards on top of the SSAS models, enabling business users to visualize and analyze data. 

## Data Sources
### - SQL Server Database: 
Online transAdventureworks2014 OLTP database containing customer information, product information and order details. 

## ETL Processes (SSIS)
### Staging database
#### - Extraction: 
SSIS packages retrieve customer and product records from the SQL Server database and order data. 
#### - Loading: 
 Data is loaded into the staging database tables within the SQL Server database.

### Data Warehouse database
#### - Extraction:
 SSIS packages retrieve customer records from the SQL Server database (Staging database) and order data. 
#### - Transformation: 
Data is cleansed, standardized, and consolidated to ensure consistency and integrity.
#### - Loading: 
Transformed data is loaded into the data warehouse tables within the SQL Server database.
## Data Warehouse (SQL, SSAS)
### - Data Warehouse Schema: 
The data warehouse follows a star schema design, including dimensions like Customer, Product, Currency, Territory, Reseller and Date, as well as a FactInternet and FactReseller tables for sales transactions. 
![Model In SSAS](https://github.com/Othman5352/Adventureworks-BI-Projcet/assets/140977589/7e2cb6f5-09b4-42ac-af4a-9a8d3367bdcd)

### - SSAS: 
Tabular models are created using SSAS to provide aggregated data for analysis. Dimensions, hierarchies, and measures are defined within the Model. 

## Data Models (SSAS)
### - Dimensions: 
- Customer dimension includes attributes like Customer ID, Name, Address, etc. 
- Product dimension includes attributes like Product ID, Name, Category, Subcategory, etc. 
- Territory dimension includes attributes like Territory ID, Name, Region, and Group. 
- Currency dimension includes attributes like Currency ID, and Name. 
- Reseller dimension includes attributes like Reseller ID, and Name. 

### - Measures:
- Key measures include Total Sales, and Units Sold. 

## Dashboards (Power BI)
### - Sales Dashboard: 
-Displays key sales metrics, such as revenue by product category, by Territory, 
by Customer, and top-selling products, and sales trends over time. 
