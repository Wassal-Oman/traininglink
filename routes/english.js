// import needed library
const express = require('express');
const emailValidator = require('email-validator');
const settings = require('../config/settings');
const mail = require('../config/sendmail');
const encrypt = require('../config/encryption');
const User = require('../models/User');
const AdminController = require('../controllers/AdminController');
const InstituteController = require('../controllers/InstituteController');
const CompanyController = require('../controllers/CompanyController');
const router = express.Router();

// middleware function to check for logged-in users
const sessionChecker = (req, res, next) => {
    if (!req.session.user) {
        res.redirect('/en/login');
    } else {
        next();
    }    
};

/* **** Common Routes **** */

// default route
router.get('/', sessionChecker, (req, res) => {
    res.redirect('/en/home');
});

// login - GET
router.get('/login', (req, res) => {
    // check if user logged in
    if(req.session.user) {
        res.redirect('/en/home');
    }

    // load login page
    res.render('english/login');
});

// login - POST
router.post('/login', (req, res) => {
    // read data from request
    const { email, password } = req.body;
    let errors = [];

    // validation
    if (!email || !password) {
        errors.push({ msg: 'Please enter all fields' });
    } else if(!emailValidator.validate(email)) {
        errors.push({ msg: 'Email is invalid' });
    } else if (password.length < 6) {
        errors.push({ msg: 'Password must be at least 6 characters' });
    }

    // check if errors exist
    if (errors.length > 0) {
        res.render('english/login', {
            errors,
            email,
            password
        });
    } else {
        // get user
        User.findOne({ where: { email: email } }).then((user) => {
            if (!user) {
                // reload page
                req.flash('error', 'User does not exist');
                res.redirect(req.get('referer'));
            } else {
                // compare input password with db password
                encrypt.compareData(password, user.dataValues.password).then(val => {
                    if(!val) {
                        // reload page
                        req.flash('error', 'Password is incorrect');
                        res.redirect(req.get('referer'));
                    } else {
                        // redirect to home page
                        req.session.user = user.dataValues;

                        // // check user
                        switch(req.session.user.dashboardUserTypeId) {
                            case 1:
                                res.redirect('/en/home');
                                break;
                            case 2:
                                res.redirect('/en/institute');
                                break;
                            case 3:
                                res.redirect('/en/company');
                                break;
                            default:
                                res.redirect('/en/logout');
                        }
                    }
                }).catch(err => {
                    console.log(err);
                    req.flash('error', 'Cannot encript password');
                    res.redirect(req.get('referer'));
                });
            }
        }).catch(err => {
            console.log(err);
            res.redirect('/en/500');
        });
    }
});

// forget password - GET
router.get('/forget-password', (req, res) => {
    // render forget password page
    res.render('english/forget-password');
});

// forget password - POST
router.post('/forget-password', (req, res) => {
    // get user email
    const email = req.body.email;
    let errors = [];

    // validation
    if (!email) {
        errors.push({ msg: 'Please enter email' });
    } else if (!emailValidator.validate(email)) {
        errors.push({ msg: 'Email is invalid' });
    }

    // check if errors exist
    if(errors.length > 0) {
        res.render('english/forget-password', {
            errors
        });
    } else {
         // send email
    }
});

// terms and condition route
router.get('/terms-and-conditions', (req, res) => {
    // render terms and conditions page
    res.render('english/terms');
});


/* ***** admin routes ***** */
router.get('/home', sessionChecker, AdminController.home);
router.get('/profile', sessionChecker, AdminController.getProfile);
router.post('/profile', sessionChecker, AdminController.updateProfile);
router.post('/change-password', sessionChecker, AdminController.changePassword);
router.get('/users', sessionChecker, AdminController.getUsers);
router.get('/institutes', sessionChecker, AdminController.getIntitutes);
router.get('/companies', sessionChecker, AdminController.getCompanies);
router.get('/students', sessionChecker, AdminController.getStudents);
router.get('/quotations', sessionChecker, AdminController.getQuotations);

/* ***** institute routes ***** */
router.get('/institute', sessionChecker, InstituteController.home);

/* ***** company routes ***** */
router.get('/company', sessionChecker, CompanyController.home);

// logout route
router.get('/logout', (req, res) => {
    // destroy session
    req.session.destroy();
    res.redirect('/en/login');
});

// 500 route
router.get('/500', (req, res) => {
    // destroy session
    req.session.destroy();
    res.status(500).render('500');
});

// export router
module.exports = router;