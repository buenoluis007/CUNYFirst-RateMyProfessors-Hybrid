-- ------------------------- Queries -------------------------
SELECT
    CONCAT_WS(" ", 'CSc', courses.course_num) AS 'Course Number',
    courseName AS 'Course Name',
    section.section_id AS 'Section',
    description AS 'Course Description',
    prereqs AS 'Prereq(s)',
    credits AS 'Credits',
    CONCAT_WS(' ', prof_fname, prof_lname) AS 'Professor',
    ta AS 'TA(s)',
    CONCAT_WS(' ', building, room) AS 'Location',
    times AS 'Dates',
    prof_rating AS 'Professor\'s Rating',
    difficulty AS 'Professor\'s Difficulty',
    would_take_again AS 'Would Take Again(%)',
    chilly_pepper AS 'Professor\'s Popularity',
    CONCAT(SUBSTRING(reviews.review, 1, 90), '...') AS 'Review'
FROM section
    JOIN courses ON section.course_num = courses.course_num
    JOIN professors ON section.professors_id = professors.professors_id
    JOIN reviews ON reviews.professors_id = professors.professors_id;


SELECT CONCAT_WS(" ", 'CSc', courses.course_num) AS 'Course Number', courseName AS 'Course Name', section.section_id AS 'Section', description AS 'Course Description', prereqs AS 'Prereq(s)', credits AS 'Credits', CONCAT_WS(' ', prof_fname, prof_lname) AS 'Professor', ta AS 'TA(s)', CONCAT_WS(' ', building, room) AS 'Location', times AS 'Dates', prof_rating AS 'Professor\'s Rating', difficulty AS 'Professor\'s Difficulty', would_take_again AS 'Would Take Again(%)', chilly_pepper AS 'Professor\'s Popularity', CONCAT(SUBSTRING(reviews.review, 1, 90), '...') AS 'Review' FROM section JOIN courses ON section.course_num = courses.course_num JOIN professors ON section.professors_id = professors.professors_id JOIN reviews ON reviews.professors_id = professors.professors_id;

-- ----------------------------------------------------------
