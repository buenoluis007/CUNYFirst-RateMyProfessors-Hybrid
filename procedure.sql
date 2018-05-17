-- -------------------------- Procedures --------------------------
-- Rate the professor
DELIMITER //
DROP PROCEDURE IF EXISTS rateProf //
CREATE PROCEDURE rateProf(IN professorsID INT, IN rating INT)
    BEGIN
        DECLARE rNum INT;
        DECLARE rSum DECIMAL;
        UPDATE reviews SET prof_rating = ((prof_rating * numberOfRating) + rating), numberOfRating = (numberOfRating + 1) WHERE professors_id = professorsID;
        SELECT DISTINCTROW numberOfRating, prof_rating INTO rNum, rSum FROM reviews WHERE professors_id = professorsID LIMIT 1;
        UPDATE reviews SET prof_rating = (rSum/rNum) WHERE professors_id = professorsID;
    END //
DELIMITER ;

-- How difficult was the professor
DELIMITER //
DROP PROCEDURE IF EXISTS diffProf //
CREATE PROCEDURE diffProf(IN professorsID INT, IN diff INT)
    BEGIN
        DECLARE dNum INT;
        DECLARE dSum DECIMAL;
        UPDATE reviews SET difficulty = ((difficulty * (numberOfRating - 1)) + diff) WHERE professors_id = professorsID;
        SELECT numberOfRating, difficulty INTO dNum, dSum FROM reviews WHERE professors_id = professorsID LIMIT 1;
        UPDATE reviews SET difficulty = (dSum/dNum) WHERE professors_id = professorsID;
    END //
DELIMITER ;

-- Percentage of how likely are you to take the professor again
DELIMITER //
DROP PROCEDURE IF EXISTS wtaProf //
CREATE PROCEDURE wtaProf(IN professorsID INT, IN wta INT)
    BEGIN
        DECLARE wNum INT;
        DECLARE wSum DECIMAL;
        UPDATE reviews SET would_take_again = ((would_take_again * (numberOfRating - 1)) + wta) WHERE professors_id = professorsID;
        SELECT numberOfRating, would_take_again INTO wNum, wSum FROM reviews WHERE professors_id = professorsID LIMIT 1;
        UPDATE reviews SET would_take_again = (wSum/wNum) WHERE professors_id = professorsID;
    END //
DELIMITER ;

-- DELIMITER //
-- DROP PROCEDURE IF EXISTS decrement //
-- CREATE PROCEDURE decrement(IN sectionID INT)
-- BEGIN
--     DECLARE seatsLeft INT;
--     SELECT seats INTO seatsLeft FROM section WHERE section_id = sectionID;
--     IF (seatsLeft > 0)
--         UPDATE section SET seats = (seats - 1) FROM section WHERE section_id = sectionID;
--     ELSE
-- END //
-- DELIMITER ;
