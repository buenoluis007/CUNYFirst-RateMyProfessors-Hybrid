// The Select Squad Project 1
// Need to npm install --save express, mysql, ejs, and body-parser
var express = require('express');
var mysql = require('mysql');
var Parser = require("body-parser");
var app = express();

app.use(Parser.urlencoded({extended: true}));
// Will look for a file in local directory called "views" and for a file with ".ejs" at the end
app.set("view engine", "ejs");
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

//LOGIN PAGE
app.get("/loginPage",function(req,res){
    if(signedInUser.loggedIn) {
        res.redirect('/');
    } else {
        res.render("LoginPage");
    }
});
//

//Beginning of Shopping Cart
app.get("/results/shoppingcart", function(req,res){
  console.log(ShoppingCart);
  var q  = "SELECT * FROM section JOIN shoppingcart WHERE userID = " + signedInUser.userID ;
  connection.query(q,function(err,results){
      var ShoppingCart = [];
      res.render("shoppingcart",{ShoppingCart:ShoppingCart});
  });
});

app.post("/addCourse",function(req,res){
  var CourseAdd = req.body.addClass;
  console.log(CourseAdd);
  var addCourse = {
      user_id: signedInUser.userID,
      section_id: CourseAdd
  }
  // var q = "INSERT INTO shoppingcart(user_id,section_id) VALUES (" + signedInUser.userID+ " , " + CourseAdd + ")";
  connection.query("INSERT INTO shoppingcart SET ?", addCourse, function(err,results){
    if (err) throw err;
    console.log(results[0]);
  });
  res.redirect("/");
});
//End of Shopping cart

// check the login credentials
app.post('/logincheck', function(req, res) {
    var username = req.body.uname;
    var password = req.body.psw;
    console.log(username);
    console.log(password);
    var q = "SELECT * FROM users WHERE username='" + username + "' && password='" + password + "'";
    connection.query(q, function(err, results) {
        if(err) throw err;
        // console.log(results);
        if(results[0]) {
            console.log("The email and password are correct!");
            signedInUser.userID = results[0].users_id;
            signedInUser.userName = results[0].username;
            signedInUser.loggedIn = true;
            console.log(signedInUser);
            res.redirect('/');
        } else {
            console.log("The email or password is incorrect. Try again.");
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
            q = "SELECT section.section_id AS 'Section', CONCAT('CSc', courses.course_num) AS COURSE, courses.courseName AS 'CourseName', CONCAT_WS(' ', prof_fname, prof_lname) AS Professor, ta, CONCAT(building, ' ', room, ' ' , times) AS Location_and_Time FROM section JOIN courses ON section.course_num = courses.course_num JOIN professors ON professors.professors_id = section.professors_id";
        } else {
            q= "SELECT section.section_id AS 'Section', CONCAT('CSc', courses.course_num) AS COURSE, courses.courseName AS 'CourseName', CONCAT_WS(' ', prof_fname, prof_lname) AS Professor, ta, CONCAT(building, ' ', room, ' ' , times) AS Location_and_Time FROM section JOIN courses ON section.course_num = courses.course_num JOIN professors ON professors.professors_id = section.professors_id WHERE courses.course_num = " + userResult;
        }

        if (checkInp(userResult)) {
            connection.query(q, function(err, results) {
                if(err) throw err;
                var results_json = [];
                results.forEach(function(result) {
                    results_json.push({
                        sec: result.Section,
                        num: result.COURSE,
                        name: result.CourseName,
                        prof: result.Professor,
                        ta: result.ta,
                        timeLoc: result.Location_and_Times
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
    var r = "SELECT CONCAT_WS(' ', 'CSc', courses.course_num) AS 'CourseNumber', courseName AS 'CourseName', section.section_id AS 'Section', description AS 'CourseDescription', prereqs AS 'Prereqs', credits AS 'Credits', seats,CONCAT_WS(' ', prof_fname, prof_lname) AS 'Professor', ta AS 'TAs', CONCAT_WS(' ', building, room, times) AS 'Location_and_Time', times AS 'Dates', prof_rating AS 'ProfessorRating', difficulty AS 'ProfessorDifficulty', would_take_again AS 'Would_Take_Again', chilly_pepper AS 'ProfessorPopularity', reviews.review AS 'Reviews' FROM section JOIN courses ON section.course_num = courses.course_num JOIN professors ON section.professors_id = professors.professors_id JOIN reviews ON reviews.professors_id = professors.professors_id WHERE section.section_id = " + classResult;
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
            if(results[i].TA === "None") {
                TAs_json.push({tAssistant: results[i].TA});
                break;
            } else {
                TAs_json.push({tAssistant: results[i].TA});
            }
        }
        results_json.push({
            sec: results[0].Section,
            name: results[0].CourseName,
            prof: results[0].Professor,
            rating: results[0].ProfessorRating,
            diff: results[0].ProfessorDifficulty,
            wta: results[0].Would_Take_Again,
            prereq: results[0].Prereqs,
            credits: results[0].Credits,
            seat: results[0].seats,
            chilly: results[0].ProfessorPopularity,
            timeLoc: results[0].Location_and_Time,
            reviews: results[0].Reviews,
            ta: results[0].TAs
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
