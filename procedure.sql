-- -------------------------- Rating Procedure --------------------------
DELIMITER //
DROP PROCEDURE IF EXISTS rateProf //
CREATE PROCEDURE rateProf (IN professorsID INT, IN rating INT)

BEGIN
    DECLARE rNum INT;
    DECLARE rSum DECIMAL;
    UPDATE professors SET prof_rating = (prof_rating + rating), numberOfRating = (numberOfRating + 1) WHERE professors_id = professorsID;
    SELECT numberOfRating, prof_rating INTO rNum, rSum FROM ratings WHERE professors_id = professorsID;
    UPDATE professors SET prof_rating = (rSum/rNum) WHERE professors_id = professorsID;
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
