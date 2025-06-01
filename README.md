# Kimia-Farma-Sales-Management-Project-2020-2023
This project presents a comprehensive performance analytics dashboard for Kimia Farma, one of Indonesia’s largest pharmaceutical companies. The dashboard provides insights into sales, profit distribution, customer transactions, and product performance across branches and provinces.

# Table of Content
- [Project Overview](#project-overview)  
- [Technologies Used](#technologies-used)  
- [Importing Dataset](#importing-dataset)  
- [Data Cleaning & Aggregation](#data-cleaning--aggregation)  
- [Dashboard](#dashboard)  
- [Dashboard Features](#dashboard-features)  
- [Key Insights](#key-insights)  
- [Author](#author)

# Project Overview
This project was built to analyse branch, product, and sales performance for Kimia Farma between 2020 and 2023. The objective is to help decision-makers identify:
- Which branches and provinces generate the highest profit
- Which products are the best sellers
- Which areas may require operational improvements
- Trends over time in net sales and customer satisfaction

# Technologies Used
- **Google BigQuery** – For data cleaning, transformation, and SQL aggregation.
- **Tableau Public** – For building interactive dashboards.
- **Google Sheets / CSV** – Source for raw data tables.
- **Markdown (README)** – Documentation.

# Importing Dataset
- `kf_transaction` – Contains transaction data, prices, and ratings.
- `kf_inventory` – Links products and branches.
- `kf_kantor_cabang` – Branch metadata including city and province.
- `kf_product` – Product names and IDs.

# Data Cleaning & Aggregation
Using **SQL in BigQuery**, I:
- Selected relevant columns (branch, product, pricing, province, etc.)
- Calculated `nett_sales` and `nett_profit` based on price ranges and discount
- Used `CASE` statements to apply gross profit tiers
- Joined data into one clean and analysis-ready table

```sql
-- Example: Gross profit percentage logic
CASE 
  WHEN price <= 50000 THEN 0.10
  WHEN price <= 100000 THEN 0.15
  WHEN price <= 300000 THEN 0.20
  ELSE 0.25
END AS persentase_gross_laba
```
---
# Dashboard
kf_tableau.png

[Visit the dashboard.](https://public.tableau.com/app/profile/khalisha.fakhira/viz/PerformanceAnalyticsofKimiaFarma2020-2023/Dashboard1)


# Dashboard Features
**Branch Store Profit Distribution**  
-> To understand which branch types contribute most to overall profit. This helps evaluate business model performance across branch types.


**Top Provinces by Transactions and Sales**  
-> Identifies which provinces generate the highest customer activity and sales. This can guide resource allocation and marketing focus to high-performing regions.


**Top 5 Branches with High Ratings but Low Transaction Experience**  
-> Highlights potential underutilised branches. These branches have strong customer satisfaction but low engagement. This analysis is to provide an opportunity for operational improvements or promotions.


**Geo Map of Profit by Province**  
-> A spatial representation of performance helps stakeholders instantly visualise geographical disparities. It supports decisions on branch expansion, downsizing, or support.


**Top 10 Best-Selling Products**  
-> Helps determine which products are driving the most profit. This insight supports inventory management, pricing strategy, and future product focus. 


**Comparison of Nett Sales per Year (2020-2023)**  
-> Provides a temporal overview of sales trends across years. This makes it easier to evaluate growth, seasonal patterns, and potential effects of external factors (e.g. pandemic recovery).


**Interactive Filters** by Year, Province, and Product Name.
->  Empowers users to drill down into the data as needed. Customising views makes the dashboard more dynamic and applicable for various stakeholders (e.g. regional managers, marketing teams).

# Key Insights
- West Java dominates in both transactions and net profit
- Psycholeptic and analgesic products yield the highest returns
- Branches like Ciamis, Subang, Purwakarta, Garut, and Subang have high service ratings but weak transaction scores.
- Net sales remained stable across 4 years, indicating consistent business performance


For any issues or inquiries, feel free to contact the project contributors.
