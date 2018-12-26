const express = require('express');
const router = express.Router();
const mysql = require('mysql2');
const settings = require('../settings');

// import database settings
const connection = settings.DB_CONNECTION;

// create database connection
const connect = mysql.createConnection({
    host: connection.HOST,
    user: connection.USERNAME,
    password: connection.PASSWORD,
    database: connection.DATABASE
});

// middleware function to check for logged-in users
const sessionChecker = (req, res, next) => {
    if (!req.session.user) {
        res.redirect('/en/login');
    } else {
        next();
    }    
};

// default route
router.get('/', sessionChecker, (req, res) => {
    res.redirect('/en/home');
});

// login routes
router.route('/login')
    .get((req, res) => {

        // check if user logged in
        if(req.session.user) {
            res.redirect('/en/home');
        }

        // load login page
        res.render('login-en');

    }).post((req, res) => {

        // read data from request
        let email = req.body.email;
        let password = req.body.password;
        let type = req.body.type;

        // prepare sql
        const sql = 'SELECT * FROM `dashboard_users` WHERE `email` = ? AND `password` = ? AND `type` = ? LIMIT 1';

        // check from database
        connect.execute(sql, [email, password, type], (err, results, fields) => {
            if(err){
                console.log(err);
                res.render('500');
            }
            else {
                // get signed user
                let user = JSON.parse(JSON.stringify(results))[0];
                
                // check for user
                if(user) {
                    // store user credentials
                    req.session.user = user;
                    res.redirect('/en/home');
                } else {
                    res.redirect('/en/login');
                }
            }
        });
    });

// home route
router.get('/home', sessionChecker, (req, res) => {

    // calculate statistics

    // view english home page
    res.render('home-en', {
        user: req.session.user
    });
});

// user profile route
router.get('/profile', sessionChecker, (req, res) => {
    res.render('profile', {
        user: req.session.user
    });
});

// change password routes
router.route('/change-password')
    .get(sessionChecker, (req, res) => {
        res.render('change-password-en');
    }).post(sessionChecker, (req, res) => {

        // get old and new password
        let userId = req.session.user.id;
        let oldPassword = req.body.oldPassword;
        let newPassword = req.body.newPassword;
        let confirmPassword = req.body.confirmPassword;

        if(!userId) { // user is not logged in, redirect to login
            res.redirect('/en/login');
        } else {  // change password based on id and old password
            // check if passwords are match
            if(newPassword == confirmPassword) {
                const sql = 'UPDATE `dashboard_users` SET password = ? WHERE id = ? AND password = ?';

                // execute query
                connect.execute(sql, [newPassword, userId, oldPassword], (err, results, fields) => {
                    if(!err) {
                        res.send({
                            err
                        });
                    } else {
                        // get signed user
                        res.send({
                            results
                        });
                    }
                });
            } else {
                res.redirect('/en/change-password');
            }
        }
    });

// forget password route
router.route('/forget-password')
    .get((req, res) => {

    }).post((req, res) => {

    });

// terms and condition route
router.get('/terms-and-conditions', (req, res) => {
    res.render('terms-en');
});

// logout route
router.get('/logout', (req, res) => {
    // destroy session
    req.session.destroy();
    res.redirect('/en/login');
});

module.exports = router;