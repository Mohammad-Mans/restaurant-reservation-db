CREATE OR ALTER PROCEDURE sp_AddNewOrder
	@ReservationId INT,
	@EmployeeId INT,
	@OrderDate DATETIME2(0) = NULL,
	@TotalAmount DECIMAL(12,2),
	@OrderId INT OUTPUT
AS
BEGIN 
    IF NOT EXISTS (SELECT 1 FROM Reservations WHERE ReservationId = @ReservationId)
    BEGIN
        RAISERROR('Reservation %d does not exist.', 16, 1, @ReservationId);
        RETURN;
    END

    IF NOT EXISTS (SELECT 1 FROM Employees WHERE EmployeeId = @EmployeeId)
    BEGIN
        RAISERROR('Employee %d does not exist.', 16, 1, @EmployeeId);
        RETURN;
    END

    INSERT INTO Orders
    VALUES (@ReservationId, @EmployeeId, @OrderDate, @TotalAmount);

    SET @OrderId = SCOPE_IDENTITY();
END;
GO

DECLARE @NewOrderId INT;

EXEC sp_AddNewOrder @ReservationId = 13 , @EmployeeId = 1, @OrderDate = '2025-04-9 12:34:00', @TotalAmount = 30, @OrderId = @NewOrderId OUTPUT;

SELECT @NewOrderId AS NewOrderId;
