-- Problem 1 & 2
-- 1. Using JOINs in a single query, combine data from all three tables (employees, products, sales) to view all sales with complete employee and product information in one table.
-- SELECT *  FROM ((sales 
-- INNER JOIN employees ON sales.SalesPersonID=employees.EmployeeID)
-- INNER JOIN products ON  sales.ProductID=products.ProductID);

-- CREATE VIEW all_sales AS SELECT SalesID, CustomerID, sales.ProductID, Quantity, EmployeeID, CONCAT(FirstName, " ", LastName) AS EmployeeName, Name AS ProductName, price  
-- FROM sales 
-- INNER JOIN employees ON sales.SalesPersonID=employees.EmployeeID
-- INNER JOIN products ON  sales.ProductID=products.ProductID

-- 2b. Test your View by selecting all rows and columns from the View

-- Problem 3
-- Find the average sale amount for each sales person
-- SELECT employeename , AVG(price * quantity) as Average_sales_amount
-- FROM all_sales
-- group by employeename
-- order by Average_sales_amount DESC;

-- Problem 4
-- Find the top three sales persons by total sales
-- SELECT DISTINCT employeename, (price*quantity) as total_sales  FROM all_sales ORDER BY total_sales DESC LIMIT 3

-- Problem 5
-- Find the product that has the highest price
-- SELECT DISTINCT productid, PRICE FROM ALL_SALES ORDER BY PRICE DESC LIMIT 1;

-- Problem 6
-- Find the product that was sold the most times
-- SELECT productname, (quantity * productid)  FROM all_sales order by productname DESC LIMIT 1;

-- Problem 7
-- Using a subquery, find all products that have a price higher than the average price for all products
-- SELECT ProductID, price FROM ALL_SALES WHERE PRICE > (SELECT AVG(PRICE) FROM ALL_SALES) ORDER BY price;

-- Problem 8
-- Find the customer who spent the most money in purchased products
 -- SELECT customerid, (quantity*price) as total_spent from all_sales order by total_spent DESC

-- Problem 9
-- Find the total number of sales for each sales person
-- SELECT DISTINCT employeename, sum(quantity*price) as total_sales FROM all_sales GROUP BY employeename

-- Problem 10
-- Find the sales person who sold the most to the customer you found in Problem 8
-- SELECT customerid, employeename, quantity FROM all_sales WHERE customerid=18723 ORDER BY employeename