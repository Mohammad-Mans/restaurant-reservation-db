CREATE INDEX IDX_Reservations_RestaurantId ON Reservations(RestaurantId);

CREATE INDEX IDX_Orders_ReservationId ON Orders(ReservationId);

CREATE INDEX IDX_Orders_EmployeeId ON Orders(EmployeeId) INCLUDE (TotalAmount);

CREATE INDEX IDX_OrderItems_OrderId ON OrderItems(OrderId) INCLUDE (ItemId, Quantity);
