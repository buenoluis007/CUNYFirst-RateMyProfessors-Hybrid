-- The Select Squad Database 2.0
-- run in mysql: source db.sql

-- DROP DATABASE
DROP DATABASE db;

-- Recreate db and use it
CREATE DATABASE db;
USE db;

-- ------------------------------- Creating the tables -------------------------------

-- Users Table
CREATE TABLE users (
    users_id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    username varchar(100) NOT NULL,
    password varchar(100) NOT NULL
);

-- Professors Table
CREATE TABLE professors (
    professors_id int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    prof_fname varchar(100) NOT NULL,
    prof_lname varchar(100) NOT NULL
);

-- Reviews Table
CREATE TABLE reviews (
    professors_id int(11) PRIMARY KEY NOT NULL,
    review varchar(500),
    created date,
    prof_rating decimal(2,1),
    difficulty decimal(2,1),
    chilly_pepper varchar(7),
    would_take_again int(11),
    FOREIGN KEY(professors_id) REFERENCES professors(professors_id)
);

-- Courses Table
CREATE TABLE courses (
    course_num int(11) PRIMARY KEY NOT NULL,
    courseName varchar(80) NOT NULL,
    description varchar(500) NOT NULL DEFAULT 'NONE',
    credits int(11) NOT NULL DEFAULT 3,
    prereqs varchar(250) NOT NULL DEFAULT 'NONE'
);

-- Section Table
CREATE TABLE section (
    section_id INT PRIMARY KEY AUTO_INCREMENT,
    course_num INT NOT NULL,
    professors_id INT NOT NULL,
    building varchar(255) DEFAULT NULL,
    room varchar(100) DEFAULT NULL,
    times varchar(255) DEFAULT NULL,
    ta varchar(100) NOT NULL DEFAULT 'None',
    FOREIGN KEY(course_num) REFERENCES courses(course_num),
    FOREIGN KEY(professors_id) REFERENCES professors(professors_id)
);

-- Shopping Cart Table
CREATE TABLE shoppingCart (
    cart_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    section_id INT NOT NULL,
    FOREIGN KEY(user_id) REFERENCES users(users_id),
    FOREIGN KEY(section_id) REFERENCES section(section_id)
);

-- ----------------------------- Inserting Data Into the Tables -----------------------------

-- Data for courses table
INSERT INTO courses(course_num, courseName, description, credits, prereqs)
VALUES
(10300, 'Introduction to Computing for Majors', 3, 'MATH19500, MATH20100(Co)'),
(10400, 'Discrete Mathematical Structures I', 4, 'MATH20100'),
(11300, 'Programming Language', 1, 'CSc10300'),
(21000, 'Computers and Assembly Language Programming', 3, 'NONE'),
(21100, 'Fundamentals of Computer Systems', 3, 'CSc10300'),
(21200, 'Data Structures', 3, 'CSc10300, CSc10400'),
(21700, 'Probability and Statistics for Computer Science', 3, 'CSc10300, CSc10400, MATH20100'),
(22000, 'Algorithms', 3, 'CSc21200'),
(22100, 'Software Design Laboratory', 3, 'CSc21200, ENGL21007'),
(30100, 'Numerical Issues In Scientific Programming', 3, 'MATH34600, CSc21700, CSc20300, CSc22000'),
(30400, 'Introduction to Theortical Computer Science', 3, 'CSc22000'),
(32200, 'Software Engineering', 3, 'CSc22000, CSc22100'),
(33200, 'Operating Systems', 4, 'CSc2200, CSc21700'),
(33500, 'Programming Language Paradigms', 3, 'CSc2200, CSc22100'),
(33600, 'Introduction to Database Systems', 3, 'CSc2200, CSc22100'),
(34200, 'Computer Organization', 3, 'CSc21100, CSc34300(Co)'),
(34300, 'Computer Systems Design Laboratory', 3, 'CSc34200(Co)'),
(41200, 'Computer Networks', 3, 'CSc32200'),
(42000, 'Complier Construction', 3, 'CSc30400'),
(44800, 'Artificial Intelligence', 3, 'CSc2200, CSc22100'),
(47000, 'Image Processing', 3, 'CSc22100'),
(47100, 'Computer Vision', 3, 'CSc30100, CSc32200'),
(48000, 'Computer Security', 3, 'CSc22000, CSc30400, CSc21700'),
(59866, 'Senior Project I', 3, 'Must Be A Senior'),
(59867, 'Senior Project II', 3, 'CSc59866');


-- Data for professors table
INSERT INTO professors (prof_fname, prof_lname)
VALUES
('William', 'Skeith'),
('Jeffrey', 'Gitlin'),
('Peter', 'Brass'),
('Michael', 'Vulis'),
('Douglas', 'Troeger'),
('Ahmet', 'Yuksel'),
('Isidor', 'Gertner'),
('Xiang', 'Meng'),
('Leonid', 'Gurtvis'),
('Irina', 'Gladkova'),
('Jie', 'Wei'),
('Zheng', 'Peng'),
('Donald', 'Gordon'),
('Stephen', 'Lucci'),
('Mohammed', 'Shibli'),
('John', 'Connor'),
('Maryam', 'Vatankhah'),
('Nooredin', 'Naghibolhosseini'),
('Cesar', 'Rojas'),
('Zhigang', 'Zhu'),
('Elahe', 'Vahdani'),
('See', 'Chiu'),
('Devendra', 'Kumar'),
('Peter', 'Barnett'),
('Huy', 'Vo'),
('Erik', 'Grimmelmann'),
('Rosario', 'Gennaro'),
('Nikolai', 'Avteniev'),
('Dong Hwan', 'Moon'),
('Michael', 'Grossberg'),
('Ronak', 'Etemadpour'),
('Akira', 'Kawaguchi'),
('George', 'Wolberg'),
('Kaliappa', 'Ravindran'),
('Edward', 'Camp');
