CSc33600 Project #2
Professor: John Connor

CUNYFirst/RateMyProfessors Hybrid brought to you by: The Select Squad
A project done in SQL, HTML, CSS, and Node.JS

Members:
	Luis Bueno
	Andy Wang
	Omar Elnagdy
	Evan Vasquez

==========How to get our project to work==========

1) Make sure your terminal is in the same directory as this readme.txt file.

2) Open mysql on your terminal and run 'source db.sql', 'source procedure.sql', source trigger.sql;'

3) Open "app.js" in your preferred text editor. On lines 13-18, edit the code to the information you use to login to your personal mysql database. You probably only need to change the password as everything else should be correct.

4) Make sure you have "Node.JS" installed. Execute in the terminal "node app.js"

5) If you connected the database correctly, the terminal should say "Connected" and not "Error connecting to database" If you see "Error connecting to database" you didn't properly edit lines 13-18 in "app.js" Go to the next step once you're successfully "Connected"

6) Go to your internet browser and type in the address bar: "127.0.0.1:8080" or "localhost:8080" which is your computers local host on port 8080. If everything went okay, our website should load onto this page.

7) Play around with the website! Mess around with the search feature, and click around on the results page. It's perfectly normal to have the front page refresh if you put an invalid input as it's programmed to do so (the terminal leaves a message for an incorrect input). To go back a page, you can use your browsers "Go Back One Page" button.

==========Triggers==========

1) before_insert_enrolled: this trigger checks if the course you're trying to enroll into has at least a spot available, if so, you can enroll. Else, you can't.

2) after_insert_enrolled: this trigger decreases the seats available for a class by 1 after someone enrolls in it.

3) after_delete_enrolled: after someone drops the course, the seat count will increase by 1.

==========Stored Procedures==========
1) rateProf: takes professors_id and a new rating as the input, then it will average out the professor's rating to account for the new rating.

2) diffProf: does the same thing as rateProf, but for the difficulty of the professor.

3) wtaProf: does the same thing as rateProf and diffProf, but for the would take again attribute of the professor.

If you have any questions, feel free to email any of the members of The Select Squad.
