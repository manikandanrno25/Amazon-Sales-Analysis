create database Amazon_Sales;
use Amazon_Sales;
CREATE TABLE amazon_sales_data (
    Order_ID VARCHAR(50),
    Date DATE,
    Status VARCHAR(50),
    Fulfilment VARCHAR(100),
    Sales_Channel VARCHAR(100),
    ship_service_level VARCHAR(50),
    Category VARCHAR(100),
    Size VARCHAR(50),
    Courier_Status VARCHAR(50),
    Qty INT,
    Amount FLOAT,
    ship_city VARCHAR(100),
    ship_state VARCHAR(100),
    ship_postal_code VARCHAR(20),
    B2B VARCHAR(10)
);
select * from amazon_sales_data;
# Total orders
select count(Order_ID) from amazon_sales_data;
#Total Revenue by Category
select Category,sum(Amount) as revenue from amazon_sales_data group by Category;
#Orders by State
select ship_state as State,count(Order_ID) as Orders from amazon_sales_data group by ship_state;
#Monthly Revenue Trend
select date_format(Date,"%Y-%m") as month,sum(Amount) as Revenue from amazon_sales_data where Status <> "Cancelled" group by date_format(Date,"%Y-%m") order by month;
#Above-Average Categories
select Category,avg(Amount) from amazon_sales_data group by Category having avg(Amount)>(select avg(Amount) from amazon_sales_data);
#List states that have more than 1000 orders
select ship_state as State,count(Order_ID) as Orders from amazon_sales_data group by State having count(Order_ID)>1000;
#Shipped vs Cancelled Revenue Comparison
SELECT
    SUM(CASE WHEN Status = 'Shipped' THEN Amount  END) AS Shipped_Revenue,
    SUM(CASE WHEN Status = 'Cancelled' THEN Amount  END) AS Cancelled_Revenue
FROM amazon_sales_data;





