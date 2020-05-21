const express = require('express');
const router = express.Router();
const mysql = require('mysql2');
const dbConnection = mysql.createPool({
    host     : 'localhost', // MYSQL HOST NAME
    user     : 'root',        // MYSQL USERNAME
    password : '',    // MYSQL PASSWORD
    database : 'nodejs_login'      // MYSQL DB NAME
});


router.get('/',(req,res) => {

    var sql= 'SELECT * FROM subject where class = 4 ';
    dbConnection.execute
    (sql, function(err, rows,fields){
       
    res.render('subject',{title: 'Subject', 'subject': rows});
   
    });
});



module.exports = router;