USE real_estate_db;

INSERT INTO property_transactions (property_id, buyer_id, transaction_date, bank_name, iban, is_successful)
SELECT 
	po.agent_id + DAY(po.offer_datetime),
    po.agent_id + MONTH(po.offer_datetime),
    DATE(po.offer_datetime),
    CONCAT("Bank ", po.agent_id),
    CONCAT("BG", po.price, po.agent_id),
    true
FROM property_offers AS po
WHERE po.agent_id <= 2;

UPDATE properties
SET price = price - 50000
WHERE price >= 800000;

DELETE FROM property_transactions
WHERE is_successful = 0;

SELECT * FROM agents
ORDER BY city_id DESC, phone DESC;

SELECT * FROM property_offers
WHERE YEAR(offer_datetime) = 2021
ORDER BY price ASC
LIMIT 10;

SELECT LEFT(pr.address, 6) AS agent_name, CHAR_LENGTH(pr.address) * 5430 AS price FROM properties AS pr
	LEFT JOIN property_offers AS po
    ON pr.id = po.property_id
WHERE po.agent_id IS NULL
ORDER BY agent_name DESC, price DESC;

SELECT bank_name, COUNT(*) AS count FROM property_transactions
GROUP BY bank_name
HAVING count >= 9
ORDER BY count DESC, bank_name ASC;

SELECT address,area,  
	CASE 
		WHEN area <= 100 THEN "small"
        WHEN area <= 200 THEN "medium"
        WHEN area <= 500 THEN "large"
        ELSE "extra large"
    END AS size
FROM properties
ORDER BY area, address DESC;

