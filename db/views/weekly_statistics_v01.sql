SELECT
  date_trunc('week', date)::date as week_start,
  (date_trunc('week', date) + '6 days'::interval)::date as week_end,
  SUM(distance) as total_distance,
  SUM(price) as total_price
FROM trips
GROUP BY week_start, week_end;
