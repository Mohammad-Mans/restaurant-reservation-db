CREATE OR ALTER VIEW ReservationsReportView AS
SELECT 
    Reservations.ReservationId,
    Reservations.ReservationDate,
    Reservations.PartySize,
    Customers.CustomerId, 
    Customers.FirstName, 
    Customers.LastName, 
    Customers.Email, 
    Customers.PhoneNumber AS CustomerPhone,
    Restaurants.RestaurantId, 
    Restaurants.Name AS RestaurantName, 
    Restaurants.Address AS RestaurantAddress, 
    Restaurants.PhoneNumber AS RestaurantPhone,
    Restaurants.OpeningHours 
FROM Reservations
	JOIN Restaurants ON Reservations.RestaurantId = Restaurants.RestaurantId
	JOIN Customers ON Reservations.CustomerId = Customers.CustomerId;
