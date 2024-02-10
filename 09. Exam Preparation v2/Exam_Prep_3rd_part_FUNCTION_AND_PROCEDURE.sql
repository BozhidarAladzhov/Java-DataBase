USE real_estate_db;

DELIMITER $

CREATE FUNCTION udf_offers_from_city_name (cityName VARCHAR(50)) 
RETURNS INT 
DETERMINISTIC
BEGIN
	DECLARE offers_count INT;
    SET offers_count := ( 
							SELECT COUNT(*) FROM property_offers AS po
							JOIN properties AS p ON po.property_id = p.id
                            JOIN cities AS c ON p.city_id = c.id
                            WHERE c.name = cityName 
	);
    RETURN offers_count;
END;
DELIMITER ;

DELIMITER $
CREATE PROCEDURE udp_special_offer (first_name VARCHAR(50))
BEGIN
	UPDATE property_offers AS po
    JOIN agents AS a ON po.agent_id = a.id
    SET price = price - price * 0.1		
	WHERE a.first_name = first_name;
END;