-- phpMyAdmin SQL Dump
-- version 4.7.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 29, 2018 at 04:57 AM
-- Server version: 10.2.7-MariaDB
-- PHP Version: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `JCS18336TheSelectSquad`
--

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `section` int(11) NOT NULL,
  `course_num` int(11) NOT NULL,
  `courseName` varchar(80) NOT NULL,
  `professors_id` int(11) NOT NULL,
  `seats` int(11) NOT NULL DEFAULT 30,
  `credits` int(11) NOT NULL DEFAULT 3,
  `prereqs` varchar(250) NOT NULL DEFAULT 'NONE'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`section`, `course_num`, `courseName`, `professors_id`, `seats`, `credits`, `prereqs`) VALUES
(1, 10300, 'Introduction to Computing for Majors', 1, 30, 3, 'MATH19500, MATH20100(Co)'),
(2, 10300, 'Introduction to Computing for Majors', 2, 30, 3, 'MATH19500, MATH20100(Co)'),
(3, 10400, 'Discrete Mathematical Structures I', 3, 30, 4, 'MATH20100'),
(4, 10400, 'Discrete Mathematical Structures I', 4, 30, 4, 'MATH20100'),
(5, 10400, 'Discrete Mathematical Structures I', 5, 30, 4, 'MATH20100'),
(6, 11300, 'Programming Language', 6, 30, 1, 'CSc10300'),
(8, 21000, 'Computers and Assembly Language Programming', 4, 30, 3, 'NONE'),
(9, 21100, 'Fundamentals of Computer Systems', 7, 30, 3, 'CSc10300'),
(10, 21100, 'Fundamentals of Computer Systems', 8, 30, 3, 'CSc10300'),
(11, 21200, 'Data Structures', 17, 30, 3, 'CSc10300, CSc10400'),
(12, 21200, 'Data Structures', 20, 30, 3, 'CSc10300, CSc10400'),
(13, 21200, 'Data Structures', 18, 30, 3, 'CSc10300, CSc10400'),
(14, 21200, 'Data Structures', 19, 30, 3, 'CSc10300, CSc10400'),
(15, 21700, 'Probability and Statistics for Computer Science', 21, 30, 3, 'CSc10300, CSc10400, MATH20100'),
(16, 21700, 'Probability and Statistics for Computer Science', 10, 30, 3, 'CSc10300, CSc10400, MATH20100'),
(17, 22000, 'Algorithms', 21, 30, 3, 'CSc21200'),
(18, 22000, 'Algorithms', 6, 30, 3, 'CSc21200'),
(19, 22000, 'Algorithms', 3, 30, 3, 'CSc21200'),
(20, 22100, 'Software Design Laboratory', 15, 30, 3, 'CSc21200, ENGL21007'),
(21, 22100, 'Software Design Laboratory', 22, 30, 3, 'CSc21200, ENGL21007'),
(22, 22100, 'Software Design Laboratory', 18, 30, 3, 'CSc21200, ENGL21007'),
(23, 30100, 'Numerical Issues In Scientific Programming', 9, 30, 3, 'MATH34600, CSc21700, CSc20300, CSc22000'),
(24, 30100, 'Numerical Issues In Scientific Programming', 10, 30, 3, 'MATH34600, CSc21700, CSc20300, CSc22000'),
(25, 30400, 'Introduction to Theortical Computer Science', 9, 30, 3, 'CSc22000'),
(26, 32200, 'Software Engineering', 11, 30, 3, 'CSc22000, CSc22100'),
(27, 33200, 'Operating Systems', 24, 30, 4, 'CSc2200, CSc21700'),
(28, 33500, 'Programming Language Paradigms', 5, 30, 3, 'CSc2200, CSc22100'),
(29, 33600, 'Introduction to Database Systems', 16, 30, 3, 'CSc2200, CSc22100'),
(30, 34200, 'Computer Organization', 12, 30, 3, 'CSc21100, CSc34300(Co)'),
(31, 34200, 'Computer Organization', 8, 30, 3, 'CSc21100, CSc34300(Co)'),
(32, 34300, 'Computer Systems Design Laboratory', 8, 30, 3, 'CSc34200(Co)'),
(33, 34300, 'Computer Systems Design Laboratory', 12, 30, 3, 'CSc34200(Co)'),
(34, 34300, 'Computer Systems Design Laboratory', 13, 30, 3, 'CSc34200(Co)'),
(35, 42000, 'Complier Construction', 4, 30, 3, 'CSc30400'),
(36, 44800, 'Artificial Intelligence', 14, 30, 3, 'CSc2200, CSc22100'),
(37, 33600, 'Introduction to Databases Systems', 25, 30, 3, 'CSc22000,CSc22100');

-- --------------------------------------------------------

--
-- Table structure for table `professors`
--

CREATE TABLE `professors` (
  `id` int(11) NOT NULL,
  `prof_fname` varchar(100) NOT NULL,
  `prof_lname` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `professors`
--

INSERT INTO `professors` (`id`, `prof_fname`, `prof_lname`) VALUES
(1, 'William', 'Skeith'),
(2, 'Jeffrey', 'Gitlin'),
(3, 'Peter', 'Brass'),
(4, 'Michael', 'Vulis'),
(5, 'Douglas', 'Troeger'),
(6, 'Ahmet', 'Yuksel'),
(7, 'Isidor', 'Gertner'),
(8, 'Xiang', 'Meng'),
(9, 'Leonid', 'Gurtvis'),
(10, 'Irina', 'Gladkova'),
(11, 'Jie', 'Wei'),
(12, 'Zheng', 'Peng'),
(13, 'Donald', 'Gordon'),
(14, 'Stephen', 'Lucci'),
(15, 'Mohammed', 'Shibli'),
(16, 'John', 'Connor'),
(17, 'Maryam', 'Vatankhah'),
(18, 'Nooredin', 'Naghibolhosseini'),
(19, 'Cesar', 'Rojas'),
(20, 'Zhigang', 'Zhu'),
(21, 'Elahe', 'Vahdani'),
(22, 'See', 'Chiu'),
(24, 'Devendra', 'Kumar'),
(25, 'Peter', 'Barnett'),
(26, 'Huy', 'Vo'),
(27, 'Erik', 'Grimmelmann'),
(28, 'Rosario', 'Gennaro'),
(29, 'Nikolai', 'Avteniev'),
(30, 'Dong Hwan', 'Moon'),
(31, 'Michael', 'Grossberg'),
(32, 'Ronak', 'Etemadpour'),
(33, 'Akira', 'Kawaguchi');

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `prof_rating` decimal(2,1) NOT NULL,
  `difficulty` decimal(2,1) NOT NULL,
  `chilly_pepper` varchar(7) NOT NULL DEFAULT 'Not Hot',
  `would_take_again` int(11) NOT NULL,
  `professors_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ratings`
--

INSERT INTO `ratings` (`prof_rating`, `difficulty`, `chilly_pepper`, `would_take_again`, `professors_id`) VALUES
('1.6', '4.3', 'Not Hot', -1, 2),
('3.3', '3.3', 'Not Hot', 44, 3),
('2.4', '3.8', 'Not Hot', 62, 4),
('2.5', '4.4', 'Not Hot', 6, 5),
('4.4', '3.9', 'Hot', 93, 6),
('3.8', '3.9', 'Not Hot', 82, 1),
('2.7', '3.7', 'Not Hot', 62, 7),
('-1.0', '-1.0', 'Not Hot', -1, 8),
('3.0', '3.8', 'Not Hot', 57, 9),
('2.1', '4.0', 'Not Hot', -1, 10),
('3.8', '3.0', 'Not Hot', -1, 11),
('2.6', '4.8', 'Not Hot', 20, 12),
('-1.0', '-1.0', 'Not Hot', -1, 13),
('4.0', '2.4', 'Is Hot', -1, 14),
('2.5', '3.6', 'Not Hot', 50, 15),
('4.9', '3.5', 'Sexy', 89, 16),
('2.0', '1.0', 'Sexy', -1, 17),
('4.7', '1.6', 'Is Hot', -1, 18),
('-1.0', '-1.0', 'Not Hot', -1, 19),
('4.2', '3.1', 'Not Hot', -1, 20),
('-1.0', '-1.0', 'Not Hot', -1, 21),
('4.0', '2.0', 'Not Hot', -1, 22),
('3.1', '2.9', 'Not Hot', -1, 24),
('4.4', '2.8', 'Is Hot', -1, 25),
('3.0', '4.0', 'Not Hot', -1, 26),
('-1.0', '-1.0', 'Not Hot', -1, 27),
('3.0', '3.7', 'Not Hot', -1, 28),
('-1.0', '-1.0', 'Not Hot', -1, 29),
('-1.0', '-1.0', 'Not Hot', -1, 30),
('3.5', '3.3', 'Not Hot', -1, 31),
('3.0', '4.4', 'Not Hot', -1, 32),
('2.3', '4.3', 'Not Hot', 39, 33);

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `review` varchar(500) DEFAULT NULL,
  `created` date DEFAULT NULL,
  `professors_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`review`, `created`, `professors_id`) VALUES
('Professor Skeith is there to make your life easier. It would be in your best interest to attend lectures, even though he uploads the class notes onto his Bitbucket. Do note that if you have no experience with programming, this class can prove difficult. However, as long as you attend lectures, do the TODOs, and read the textbook, you will do fine.', NULL, 1),
('It\'s very rare you come across a Professor that is so devoted to giving his students the highest degree of knowledge they can get. Just by looking at his 103 homepage you can see the time he put into making all the pages explaining things like git, gdb, arch-linux, etc. His projects are interesting, demanding and rewarding. He is a true gem.', NULL, 1),
('I did not have a great time at City College and I could not wait to get out of there. Professor Skeith was definitely the person that started to make it enjoyable for me. Very inspirational, super smart and very helpful for his students. I wish I would be able to take his classes again.', NULL, 1),
('He is ever ever ever worst professor. His teaching does not organize and mass up . He just say alway \"just use\" when u study computer sicence, plz plz avold him', NULL, 2),
('If you go into this class knowing 0 programming, you\'re in for a rough ride. He codes on the command line which is something you get used to. Not very clear when he lectures, but his projects are where I learned the most from. Projects rating (4.5/5)', NULL, 2),
('the worst professor ever. If you have legit no idea about programming, be aware and don\'t take him, even if it takes costs you one semester for a better professor do it. This guy doesn\'t make any sense. Choosing him as my professor was one of the worst thing i ever did. Beware and don\'t take him. i wish i could give him negative rating.', NULL, 2),
('He is a very charming and nice professor, exams are too hard, but he curve everyone. Most people get 20-30, but in the end, they still get above C. TAKE HIM DUDE!', NULL, 3),
('Not recommended at all. Tough grader and really hard projects.', NULL, 3),
('This guy teaches but never understood what he was teaching. He never explained things clearly. Never asks student if they understood or not. Grading Policy is super clear: 3 tasks; Test 1 4 Programming Assignments Test 2. Takes median of those grades. Kindda easy if you know ur stuff but not a great professor. CHANGE IF POSSIBLE.', NULL, 3),
('3rd year student here, best CSC professor Ive had yet. Clearly has been programming since it was a hobby as he said in the 80s. Everything you need for projects given in lecture, a tiny bit of things you need to look up but straight forward. Any textbook allowed, most assembly books are open source/free! Only 3 ppl got C for just handing in smthng', NULL, 4),
('A horrible unprofessional professor. He is ambiguous as to how he grades test due to his inability to speak standard English. Avoid this guy like the plague.', NULL, 4),
('This is by far one of the best professor\'s at CCNY, despite his thick accent he knows his stuff and is willing to explain. This course is not for the weak, be prepare to think for yourself and learn! I enjoyed his course.', NULL, 4),
('I feel bad for whoever have him. The wrost professor you will ever have. He will take of alot of points of if you make the most tinitest mistakes in your exams. Hes good at failing students. He takes off point for no reason. His class is a mess and confusing, he doesnt finish his work.', NULL, 5),
('If you want to pass this class, make sure you do all the homework and visit his office hour where you will be solving homework problems on the board. Most students don\'t do the homework which is a biggest mistake. Try to get hold of past exams to prepare for his midterms and finals as the questions will be very similar. He grades very harshly.', NULL, 5),
('Hard professor but learned a lot. Pay attention to lectures since theres no feedback for writing proofs on your own. Avoid if GPA is more important than content.', NULL, 5),
('Super helpful, and he is an eye candy. He doesn\'t give much feedback unless you ask him, but otherwise great professor.', NULL, 6),
('LECTURE HEAVYTEST HEAVYINSPIRATIONAL\r\nAlthough it was a very hard and challenging course, he made me like the stuff. And I learned a lot. I am very grateful to him. I am taking his course for next semester.', NULL, 6),
('He has a memory like an elephant. He\'ll remember everything comes out of your mouth and what\'s written on assignments. His algorithms lecture is super fun! He talks to every single student in class and he makes sure his students learn the stuff. Makes me look forward to the next lecture.', NULL, 6),
('This class is a very difficult and stressful one. Professor Gertner will challenge you and put you to work. Your grade really shows how much effort you put into his class. Do the homework the second they are assigned or you will stay up late trying to do them. Read up on VHDL, Binary to Hexadecimal translations, and get yourself a raspberry pi.', NULL, 7),
('No review up to date', NULL, 8),
('He seems like a nice guy, but he doesn\'t know how to teach. The assignments/exams he gives are hard and require too much time to understand. If you\'re not self motivated AND good at math, avoid him if possible and take Gladkova instead. She\'s just as hard but she actually teaches everything you need for an A in class, no Wikipedia torture required!', NULL, 9),
('Absolutely terrible. Do not expect to learn from her lectures. She reads straight from the slides which are based off of the textbook. You are better off reading the textbook and looking at the examples. 1 exam, midterm, final, simulation project, and a group project. Curves are crappy too. Aced everything but final and ended up with a B+ -.-', NULL, 10),
('Very interesting course. Teaches the subject very well and makes the class fun. Going to class and taking notes will help you a lot for the quiz,midterm,and final. Find a good group (great programmers) and start it as early as you can. Lab quiz will be based on the handouts from your lab TA.', NULL, 11),
('Take Gartner instead In the beginning it would seem like he\'s a good professor but wait till he start deducting points for silly mistakes. His vhdl projects aren	 that difficult but he wants you to implement them the way he wants otherwise he would deduct so many points which I hated it avoid him if u can', NULL, 12),
('No review up to date', NULL, 13),
('He is a great lecturer. You would need to study a lot to be able to get a good grade.', NULL, 14),
('absolutely horrible. worst teacher in the entire school. he has no idea what he is teaching. doesnt know the material he suppose to teach. his grading makes no sense. u can do all the work correctly and still get an 80. his class is a joke!!! BEWARE OF THIS TEACHER!', NULL, 15),
('BEST PROFESSOR EVER! :D', NULL, 16),
('No review up to date', NULL, 17),
('Nooreddin really cares about his students, he will stop to explain something in the easiest possible way and he\'s very relaxed. You\'ll learn a lot of life lessons as well as CSC, enjoy him if you have him because a lot of other professors in this school aren\'t as enjoyable to have.', NULL, 18),
('No review up to date', NULL, 19),
('This school has a tendency to have subpar CS prof and I was glad Zhu was the exception. He actually cares about students and teaches his lectures so that even beginner programmers understand. He does have pop quizzes and 6-7 assignments but if you read the textbook and lectures before hand you should be fine.', NULL, 20),
('No review up to date', NULL, 21),
('Was actually easier than expected. Had to study but not too much. Take him if you can you\'ll actually pick up something useful!', NULL, 22),
('No final, 3 test( he calls them quizzes) 300 points each 2 questions each but if u know the information you can easily just think through them. Lectures kind of get boring and I think even he realizes it. Better than the average CSC Dept in ccny', NULL, 24),
('Exams are very similar to review. Home work and project will help you to understand materials', NULL, 25),
('Tricky class, the big data course. This guy can be confusing at times. Overall, you learn a lot. Expect to have your Python basics down. This is a HEAVY Python course. However, very practical, useful knowledge.', NULL, 26),
('No review up to date', NULL, 27),
('Great Professor. He teaches in detail. He is always wiling to go back and explain. He is always available to help outside of office hours. Must do well on the midterm and final. He curves generously.', NULL, 28),
('No review up to date', NULL, 29),
('No review up to date', NULL, 30),
('You will learn a LOT from his class. And i don\'t just mean textbook material but material that is going to be very useful in the real world. This has probably been my most helpful class I have taken at CCNY and a class I would recommend all CSC majors take. He really makes you work but it really is all worth it in the end.', NULL, 31),
('Stay away if you can. She gives a lot of info in powerpoint but doesn\'t reinforce the material with useful assignments. No review for midterm/final, which is frustrating because her tests don\'t reflect what you\'ve worked on in class/hw. This class could benefit from a proper text book and weekly programming assignments that reflect the lectures.', NULL, 32),
('DO NOT TAKE HIM UNLESS YOU GOT EXPERIENCE I took him 2x, I dropped in the fall and retook it in the summer after getting some experience. For newbies the assignments are difficult he there is no lecture he makes videos which you have watch to pass, he is rude when asked a question. If you have experience you can get by the 7 hw the 3 exams are hard', NULL, 33),
('Kawaguchi is one of the worst professors ever. Take him if you do not want to pass.', NULL, 33),
('Well the only thing I want to point out before selecting Akira, be ready to study on your own. He seems funny and knows his stuff but unfortunately he just can\'t teach. He gives you bunch of assignments without any explanations. His lectures were also so confusing and all over the place. Then he asks his students \"Why don\'t you understand?\".', NULL, 33),
('If you want to learn data science, I would not recommend her.', NULL, 32),
('The lectures in general are difficult but she gave lots of examples and extra books and resources for better clarification. She is helpful in general. The class needs more preparation. The exams are not difficult though there are many assignments. I liked the class and learned a lot', NULL, 32),
('Grade based on number of commits on bitbucket. Commit every single minor change you make for your assignments to bitbucket. Complete assignments properly. Concentrate on class properly to do better in exam. Exam will be very tricky and short answer oriented. Highly ambitious. But very good professor.', NULL, 31),
('Grossberg is a guy who knows what he\'s talking about. He knows the material so well but sometimes may have a hard time conveying it or assumes you know more than actually do. Great if you ask him a technical question, he\'ll always give you a good answer. He gives long tests, so you need to know your stuff in order to finish it all.', NULL, 31),
('Exams are tough, he also is tough grader, not many partial credits provide. Leave him alone!', NULL, 28),
('Algorithms is one of the toughest course that i ever took but the professor made it Manageable .He explains every concept deep from roots. Homeworks are tough and expect them every week but the tests are easy. you can crack them if you are paying attention to his classes. Grading standards are good and i would be more than happy to take him again.', NULL, 28),
('class can be tough, but he\'s a nice guy', NULL, 26),
('Not the most understandable professor ever, but would take again if needed. Beware of the big datas.', NULL, 26),
('Very intelligent and experienced person. Lecture is good if you review his slides before, but I think it can get boring when you are behind. Homework assignments are important because he will reference the database schema as examples in class or exam.', NULL, 25),
('A very good professor. The best one for the Databases course, for sure. Sometimes a little dry and abstract during lecture, but the exams are relatively straightforward. You wouldn\'t go wrong with Barnett! Just remember that attendance is mandatory!', NULL, 25),
('Professor Kumar is very knowledgeable and is a fair grader. He curves a lot, and even though you might get a 0 on the homework presentation, you can still get an A like me. Just know the material and attend the lectures if you want a good grade.', NULL, 24),
('3 quizzes, 300 points each, usually 4-5 problems in each quiz. Easy class but TA is an extremely tough grader. If you have a little bit mistake in a problem. You will get 5 out of 60, which directly make you grade three levels down. Because final grade is only based on three quizzes. BTW he does not care whether students understand his class.', NULL, 24),
('You can get a good grade if you study in his class.', NULL, 22),
('Nicest guys ever. Doesn\'t require much to pass the course.', NULL, 22),
('Fantastic professor! Very enthusiastic about teaching young computer scientists. He is a great guy. He presents the course material and his expectations very clearly. The assignments are very fair, and there is great potential to get an A in his class.', NULL, 20),
('Very nice & helpful professor. Gives assignments every two weeks & a quiz every week. The assignments depend heavily on the book along with the short answers on the exams. Exams consist of multiple choice & short answers. No attendance taken but you never know when a quiz is given, so it\'s best to attend every lecture. Powerpoint lectures given.', NULL, 20),
('Cool guy, pretty chill. He rambles on a lot about life , then makes up for it by keeping you extra time. Easy pass, take him.', NULL, 18),
('Would take this professor again for further class!!! He really cares student and a kind professor.', NULL, 18),
('This class is a very difficult and stressful one. Professor Gertner will challenge you and put you to work. Your grade really shows how much effort you put into his class. Do the homework the second they are assigned or you will stay up late trying to do them. Read up on VHDL, Binary to Hexadecimal translations, and get yourself a raspberry pi.', NULL, 7),
('Someone that can relay information and break things down in lamens terms is a good professor. I\'m not sorry for saying this - Professor Gertner is not one of them. Not only was it hard understand his accent, he would get defensive and verbally attack someone for clarification. No syllabus. The material in the book is not on the exams.', NULL, 7),
('Word of caution, Prof. Gurvits\'s class is quite unorthodox. No midterm, no attendance, no hw. Just a final which is open book. He does not follow a book and he does cover more than the required amount in the class. The material is tough but they are cool stuff. Grade based on class participation. Dont take his class if u dont like learning.', NULL, 9),
('He is the best professor in this college i ever met. The exams are pretty easy as long as you took cal 2 already. The course is totally understandable. You don\'t need to focus on his lecture because it is so easy. Just take a few minutes to review his lecture notes you will get it.', NULL, 9),
('Boring lectures, tough material, presented in a decent fashion at best. Tests are hard but she doesnt include anything she didnt cover. Not accessible outside class at all and makes her hw optional. Nice person over all but if you care about your grade gurvits is tougher but more lenient take him instead', NULL, 10),
('Very \"good\" Professor, you can\'t even give her a negative comment because someone will delete it right the way.', NULL, 10),
('Nice professor but expect to do some work especially on the project. Try to start your project early and take notes in class. You should learn a lot from the class.', NULL, 11),
('You can\'t avoid taking him. He\'s not exactly the best prof, he\'s ok. Be ready to take quick notes as he only write on one area of the board. He does expect a lot from the project, he curves the grade. The \"lab\" is useless, so don\'t even bother going.', NULL, 11),
('CRAZY PROJECT', NULL, 12),
('Computer System is a hard class and Professor Zheng is trying his best to make the topic easy to understand. You need to take time out and actually read and study up on the chapters. Group project consists of building circuits on an actual breadboard. His midterm and final are both 25% each which isn\'t that bad but the questions are hard.', NULL, 12),
('He is super helpful super kind and flexible and he is a good grader. You\'d learn a lot in his class. he jokes all the time, he is funny sometimes and mean sometimes. jut take him you\'d never regret.', NULL, 14),
('I have taken this class in Spring 2014, and it was amazing. especially I would love the programs he give and they are interesting and very challenging. Go and take this class and try to do programs and his exams are little complex, and if you think he is generous and don\'t study or do programming, you might end up in C or B-. So be careful', NULL, 14),
('I\'d never been so disappointed at a prof before, but geeez, this has been my worst prof at CCNY! CS Dept: you did bad hiring him. UNCLEAR grading criteria. He doesn\'t explain anything, and I\'m pretty sure he doesn\'t know what h\'s \"teaching\". Everyone complied with hw reqs and .. you get 80s for doing exactly the hw requested? AVOID HIM.', NULL, 15),
('This guy does not teach anything. He literally comes into class to waste time by asking dumb things. He\'ll open up a slide for 10 mins and skims through it. All of his assignments and projects are copied from another professor. He himself does not know whats going on. YOU WILL LEARN NOTHING. you will spend a lot of time teaching yourself everything', NULL, 15),
('There are no pop quizzes he tells you when the quizzes are online on his website as well as the homework due date. Lectures are long but do not seem so due to the fact that he makes it interesting. Best class to look forward especially after having a long day.', NULL, 16),
('Had him for Java 1. Very patient, he will explain if you ask. Just keep up with the work because there are quizzes that keep you on your toe but ultimately helps you learn. Java is very similar to C++ and he\'s one of the profs that makes it easy to learn.', NULL, 16),
('Easy A, just show up and you’ll pass..', NULL, 17),
('Kinda lame, didn’t learn much in this class, hope she changes her teaching style because its really not that good.', NULL, 17);

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `course_section` int(11) NOT NULL,
  `building` varchar(255) DEFAULT NULL,
  `room` varchar(100) DEFAULT NULL,
  `times` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`course_section`, `building`, `room`, `times`) VALUES
(1, 'Marshak', 'MR4, NAC 7/117', 'TuesThur 11:00am-11:50am, Fri 9:00am-10:40am'),
(2, 'Marshak', 'MR4, NAC 7/107', 'MonWe 11:00am-11:50am.Fri 9:00am-10:40am'),
(3, 'NAC,Sheapard', '4/220C, S-209', 'MonWe 9:00am-10:40am,We 12:00pm,1:40pm'),
(4, 'Sheapard,Marshak', 'S-210,417N', 'MonWe 4:00pm-5:40pm,We 9:00am,10:40pm'),
(5, 'NAC', '6/115', 'TuesThurs 2:00pm-3:40pm,Fri 1:00pm,2:40pm'),
(6, 'Shepard', 'S-209', 'Tues 9:30am-10:45am'),
(8, 'NAC', '7/231', 'MonWed 11:00am-12:15pm'),
(9, 'NAC', '7/225', 'MonWed 2:00PM-3:15pm,MonWed 3:30pm-4:20pm'),
(10, 'NAC', '4/113', 'TuesThurs 11:00am-12:15pm'),
(11, 'Shepard', 'S-209', 'MonWed 10:00pm-11:40am'),
(12, 'Shepard', 'S-209', 'MonWed 2:00pm-3:40pm'),
(13, 'NAC', '6/112', 'TuesThurs 10:00am-11:40am'),
(14, 'Shepard', 'S-203', 'TuesThurs 2:00pm-3:40pm'),
(15, 'NAC', '5/102', 'TuesFri 3:30pm-4:45pm'),
(16, 'NAC', '5/126', 'TuesThurs 2:00pm-3:15pm'),
(17, 'NAC', '5/126', 'TuesThurs 11:00am-12:15pm'),
(18, 'NAC', '7/306', 'MonWe 12:30am-1:45pm'),
(19, 'NAC', '7/6113', 'TuesFri 11:00am-12:15pm'),
(20, 'Shepard', 'S-21', 'MonWed 3:30am-4:45pm'),
(21, 'NAC', '5/150', 'TuesThurs 2:00pm-3:15pm'),
(22, 'Marshak', '410', 'TuesThurs 3:30pm-4:45pm'),
(23, 'NAC', '4/125', 'TuesThurs 2:00pm-3:15pm'),
(24, 'NAC', '4/125', 'TuesThurs 11:00am-12:15pm'),
(25, 'Baskervill', '106', 'TuesThurs 5:00pm-6:15pm'),
(27, 'NAC', '4/130, 7/106', 'Sa 9:00am-11:30am, Fri 9:00am-10:40am'),
(28, 'Shepard', 'S-209', 'TuesThurs 11:00am-12:15pm'),
(29, 'NAC', '4/121B', 'MonWed 5:00pm-6:15pm'),
(37, 'Shepard', 'S-209', 'TuesThurs 2:00pm-3:15pm'),
(30, 'NAC', '5/150', 'MonWed 11:00am-12:15pm'),
(31, 'NAC', '6/114', 'TuesThurs 2:00pm-3:15pm'),
(32, 'NAC', '7/105', 'TuesThurs 5:00pm-7:30pm'),
(33, 'NAC', '5/126', 'MonWed 2:00pm-3:15pm'),
(34, 'NAC', '4/220C', 'TuesThurs 3:30pm-4:45pm'),
(35, 'NAC', '4/120', 'MonWed 2:00pm-3:15pm'),
(36, 'NAC', '4/220C', 'MonWed 3:30pm-4:45pm'),
(26, 'Marshak, NAC', 'MR4, 4/156', 'MonWed 2:00pm-3:15pm, Fri 1:00pm-2:40pm');

-- --------------------------------------------------------

--
-- Table structure for table `TAs`
--

CREATE TABLE `TAs` (
  `ta_fname` varchar(20) DEFAULT NULL,
  `ta_lname` varchar(20) DEFAULT NULL,
  `course_section` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `TAs`
--

INSERT INTO `TAs` (`ta_fname`, `ta_lname`, `course_section`) VALUES
('Amir', 'Mohsen', 2),
('Toliyat', 'Abolhassani', 2),
('Bin', 'Mu', 1),
('Siyu', 'Liao', 3),
('Nihal', 'Vatandas', 4),
('Chi-Him', 'Liu', 5),
('Michael', 'Iannelli', 27),
('Isatou', 'Sanneh', 26);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`) VALUES
(1, 'Luis_B007'),
(2, 'Andy_W002'),
(3, 'Omar_E004'),
(4, 'Evan_V005');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`section`),
  ADD KEY `professors_id` (`professors_id`);

--
-- Indexes for table `professors`
--
ALTER TABLE `professors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD KEY `professors_id` (`professors_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD KEY `professors_id` (`professors_id`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD KEY `course_section` (`course_section`);

--
-- Indexes for table `TAs`
--
ALTER TABLE `TAs`
  ADD KEY `course_section` (`course_section`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `section` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT for table `professors`
--
ALTER TABLE `professors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`professors_id`) REFERENCES `professors` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`professors_id`) REFERENCES `professors` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`professors_id`) REFERENCES `professors` (`id`);

--
-- Constraints for table `schedule`
--
ALTER TABLE `schedule`
  ADD CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`course_section`) REFERENCES `courses` (`section`) ON DELETE CASCADE;

--
-- Constraints for table `TAs`
--
ALTER TABLE `TAs`
  ADD CONSTRAINT `TAs_ibfk_1` FOREIGN KEY (`course_section`) REFERENCES `courses` (`section`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
