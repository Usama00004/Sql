-- ROW_NUMBER()
SELECT 
    CustomerID,
    OrderDate, 
    ROW_NUMBER() OVER (PARTITION BY CustomerID ORDER BY OrderDate) AS RowNum
FROM Orders;

-- RANK() and DENSE_RANK()
SELECT 
    DepartmentID,
    EmployeeID,
    Salary,
    RANK() OVER (PARTITION BY DepartmentID ORDER BY Salary DESC) AS Rank,
    DENSE_RANK() OVER (PARTITION BY DepartmentID ORDER BY Salary DESC) AS DenseRank
FROM Employees;

-- SUM()
SELECT 
    SalesPersonID, 
    SaleAmount,
    SUM(SaleAmount) OVER (PARTITION BY SalesPersonID ORDER BY SaleDate) AS CumulativeSales
FROM Sales;

-- LAG() and LEAD()
SELECT 
    SalesPersonID, 
    SaleDate, 
    SaleAmount,
    LAG(SaleAmount) OVER (PARTITION BY SalesPersonID ORDER BY SaleDate) AS PreviousSale,
    LEAD(SaleAmount) OVER (PARTITION BY SalesPersonID ORDER BY SaleDate) AS NextSale
FROM Sales;

 
-- FIRST_VALUE() and LAST_VALUE()
SELECT 
    CustomerID, 
    OrderDate, 
    OrderAmount,
    FIRST_VALUE(OrderAmount) OVER (PARTITION BY CustomerID ORDER BY OrderDate) AS FirstOrderAmount,
    LAST_VALUE(OrderAmount) OVER (PARTITION BY CustomerID ORDER BY OrderDate ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS LastOrderAmount
FROM Orders;