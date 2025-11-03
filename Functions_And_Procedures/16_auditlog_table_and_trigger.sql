CREATE TABLE AuditLog (
    AuditId INT IDENTITY PRIMARY KEY,
    RestaurantId INT,
    TableId INT,
    ReservationDate DATETIME2,
    ChangeDate DATETIME2 DEFAULT GETDATE()
);
GO

CREATE OR ALTER TRIGGER trg_LogTableReservation
ON Reservations
AFTER INSERT
AS
BEGIN
    INSERT INTO AuditLog (RestaurantId, TableId, ReservationDate)
    SELECT RestaurantId, TableId, ReservationDate
    FROM inserted;
END;
GO

INSERT INTO Reservations 
VALUES (33, 5, 10, '2025-04-12 2:30', 3);

SELECT * FROM AuditLog;
