# Retail Sales & Product Performance Analysis

## Project Overview

This end-to-end data analytics project uses **MySQL, Power BI, Power Query, and DAX** to analyze retail sales performance, product profitability, customer demographics, and purchasing behavior.

The project combines SQL-based data analysis with an interactive three-page Power BI dashboard designed to transform raw transactional data into meaningful business insights and support data-driven decision-making.

## Project Objectives

- Analyze overall sales performance, revenue trends, and year-over-year growth.
- Identify seasonal patterns in retail sales.
- Evaluate product performance and profitability across categories and subcategories.
- Identify the highest-performing products based on gross profit and gross profit margin.
- Analyze customer demographics and geographical distribution.
- Evaluate customer spending behavior and repeat purchasing patterns.
- Validate business metrics using SQL and Power BI.

## Tools and Technologies

| Tool | Purpose |
|---|---|
| MySQL | Data storage, querying, analysis, and validation |
| MySQL Workbench | Database management and SQL development |
| Power BI Desktop | Interactive dashboard development and data visualization |
| Power Query | Data cleaning and transformation |
| DAX | KPI calculations, business metrics, and time intelligence |
| GitHub | Project documentation and version control |

## Dataset Source

The datasets used in this project were obtained from **Data with Baraa**, an educational platform and YouTube channel focused on data analytics, SQL, and data engineering.

**Source resources:**

- [Data with Baraa – YouTube Tutorial](https://www.youtube.com/watch?v=2jGhQpbzHes&list=PLNcg_FV9n7qZ4Ym8ZriYT6WF8TaC2e_R7&index=5)
- [Data with Baraa – SQL Resources](https://www.datawithbaraa.com/wiki/sql)

The original datasets were imported into MySQL and used as the foundation for this portfolio project. The SQL analysis, Power BI dashboards, business insights, and analytical decisions were developed as part of this project.

Credit goes to Data with Baraa for providing the datasets and educational resources.

## Dataset Description

The project uses three relational tables stored in the MySQL database `gold_datasets`.

| Table | Description |
|---|---|
| `customers` | Customer identifiers, names, country, gender, and marital status |
| `products` | Product identifiers, names, categories, subcategories, and unit costs |
| `sales` | Transactional records containing order numbers, dates, quantities, prices, and sales amounts |

### Data Model

The data model follows a star schema structure:

- **Fact table:** Sales
- **Dimension table:** Customers
- **Dimension table:** Products

Relationships are established using:

- `customer_key` between the customers and sales tables.
- `product_key` between the products and sales tables.

This structure enables analysis across customer demographics, product attributes, and transactional data.

## Data Preparation and Validation

Before developing the dashboards, several data preparation and validation procedures were performed to improve data reliability.

### Data Preparation

- Imported the original CSV datasets into MySQL.
- Verified imported row counts against the source datasets.
- Connected Power BI to the MySQL database.
- Converted relevant date columns into appropriate date data types.
- Standardized unavailable demographic values as `Unknown`.
- Created calculated measures using DAX.
- Established relationships between the fact and dimension tables.

### Data Quality Checks

- Investigated missing customer records and unmatched customer keys.
- Checked referential integrity between sales, customers, and products.
- Investigated products with zero unit costs.
- Validated business metrics using SQL queries.
- Investigated customers with unknown country information.
- Verified the repeat purchase rate for the unknown-country customer segment.

Two product records were identified with zero unit costs. Further SQL investigation confirmed that neither product had associated sales transactions. Therefore, these records did not affect the gross profit calculations.

### Reporting Period

The time-series analysis focuses on the complete reporting years of **2011–2013**.

December 2010 and January 2014 were excluded from time-series comparisons because they represented incomplete reporting periods.

Overall KPIs include all available sales records when no filters are applied.

---

## Dashboard 1: Executive Overview

![Executive Overview](Dashboard%20-%20Executive%20Overview.png)

### Overview

The Executive Overview dashboard provides a high-level summary of retail business performance, allowing stakeholders to monitor revenue, order volume, customer volume, sales growth, and product category contribution.

### Key Performance Indicators

| KPI | Result |
|---|---:|
| Total Sales | $29.4M |
| Total Orders | 27.7K |
| Number of Customers | 18.5K |
| Catalog Products | 295 |

### Dashboard Features

- Monthly sales trend from 2011 to 2013.
- Sales distribution by calendar month.
- Total sales by product category.
- Annual sales and year-over-year growth.
- Bike sales distribution by subcategory.
- Interactive country slicer.

### Key Findings

- The business generated approximately **$29.4 million in total sales**.
- Sales declined by **17.43% in 2012** before recovering significantly in 2013.
- Annual sales increased by **179.77% in 2013**, reaching approximately $16.3 million.
- Bikes generated approximately **$28.32 million**, accounting for 96.5% of total revenue.
- Road bikes contributed the largest share of bike revenue at **51.28%**, followed by mountain bikes at 35.15% and touring bikes at 13.58%.
- December recorded the highest combined calendar-month sales across the complete reporting years.

### Business Implications

The business relies heavily on the bike category for revenue generation. Historical sales patterns can also support inventory planning, promotional activities, and demand forecasting.

---

## Dashboard 2: Product Performance Analysis

![Product Performance](Dashboard%20-%20Product%20Performance.png)

### Overview

The Product Performance dashboard evaluates product sales volume, costs, gross profit, and profitability. It distinguishes between products that generate high revenue and those that deliver stronger profit margins.

### Key Performance Indicators

| KPI | Result |
|---|---:|
| Total Units Sold | 60,423 |
| Total Cost | $17.7M |
| Gross Profit | $11.7M |
| Gross Profit Margin | 39.8% |

### Dashboard Features

- Total sales and gross profit by product category.
- Top 10 products ranked by gross profit.
- Top 10 subcategories ranked by gross profit margin.
- Interactive product-level profitability matrix.
- Hierarchical analysis by category, subcategory, and product.
- Conditional formatting using data bars.
- Interactive year slicer.

### Product Category Performance

| Category | Units Sold | Total Sales | Gross Profit | Gross Profit Margin |
|---|---:|---:|---:|---:|
| Bikes | 15,205 | $28,316,272 | $11,109,565 | 39.2% |
| Accessories | 36,112 | $700,262 | $439,510 | 62.8% |
| Clothing | 9,106 | $339,716 | $136,682 | 40.2% |
| **Total** | **60,423** | **$29,356,250** | **$11,685,757** | **39.8%** |

### Key Findings

- Bikes generated approximately **95.1% of total gross profit**, making them the primary contributor to overall profitability.
- Accessories achieved the highest category gross profit margin at **62.8%**.
- Accessories also recorded the highest sales volume, with 36,112 units sold.
- Socks achieved the highest displayed subcategory gross profit margin at **66.7%**.
- Mountain-200 Black - 46 was the highest-ranked product by gross profit, generating approximately $600,000.
- All ten products in the top gross profit ranking belonged to the bike category.

### Business Implications

Although bikes generate the majority of revenue and gross profit, accessories offer significantly higher profit margins.

Cross-selling accessories alongside bike purchases could provide opportunities to increase overall profitability and customer order value.

---

## Dashboard 3: Customer Analysis

![Customer Analysis](Dashboard%20-%20Customer%20Analysis.png)

### Overview

The Customer Analysis dashboard examines customer demographics, geographical distribution, purchasing behavior, customer value, and repeat purchasing patterns.

The dashboard helps identify valuable customer segments and potential opportunities to improve customer engagement and repeat purchasing.

### Key Performance Indicators

| KPI | Result |
|---|---:|
| Average Order Value | $1,061.36 |
| Revenue Per Customer | $1,588.20 |
| Repeat Customers | 6.87K |
| Repeat Purchase Rate | 37.1% |

### Dashboard Features

- Customer distribution by country.
- Customer gender distribution.
- Top 5 customers ranked by revenue.
- Customer segment performance matrix.
- Hierarchical analysis by country and gender.
- Conditional formatting for repeat purchase rates.
- Interactive marital status slicer.

### Customer Segment Performance

| Country | Purchasing Customers | Average Order Value | Revenue Per Customer | Repeat Purchase Rate |
|---|---:|---:|---:|---:|
| United States | 7,482 | $992.67 | $1,224.58 | 23.2% |
| Australia | 3,591 | $1,348.64 | $2,523.02 | 71.9% |
| United Kingdom | 1,913 | $1,118.90 | $1,772.81 | 45.1% |
| France | 1,810 | $1,064.31 | $1,460.64 | 25.3% |
| Germany | 1,780 | $1,165.08 | $1,625.88 | 28.1% |
| Canada | 1,571 | $586.00 | $1,258.90 | 46.1% |
| Unknown | 337 | $673.06 | $673.06 | 0.0% |
| **Total** | **18,484** | **$1,061.36** | **$1,588.20** | **37.1%** |

### Key Findings

- The United States had the largest customer base, with **7,482 purchasing customers**.
- Australia recorded the highest repeat purchase rate at **71.9%**, compared with the overall rate of 37.1%.
- Australia also generated the highest revenue per customer at **$2,523.02**.
- Australian customers generated approximately **2.06 times more revenue per customer** than customers in the United States.
- Despite having the largest customer base, the United States recorded a relatively low repeat purchase rate of 23.2%.
- Customer gender distribution was nearly balanced, with 50.54% male and 49.38% female customers.
- All 337 customers with unknown country information placed exactly one distinct order during the available reporting period, resulting in a repeat purchase rate of 0%.

### Business Implications

Customer volume alone does not necessarily indicate customer value.

Although the United States has the largest customer base, Australia demonstrates stronger repeat purchasing behavior and higher revenue per customer.

Investigating the differences between these markets could help identify opportunities to improve customer engagement and repeat purchasing.

---

## KPI Calculation Methodology

The following business metrics were calculated using SQL and DAX.

| Metric | Calculation |
|---|---|
| Total Sales | Sum of sales amounts |
| Total Orders | Count of distinct order numbers |
| Number of Customers | Count of distinct customer IDs |
| Catalog Products | Count of product records with a product ID |
| Total Units Sold | Sum of quantities sold |
| Total Cost | Sum of quantity multiplied by product unit cost |
| Gross Profit | Total Sales − Total Cost |
| Gross Profit Margin | Gross Profit / Total Sales |
| Purchasing Customers | Count of distinct customer keys in the sales table |
| Average Order Value | Total Sales / Total Orders |
| Revenue Per Customer | Total Sales / Purchasing Customers |
| Repeat Customers | Customers with more than one distinct order |
| Repeat Purchase Rate | Repeat Customers / Purchasing Customers |
| Year-over-Year Growth | (Current Year Sales − Previous Year Sales) / Previous Year Sales |

Gross profit is calculated using the available product unit costs and does not include additional operating expenses.

Repeat purchase rate represents observed repeat purchasing behavior within the available reporting period rather than a cohort-based customer retention rate.

## SQL Analysis

SQL was used to calculate KPIs, investigate data quality issues, analyze business performance, and cross-check Power BI results.

### SQL Techniques Demonstrated

- Aggregate functions
- INNER JOINs
- LEFT JOINs
- CROSS JOINs
- GROUP BY and HAVING clauses
- Common Table Expressions (CTEs)
- Conditional aggregation using CASE WHEN
- Window functions
- LAG() for year-over-year analysis
- Date functions
- DISTINCT counts
- NULL handling
- Data quality validation

### SQL Files

| File | Description |
|---|---|
| [Database_Table_Initialization.sql](Database_Table_Initialization.sql) | Database initialization and imported dataset verification |
| [KPI_Queries.sql](KPI_Queries.sql) | SQL queries for calculating the primary business KPIs |
| [Visualization_Queries.sql](Visualization_Queries.sql) | SQL queries supporting sales, product, and customer analysis |

## Power BI Techniques Demonstrated

- Relational data modeling
- Star schema design
- Power Query transformations
- DAX calculated measures
- Time intelligence
- Filter context
- Interactive KPI cards
- Bar and column charts
- Line charts
- Donut charts
- Combination charts
- Top N filtering
- Hierarchical matrices
- Conditional formatting
- Interactive slicers

## Business Recommendations

Based on the analysis, the following business opportunities were identified:

### 1. Increase Accessory Cross-Selling

Accessories have a significantly higher gross profit margin than bikes. Bundling accessories with bike purchases could improve overall profitability and increase average order value.

### 2. Improve Repeat Purchasing in the United States

The United States has the largest customer base but a relatively low repeat purchase rate. Targeted customer engagement, loyalty programs, and personalized promotions could be evaluated to encourage repeat purchases.

### 3. Investigate Australian Customer Purchasing Behavior

Australia demonstrates the strongest repeat purchasing performance and highest revenue per customer. Further analysis could identify factors contributing to this performance and determine whether similar strategies could be applied to other markets.

### 4. Leverage Historical Sales Patterns

Historical monthly sales patterns can support inventory management, promotional planning, and resource allocation, particularly during periods of higher demand.

### 5. Improve Customer Data Quality

Improving the completeness of customer demographic information, particularly country information, could enable more accurate customer segmentation and targeted marketing.

## Repository Structure

    retail-sales-performance-analysis/
    |
    |-- README.md
    |-- Database_Table_Initialization.sql
    |-- KPI_Queries.sql
    |-- Visualization_Queries.sql
    |-- Dashboard - Executive Overview.png
    |-- Dashboard - Product Performance.png
    |-- Dashboard - Customer Analysis.png

## How to Reproduce the Project

1. Obtain the original datasets from the Data with Baraa resources linked in the Dataset Source section.
2. Create the `gold_datasets` database in MySQL.
3. Import the customers, products, and sales CSV datasets using MySQL Workbench.
4. Verify the imported row counts against the original datasets.
5. Execute the KPI and visualization SQL queries using MySQL 8.0 or later.
6. Connect Power BI Desktop to the MySQL database.
7. Perform the necessary data transformations using Power Query.
8. Establish relationships between the fact and dimension tables.
9. Create the required DAX measures.
10. Develop the interactive dashboard pages.

The database initialization script creates the database but requires the CSV datasets to be imported separately.

## Project Limitations

- Time-series comparisons exclude incomplete reporting periods in 2010 and 2014.
- Gross profit calculations are based on available product costs and do not account for additional business operating expenses.
- Customer records with unavailable demographic information are retained as an Unknown segment.
- Repeat purchase rates reflect the available historical transaction data and should not be interpreted as lifetime customer retention rates.
- Customers with identical names must be distinguished using unique customer identifiers when calculating individual customer rankings.
- The analysis identifies historical patterns and relationships but does not establish causation.
- Dashboard screenshots provide a static preview of the interactive Power BI report.

## Conclusion

This project demonstrates an end-to-end data analytics workflow, from database initialization and data validation to SQL analysis, data modeling, dashboard development, and business interpretation.

The analysis highlights the importance of evaluating revenue, profitability, and customer purchasing behavior together rather than relying solely on sales volume.

By combining MySQL and Power BI, the project demonstrates how transactional data can be transformed into actionable business insights that support strategic decision-making.

## Acknowledgments

Special thanks to **Data with Baraa** for providing the original datasets and educational resources that supported this project.

- [Data with Baraa – YouTube Tutorial](https://www.youtube.com/watch?v=2jGhQpbzHes&list=PLNcg_FV9n7qZ4Ym8ZriYT6WF8TaC2e_R7&index=5)
- [Data with Baraa – SQL Resources](https://www.datawithbaraa.com/wiki/sql)
