SELECT * FROM chocolate_sales.`choco sales`;
ALTER TABLE `choco sales`
CHANGE COLUMN PRODUCT PRODUCT_NAME VARCHAR(255);
SELECT * FROM `CHOCO SALES`;
UPDATE `CHOCO SALES`
SET Date = STR_TO_DATE(Date, '%d-%m-%Y');
ALTER TABLE `choco sales`
CHANGE Amount `Total_Sales` DECIMAL(12,2);
SELECT sum(Total_Sales) from `choco sales`;
SELECT
    AVG(`Boxes shipped`) AS avg_boxes_per_sale
FROM `choco sales`;
SELECT
    Country,
    SUM(CAST(REPLACE(REPLACE(Total_Sales, '$', ''), ',', '') AS DECIMAL(12,2))) AS total_sales
FROM `choco sales`
GROUP BY Country
ORDER BY total_sales DESC
LIMIT 1;
SELECT
    `SalesPerson`,
    SUM(CAST(REPLACE(REPLACE(Total_Sales, '$', ''), ',', '') AS DECIMAL(12,2))) AS Total_Sales,
    SUM(`Boxes Shipped`) AS Total_Boxes_Shipped
FROM `choco Sales`
GROUP BY `SalesPerson`
LIMIT 5;
ALTER TABLE `choco Sales`
CHANGE  SalesPerson `Sales Person` VARCHAR(100);
DESCRIBE `choco sales`;
SELECT
    PRODUCT_NAME,
    SUM(CAST(REPLACE(REPLACE(Total_Sales, '$', ''), ',', '') AS DECIMAL(12,2))) AS Total_Sales,
    SUM(`Boxes Shipped`) AS Total_Boxes_Shipped
FROM `choco sales`
GROUP BY PRODUCT_NAME;
SELECT
    DATE_FORMAT(MIN(Date), '%d-%b-%y') AS month_year,
    SUM(CAST(REPLACE(REPLACE(Total_Sales, '$', ''), ',', '') AS DECIMAL(12,2))) AS Total_Sales
FROM `choco Sales`
GROUP BY YEAR(Date), MONTH(Date)
ORDER BY YEAR(Date), MONTH(Date);
SELECT
    PRODUCT_NAME,
    AVG(CAST(REPLACE(REPLACE(Total_Sales, '$', ''), ',', '') AS DECIMAL(12,2))) AS avg_sales_amount
FROM `choco sales`
GROUP BY PRODUCT_NAME
ORDER BY avg_sales_amount DESC
LIMIT 1;
SELECT
    SalesPerson,
    SUM(CAST(REPLACE(REPLACE(Total_Sales, '$', ''), ',', '') AS DECIMAL(12,2))) AS Total_Sales
FROM `choco sales`
GROUP BY SalesPerson
HAVING SUM(CAST(REPLACE(REPLACE(Total_Sales, '$', ''), ',', '') AS DECIMAL(12,2))) > 100000;
SELECT
    Country,
    PRODUCT_NAME,
    SUM(CAST(REPLACE(REPLACE(Total_Sales, '$', ''), ',', '') AS DECIMAL(12,2))) AS Total_Sales,
    SUM(`Boxes Shipped`) AS Total_Boxes_Shipped
FROM `choco sales`
GROUP BY Country, PRODUCT_NAME
ORDER BY Country, Total_Sales DESC;
SELECT
    Total_Sales,
    CAST(REPLACE(REPLACE(Total_Sales, '$', ''), ',', '') AS DECIMAL(12,2)) AS numeric_amount,
    Date,
    `SalesPerson`
FROM `choco Sales`
WHERE CAST(REPLACE(REPLACE(Total_Sales, '$', ''), ',', '') AS DECIMAL(12,2)) =
      (SELECT MAX(CAST(REPLACE(REPLACE(Total_Sales, '$', ''), ',', '') AS DECIMAL(12,2)))
       FROM `choco Sales`)
UNION ALL
SELECT
    Total_Sales,
    CAST(REPLACE(REPLACE(Total_Sales, '$', ''), ',', '') AS DECIMAL(12,2)) AS numeric_amount,
    Date,
    `SalesPerson`
FROM `choco Sales`
WHERE CAST(REPLACE(REPLACE(Total_Sales, '$', ''), ',', '') AS DECIMAL(12,2)) =
      (SELECT MIN(CAST(REPLACE(REPLACE(Total_Sales, '$', ''), ',', '') AS DECIMAL(12,2)))
       FROM `choco Sales`);