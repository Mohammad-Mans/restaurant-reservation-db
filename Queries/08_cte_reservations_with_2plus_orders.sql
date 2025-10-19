WITH ReservationsCTE (ReservationId, NumberOFOrders) as (
SELECT ReservationId , COUNT(*)
FROM Orders
GROUP BY ReservationId
)

Select *
FROM ReservationsCTE
	JOIN Reservations ON ReservationsCTE.ReservationId = Reservations.ReservationId
WHERE NumberOFOrders >= 2;
