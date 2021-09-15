SELECT *
	FROM dbo.mt_sales;

-- Grouping Total_Units_Sold
SELECT pro.Product_ID AS Product_ID
		,pro.Product_Name
		,(Product_Price - Product_Cost) AS Profit
		,SUM(Units) AS Total_Units_Sold
	FROM dbo.mt_products pro
		RIGHT JOIN dbo.mt_sales AS sales
			ON pro.Product_ID = sales.Product_ID
	GROUP BY Product_Price
			,Product_Cost
			,pro.Product_Name
			,pro.Product_ID
	ORDER BY pro.Product_ID ASC;


-- Breaking Down The Sales Revenue To its Parts 
SELECT sales.Product_ID
		,Product_Name
		,Product_Category
		,SUM(Units) Total_Unit_Sold
	FROM dbo.mt_sales sales
		LEFT JOIN dbo.mt_products products
			ON sales.Product_ID = products.Product_ID
	GROUP BY Product_Name
			,sales.Product_ID
			,Product_Category
	ORDER BY sales.Product_ID ASC;


-- Finding the Average, Total and Gross Sales Revenue For Maven Toys
SELECT ROUND(AVG(Product_Price), 2) AS Average_Sales_Price
		,SUM(Units) AS Total_Units_Sold
		,ROUND((AVG(Product_Price) * SUM(Units)), 2) AS Gross_Sales_Revenue
	FROM dbo.mt_sales sales
		LEFT JOIN dbo.mt_products pro
			ON sales.Product_ID = pro.Product_ID;


SELECT *
	FROM dbo.mt_products;

--Finding The Margin
SELECT (Product_Price - Product_Cost) AS Margin
	FROM dbo.mt_products;