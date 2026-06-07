USE amazon_analysis;

-- ================================================
-- Q1: TOTAL REVENUE BY CATEGORY
-- Business Question: Which category generates 
-- the most revenue?
-- ================================================

select
	category,
    count(*) as total_orders,
    round(sum(amount), 2) as total_revenue,
    round(avg(amount), 2) as avg_order_value
from amazon_cleaned
group by category
order by total_revenue desc;

-- ================================================
-- Q2: TOP 10 STATES BY ORDER COUNT
-- Business Question: Which states place
-- the most orders on amazon?
-- ================================================

select
	shipstate,
    count(*) as total_orders,
    round(sum(amount), 2) as total_revenue
from amazon_cleaned
group by shipstate
order by total_orders desc
limit 10;

-- ================================================
-- Q3: MONTHLY REVENUE TREND
-- Business Question: Which mmonth generated the
-- high revenue? is revenue growing or declining?
-- ================================================ 

select
	Month,
    Month_name,
    count(*) as total_orders,
    round(sum(amount), 2) as total_revenue,
    round(avg(amount), 2) as avg_order_revenue
from amazon_cleaned
group by Month, Month_name
order by Month asc;

-- ================================================
-- Q4: AVG ORDER VALUE BY CATEGORY
-- Business Question: Which category has
-- heighest spending per order?
-- ================================================

select
	category,
    count(*) as total_revenue,
    round(avg(amount), 2) as avg_order_value,
    round(min(amount),2) as min_order_value,
    round(max(amount), 2) as max_order_value
from amazon_cleaned
group by category
order by avg_order_value desc, total_revenue desc, min_order_value asc, max_order_value desc;

-- ================================================
-- Q5: TOP 10 CITY
-- Business Question: Which cities drive
-- the most orders on amazon india?
-- ================================================

select
	shipcity,
    shipstate,
    count(*) as total_orders,
    round(sum(amount), 2) as total_revnue
from amazon_cleaned
group by shipcity, shipstate
order by total_orders desc
limit 10;

-- ================================================
-- Q6: REVENUE BY FULFILMENT TYPE 
-- Business Question: Which fulfilment method
-- generates more revenue?
-- ================================================
select
	Fulfilment,
    count(*) as total_orders,
    round(sum(amount), 2) as total_revenue,
    round(avg(amount), 2) as avg_order_value,
    round(count(*) * 100.0 / sum(count(*)) over(), 1) as order_percentage
from amazon_cleaned
group by Fulfilment
order by total_orders desc;

-- ================================================
-- Q7: MONTH OVER MONTH REVENUE CHANGE
-- Business Question: How is revenue trending
-- month over month? growing? or declining?
-- ================================================
with monthly_revenue as(
	select
    Month,
    Month_name,
    round(sum(amount), 2) as total_revenue
from amazon_cleaned
group by Month, Month_name
)
select
	Month,
    Month_name,
    total_revenue,
    lag(total_revenue) over(order by Month) as prev_month_revenue,
    round(total_revenue - lag(total_revenue) over(order by Month), 2) as revenue_change,
    round((total_revenue - lag(total_revenue) over(order by Month))
    / lag(total_revenue) over(order by Month) * 100, 1) as pct_change
from monthly_revenue
group by Month, Month_name;

-- ================================================
-- Q8: B2B VS B2C REVENUE ANALYSIS 
-- Business Question: How does revenue and order
-- behaviour differ between business and consumer customer?
-- ================================================

select
	B2B,
    case
		when B2B = 'true' then 'B2B (business)'
        else 'B2C (consumer)'
	end as customer_type,
        count(*) as total_orders,
        round(sum(amount), 2) as total_revenue,
        round(avg(amount), 2) as avg_order_value,
        round(count(*) * 100 / sum(count(*)) over(), 1) as order_percentage
from amazon_cleaned
group by B2B
order by total_orders desc;

-- ================================================
-- Q9: BEST SEELING SIZE
-- Business Question: What is the most popular size
-- within each product category?
-- ================================================

with size_category as(
	select
		Category,
        Size,
        count(*) as total_orders,
        round(sum(amount), 2) as total_revenue
        from amazon_cleaned
        group by Category, Size
),
rank_sizes as(
	select
		 Category,
         Size,
         total_orders,
         total_revenue,
         rank() over(partition by Category order by total_orders) as size_rank
		from size_category
)
select
	Category,
    Size,
    total_orders,
    total_revenue,
    size_rank
from rank_sizes
where size_rank = 1
order by total_orders desc;

-- ================================================
-- Q10: PEAK REVENUE DAY
-- Business Question:  Which single day generated
-- the highest revenue?
-- ================================================
select
	Date,
    Month_name,
    count(*) as total_orders,
    round(sum(amount), 2) as total_revenue,
    round(avg(amount), 2) as avg_order_value,
    rank() over (order by sum(amount) desc) as revenue_rank
from amazon_cleaned
group by Date, Month_name
order by total_revenue desc
limit 10;
    















































