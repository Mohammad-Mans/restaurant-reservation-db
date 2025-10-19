DECLARE @EmployeeID INT = 20;

SELECT AVG(TotalAmount) as AverageTotalAmount
FROM Orders
WHERE EmployeeID = @EmployeeID;
