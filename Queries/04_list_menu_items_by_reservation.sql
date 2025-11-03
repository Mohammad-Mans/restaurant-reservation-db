DECLARE @ReservationID INT = 10;

SELECT MenuItems.ItemId, MenuItems.Name as ItemName, MenuItems.Description as ItemDescription, MenuItems.Price as ItemPrice, OrderItems.Quantity as ItemQuantity
FROM Orders
	JOIN OrderItems ON Orders.OrderID = OrderItems.OrderId
	JOIN MenuItems ON OrderItems.ItemId = MenuItems.ItemId
WHERE Orders.ReservationId = @ReservationID
ORDER BY Orders.OrderDate;
