# Amazon E-Commerce Sales Analysis

End-to-end data analysis project on Amazon India fashion sales data covering data understanding, cleaning, exploratory data analysis, SQL business queries, and an interactive Tableau dashboard.

**Live Dashboard:** [View on Tableau Public](https://public.tableau.com/views/AmazonE-CommerceSalesDashboard/Dashboard1)

-----

## Project Overview

|Item      |Details                          |
|----------|---------------------------------|
|Dataset   |Amazon Sale Report (Kaggle)      |
|Raw Data  |128,975 rows, 24 columns         |
|Clean Data|105,080 rows, 21 columns         |
|Period    |March 2022 to June 2022          |
|Domain    |E-Commerce, Fashion Retail, India|
|Tools     |Python, MySQL, Tableau Public    |

-----

## Tools and Technologies

- **Python** — pandas, numpy, matplotlib, seaborn
- **MySQL Workbench 8.0** — SQL queries, window functions, CTEs
- **Tableau Public** — interactive dashboard, KPI cards, filters
- **VS Code** — development environment
- **GitHub** — version control

-----

## Project Structure

```
Amazon_Ecommerce_Sales_Analysis/
│
├── 01_data_understanding.ipynb     # Dataset exploration and quality check
├── 02_data_cleaning.ipynb          # Data cleaning and preprocessing
├── 03_EDA_Analysis.ipynb           # Exploratory data analysis with 8 charts
├── 04_sql_analysis_summary.ipynb   # SQL business questions and findings
├── amazon_sql_analysis.sql         # 10 SQL queries with business context
└── README.md
```

-----

## Phase 1 — Data Understanding

**File:** `01_data_understanding.ipynb`

**Objective:** Understand the structure, content, and quality of the raw dataset before cleaning.

**Key Findings:**

- Total rows: 128,975 | Total columns: 24
- Average order value: Rs 648
- 75% of orders are below Rs 788 (budget to mid-range market)
- Most popular categories: Kurta, Set, Western Dress
- Issues found: missing values in Amount and Currency (7,795 rows), garbage column (Unnamed: 22), Date stored as text

-----

## Phase 2 — Data Cleaning

**File:** `02_data_cleaning.ipynb`

**Objective:** Clean the raw dataset to produce an analysis-ready CSV file.

**Cleaning Steps:**

|Step                     |Action                                                                                 |Rows Affected      |
|-------------------------|---------------------------------------------------------------------------------------|-------------------|
|Drop irrelevant columns  |Removed fulfilled-by, promotion-ids, ASIN, Unnamed:22, Courier Status, ship-postal-code|6 columns removed  |
|Fix Date column          |Converted to datetime, extracted Month, Month_name, Year                               |0 rows removed     |
|Handle missing values    |Removed rows with missing Amount and ship-state                                        |7,828 rows removed |
|Remove invalid orders    |Kept only Shipped status orders                                                        |13,807 rows removed|
|Remove zero amount orders|Removed orders with Amount = 0                                                         |2,262 rows removed |

**Output:** `amazon_cleaned.csv` — 105,080 rows, 21 columns (81.5% data retained)

-----

## Phase 3 — Exploratory Data Analysis

**File:** `03_EDA_Analysis.ipynb`

**Objective:** Explore the clean dataset to find patterns, trends, and business insights.

### Analysis 1 — Revenue by Category

Set category leads with Rs 3.47 Crore total revenue. Set and Kurta have almost equal order volumes (~40,600 each) but Set earns double the revenue due to higher average order value.

### Analysis 2 — Monthly Revenue Trend

April is the peak month at Rs 2.57 Crore. Revenue declined 8.5% from April to May and a further 13% from May to June — a 20.3% total decline over the period.

### Analysis 3 — Revenue by State

Maharashtra is the top state at Rs 1.19 Crore. The top 5 states contribute 65% of total revenue. South and West India dominate Amazon fashion sales.

### Analysis 4 — Orders by Category

Set and Kurta are nearly equal in order count but Set generates double the revenue. Set average order value is Rs 854 versus Kurta at Rs 466 — an 83% difference.

### Analysis 5 — Top 10 Cities

Bengaluru is the top city with 9,495 orders. The top 5 cities contribute 29% of all orders.

### Analysis 6 — Size Analysis

Medium, Large, and XL are the top 3 sizes accounting for 50.7% of all orders. Plus sizes (4XL to 6XL) represent only 2% — an underserved market opportunity.

### Analysis 7 — B2B vs B2C

99.3% of all orders are from individual consumers. B2B orders total only 784 out of 105,080. Amazon India fashion is a pure B2C business with an untapped B2B wholesale opportunity.

### Analysis 8 — Fulfilment Analysis

Amazon fulfilled 72.4% of orders and Merchant fulfilled 27.6%. Amazon-fulfilled orders deliver faster and generate higher customer satisfaction.

-----

## Phase 4 — SQL Business Analysis

**Files:** `amazon_sql_analysis.sql`, `04_sql_analysis_summary.ipynb`

**Database:** amazon_analysis | **Tool:** MySQL Workbench 8.0

**Connection:** Python (sqlalchemy + pymysql) used to load amazon_cleaned.csv into MySQL.

### SQL Queries

|Query|Business Question                              |Key Technique                |
|-----|-----------------------------------------------|-----------------------------|
|Q1   |Which category generates the most revenue?     |GROUP BY, SUM, AVG           |
|Q2   |Which states place the most orders?            |GROUP BY, ORDER BY, LIMIT    |
|Q3   |Which month generated the highest revenue?     |GROUP BY Month               |
|Q4   |Which category has the highest avg order value?|AVG, MIN, MAX                |
|Q5   |Which cities drive the most orders?            |GROUP BY city and state      |
|Q6   |Which fulfilment method generates more revenue?|Window function, percentage  |
|Q7   |How is revenue trending month over month?      |CTE, LAG() window function   |
|Q8   |How does B2B vs B2C revenue differ?            |CASE WHEN, Window function   |
|Q9   |What is the best-selling size per category?    |CTE, RANK() with PARTITION BY|
|Q10  |Which single day generated the highest revenue?|RANK() global, GROUP BY Date |

### Key SQL Findings

- May 4, 2022 = peak single day at Rs 10.94 Lakhs
- May 4th had fewer orders than May 2nd but higher revenue — confirming order quality matters more than order volume
- B2B average order value (Rs 701) is higher than B2C (Rs 662) despite only 0.7% of total orders
- Set size M = 7,494 orders (top size), Kurta size L = 7,219 orders

-----

## Phase 5 — Tableau Dashboard

**Live Dashboard:** [Amazon E-Commerce Sales Dashboard](https://public.tableau.com/views/AmazonE-CommerceSalesDashboard/Dashboard1)

### Dashboard Components

|Sheet                |Chart Type|Business Question                  |
|---------------------|----------|-----------------------------------|
|KPI Total Revenue    |Text      |What is total revenue?             |
|KPI Total Orders     |Text      |How many orders were placed?       |
|KPI AOV              |Text      |What is the average order value?   |
|KPI Top Category     |Text      |Which category leads?              |
|Revenue by Category  |Bar Chart |Which category earns the most?     |
|Monthly Revenue Trend|Line Chart|How is revenue trending?           |
|Revenue by State     |Map       |Which states contribute the most?  |
|Top 10 Cities        |Bar Chart |Which cities place the most orders?|
|Revenue by Fulfilment|Bar Chart |Amazon vs Merchant fulfilment?     |

### Dashboard Features

- Category filter — filter all charts by product category
- Month filter — filter all charts by month
- Indian number formatting — values displayed in Crore and Lakh
- Interactive tooltips on all charts

-----

## Key Business Insights

1. **Set is the star product** — highest revenue (Rs 3.47 Cr) and highest average order value (Rs 854). Prioritise Set category for inventory and promotions.
1. **April is peak month** — Rs 2.57 Crore. Revenue declined 20.3% from April to June. Root cause investigation recommended — competition, seasonality, or supply issues.
1. **May 4th = single best day** — Rs 10.94 Lakhs. May 1-4 consistently strong, suggesting salary-cycle effect on consumer spending.
1. **Maharashtra and Bengaluru dominate** — top state and top city. Prioritise marketing spend in Maharashtra, Karnataka, and Telangana for maximum ROI.
1. **B2B is untapped** — only 784 B2B orders despite higher average order value. A wholesale B2B program could be a significant growth opportunity.
1. **Plus sizes underserved** — 4XL to 6XL is only 2% of orders. A gap exists between supply and potential plus-size demand.
1. **Saree is a premium niche** — Rs 806 average order value with only 141 orders. High-value low-volume segment worth targeted marketing.

-----

## How to Run This Project

**Clone the repository:**

```
git clone https://github.com/PushpalathaSidd/Amazon_Ecommerce_Sales_Analysis.git
```

**Install Python dependencies:**

```
pip install pandas numpy matplotlib seaborn sqlalchemy pymysql
```

**Run notebooks in order:**

```
01_data_understanding.ipynb
02_data_cleaning.ipynb
03_EDA_Analysis.ipynb
04_sql_analysis_summary.ipynb
```

**For SQL analysis:**

- Open MySQL Workbench
- Create database: `CREATE DATABASE amazon_analysis;`
- Run `amazon_sql_analysis.sql`

-----

## Dataset

- **Source:** [Kaggle — Amazon Sale Report](https://www.kaggle.com/)
- **Original size:** 128,975 rows, 24 columns
- **Clean size:** 105,080 rows, 21 columns
- **Note:** Raw CSV not included in repository due to file size. Download from Kaggle and run the cleaning notebook to generate amazon_cleaned.csv.

-----

## Author

**Pushpalatha S**
Data Analyst | Bengaluru, India

[GitHub](https://github.com/PushpalathaSidd) | [Tableau Public](https://public.tableau.com/app/profile/pushpalatha.sidd)
