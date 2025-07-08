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

## Case Scenarios & Questions

### Case Scenario I – Sales & Shipping

1. **Which product category had the highest sales?**  
2. **What are the Top 3 and Bottom 3 regions in terms of sales?**  
3. **What were the total sales of appliances in Ontario?**  
4. **Advise KMS on how to increase revenue from the bottom 10 customers**  
5. **Which shipping method incurred the most shipping cost?**

### Case Scenario II – Customer Intelligence

6. **Who are the most valuable customers, and what do they typically purchase?**  
7. **Which small business customer had the highest sales?**  
8. **Which corporate customer placed the most orders from 2009 to 2012?**  
9. **Which consumer customer was the most profitable?**  
10. **Which customers returned items, and what segment do they belong to?**  
11. **Was shipping cost aligned with order priority (e.g., Express Air vs Delivery Truck)?**

---

## Tech Stack

| Tool | Purpose |
|------|---------|
| **SQL Server (SSMS)** | Data analysis and querying |
| **Python (Pandas, Matplotlib)** | Data cleaning, transformation, visualization |
| **Excel** | Summary reporting and tabular insights |
| **GitHub** | Version control and project hosting |

---

## Visualizations

The following charts were generated to support the analysis:

- Sales by Product Category  
- Sales by Region (Top 3 & Bottom 3)  
- Shipping Cost by Shipping Method  
- Heatmap: Shipping Cost vs Order Priority  
- Return Rate by Customer Segment  
- Segment-Level Sales and Returns  

All visualizations are stored in the `/visuals` directory or embedded in the summary report.

---

## Key Insights

- **Technology** was the highest-performing product category.
- **Express Air** had the highest shipping cost, even for low-priority orders — review logistics strategy.
- Some **high-value customers** consistently purchase tech and office supplies — potential loyalty targets.
- Return rates are higher among **Consumer** segment — investigate reasons.
- **Bottom-tier customers** have potential for upselling via personalized engagement.

---

## Project Structure

KMS-Inventory-Analysis/
│
├── data/
│ ├── KMS Sql Case Study.csv
│ └── Order_Status.csv
│
├── scripts/
│ └── KMS_Inventory_Analysis.sql
│
├── reports/
│ └── KMS_Inventory_Summary_Report.xlsx
│
├── visuals/
│ ├── sales_by_category.png
│ ├── shipping_costs.png
│ └── return_rate_segment.png
│
└── README.md
