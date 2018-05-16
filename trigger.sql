CREATE TRIGGER seatsTrigger
    BEFORE INSERT ON shoppingCart FOR EACH ROW
    BEGIN
        DECLARE seatsLeft INT;
        SELECT seats INTO seatsLeft FROM section WHERE section_id = NEW.section_id;
        IF (seatsLeft > 0)
            INSERT INTO shoppingCart VALUES (NEW.user_id, NEW.section_id);
        UPDATE section SET seats = (seatsLeft - 1) WHERE section_id = NEW.section_id;
        END IF;
    END;
