create Schema Pizza;
use Pizza;
Select*From pizza_Sales;
-- Total Revenue --
Select Sum(Total_Price) as Total_Revenue From Pizza_Sales;
-- Average Order Value --
Select Sum(Total_Price)/Count(distinct Order_Id) as Avg_Order_Value from Pizza_Sales;
-- Total Pizza Sold--
Select Sum(Quantity) As Total_Pizza_Sold from Pizza_Sales;
-- Total Orders --
Select Count(distinct Order_Id) as Total_orders from Pizza_Sales;
-- Avg. Pizzas per Order--
Select Cast(Cast(Sum(Quantity) as decimal(7,2))/ Cast(Count(distinct order_id) As Decimal(7,2)) As decimal(7,2)) as Avr_Pizza_per_Order from pizza_sales;
-- Percentage Of Sales by Pizza Category--
select Pizza_Category, Sum(Total_Price) as Total_Sales,Sum(Total_Price)*100/(Select Sum(Total_Price)From Pizza_Sales) as Percentage_of_Sales
From Pizza_Sales 
Group By Pizza_Category;
-- Percentage of Sales by Pizza Size--
select Pizza_Size, Sum(Total_Price) as Total_Sales,Sum(Total_Price)*100/(Select Sum(Total_Price)From Pizza_Sales) as Percentage_of_Sales
From Pizza_Sales 
Group By Pizza_Size;
-- Top 5 Best Sellers by revenue--
Select Pizza_Name,Sum(Total_Price) as Total_Revenue From Pizza_Sales
Group By Pizza_Name 
Order By Total_Revenue Desc limit 5;
-- Bottom 5 Sellers by revenue --
Select Pizza_Name,Sum(Total_Price) as Total_Revenue From Pizza_Sales
Group By Pizza_Name 
Order By Total_Revenue Asc limit 5;
-- Top 5 Best Sellers by Total Quantity --
Select Pizza_Name,Sum(Quantity) as Total_Quantity From Pizza_Sales
Group By Pizza_Name 
Order By Total_Quantity Desc limit 5;
-- Bottom 5 Sellers by Total Quantity --
Select Pizza_Name,Sum(Quantity) as Total_Quantity From Pizza_Sales
Group By Pizza_Name 
Order By Total_Quantity Asc limit 5;
-- Top 5 Best Sellers by Total Orders --
Select Pizza_Name,Count(Distinct Order_Id) as Total_Order From Pizza_Sales
Group By Pizza_Name 
Order By Total_order Desc limit 5;
-- Bottom 5 Sellers by Total Orders --
Select Pizza_Name,Count(Distinct Order_Id) as Total_Order From Pizza_Sales
Group By Pizza_Name 
Order By Total_order Asc limit 5;