const express = require('express');
const router = express.Router();
const mysql = require('mysql2');
const dbConnection = mysql.createPool({
    host     : 'localhost', // MYSQL HOST NAME
    user     : 'root',        // MYSQL USERNAME
    password : '',    // MYSQL PASSWORD
    database : 'nodejs_login'     , // MYSQL DB NAME
    debug: false
});
router.get('/enquiry', function(req,res,next) {
    if (dbConnection != null){
        res.send('coonneted');
    }else {
        res.render('enquiry');
    }
});
/*router.post('/enquiry', function (req,res,next) {
    console.log('copnnect');
});
// post data validation(using express-validator)
/*[
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
    body('user_phr','The password must be of minimum length 6 characters').trim().isLength({ min: 10 }),
    body('user_pho','The password must be of minimum length 6 characters').trim().isLength({ min: 10}),
    body('user_lca','guardian address is Empty!').trim().not().isEmpty(),
    body('user_lcn','guardian name is Empty!').trim().not().isEmpty(),
    body('user_rel','relagion is Empty!').trim().not().isEmpty(),
    body('user_na','nationality is Empty!').trim().not().isEmpty(),
    body('f_occ','father occupation is Empty!').trim().not().isEmpty(),
    body('m_occ','mother occupation is Empty!').trim().not().isEmpty(),
],// end of post data validation
(req,res,next) => {

    const validation_result = validationResult(req);
    const {user_name, user_email, user_date, f_name , m_name, f_occ, m_occ, user_radd, user_oadd, user_phr, user_pho, user_lca, user_lcn, user_na, user_class} = req.body;
    // IF validation_result HAS NO ERROR
    if(validation_result.isEmpty()){
    
            // INSERTING USER INTO DATABASE
            dbConnection.execute("INSERT INTO `enquiry`(`name`,`email`,`user_date`,`f_name`,``m_name`,`f_occ`, `m_occ`, `user_radd`, `user_oadd`, `user_phr`, `user_pho`, `user_lca`, `user_lcn`,`user_rel`,`user_na`,`class`) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",[user_name,user_email,user_date, f_name , m_name, f_occ, m_occ, user_radd, user_oadd, user_phr, user_pho, user_lca,user_lcn,user_na,user_rel, user_class])
            .then(result => {
                res.send(`your all information is save with us`);
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

*/

module.exports = router;