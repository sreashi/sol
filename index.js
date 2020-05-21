const express = require('express');
const bodyParser = require('body-parser');
const qs = require('querystring');
const path = require('path');
const fs = require('fs');
const cookieSession = require('cookie-session');
const bcrypt = require('bcrypt');
const dbConnection = require('./database');
const { body, validationResult } = require('express-validator');
const subjectRoutes = require('./routes/subject');
const resultRoutes = require('./routes/result');
const enquiryRoutes = require('./routes/enquiry');
const app = express();
app.use(express.urlencoded({extended:true}));
app.use(bodyParser.urlencoded({extended:true}));
app.use('/',resultRoutes);
app.use(bodyParser.json());
app.use('/subject',subjectRoutes);
app.use('/enquiry',enquiryRoutes);
app.use('/result',resultRoutes);
 

app.use(express.static(__dirname+'/public'));
// SET OUR VIEWS AND VIEW ENGINE
app.set('views', path.join(__dirname,'views'));
app.set('view engine','ejs');

// APPLY COOKIE SESSION MIDDLEWARE
app.use(cookieSession({
    name: 'session',
    keys: ['key1', 'key2'],
    maxAge:  3600 * 1000 // 1hr
}));

// DECLARING CUSTOM MIDDLEWARE
const ifNotLoggedin = (req, res, next) => {
    if(!req.session.isLoggedIn){
        return res.render('login-register');
    }
    next();
}

const ifLoggedin = (req,res,next) => {
    if(req.session.isLoggedIn){
        return res.redirect('/home');
    }
    next();
}
// END OF CUSTOM MIDDLEWARE


// ROOT PAGE
app.get('/', ifNotLoggedin, (req,res,next) => {
    dbConnection.execute("SELECT `name`,`class` FROM `users` WHERE `id`=?",[req.session.userID])
    .then(([rows]) => {
        res.render('home',{
            name:rows[0].name,
            claas:rows[0].class
       
        });

        console.log([rows]);
        console.log(rows[0].class);
        
    });
     
});// END OF ROOT PAGE


// REGISTER PAGE
app.post('/register', ifLoggedin, 
// post data validation(using express-validator)
[
    body('user_email','Invalid email address!').isEmail().custom((value) => {
        return dbConnection.execute('SELECT `email` FROM `users` WHERE `email`=?', [value])
        .then(([rows]) => {
            if(rows.length > 0){
                return Promise.reject('This E-mail already in use!');
            }
            return true;
        });
    }),
    body('user_name','Username is Empty!').trim().not().isEmpty(),
    body('user_pass','The password must be of minimum length 6 characters').trim().isLength({ min: 6 }),
    body('user_class','Enter Your Class').trim().not().isEmpty(),
],// end of post data validation
(req,res,next) => {

    const validation_result = validationResult(req);
    const {user_name, user_pass, user_email,user_class} = req.body;
    // IF validation_result HAS NO ERROR
    if(validation_result.isEmpty()){
        // password encryption (using bcrypt)
        bcrypt.hash(user_pass, 12).then((hash_pass) => {
            // INSERTING USER INTO DATABASE
            dbConnection.execute("INSERT INTO `users`(`name`,`email`,`class`,`password`) VALUES(?,?,?,?)",[user_name,user_email,user_class, hash_pass])
            .then(result => {
                res.send(`your account has been created successfully, Now you can <a  href="/">Login</a>`);
            }).catch(err => {
                // THROW INSERTING USER ERROR'S
                if (err) throw err;
            });
        })
        .catch(err => {
            // THROW HASING ERROR'S
            if (err) throw err;
        })
    }
    else{
        // COLLECT ALL THE VALIDATION ERRORS
        let allErrors = validation_result.errors.map((error) => {
            return error.msg;
        });
        // REDERING login-register PAGE WITH VALIDATION ERRORS
        res.render('login-register',{
            register_error:allErrors,
            old_data:req.body
        });
    }
});// END OF REGISTER PAGE

// LOGIN PAGE
app.post('/', ifLoggedin, [
    body('user_email').custom((value) => {
        return dbConnection.execute('SELECT `email` FROM `users` WHERE `email`=?', [value])
        .then(([rows]) => {
            if(rows.length == 1){
                return true;
                
            }
            return Promise.reject('Invalid Email Address!');
            
        });
    }),
    body('user_pass','Password is empty!').trim().not().isEmpty(),
], (req, res) => {
    const validation_result = validationResult(req);
    const {user_pass, user_email} = req.body;
    if(validation_result.isEmpty()){
        
        dbConnection.execute("SELECT * FROM `users` WHERE `email`=?",[user_email])
        .then(([rows]) => {
            // console.log(rows[0].password);
            bcrypt.compare(user_pass, rows[0].password).then(compare_result => {
                if(compare_result === true){
                    req.session.isLoggedIn = true;
                    req.session.userID = rows[0].id;

                    res.redirect('/');
                }
                else{
                    res.render('login-register',{
                        login_errors:['Invalid Password!']
                    });
                }
            })
            .catch(err => {
                if (err) throw err;
            });


        }).catch(err => {
            if (err) throw err;
        });
    }
    else{
        let allErrors = validation_result.errors.map((error) => {
            return error.msg;
        });
        // REDERING login-register PAGE WITH LOGIN VALIDATION ERRORS
        res.render('login-register',{
            login_errors:allErrors
        });
    }
});
// END OF LOGIN PAGE
app.get('/subject', (req,res) => {
    res.render("subject");
});
//

//Enquiry page
app.get('/enquiry', (req,res) => {
    res.render("enquiry");
});
app.post('/enquiry', [
    body('user_email','Invalid email address!').isEmail().custom((value) => {
        return dbConnection.execute('SELECT `email` FROM `enquiry` WHERE `email`=?', [value])
        .then(([rows]) => {
            if(rows.length > 0){
                return Promise.reject('This E-mail already in use!');
            }
            return true;
        });
    }),
    body('user_name','Username is Empty!').trim().not().isEmpty(),
    body('user_class','Enter Your Class').trim().not().isEmpty(),
    body('user_date','Date is Empty!').trim().not().isEmpty(),
    body('f_name','father name is Empty!').trim().not().isEmpty(),
    body('m_name','mother name is Empty!').trim().not().isEmpty(),
    body('user_radd','Address is Empty!').trim().not().isEmpty(),
    body('user_oadd','Address is Empty!').trim().not().isEmpty(),
    body('user_phr','The number must be of minimum length 10 characters').trim().isLength({ min: 10 }),
    body('user_pho','The number must be of minimum length 10 characters').trim().isLength({ min: 10}),
    body('user_lca','guardian address is Empty!').trim().not().isEmpty(),
    body('user_lcn','guardian name is Empty!').trim().not().isEmpty(),
    body('user_rel','relagion is Empty!').trim().not().isEmpty(),
    body('user_na','nationality is Empty!').trim().not().isEmpty(),
    body('f_occ','father occupation is Empty!').trim().not().isEmpty(),
    body('m_occ','mother occupation is Empty!').trim().not().isEmpty(),
],// end of post data validation
(req,res,next) => {

    const validation_result = validationResult(req);
    const {user_name, user_email, user_date, f_name , m_name, f_occ, m_occ, user_radd, user_oadd, user_phr, user_pho, user_lca, user_lcn,user_rel, user_na , user_class} = req.body;
    // IF validation_result HAS NO ERROR
    if(validation_result.isEmpty()){
    
            // INSERTING USER INTO DATABASE
            dbConnection.execute("INSERT INTO `enquiry`( `name`,`email`,`user_date`,`f_name`,`m_name`,`f_occ`,`m_occ`,`user_radd`,`user_oadd`, `user_phr`, `user_pho`, `user_lca`, `user_lcn`,`user_rel`,`user_na`,`class`) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",[user_name,user_email,user_date, f_name , m_name, f_occ, m_occ, user_radd, user_oadd, user_phr, user_pho, user_lca,user_lcn,user_na,user_rel, user_class])
            .then(result => {
                res.send(`sucess`);
            }).catch(err => {
                // THROW INSERTING USER ERROR'S
                if (err) throw err;
            });
    
       
    }
    else{
        // COLLECT ALL THE VALIDATION ERRORS
        let allErrors = validation_result.errors.map((error) => {
            return error.msg;
        });
        // REDERING login-register PAGE WITH VALIDATION ERRORS
        res.render('enquiry',{
            enquiry_error:allErrors,
            old_data:req.body
        });
    }
});

/*app.get('/result', (req,res,next)  => {

    abcdef= req.query;
    var sqlstr="SELECT * FROM `subject` WHERE `subject_name`=";
    var sqlstr2=JSON.stringify(abcdef);
    var b = sqlstr2.replace(/[^a-zA-Z]/g,' ');
    var c= "\""+b.trim()+"\"";
    var d=(sqlstr+c);
    console.log(abcdef);
    dbConnection.execute(d.trim())
    .then(([rows]) => {
         res.render('result',{sonai : 'sonai'});
                               
                                //teachh:rows[0].teacher_name,
                                //date:rows[0].date
                            
                   
    
        
                    console.log([rows]);
                    console.log(rows[0].teacher_name);
                    console.log(rows[0].period);
                    //console.log(rows[0].date);
                    //console.log(rows[0].pdf);
    
             })
       .catch((err) => {
        if (err) throw err;
         res.send(error);
    });
    process.on('unhandledRejection', (reason, promise) => {
       console.log('Unhandled Rejection at:', reason.stack || reason)
        // Recommended: send the information to sentry.io
        // or whatever crash reporting service you use
    
    })
//}
//catch(e)  {
  //  if (e) throw e;
   // console.log(e);

//}
});*/

//app.post('/result',function(request,response){
  //  var templefile
//})
//app.get('/result', (req,res) => {
  //  res.render("result");
//});
// LOGOUT
app.get('/logout',(req,res)=>{
    //session destroy
    req.session = null;
    res.redirect('/');
});
// END OF LOGOUT

app.use('/', (req,res) => {
    res.status(404).send('<h1>404 Page Not Found!</h1>');
});

app.listen(3003, () => console.log("Server is Running..."));