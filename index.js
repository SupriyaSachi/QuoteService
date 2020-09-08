var express = require('express');
var bodyParser = require('body-parser');
var router = express.Router();
var jsonParser = bodyParser.json();
var urlencodedParser = bodyParser.urlencoded({ extended: false });

const { Client, Query } = require('pg');
const url = require('url');
var config = require('./../config');

//var username = "postgres" // sandbox username
//var password = "postgres" // read only privileges on our table
//var host = "localhost:5432"
//var database = "TickerQuote" // database name
//var conString = "postgres://"+username+":"+password+"@"+host+"/"+database; // Your Database Connection
var timemin = 10;
var recnum = 5;

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

router.get('/create-quote', function(req, res, next) {
  res.render('createquote', { title: 'Express' });
});


router.get('/view-quote', function(req, res) {
  res.render('viewquote', {
    title: "Express API",
  });
});

router.get('/list-quote', function(req, res) {
  
  var selquery = "SELECT * FROM quote WHERE \"timestamp\" >= NOW() - INTERVAL \'"+timemin+"\' MINUTE LIMIT "+recnum;
   var client = new Client(config.postgresurl);
   client.connect(); 
   client.query(selquery, function(err, result, fields) {
     if (err) throw err;
     console.log("result = "+result.rowCount);
     if (result.rowCount > 0)
     {
      var data = "";
       var tmpval = "";
       var timestamploc="";
       for (var i = 0; i < result.rowCount; i++)
       {
        timestamploc = result.rows[i].timestamp.toISOString(); 
        
         tmpval = timestamploc+";"+result.rows[i].symbol+";"+result.rows[i].sharestraded+";"+result.rows[i].pricetraded+";"+result.rows[i].changedirection+";"+result.rows[i].changeamount;
         if (i == 0)
         {
           data = tmpval;
         }
         else
         {
           data = data +"|"+tmpval;
         }
        
       }

       res.render('listquote', {
         title: "Express API",
         jsonData: data,
         jsonrecnum: recnum,
         jsontimein: timemin 
     });
     }
     else
     {

       res.render('errorquote', {
         title: "Express API"
     });
     }
 
     });
});

router.post('/list-quote', function(req, res) {

  recnum = req.body.value1; 
  timemin = req.body.value2;
  res.send("success"); 
});



router.post('/submit-create-quote', function(req, res, next) {
  var timestamp = req.body.value1; 
  var symbol = req.body.value2;
  var sharestraded = req.body.value3;
  var pricetraded = req.body.value4;
  var changedirection = req.body.value5;
  var changeamount = req.body.value6;

  var insertsql = "INSERT INTO public.quote(timestamp, symbol, sharestraded, pricetraded, changedirection, changeamount) VALUES ("+"'"+timestamp+"'"+", "+"'"+symbol+"'"+", "+"'"+sharestraded+"'"+", "+pricetraded+", "+"'"+changedirection+"'"+", "+"'"+changeamount+"'"+")";
	console.log(insertsql);
	var client = new Client(config.postgresurl); // Setup our Postgres Client
  client.connect();
	client.query(insertsql, function (err, result) {  
	if (err) throw err;  
	console.log("1 record inserted"); 
	res.send("success"); 
});
});

module.exports = router;
