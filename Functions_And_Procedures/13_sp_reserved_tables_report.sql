CREATE OR ALTER PROCEDURE sp_ResrvedTablesReport @StartDate DATETIME2, @EndDate DATETIME2
AS
BEGIN
	SELECT 
	Reservations.TableId,
	Reservations.ReservationDate,
	Reservations.PartySize,
	Restaurants.RestaurantId,
	Restaurants.Name as RestaurantName
	From Reservations
		JOIN Restaurants ON Reservations.RestaurantId = Restaurants.RestaurantId
	WHERE Reservations.ReservationDate >= @StartDate AND Reservations.ReservationDate <= @EndDate
	ORDER BY Reservations.ReservationDate
END;
GO

EXEC sp_ResrvedTablesReport @StartDate = '2025-03-30', @EndDate = '2025-04-10';
