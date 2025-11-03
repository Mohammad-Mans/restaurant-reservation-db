DECLARE @CustomerId INT = 20;

SELECT Reservations.ReservationId, Reservations.ReservationDate, Reservations.PartySize, RestaurantTables.TableId, Restaurants.Name as 'Restaurant Name'
FROM Reservations 
	JOIN Restaurants ON Restaurants.RestaurantId = Reservations.RestaurantId
	JOIN RestaurantTables ON RestaurantTables.TableId = Reservations.TableId
WHERE Reservations.CustomerId = @CustomerId
ORDER BY Reservations.ReservationDate;