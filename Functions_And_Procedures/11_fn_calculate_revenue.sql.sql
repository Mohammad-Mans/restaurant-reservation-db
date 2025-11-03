CREATE OR ALTER FUNCTION fn_CalculateRevenue(@RestaurantId INT)
RETURNS DECIMAL(10,2)
AS
BEGIN
	DECLARE @Revenue DECIMAL(18,2);
	SELECT @Revenue = SUM(ORDERS.TotalAmount)
	FROM ORDERS
		JOIN Reservations ON Orders.ReservationId = Reservations.ReservationId
	WHERE Reservations.RestaurantId = @RestaurantId

	RETURN ISNULL(@Revenue,0)
	
END;
GO

SELECT dbo.fn_CalculateRevenue(1) AS TotalRestaurantRevenue;