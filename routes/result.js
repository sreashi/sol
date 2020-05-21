const express = require('express');
const bodyParser = require('body-parser');
const qs = require('querystring');
const router = express.Router();
const mysql = require('mysql2');
const dbConnection = mysql.createPool({
    host     : 'localhost', // MYSQL HOST NAME
    user     : 'root',        // MYSQL USERNAME
    password : '',    // MYSQL PASSWORD
    database : 'nodejs_login'      // MYSQL DB NAME
});


router.get('/result', function(req,res) {
   
    abcdef= req.query;
    var sqlstr="SELECT * FROM `subject` WHERE `subject_name`=";
    var sqlstr2=JSON.stringify(abcdef);
    var b = sqlstr2.replace(/[^a-zA-Z]/g,' ');
    var c = "\""+b.trim()+"\"";
    var d =( sqlstr+c);
    console.log(abcdef);
    dbConnection.execute(d,function(err, rows,fields){
                //.then(([rows]) => {
                var value =[];
                rows.forEach(function(row){
                  value.push({ teacher_name : row.teacher_name , period : row.period , date : row.date, pdf : row.pdf});
                });
                   res.render('result', {
                         value : value,
                          //}//,function(err, result){
                           // res.status(200).send(result)
                          });
                   
                        // peeriod: rows[0].period, 
                            //teacher_name: rows[0].teacher_name,
                            //Date:rows[0].date
                //});
         console.log(value);       
        console.log(rows);
        //console.log(rows[0].period);
        //console.log ('teacher name is',rows[0].teacher_name);
        //console.log(rows[0].date); 
        if (err) {
          console.log(err);
        } else if (rows.length) { 
          console.log('The result is  ', rows[0].teacher_name,rows[0].period,rows[0].date);
        
        }
         else {
          console.log('Error');
        }
    });

});


module.exports = router;