-- Check if the class is full
DELIMITER $$
DROP TRIGGER IF EXISTS before_insert_enrolled $$
CREATE TRIGGER before_insert_enrolled
    BEFORE INSERT ON enrolled
	FOR EACH ROW
    BEGIN

        DECLARE seatsLeft INT;

        SELECT seats INTO seatsLeft FROM section WHERE section_id = NEW.section_id;

        IF seatsLeft <= 0
        THEN SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'Class Is Full';

        END IF;

    END; $$

DELIMITER ;

-- Decrease seats by 1 after enrolling
DELIMITER $$
DROP TRIGGER IF EXISTS after_insert_enrolled $$
CREATE TRIGGER after_insert_enrolled
    AFTER INSERT ON enrolled
	FOR EACH ROW
    BEGIN

	UPDATE section SET seats = (seats - 1) WHERE section_id = NEW.section_id;

    END; $$

DELIMITER ;
