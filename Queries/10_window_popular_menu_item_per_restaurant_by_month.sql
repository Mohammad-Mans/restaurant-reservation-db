DECLARE @Month int = 1;

WITH ItemFrequencyCTE AS (
SELECT 
	Restaurants.RestaurantId,
	OrderItems.ItemId,
	MenuItems.Name,
	SUM(OrderITems.Quantity) AS ItemFrequency,
	ROW_NUMBER() OVER (PARTITION BY Restaurants.RestaurantId ORDER BY SUM(OrderITems.Quantity) DESC) AS ItemRank
FROM OrderItems
	JOIN Orders ON OrderItems.OrderId = Orders.OrderId
	JOIN MenuItems ON OrderItems.ItemId = MenuItems.ItemId
	JOIN Restaurants ON MenuItems.RestaurantId = Restaurants.RestaurantId
WHERE MONTH(Orders.OrderDate) = @Month
GROUP BY OrderItems.ItemId, MenuItems.Name, Restaurants.RestaurantId
)

SELECT * FROM ItemFrequencyCTE WHERE ItemRank = 1;
