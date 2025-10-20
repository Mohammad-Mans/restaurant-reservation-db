CREATE OR ALTER PROCEDURE sp_FutureReservedTablesReport
AS
BEGIN
    SELECT DISTINCT TableId, ReservationDate
    INTO #FutureReservations
    FROM Reservations
    WHERE ReservationDate > GETDATE();

    SELECT *
    FROM #FutureReservations
        JOIN RestaurantTables ON #FutureReservations.TableId = RestaurantTables.TableId
        JOIN Restaurants ON RestaurantTables.RestaurantId = Restaurants.RestaurantId
    ORDER BY #FutureReservations.ReservationDate;

    DROP TABLE #FutureReservations;
END;

EXEC sp_FutureReservedTablesReport;
