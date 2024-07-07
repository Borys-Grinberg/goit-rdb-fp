SELECT
	MAKEDATE(ic.Year, 1) AS initial_date,
	CURDATE() AS today_date,
    TIMESTAMPDIFF(YEAR, MAKEDATE(ic.Year, 1), CURDATE()) AS years_difference
FROM infectious_cases AS ic;