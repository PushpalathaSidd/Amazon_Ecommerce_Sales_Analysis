# Amazon E-Commerce Sales Analysis
## SQL Business Analysis Summary

*Objective:* Answer 10 key business questions using 
MySQL to validate Python EDA findings and uncover 
deeper insights through advanced SQL techniques.

*Dataset:* amazon_cleaned.csv — 105,080 rows, 21 columns  
*Tool:* MySQL Workbench 8.0  
*Database:* amazon_analysis  

---

## Business Questions & Key Findings

### Q1 — Total Revenue by Category
*Question:* Which product category generates the most revenue?

| Category | Orders | Revenue | Avg Order |
|----------|--------|---------|-----------|
| Set | 40,654 | Rs 3.47 Crore | Rs 854 |
| Kurta | 40,596 | Rs 1.89 Crore | Rs 466 |
| Western Dress | 12,639 | Rs 98 Lakhs | Rs 777 |

*Insight:* Set and Kurta have almost equal orders but 
Set earns double the revenue — because Set avg order (Rs 854) 
is 83% higher than Kurta avg order (Rs 466)

---

### Q2 — Top 10 States by Orders
*Question:* Which Indian states place the most orders?

| State | Orders | Revenue |
|-------|--------|---------|
| Maharashtra | 18,413 | Rs 1.19 Crore |
| Karnataka | 14,423 | Rs 94 Lakhs |
| Tamil Nadu | 9,470 | Rs 58 Lakhs |

*Insight:* Top 3 states contribute 40% of total orders. 
South and West India dominate Amazon India fashion sales.

---

### Q3 — Monthly Revenue Trend
*Question:* Which month had highest revenue?

| Month | Orders | Revenue | Avg Order |
|-------|--------|---------|-----------|
| March | 151 | Rs 94,183 | Rs 623 |
| April | 40,117 | Rs 2.57 Crore | Rs 639 |
| May | 34,632 | Rs 2.35 Crore | Rs 677 |
| June | 30,180 | Rs 2.04 Crore | Rs 676 |

*Insight:* April has highest total revenue but May has 
highest average order value (Rs 677) — May customers spent 
more per order even as overall orders declined.

---

### Q4 — Average Order Value by Category
*Question:* Which category has highest spending per order?

| Category | Avg | Min | Max |
|----------|-----|-----|-----|
| Set | Rs 854 | Rs 357 | Rs 5,584 |
| Saree | Rs 806 | Rs 554 | Rs 2,058 |
| Western Dress | Rs 777 | Rs 366 | Rs 2,860 |
| Kurta | Rs 466 | Rs 199 | Rs 2,175 |

*Insight:* Saree has only 141 orders but Rs 806 avg — 
a premium underserved segment with huge growth potential.

---

### Q5 — Top 10 Cities by Orders
*Question:* Which cities drive the most orders?

| City | State | Orders | Revenue |
|------|-------|--------|---------|
| Bengaluru | Karnataka | 10,041 | Rs 65 Lakhs |
| Hyderabad | Telangana | 7,448 | Rs 49 Lakhs |
| Mumbai | Maharashtra | 5,998 | Rs 38 Lakhs |
| Chennai | Tamil Nadu | 5,237 | Rs 32 Lakhs |
| New Delhi | Delhi | 5,174 | Rs 35 Lakhs |

*Insight:* Delhi has fewer orders than Chennai but 
higher revenue — Delhi customers spend more per order.

---

### Q6 — Fulfilment Type Analysis
*Question:* Amazon vs Merchant — which performs better?

| Fulfilment | Orders | Revenue | Avg Order | % Share |
|------------|--------|---------|-----------|---------|
| Amazon | 76,062 | Rs 5.03 Crore | Rs 661 | 72.4% |
| Merchant | 29,018 | Rs 1.93 Crore | Rs 666 | 27.6% |

*Insight:* Merchant customers spend slightly more 
per order (Rs 666 vs Rs 661) despite fewer orders — 
Merchant sellers attract higher-value customers.

---

### Q7 — Month over Month Revenue Change
*Question:* Is revenue growing or declining?

| Month | Revenue | Prev Month | Change | % Change |
|-------|---------|------------|--------|----------|
| March | Rs 94,183 | NULL | NULL | NULL |
| April | Rs 2.57 Cr | Rs 94,183 | +Rs 2.55 Cr | +27,148% |
| May | Rs 2.35 Cr | Rs 2.57 Cr | -Rs 2.2 L | -8.6% |
| June | Rs 2.04 Cr | Rs 2.35 Cr | -Rs 3.0 L | -12.9% |

*Insight:* Revenue declining consistently April to June.
April to May: -8.6%, May to June: -12.9%.
Total decline of 20.3% over 3 months.
Note: April spike vs March is misleading — March had only 1 day of data.

---

### Q8 — B2B vs B2C Analysis
*Question:* Business vs Consumer customer behaviour?

| Type | Orders | Revenue | Avg Order | % Share |
|------|--------|---------|-----------|---------|
| B2C | 104,296 | Rs 6.91 Crore | Rs 662 | 99.3% |
| B2B | 784 | Rs 5.5 Lakhs | Rs 701 | 0.7% |

*Insight:* B2B customers spend 5.9% more per order 
than B2C customers (Rs 701 vs Rs 662). B2B is completely 
untapped — only 784 orders — huge growth opportunity.

---

### Q9 — Best Selling Size Per Category
*Question:* What is the number 1 size in each category?

| Category | Top Size | Orders | Revenue |
|----------|----------|--------|---------|
| Set | M | 7,494 | Rs 63 Lakhs |
| Kurta | L | 7,219 | Rs 33 Lakhs |
| Western Dress | L | 2,306 | Rs 17 Lakhs |
| Top | XL | 1,568 | Rs 8.3 Lakhs |
| Saree | Free | 141 | Rs 1.1 Lakhs |
| Blouse | Free | 175 | Rs 70K |

*Insight:* Traditional wear (Set, Kurta) prefer M and L sizes.
Occasion wear (Saree, Blouse) prefer Free size.
Stock planning should be category-specific.

---

### Q10 — Peak Revenue Day
*Question:* Which single day generated highest revenue?

| Rank | Date | Month | Orders | Revenue | Avg Order |
|------|------|-------|--------|---------|-----------|
| 1 | 2022-05-04 | May | 1,669 | Rs 10.94 Lakhs | Rs 655 |
| 2 | 2022-05-03 | May | 1,711 | Rs 10.76 Lakhs | Rs 629 |
| 3 | 2022-05-02 | May | 1,723 | Rs 10.65 Lakhs | Rs 618 |
| 4 | 2022-04-14 | April | 1,570 | Rs 10.08 Lakhs | Rs 642 |
| 5 | 2022-05-01 | May | 1,524 | Rs 9.93 Lakhs | Rs 651 |

*Insight:* May 1-4 dominate top 5 peak days — likely 
salary/month-start shopping effect. More orders does not 
mean more revenue — May 4 has fewer orders than May 2 
but higher revenue due to higher avg order value.

---

## SQL Concepts Used

| Concept | Used In |
|---------|---------|
| GROUP BY + Aggregations | Q1-Q6, Q10 |
| ORDER BY ASC/DESC | All queries |
| LIMIT | Q2, Q5, Q10 |
| CASE WHEN | Q8 |
| Window Function OVER() | Q6, Q7, Q9, Q10 |
| LAG() | Q7 |
| RANK() with PARTITION BY | Q9 |
| RANK() without PARTITION | Q10 |
| CTE (WITH clause) | Q7, Q9 |
| Chained CTEs | Q9 |
| Percentage calculation | Q6, Q8 |

---

## Top 5 Business Recommendations

1. *Focus on Set category* — highest revenue AND orders
   — Increase inventory and marketing spend

2. *Target Saree segment* — premium customers (Rs 806 avg)
   — Only 141 orders — massive untapped potential

3. *Launch B2B wholesale program* — only 0.7% of orders
   — B2B spends 5.9% more per order — high value segment

4. *Run promotions on May 1-5* — consistently peak days
   — Salary effect drives highest single-day revenues

5. *Stock M/L for traditional, L/XL for western wear*
   — Size preferences differ by category significantly

---

## Next Step — Tableau Dashboard