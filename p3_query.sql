SELECT 
	AVG(Number_rabies) AS avg_rabies, 
    MIN(Number_rabies) AS min_rabies, 
    MAX(Number_rabies) AS max_rabies, 
    SUM(Number_rabies) AS rabies_sum
FROM infectious_cases
WHERE LENGTH(Number_rabies) > 0
GROUP BY country_entity_id 
ORDER BY avg_rabies DESC
LIMIT 10;