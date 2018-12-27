// import needed library
const express = require('express');
const mysql = require('mysql2');
const settings = require('../settings');
const mail = require('../sendmail');
const router = express.Router();

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
                    // reload page
                    res.redirect(req.get('referer'));
                }
            }
        });
    });

// home route
router.get('/home', sessionChecker, (req, res) => {

    // get number of institutes
    let instPromise = getUsersCount("`dashboard_users`", "'I'");

    // get number of companies
    let compPromise = getUsersCount("`dashboard_users`", "'C'");

    // get number of students
    let studPromise = getStudentCount();

    // get number of quotations
    let quotPromise = getQuotationCount();

    // view english home page
    Promise.all([instPromise, compPromise, studPromise, quotPromise]).then(val => {
        res.render('home-en', {
            user: req.session.user,
            instCount: val[0],
            compCount: val[1],
            studCount: val[2],
            quotCount: val[3]
        });
    }).catch(err => {
        res.render('home-en', {
            user: req.session.user,
            instCount: 0,
            compCount: 0,
            studCount: 0,
            quotCount: 0
        });
    });
});

// user profile route
router.route('/profile')
    .get(sessionChecker, (req, res) => {

        // specify role
        let role = '';
        switch(req.session.user.type) {
            case 'A':
                role = 'Administrator';
                break;
            case 'I':
                role = 'Institute';
                break;
            case 'C':
                role = 'Company';
                break;
        }

        // render profile page
        res.render('profile-en', {
            user: req.session.user,
            type: role
        });
    }).post(sessionChecker, (req, res) => {

        // get user input
        let id = req.session.user.id;
        let name = req.body.name;
        let email = req.body.email;
        let phone = req.body.phone;

        // sql query
        const sql = 'UPDATE `dashboard_users` SET name = ?, email = ?, phone = ? WHERE id = ?';

        // execute query
        connect.execute(sql, [name, email, phone, id], (err, results, fields) => {
            if(err) {
                // reload page
                res.redirect(req.get('referer'));
            } else {
                // get signed user
                res.redirect('/en/logout');
            }
        });
    });

// change password routes
router.route('/change-password')
    .get(sessionChecker, (req, res) => {
        res.render('change-password-en', {
            user: req.session.user
        });
    }).post(sessionChecker, (req, res) => {

        // get old and new password
        let userId = req.session.user.id;
        let oldPassword = req.body.oldPassword;
        let newPassword = req.body.newPassword;
        let confirmPassword = req.body.confirmPassword;

        // check passwords
        if(newPassword == confirmPassword) {
            // sql query
            const sql = 'UPDATE `dashboard_users` SET password = ? WHERE id = ? AND password = ?';

            // execute query
            connect.execute(sql, [newPassword, userId, oldPassword], (err, results, fields) => {
                if(err) {
                    // reload page
                    res.redirect(req.get('referer'));
                } else {
                    // get signed user
                    res.redirect('/en/logout');
                }
            });
        } else {
            // reload page
            res.redirect(req.get('referer'));
        }
    });

// forget password route
router.route('/forget-password')
    .get((req, res) => {
        res.render('forget-password-en');
    }).post((req, res) => {
        // get user email
        let email = req.body.email;

        // specify role
        let role = '';
        switch(req.body.type) {
            case 'A':
                role = 'Administrator';
                break;
            case 'I':
                role = 'Institute';
                break;
            case 'C':
                role = 'Company';
                break;
        }

        // send email
        mail('Forget Password', `I forgot my password, my email is ${email} and I'm a/an ${role}.`).then(val => {
            res.redirect('/en/login');
        }).catch(err => {
            console.log(err);
            res.redirect(req.get('referer'));
        });
    });

// terms and condition route
router.get('/terms-and-conditions', (req, res) => {
    res.render('terms-en', {
        user: req.session.user
    });
});

// institutes route
router.get('/institutes', sessionChecker, (req, res) => {
    res.render('institutes-en', {
        user: req.session.user
    });
});

// companies route
router.get('/companies', sessionChecker, (req, res) => {
    res.render('companies-en', {
        user: req.session.user
    });
});

// students route
router.get('/students', sessionChecker, (req, res) => {
    res.render('students-en', {
        user: req.session.user
    });
});

// quotations route
router.get('/quotations', sessionChecker, (req, res) => {
    res.render('quotations-en', {
        user: req.session.user
    });
});

// logout route
router.get('/logout', (req, res) => {
    // destroy session
    req.session.destroy();
    res.redirect('/en/login');
});

// function to get count of dashboard users
function getUsersCount(tableName, type) {
    return new Promise((resolve, reject) => {
        const sql = `SELECT COUNT(*) as count FROM ${tableName} WHERE type = ${type}`;
        connect.execute(sql, (err, results, fields) => {
            if(err) return reject(0);
            else return resolve(Number.parseInt(JSON.parse(JSON.stringify(results))[0].count));
        });
    });
}

// function to get count of students
function getStudentCount() {
    return new Promise((resolve, reject) => {
        const sql = 'SELECT COUNT(*) as count FROM `users`';
        connect.execute(sql, (err, results, fields) => {
            if(err) return reject(0);
            else return resolve(Number.parseInt(JSON.parse(JSON.stringify(results))[0].count));
        });
    });
}

// function to get count of students
function getQuotationCount() {
    return new Promise((resolve, reject) => {
        const sql = 'SELECT COUNT(*) as count FROM `quotations`';
        connect.execute(sql, (err, results, fields) => {
            if(err) return reject(0);
            else return resolve(Number.parseInt(JSON.parse(JSON.stringify(results))[0].count));
        });
    });
}

// export router
module.exports = router;