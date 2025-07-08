# Kultra-Mega-Stores-Inventory
Business Intelligence Case Study for Kultra Mega Stores (KMS): Analyzing sales, shipping, customer behavior, and returns data from 2009–2012 using SQL. Developed insights to improve revenue, reduce shipping inefficiencies, and enhance customer engagement.

# Kultra Mega Stores Inventory Analysis (SQL Project)

## Company Overview

**Kultra Mega Stores (KMS)** is a leading office supplies and furniture retailer headquartered in Lagos, Nigeria. KMS serves a diverse customer base across Lagos, including:

- Individual Consumers  
- Small Businesses (Retail)  
- Corporate Clients (Wholesale)  

As a **Business Intelligence Analyst**, I was engaged to support the **Abuja division**, analyzing order data from **2009 to 2012** to uncover sales trends, customer behaviors, and shipping patterns.

---

## Project Files

| File | Description |
|------|-------------|
| `KMS Sql Case Study.csv` | Main order dataset including sales, shipping, product, and customer info |
| `Order_Status.csv` | Supplementary dataset indicating which orders were returned |
| `KMS_Inventory_Analysis.sql` | All SQL queries used for analysis |
| `KMS_Inventory_Summary_Report.xlsx` | Clean, structured summary report with key metrics |
| `visuals/` | Folder containing data visualizations (bar charts, heatmaps, etc.) |

---

## Business Objectives

The goal is to help KMS:

- Identify key sales drivers and laggards
- Understand high-value customers
- Optimize shipping cost and performance
- Reduce product returns
- Advise strategies for revenue growth

---

## Data Sources

| File | Description |
|------|-------------|
| `KMS Sql Case Study.csv` | Main dataset: orders, products, sales, profit, shipping |
| `Order_Status.csv`       | Return status of each order (`Returned` or `Completed`) |

---

## Tools Used

- **Microsoft SQL Server (SSMS)** – Data import and querying
- **SQL** – Analysis logic and reporting
- **Excel / Python** – Post-analysis formatting and charts
- **GitHub** - Version control and project hosting

---

## Case Scenario I – Sales and Shipping

### 1. Which product category had the highest sales?
- **Technology** with ₦5,984,248.18

### 2. What are the Top 3 and Bottom 3 regions by sales?
#### Top 3:
- West (₦3.59M), Ontario (₦3.06M), Prarie (₦2.83M)
#### Bottom 3:
- Yukon (₦975k), Northwest Territories (₦800k), Nunavut (₦116k)

### 3. What were the total sales of appliances in Ontario?
- ₦0.00 — no recorded appliance sales in Ontario.

### 4. How can KMS increase revenue from the bottom 10 customers?
- Targeted campaigns and upsell opportunities
- Offer bundles or discounts
- Use loyalty programs to retain and re-engage

### 5. Which shipping method incurred the most cost?
- **Delivery Truck** — ₦51,971.94 total shipping cost

---

## Case Scenario II – Customer Intelligence

### 6. Who are the most valuable customers, and what do they buy?
- Top customers: **Sean Miller**, **Emily Phan**, **Chad Gaddis**
- Mostly purchase **Technology** and **Office Supplies**

### 7. Which small business customer had the highest sales?
- **Dennis Kane** — ₦75,967.59

### 8. Which corporate customer placed the most orders (2009–2012)?
- **Roy Skaria** — 18 orders

### 9. Which consumer customer was the most profitable?
- **Emily Phan** — ₦34,005.44 in profit

### 10. Which customers returned items, and what segment do they belong to?
- Several customers across segments returned items (see return table)
- Detected by joining `Order_Status` with `KMS_Orders` where `Status = 'Returned'`

### 11. Was shipping cost aligned with order priority?
| Order Priority | Ship Mode       | Avg Shipping Cost |
|----------------|------------------|--------------------|
| High           | Express Air      | High               |
| Low            | Delivery Truck   | Lower              |

Conclusion: Shipping methods mostly align with priority. However, a few anomalies could be optimized to save cost.

---

## Key Insights

- Focus sales efforts on **Technology products**
- Use **Delivery Truck** for non-urgent shipments to reduce cost
- Identify **inactive or low-spending customers** and re-engage them
- Monitor **returns** by segment to address potential quality/service issues

---

## Project Structure

KMS-Inventory-Analysis/
│
├── data/
│ ├── KMS Sql Case Study.csv
│ └── Order_Status.csv
│
├── analysis/
│ └── KMS_Inventory_Analysis.sql
│
├── reports/
│ └── KMS_Inventory_Summary_Report.xlsx
│
├── visuals/
│ └── charts/
│ ├── sales_by_category.png
│ ├── shipping_cost_vs_priority.png
│ └── return_rate_by_segment.png
│
└── README.md
