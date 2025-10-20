CREATE OR ALTER FUNCTION fn_CalculateEmployeeSalary(@EmployeeId INT)
RETURNS DECIMAL(10,2)
AS
BEGIN
	DECLARE @OrdersCount INT;
	DECLARE @Position VARCHAR(50);
	DECLARE @EmployeeRank INT = 1;

	SELECT @OrdersCount = COUNT(*) FROM dbo.Orders WHERE EmployeeId = @EmployeeId;
    SELECT @Position = Position FROM dbo.Employees WHERE EmployeeId = @EmployeeId;

	SET @EmployeeRank =
		CASE WHEN @Position = 'AssistantWaiter' THEN 3
			WHEN @Position = 'StandardWaiter' THEN 4
            WHEN @Position = 'VIPOrdersWaiter' THEN 5
            WHEN @Position = 'Manager' THEN 6
            ELSE 1 END;

	RETURN (@OrdersCount * @EmployeeRank)
END;
GO

SELECT dbo.fn_CalculateEmployeeSalary(1) AS TotalRestaurantRevenue;
