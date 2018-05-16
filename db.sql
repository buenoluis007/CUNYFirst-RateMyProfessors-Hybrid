-- The Select Squad Database 2.0
-- run in mysql: source db.sql

-- DROP DATABASE
DROP DATABASE IF EXISTS db;

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
    professors_id INT PRIMARY KEY AUTO_INCREMENT,
    prof_fname varchar(100) NOT NULL,
    prof_lname varchar(100) NOT NULL
);

-- Reviews Table
CREATE TABLE reviews (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    professors_id int(11) NOT NULL,
    prof_rating decimal(2,1),
    difficulty decimal(2,1),
    chilly_pepper varchar(7),
    would_take_again int(11),
    review varchar(1000),
    created date,
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

INSERT INTO section (course_num, professors_id, building, room, times, ta)
VALUES  (10300,1,'MR4, NAC 7/117', 'TuesThur 11:00am-11:50am, Fri 9:00am-10:40am','Bin Mu'),
        (10300,2,'MR4, NAC 7/107', 'MonWe 11:00am-11:50am.Fri 9:00am-10:40am','Amir Mohsen'),
        (10400,3,'NAC,Sheapard', '4/220C, S-209', 'MonWe 9:00am-10:40am,We 12:00pm,1:40pm','Siyu Liao'),
        (10400,4,'Sheapard,Marshak', 'S-210,417N', 'MonWe 4:00pm-5:40pm,We 9:00am,10:40pm','Nihal Vatandas'),
        (10400,5,'NAC', '6/115', 'TuesThurs 2:00pm-3:40pm,Fri 1:00pm,2:40pm','Chi-Him Liu'),
        (11300,6,'Shepard', 'S-209', 'Tues 9:30am-10:45am',),
        (21000,4,'NAC', '7/231', 'MonWed 11:00am-12:15pm',),
        (21100,7,'NAC', '7/225', 'MonWed 2:00PM-3:15pm,MonWed 3:30pm-4:20pm',),
        (21100,8,'NAC', '4/113', 'TuesThurs 11:00am-12:15pm',),
        (21200,17,'Shepard', 'S-209', 'MonWed 10:00pm-11:40am',),
        (21200,20,'Shepard', 'S-209', 'MonWed 2:00pm-3:40pm',),
        (21200,18,'NAC', '6/112', 'TuesThurs 10:00am-11:40am',),
        (21200,19,'Shepard', 'S-203', 'TuesThurs 2:00pm-3:40pm',),
        (21700,21,'NAC', '5/102', 'TuesFri 3:30pm-4:45pm',)
        (21700,10,'NAC', '5/126', 'TuesThurs 2:00pm-3:15pm',),
        (22000,21,'NAC', '5/126', 'TuesThurs 11:00am-12:15pm',),
        (22000,6,'NAC', '7/306', 'MonWe 12:30am-1:45pm',),
        (22000,3,'NAC', '7/6113', 'TuesFri 11:00am-12:15pm',),
        (22100,15,'Shepard', 'S-21', 'MonWed 3:30am-4:45pm',),
        (22100,22,'NAC', '5/150', 'TuesThurs 2:00pm-3:15pm',),
        (22100,18,'Marshak', '410', 'TuesThurs 3:30pm-4:45pm',),
        (30100,9,'NAC', '4/125', 'TuesThurs 2:00pm-3:15pm',),
        (30100,10,'NAC', '4/125', 'TuesThurs 11:00am-12:15pm',),
        (30400, 9, 'Baskervill', '106', 'TuesThurs 5:00pm-6:15pm', 'None'),
        (32200, 11, 'Marshak, NAC', 'MR4, 4/156', 'MonWed 2:00pm-3:15pm, Fri 1:00pm-2:40pm', 'Isatou Sanneh'),
        (33200, 24, 'NAC', '4/130, 7/106', 'Sa 9:00am-11:30am, Fri 9:00am-10:40am', 'Michael Iannelli'),
        (33500, 5, 'Shepard', 'S-209', 'TuesThurs 11:00am-12:15pm', 'None'),
        (33600, 16, 'NAC', '4/121B', 'MonWed 5:00pm-6:15pm', 'None'),
        (33600, 25, 'Shepard', 'S-209', 'TuesThurs 2:00pm-3:15pm', 'None'),
        (34200, 12, 'NAC', '5/150', 'MonWed 11:00am-12:15pm', 'None'),
        (34200, 8, 'NAC', '6/114', 'TuesThurs 2:00pm-3:15pm', 'None'),
        (34300, 8, 'NAC', '7/105', 'TuesThurs 5:00pm-7:30pm', 'None'),
        (34300, 12, 'NAC', '5/126', 'MonWed 2:00pm-3:15pm', 'None'),
        (34300, 13, 'NAC', '4/220C', 'TuesThurs 3:30pm-4:45pm', 'None'),
        (41200, 34, 'NAC', '5/150', 'MonWed 9:30am-10:45am', 'None'),
        (42000, 4, 'NAC', '4/120', 'MonWed 2:00pm-3:15pm', 'None'),
        (44800, 14, 'NAC', '4/220C', 'MonWed 3:30pm-4:45pm', 'None'),
        (47000, 33, 'NAC', '6/311', 'MonWed 2:00pm-3:15pm', 'None'),
        (47100, 20, 'NAC', '6/314', 'Mon 2:00pm-4:30pm', 'None'),
        (48000, 1, 'NAC', '4/222', 'TuTh 5:00PM - 6:15PM', 'None');



-- Data for courses table
INSERT INTO courses(course_num, courseName, description, credits, prereqs)
VALUES
(10300, 'Introduction to Computing for Majors', 'Basics of procedural computer programming (primarily in C++)', 3, 'MATH19500, MATH20100(Co)'),
(10400, 'Discrete Mathematical Structures I', 'Introduction to the mathematics fundamental to all phases of computer science, i.e. from the formulation of problems, to the understanding of their underlying structure, to the comparative analysis of the complexity of algorithms that can be used to solve these problems.', 4, 'MATH20100'),
(11300, 'Programming Language', 'This is a family of courses designed to develop understanding of and fluency in current and important programming language such as Python, C#, JavaScript and others as they emerge.', 1, 'CSc10300'),
(21000, 'Computers and Assembly Language Programming', 'Computer structure, machine representation of data, addressing and indexing, computation and control instructions, assembly language and assemblers', 3, 'NONE'),
(21100, 'Fundamentals of Computer Systems', 'Fundamentals of computer organization and digital logic. Boolean algebra, number systems and codes, combinational logic design principles, basic gates and components, flipflops and latches, counters and state machines', 3, 'CSc10300'),
(21200, 'Data Structures', 'Extension of the knowledge of algorithm design and programming gained in CSC 10300 with continued emphasis on the logic underlying the transition from specification to program. Particular attention is paid to issues arising in the implementation of larger programs: introduction of data structures and data abstraction; the basics of object-oriented programming. Introduction of recursion as a design tool. Introduction of complexity analysis', 3, 'CSc10300, CSc10400'),
(21700, 'Probability and Statistics for Computer Science', 'Project course in which students work as leaders or members of project teams. Individual oral presentations and written reports. Overview of applicable discrete and stochastic foundations: combinatorics, probability, and Monte Carlo.', 3, 'CSc10300, CSc10400, MATH20100'),
(22000, 'Algorithms', 'Measuring algorithmic complexity (O-Notation); searching and sorting algorithms and their complexity; tree and graph algorithms and their complexity; classes of algorithms, such as divide-and-conquer, backtracking, greedy, probabilistic, etc. Computational complexity; the classes P and NP.', 3, 'CSc21200'),
(22100, 'Software Design Laboratory', 'Accelerated introduction to Java programming language and its standard library usage. The course covers coding principles, graphic user interface, event-driven programming, design patterns, security issues, and network and mobile computing capabilities.', 3, 'CSc21200, ENGL21007'),
(30100, 'Numerical Issues In Scientific Programming', 'Numerical issues: roundoff error, truncation error, overflow and underflow errors. Numerical integration; solution of simultaneous equations; curve fitting. A thorough introduction to scientific programming, using a modern version of the Fortran or Matlab language.', 3, 'MATH34600, CSc21700, CSc20300, CSc22000'),
(30400, 'Introduction to Theortical Computer Science', 'Finite state automata, pushdown automata, Turing Machines, and the languages they can recognize. Church\'s Thesis.', 3, 'CSc22000'),
(32200, 'Software Engineering', 'The software development life cycle from feasibility study to turnover to client. Documentation of design, program, and training materials.', 3, 'CSc22000, CSc22100'),
(33200, 'Operating Systems', 'Overview of computer organization. Interrupts. Operating systems objectives and functions. Hardware protection mechanisms, dual mode operation. System calls.', 4, 'CSc2200, CSc21700'),
(33500, 'Programming Language Paradigms', 'Principles underlying programming language design, with intensive study of a modern declarative programming language such as Haskell, ML, or Scheme. Substantial programming assignments', 3, 'CSc2200, CSc22100'),
(33600, 'Introduction to Database Systems', 'An introduction to database architecture. Levels of abstraction in a database system; physical database organization: abstract data models; relational databases and their query languages. Database design assignments.', 3, 'CSc2200, CSc22100'),
(34200, 'Computer Organization', 'This course provides computer science and engineering students with an in-depth look at computer architecture and the hardware/software interface. The major topics are: computer abstractions and technology; the role of performance and measuring performance', 3, 'CSc21100, CSc34300(Co)'),
(34300, 'Computer Systems Design Laboratory', 'This course provides hands-on experience designing computers using commercially available CAD tools such as simulators and hardware description languages.', 1, 'CSc34200(Co)'),
(41200, 'Computer Networks', 'Layer approach to understanding networks using the ISO model: physical layer, data link layer, network layer, and, as time permits, the transport, session presentation, and application layers.', 3, 'CSc32200'),
(42000, 'Complier Construction', 'Formal description of programming languages and techniques used in their compilation. Study of syntax, semantics, ambiguities, procedures replication, iteration, and recursion in these languages.', 3, 'CSc30400'),
(44800, 'Artificial Intelligence', 'State-space and problem-induction representations of problems. Heuristic methods. Mechanical theorem proving. Application of these techniques to artificial intelligence problems.', 3, 'CSc2200, CSc22100'),
(47000, 'Image Processing', 'An intensive introduction to digital image processing. Image enhancement, digital filtering theory. Fourier transforms, image reconstruction, resampling, antialiasing, geometric transformations, scanline algorithms, warping, and morphing.', 3, 'CSc22100'),
(47100, 'Computer Vision', 'An intensive introduction to algorithms that recover information from images, motion sequences, multiple views, and 3D volumes.', 3, 'CSc30100, CSc32200'),
(48000, 'Computer Security', 'An introduction to the principles and practices of computer security in various computing environments. Conventional encryption systems and classical cryptography.', 3, 'CSc22000, CSc30400, CSc21700'),
(59866, 'Senior Project I', 'This is a two semester capstone design course. The student is required to design and implement a solution to a computer engineering problem.', 3, 'Must Be A Senior'),
(59867, 'Senior Project II', 'This is a two semester capstone design course. The student is required to design and implement a solution to a computer engineering problem. Topics include introduction to engineering design, identification of a problem, background research, social, environmental, ethical and economic considerations, intellectual property', 3, 'CSc59866');


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

-- Data for ratings table
INSERT INTO reviews (prof_rating, difficulty, chilly_pepper, would_take_again, professors_id, review, created)
VALUES
(3.8, 3.9, 'Not Hot', 82, 1, 'Professor Skeith is there to make your life easier. It would be in your best interest to attend lectures, even though he uploads the class notes onto his Bitbucket. Do note that if you have no experience with programming, this class can prove difficult. However, as long as you attend lectures, do the TODOs, and read the textbook, you will do fine.', NULL),
(3.8, 3.9, 'Not Hot', 82, 1, 'It\'s very rare you come across a Professor that is so devoted to giving his students the highest degree of knowledge they can get. Just by looking at his 103 homepage you can see the time he put into making all the pages explaining things like git, gdb, arch-linux, etc. His projects are interesting, demanding and rewarding. He is a true gem.', NULL),
(3.8, 3.9, 'Not Hot', 82, 1, 'I did not have a great time at City College and I could not wait to get out of there. Professor Skeith was definitely the person that started to make it enjoyable for me. Very inspirational, super smart and very helpful for his students. I wish I would be able to take his classes again.', NULL),
(1.6, 4.3, 'Not Hot',  0, 2, 'He is ever ever ever worst professor. His teaching does not organize and mass up . He just say alway \"just use\" when u study computer sicence, plz plz avold him', NULL),
(1.6, 4.3, 'Not Hot',  0, 2, 'If you go into this class knowing 0 programming, you\'re in for a rough ride. He codes on the command line which is something you get used to. Not very clear when he lectures, but his projects are where I learned the most from. Projects rating (4.5/5)', NULL),
(1.6, 4.3, 'Not Hot',  0, 2, 'the worst professor ever. If you have legit no idea about programming, be aware and don\'t take him, even if it takes costs you one semester for a better professor do it. This guy doesn\'t make any sense. Choosing him as my professor was one of the worst thing i ever did. Beware and don\'t take him. i wish i could give him negative rating.', NULL),
(3.3, 3.3, 'Not Hot', 44, 3, 'He is a very charming and nice professor, exams are too hard, but he curve everyone. Most people get 20-30, but in the end, they still get above C. TAKE HIM DUDE!', NULL),
(3.3, 3.3, 'Not Hot', 44, 3, 'Not recommended at all. Tough grader and really hard projects.', NULL),
(3.3, 3.3, 'Not Hot', 44, 3, 'This guy teaches but never understood what he was teaching. He never explained things clearly. Never asks student if they understood or not. Grading Policy is super clear: 3 tasks; Test 1 4 Programming Assignments Test 2. Takes median of those grades. Kindda easy if you know ur stuff but not a great professor. CHANGE IF POSSIBLE.', NULL),
(2.4, 3.8, 'Not Hot', 62, 4, '3rd year student here, best CSC professor Ive had yet. Clearly has been programming since it was a hobby as he said in the 80s. Everything you need for projects given in lecture, a tiny bit of things you need to look up but straight forward. Any textbook allowed, most assembly books are open source/free! Only 3 ppl got C for just handing in smthng', NULL),
(2.4, 3.8, 'Not Hot', 62, 4, 'A horrible unprofessional professor. He is ambiguous as to how he grades test due to his inability to speak standard English. Avoid this guy like the plague.', NULL),
(2.4, 3.8, 'Not Hot', 62, 4, 'This is by far one of the best professor\'s at CCNY, despite his thick accent he knows his stuff and is willing to explain. This course is not for the weak, be prepare to think for yourself and learn! I enjoyed his course.', NULL),
(2.5, 4.4, 'Not Hot', 6, 5, 'I feel bad for whoever have him. The wrost professor you will ever have. He will take of alot of points of if you make the most tinitest mistakes in your exams. Hes good at failing students. He takes off point for no reason. His class is a mess and confusing, he doesnt finish his work.', NULL),
(2.5, 4.4, 'Not Hot', 6, 5, 'If you want to pass this class, make sure you do all the homework and visit his office hour where you will be solving homework problems on the board. Most students don\'t do the homework which is a biggest mistake. Try to get hold of past exams to prepare for his midterms and finals as the questions will be very similar. He grades very harshly.', NULL),
(2.5, 4.4, 'Not Hot', 6, 5, 'Hard professor but learned a lot. Pay attention to lectures since theres no feedback for writing proofs on your own. Avoid if GPA is more important than content.', NULL),
(4.4, 3.9, 'Hot', 93, 6, 'Super helpful, and he is an eye candy. He doesn\'t give much feedback unless you ask him, but otherwise great professor.', NULL),
(4.4, 3.9, 'Hot', 93, 6, 'LECTURE HEAVYTEST HEAVYINSPIRATIONAL\r\nAlthough it was a very hard and challenging course, he made me like the stuff. And I learned a lot. I am very grateful to him. I am taking his course for next semester.', NULL),
(4.4, 3.9, 'Hot', 93, 6, 'He has a memory like an elephant. He\'ll remember everything comes out of your mouth and what\'s written on assignments. His algorithms lecture is super fun! He talks to every single student in class and he makes sure his students learn the stuff. Makes me look forward to the next lecture.', NULL),
(2.7, 3.7, 'Not Hot', 62, 7, 'This class is a very difficult and stressful one. Professor Gertner will challenge you and put you to work. Your grade really shows how much effort you put into his class. Do the homework the second they are assigned or you will stay up late trying to do them. Read up on VHDL, Binary to Hexadecimal translations, and get yourself a raspberry pi.', NULL),
(2.7, 3.7, 'Not Hot', 62, 7, 'This class is a very difficult and stressful one. Professor Gertner will challenge you and put you to work. Your grade really shows how much effort you put into his class. Do the homework the second they are assigned or you will stay up late trying to do them. Read up on VHDL, Binary to Hexadecimal translations, and get yourself a raspberry pi.', NULL),
(2.7, 3.7, 'Not Hot', 62, 7, 'Someone that can relay information and break things down in lamens terms is a good professor. I\'m not sorry for saying this - Professor Gertner is not one of them. Not only was it hard understand his accent, he would get defensive and verbally attack someone for clarification. No syllabus. The material in the book is not on the exams.', NULL),
(0, 0, 'Not Hot',  0, 8, 'No review up to date', NULL),
(3.0, 3.8, 'Not Hot', 57, 9, 'He seems like a nice guy, but he doesn\'t know how to teach. The assignments/exams he gives are hard and require too much time to understand. If you\'re not self motivated AND good at math, avoid him if possible and take Gladkova instead. She\'s just as hard but she actually teaches everything you need for an A in class, no Wikipedia torture required!', NULL),
(3.0, 3.8, 'Not Hot', 57, 9, 'Word of caution, Prof. Gurvits\'s class is quite unorthodox. No midterm, no attendance, no hw. Just a final which is open book. He does not follow a book and he does cover more than the required amount in the class. The material is tough but they are cool stuff. Grade based on class participation. Dont take his class if u dont like learning.', NULL),
(3.0, 3.8, 'Not Hot', 57, 9, 'He is the best professor in this college i ever met. The exams are pretty easy as long as you took cal 2 already. The course is totally understandable. You don\'t need to focus on his lecture because it is so easy. Just take a few minutes to review his lecture notes you will get it.', NULL),
(2.1, 4.0, 'Not Hot',  0, 10,'Boring lectures, tough material, presented in a decent fashion at best. Tests are hard but she doesnt include anything she didnt cover. Not accessible outside class at all and makes her hw optional. Nice person over all but if you care about your grade gurvits is tougher but more lenient take him instead', NULL),
(2.1, 4.0, 'Not Hot',  0, 10,'Very \"good\" Professor, you can\'t even give her a negative comment because someone will delete it right the way.', NULL),
(2.1, 4.0, 'Not Hot',  0, 10,'Absolutely terrible. Do not expect to learn from her lectures. She reads straight from the slides which are based off of the textbook. You are better off reading the textbook and looking at the examples. 1 exam, midterm, final, simulation project, and a group project. Curves are crappy too. Aced everything but final and ended up with a B+ -.-', NULL),
(3.8, 3.0, 'Not Hot',  0, 11,'Nice professor but expect to do some work especially on the project. Try to start your project early and take notes in class. You should learn a lot from the class.', NULL),
(3.8, 3.0, 'Not Hot',  0, 11,'You can\'t avoid taking him. He\'s not exactly the best prof, he\'s ok. Be ready to take quick notes as he only write on one area of the board. He does expect a lot from the project, he curves the grade. The \"lab\" is useless, so don\'t even bother going.', NULL),
(3.8, 3.0, 'Not Hot',  0, 11,'Very interesting course. Teaches the subject very well and makes the class fun. Going to class and taking notes will help you a lot for the quiz,midterm,and final. Find a good group (great programmers) and start it as early as you can. Lab quiz will be based on the handouts from your lab TA.', NULL),
(2.6, 4.8, 'Not Hot', 20, 12,'Take Gartner instead In the beginning it would seem like he\'s a good professor but wait till he start deducting points for silly mistakes. His vhdl projects aren	 that difficult but he wants you to implement them the way he wants otherwise he would deduct so many points which I hated it avoid him if u can', NULL),
(2.6, 4.8, 'Not Hot', 20, 12,'Computer System is a hard class and Professor Zheng is trying his best to make the topic easy to understand. You need to take time out and actually read and study up on the chapters. Group project consists of building circuits on an actual breadboard. His midterm and final are both 25% each which isn\'t that bad but the questions are hard.', NULL),
(2.6, 4.8, 'Not Hot', 20, 12,'CRAZY PROJECT', NULL),
(0, 0, 'Not Hot',  0, 13, 'No review up to date', NULL),
(4.0, 2.4, 'Is Hot',  0, 14, 'He is a great lecturer. You would need to study a lot to be able to get a good grade.', NULL),
(4.0, 2.4, 'Is Hot',  0, 14, 'He is super helpful super kind and flexible and he is a good grader. You\'d learn a lot in his class. he jokes all the time, he is funny sometimes and mean sometimes. jut take him you\'d never regret.', NULL),
(4.0, 2.4, 'Is Hot',  0, 14, 'I have taken this class in Spring 2014, and it was amazing. especially I would love the programs he give and they are interesting and very challenging. Go and take this class and try to do programs and his exams are little complex, and if you think he is generous and don\'t study or do programming, you might end up in C or B-. So be careful', NULL),
(2.5, 3.6, 'Not Hot', 50, 15, 'I\'d never been so disappointed at a prof before, but geeez, this has been my worst prof at CCNY! CS Dept: you did bad hiring him. UNCLEAR grading criteria. He doesn\'t explain anything, and I\'m pretty sure he doesn\'t know what h\'s \"teaching\". Everyone complied with hw reqs and .. you get 80s for doing exactly the hw requested? AVOID HIM.', NULL),
(2.5, 3.6, 'Not Hot', 50, 15, 'This guy does not teach anything. He literally comes into class to waste time by asking dumb things. He\'ll open up a slide for 10 mins and skims through it. All of his assignments and projects are copied from another professor. He himself does not know whats going on. YOU WILL LEARN NOTHING. you will spend a lot of time teaching yourself everything', NULL),
(2.5, 3.6, 'Not Hot', 50, 15, 'absolutely horrible. worst teacher in the entire school. he has no idea what he is teaching. doesnt know the material he suppose to teach. his grading makes no sense. u can do all the work correctly and still get an 80. his class is a joke!!! BEWARE OF THIS TEACHER!', NULL),
(4.9, 3.5, 'Sexy', 89, 16, 'BEST PROFESSOR EVER! :D', NULL),
(4.9, 3.5, 'Sexy', 89, 16, 'There are no pop quizzes he tells you when the quizzes are online on his website as well as the homework due date. Lectures are long but do not seem so due to the fact that he makes it interesting. Best class to look forward especially after having a long day.', NULL),
(4.9, 3.5, 'Sexy', 89, 16, 'Had him for Java 1. Very patient, he will explain if you ask. Just keep up with the work because there are quizzes that keep you on your toe but ultimately helps you learn. Java is very similar to C++ and he\'s one of the profs that makes it easy to learn.', NULL),
(2.0, 1.0, 'Sexy',  0, 17, 'Easy A, just show up and you’ll pass..', NULL),
(2.0, 1.0, 'Sexy',  0, 17, 'Kinda lame, didn’t learn much in this class, hope she changes her teaching style because its really not that good.', NULL),
(4.7, 1.6, 'Is Hot',  0, 18, 'Nooreddin really cares about his students, he will stop to explain something in the easiest possible way and he\'s very relaxed. You\'ll learn a lot of life lessons as well as CSC, enjoy him if you have him because a lot of other professors in this school aren\'t as enjoyable to have.', NULL),
(4.7, 1.6, 'Is Hot',  0, 18, 'Would take this professor again for further class!!! He really cares student and a kind professor.', NULL),
(4.7, 1.6, 'Is Hot',  0, 18, 'Cool guy, pretty chill. He rambles on a lot about life , then makes up for it by keeping you extra time. Easy pass, take him.', NULL),
(0, 0, 'Not Hot', 0, 19, 'No review up to date', NULL),
(4.2, 3.1, 'Not Hot',  0, 20, 'This school has a tendency to have subpar CS prof and I was glad Zhu was the exception. He actually cares about students and teaches his lectures so that even beginner programmers understand. He does have pop quizzes and 6-7 assignments but if you read the textbook and lectures before hand you should be fine.', NULL),
(4.2, 3.1, 'Not Hot',  0, 20, 'Fantastic professor! Very enthusiastic about teaching young computer scientists. He is a great guy. He presents the course material and his expectations very clearly. The assignments are very fair, and there is great potential to get an A in his class.', NULL),
(4.2, 3.1, 'Not Hot',  0, 20, 'Very nice & helpful professor. Gives assignments every two weeks & a quiz every week. The assignments depend heavily on the book along with the short answers on the exams. Exams consist of multiple choice & short answers. No attendance taken but you never know when a quiz is given, so it\'s best to attend every lecture. Powerpoint lectures given.', NULL),
(0, 0, 'Not Hot',  0, 21, 'No review up to date', NULL),
(4.0, 2.0, 'Not Hot',  0, 22, 'Was actually easier than expected. Had to study but not too much. Take him if you can you\'ll actually pick up something useful!', NULL),
(4.0, 2.0, 'Not Hot',  0, 22, 'You can get a good grade if you study in his class.', NULL),
(4.0, 2.0, 'Not Hot',  0, 22,'Nicest guys ever. Doesn\'t require much to pass the course.', NULL),
(3.1, 2.9, 'Not Hot',  0, 23, 'No final, 3 test( he calls them quizzes) 300 points each 2 questions each but if u know the information you can easily just think through them. Lectures kind of get boring and I think even he realizes it. Better than the average CSC Dept in ccny', NULL),
(3.1, 2.9, 'Not Hot',  0, 23, 'Professor Kumar is very knowledgeable and is a fair grader. He curves a lot, and even though you might get a 0 on the homework presentation, you can still get an A like me. Just know the material and attend the lectures if you want a good grade.', NULL),
(3.1, 2.9, 'Not Hot',  0, 23, '3 quizzes, 300 points each, usually 4-5 problems in each quiz. Easy class but TA is an extremely tough grader. If you have a little bit mistake in a problem. You will get 5 out of 60, which directly make you grade three levels down. Because final grade is only based on three quizzes. BTW he does not care whether students understand his class.', NULL),
(4.4, 2.8, 'Is Hot',  0, 24, 'Exams are very similar to review. Home work and project will help you to understand materials', NULL),
(4.4, 2.8, 'Is Hot',  0, 24, 'Very intelligent and experienced person. Lecture is good if you review his slides before, but I think it can get boring when you are behind. Homework assignments are important because he will reference the database schema as examples in class or exam.', NULL),
(4.4, 2.8, 'Is Hot',  0, 24, 'A very good professor. The best one for the Databases course, for sure. Sometimes a little dry and abstract during lecture, but the exams are relatively straightforward. You wouldn\'t go wrong with Barnett! Just remember that attendance is mandatory!', NULL),
(3.0, 4.0, 'Not Hot',  0, 25, 'No review up to date', NULL),
(0, 0, 'Not Hot',  0, 26, 'No review up to date', NULL),
(3.0, 3.7, 'Not Hot',  0, 27, 'Great Professor. He teaches in detail. He is always wiling to go back and explain. He is always available to help outside of office hours. Must do well on the midterm and final. He curves generously.', NULL),
(3.0, 3.7, 'Not Hot',  0, 27, 'Exams are tough, he also is tough grader, not many partial credits provide. Leave him alone!', NULL),
(3.0, 3.7, 'Not Hot',  0, 27, 'Algorithms is one of the toughest course that i ever took but the professor made it Manageable .He explains every concept deep from roots. Homeworks are tough and expect them every week but the tests are easy. you can crack them if you are paying attention to his classes. Grading standards are good and i would be more than happy to take him again.', NULL),
(0, 0, 'Not Hot',  0, 28, 'No review up to date', NULL),
(0, 0, 'Not Hot',  0, 29, 'No review up to date', NULL),
(3.5, 3.3, 'Not Hot',  0, 30, 'You will learn a LOT from his class. And i don\'t just mean textbook material but material that is going to be very useful in the real world. This has probably been my most helpful class I have taken at CCNY and a class I would recommend all CSC majors take. He really makes you work but it really is all worth it in the end.', NULL),
(3.5, 3.3, 'Not Hot',  0, 30, 'Grade based on number of commits on bitbucket. Commit every single minor change you make for your assignments to bitbucket. Complete assignments properly. Concentrate on class properly to do better in exam. Exam will be very tricky and short answer oriented. Highly ambitious. But very good professor.', NULL),
(3.5, 3.3, 'Not Hot',  0, 30, 'Grossberg is a guy who knows what he\'s talking about. He knows the material so well but sometimes may have a hard time conveying it or assumes you know more than actually do. Great if you ask him a technical question, he\'ll always give you a good answer. He gives long tests, so you need to know your stuff in order to finish it all.', NULL),
(3.0, 4.4, 'Not Hot',  0, 31, 'Stay away if you can. She gives a lot of info in powerpoint but doesn\'t reinforce the material with useful assignments. No review for midterm/final, which is frustrating because her tests don\'t reflect what you\'ve worked on in class/hw. This class could benefit from a proper text book and weekly programming assignments that reflect the lectures.', NULL),
(3.0, 4.4, 'Not Hot',  0, 31, 'If you want to learn data science, I would not recommend her.', NULL),
(3.0, 4.4, 'Not Hot',  0, 31, 'The lectures in general are difficult but she gave lots of examples and extra books and resources for better clarification. She is helpful in general. The class needs more preparation. The exams are not difficult though there are many assignments. I liked the class and learned a lot', NULL),
(2.3, 4.3, 'Not Hot', 39, 32, 'DO NOT TAKE HIM UNLESS YOU GOT EXPERIENCE I took him 2x, I dropped in the fall and retook it in the summer after getting some experience. For newbies the assignments are difficult he there is no lecture he makes videos which you have watch to pass, he is rude when asked a question. If you have experience you can get by the 7 hw the 3 exams are hard', NULL),
(2.3, 4.3, 'Not Hot', 39, 32, 'Kawaguchi is one of the worst professors ever. Take him if you do not want to pass.', NULL),
(2.3, 4.3, 'Not Hot', 39, 32, 'Well the only thing I want to point out before selecting Akira, be ready to study on your own. He seems funny and knows his stuff but unfortunately he just can\'t teach. He gives you bunch of assignments without any explanations. His lectures were also so confusing and all over the place. Then he asks his students \"Why don\'t you understand?\".', NULL),
(4.1, 3.2, 'Is Hot', 100, 33, 'One of the best professor in CCNY. His lectures are very clear and answers any question you might have during the class. He give 3 or 4 group projects , 1 midterm and a final exam. Make sure you read his slides to understand every concept. Exam questions are tricky and plus point if you\'re good in linear algebra. Make sure you participate.', NULL),
(4.1, 3.2, 'Is Hot', 100, 33, 'Great class just a lot of hw but he is very helpful about the hws so it is totally fine Prof Wolberg is great', NULL),
(4.1, 3.2, 'Is Hot', 100, 33, 'Really cool guy. One of the things I love about his lectures is that you\'ll get a bit of a history lesson to give you perspective on why what you\'re learning about exists. He has a lot of knowledge, and he tries very hard to convey it. Definitely not an easy A, but you get what you put into this. He also totally deserves the chili pepper.', NULL),
(3.1, 3.6, 'Not Hot', 0, 34, 'He is a great professor, not to mention a great man in general. He teaches his materials with some excellent analogies that get through to you easily. You can pass with minimal effort.', NULL),
(3.1, 3.6, 'Not Hot', 0, 34, 'Horrible...Professor is extremly nice..but what he teaches and then gives on the exams are completely different..horrible..', NULL),
(3.1, 3.6, 'Not Hot', 0, 34, 'Kaliappa\'s an OK professor at best. I feel like he could be good if he\'s more organized. He rarely responds to emails, didn\'t give us a clear syllabus and his writing skills is a mess. Expect to study from the textbook and critical thinking questions in his quizzes and test. His test and q\'s are definitely a lot diff from txtbk q\'s. Good luck', NULL),
(0, 0, 'Not Hot', 0, 35, 'No review up to date', NULL);

INSERT INTO users(username, password) VALUES
('buenoluis001', 'mvsl'),('omarelnagdy', 'oe1');
