SELECT 
	Restaurants.RestaurantId,
	Restaurants.Name AS RestaurantName,
	COUNT(*) AS ReservationFrequency,
	Dense_RANK() OVER ( ORDER BY COUNT(*) DESC) AS RestaurantRank
FROM Restaurants
	JOIN Reservations on Restaurants.RestaurantId = Reservations.RestaurantId
GROUP BY Restaurants.RestaurantId, Restaurants.Name
