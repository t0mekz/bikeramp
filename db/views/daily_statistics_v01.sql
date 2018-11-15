SELECT date, SUM(distance) as total_distance, AVG(distance) as avg_ride, AVG(price) as avg_price
FROM trips
WHERE distance IS NOT null
GROUP BY date;
