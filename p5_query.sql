DROP FUNCTION IF EXISTS CalculateDifference;
DELIMITER //
CREATE FUNCTION CalculateDifference(start_date DATE, end_date DATE)
RETURNS INT
DETERMINISTIC 
NO SQL
BEGIN
    DECLARE result INT;
    SET result = TIMESTAMPDIFF(YEAR, start_date, end_date);
    RETURN result;
END //
DELIMITER ;

SELECT 
	CalculateDifference(MAKEDATE(ic.Year, 1), CURDATE()) AS difference
FROM infectious_cases AS ic;