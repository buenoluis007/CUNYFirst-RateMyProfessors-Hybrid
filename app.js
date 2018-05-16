// The Select Squad Project 1
// Need to npm install --save express, mysql, ejs, and body-parser
var express = require('express');
var mysql = require('mysql');
var bodyParser = require("body-parser");
var app = express();

// Will look for a file in local directory called "views" and for a file with ".ejs" at the end
app.set("view engine", "ejs");
// app.use(bodyParser.urlencoded({extended: true})); // Needed for post requests ie: submitting a form
app.use(express.static(__dirname + "/public")); // Use public folder to access css

var connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'cool',
    database: 'db'
});

// Check if server is working properly
connection.connect(function(error) {
    if(!!error) {
        console.log("Error connecting to database");
    } else {
        console.log("Connected");
    }
});

let signedInUser = {
    userID: '0',
    userName: "",
    loggedIn: false,
};

app.get('/', function(req, res) {
    res.render("searchpage");
    console.log("Someone requested The Select Squad!");
});

// If logged in, redirect the user (FIX)
app.post('/RedirectLogin', function(req, res) {
  console.log(signedInUser.email);
    if(signedInUser.status === true) { // If the user is already signed in and tries to access this page, redirect them
        res.redirect('/');
    } else {
        res.render("/login");
    }
});

// check the login credentials
app.post('/logincheck', function(req, res) {
    var email = req.body.email;
    var password = req.body.pass;
    console.log(email);
    console.log(password);
    var q = "SELECT * FROM Users WHERE email='" + email + "' && password='" + password + "'";
    connection.query(q, function(err, results) {
        if(err) throw err;
        // console.log(results);
        if(results[0]) {
            console.log("The email and password are correct!");
            signedInUser.userID = results[0].userID;
            signedInUser.userName = results[0].email;
            signedInUser.loggedIn = true;
            console.log(signedInUser);
            res.redirect('/login');
        } else {
            console.log("The email or password is incorrect. Try again.");
            signedInUser.failed = true
            console.log(signedInUser.failed);
            res.redirect('/login');
        }
    });
});

// Sign Out
app.post('/signout', function(req, res) {
    signedInUser.userID = 0;
    signedInUser.userName = "";
    signedInUser.loggedIn = false;
    res.redirect('/');
});

// Depends on response from html form
app.get('/results', function(req, res) {
    var userResult = req.query.Course_Number;
    var q = "";
    if (!userResult) {
        console.log("You inputted nothing!");
        res.redirect('/');
    } else {
        // console.log(userResult);
        if (userResult == "All") {
            q = 'SELECT courses.section, CONCAT("CSc", course_num) AS COURSE, courseName, CONCAT_WS(" ", prof_fname, prof_lname) AS Professor, CASE WHEN prof_rating = -1 THEN "N/A" ELSE prof_rating END AS Professor_Rating, CONCAT_WS(" ", building, room, times) AS Location_and_Time FROM courses JOIN professors ON courses.professors_id = professors.id JOIN ratings ON ratings.professors_id = professors.id JOIN schedule ON courses.section = schedule.course_section ORDER BY COURSE';
        } else {
            q = 'SELECT courses.section, CONCAT("CSc", course_num) AS COURSE, courseName, CONCAT_WS(" ", prof_fname, prof_lname) AS Professor, CASE WHEN prof_rating = -1 THEN "N/A" ELSE prof_rating END AS Professor_Rating, CONCAT_WS(" ", building, room, times) AS Location_and_Time FROM courses JOIN professors ON courses.professors_id = professors.id JOIN ratings ON ratings.professors_id = professors.id JOIN schedule ON courses.section = schedule.course_section WHERE course_num = ' + userResult + ' ORDER BY COURSE';
        }

        if (checkInp(userResult)) {
            connection.query(q, function(err, results) {
                if(err) throw err;
                var results_json = [];
                results.forEach(function(result) {
                    results_json.push({
                        sec: result.section,
                        num: result.COURSE,
                        name: result.courseName,
                        prof: result.Professor,
                        rating: result.Professor_Rating,
                        timeLoc: result.Location_and_Time
                    });
                });
                // Uses views/orders.ejs
                // console.log(results_json);
                res.render("schedule", {results: results_json});
            });
        } else {
            console.log("Invalid input! Format: 'xxx00' where x is an number");
            // alert("Must input numbers!");
            res.redirect('/');
        }
    }


    // console.log("Someone requested The Select Squad!");
});

app.get("/results/details", function(req, res) {
    var classResult = req.query.courseValue;
    var r = 'SELECT section, CONCAT("CSc",course_num, " ",courseName) AS COURSE, CONCAT_WS(" ", prof_fname, prof_lname) AS Professor, IFNULL(CONCAT_WS(" ", ta_fname, ta_lname), "N/A") AS TA, CASE WHEN prof_rating = -1 THEN "N/A" ELSE prof_rating END AS Professor_Rating, CASE WHEN difficulty = -1 THEN "N/A" ELSE difficulty END AS Difficulty, CASE WHEN would_take_again = -1 THEN "N/A" ELSE would_take_again END AS Would_Take_Again, chilly_pepper AS Chilly_Pepper, review AS Review, prereqs, credits, seats, CONCAT_WS(", ", building, room, times) AS Location_and_Time FROM courses JOIN professors ON courses.professors_id = professors.id JOIN ratings ON ratings.professors_id = professors.id JOIN reviews ON reviews.professors_id = professors.id JOIN schedule ON courses.section = schedule.course_section LEFT JOIN TAs ON courses.section = TAs.course_section WHERE section = ' + classResult;
    connection.query(r, function(err, results) {
        if(err) throw err;
        // console.log(results);
        var reviews_json = [];
        var TAs_json = [];
        var results_json = [];
        for(var i = 0; i < results.length; i++) {
            if(results[i].Review === "No review up to date") {
                reviews_json.push({profreview: results[i].Review});
                break;
            } else {
                reviews_json.push({profreview: results[i].Review});
            }
        }
        for(var i = 0; i < results.length; i++) {
            if(results[i].TA === "") {
                TAs_json.push({tAssistant: results[i].TA});
                break;
            } else {
                TAs_json.push({tAssistant: results[i].TA});
            }
        }
        results_json.push({
            sec: results[0].section,
            name: results[0].COURSE,
            prof: results[0].Professor,
            rating: results[0].Professor_Rating,
            diff: results[0].Difficulty,
            wta: results[0].Would_Take_Again,
            prereq: results[0].prereqs,
            credits: results[0].credits,
            seat: results[0].seats,
            chilly: results[0].Chilly_Pepper,
            timeLoc: results[0].Location_and_Time,
            reviews: reviews_json,
            ta: TAs_json
        });
        // console.log(results);
        // console.log(reviews_json);
        // console.log(TAs_json);
        // console.log(results_json);
        res.render("reviewTable", {results: results_json});
    });
    // console.log(classResult);
});



app.get('*', function(req, res) {
    res.send("This is not a valid page on this website.")
});

// Message for devs to see on localhost http://127.0.0.1:8080/
app.listen(8080, function() {
    console.log("Server running on 8080");
});

function checkInp(x) {
    if(x == "All") {
        return true;
    } else if (isNaN(x)) {
        return false;
    }
    return true;
}
