CREATE OR ALTER VIEW EmployeesDetailsView AS
SELECT 
    Employees.EmployeeId,
    Employees.FirstName, 
    Employees.LastName, 
    Employees.Position, 
    Restaurants.RestaurantId, 
    Restaurants.Name AS RestaurantName, 
    Restaurants.Address AS RestaurantAddress, 
    Restaurants.PhoneNumber AS RestaurantPhone,
    Restaurants.OpeningHours 
FROM Employees
	JOIN Restaurants ON Employees.RestaurantId = Restaurants.RestaurantId;
GO

SELECT * FROM EmployeesDetailsView ORDER BY RestaurantId;
