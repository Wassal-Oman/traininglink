// import needed library
const express = require('express');
const emailValidator = require('email-validator');
const jwt = require('jsonwebtoken');
const settings = require('../config/settings');
const mail = require('../config/sendmail');
const encrypt = require('../config/encryption');
const User = require('../models/User');
const AdminController = require('../controllers/AdminController');
const InstituteController = require('../controllers/InstituteController');
const CompanyController = require('../controllers/CompanyController');
const router = express.Router();

// secret key
const jwtSecretKey = settings.SECRET_KEY;

// host
const host = settings.HOST_URL;

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
router.get('/', (req, res) => {
    res.redirect('/en/login');
});

// login - GET
router.get('/login', (req, res) => {

    if(req.session.user) {
        // check user type
        switch(req.session.user.dashboardUserTypeId) {
            case 1:
                res.redirect('/en/admin/home');
                break;
            case 2:
                res.redirect('/en/institute/home');
                break;
            case 3:
                res.redirect('/en/company/home');
                break;
            default:
                res.redirect('/en/logout');
        }
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
                        // check if email is verified
                        if(user.dataValues.isEmailVerified) {
                            // store user data
                            req.session.user = user.dataValues;

                            // check user type
                            switch(user.dataValues.dashboardUserTypeId) {
                                case 1:
                                    res.redirect('/en/admin/home');
                                    break;
                                case 2:
                                    res.redirect('/en/institute/home');
                                    break;
                                case 3:
                                    res.redirect('/en/company/home');
                                    break;
                                default:
                                    res.redirect('/en/logout');
                            }
                        } else {
                            // reload page
                            req.flash('warning', 'Email is not verified');
                            res.redirect(req.get('referer'));
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
        // check if user exists
        User.findOne({ where: { email } }).then(user => {
            if(!user) {
                req.flash('error', 'User does not exist');
                res.redirect('/en/forget-password');
            } else {
                // get payload
                const { id, name, email } = user;
                const payload = { id, name, email };

                // sign a new token
                jwt.sign({ payload }, jwtSecretKey, { expiresIn: '1h'}, (err, token) => {
                    if(err) {
                        req.flash('error', 'Cannot generate token');
                        res.redirect('/en/forget-password');
                    } else {
                        // send email
                        mail(email, 'Reset Password', `<p>Follow this link to reset your password.</p><br><a href='${host}/en/reset-password/${id}/${token}'>Press Here</a>`).then(val => {
                            console.log(val);
                            req.flash('success', 'Email has sent to reset password');
                            res.redirect('/en/forget-password');
                        }).catch(err => {
                            console.log(err);
                            req.flash('error', 'Cannot send email for reset password');
                            res.redirect('/en/forget-password');
                        });
                    }
                });
            }
        }).catch(err => {

        });
    }
});

// reset password with id and token - GET
router.get('/reset-password/:id/:token', (req, res) => {
    // get id and token
    const id = req.params.id;
    const token = req.params.token;

    // verify token
    jwt.verify(token, jwtSecretKey, (err, val) => {
        if(err) {
            res.render('english/message', {
                title: 'ERROR',
                message: 'Link has expired .. Send Another one'
            });
        } else {
            console.log(val);
            res.render('english/reset-password', {
                id
            });
        }
    });
});

// reset password - POST
router.post('/reset-password', (req, res) => {

    // get user id
    const { id, newPassword, confirmPassword } = req.body;
    let errors = [];

    // validation
    if(!id) {
        errors.push({ msg: 'User is undefined' });
    } else if (!newPassword || !confirmPassword) {
        errors.push({ msg: 'Please enter all fields' });
    } else if (newPassword.length < 6) {
        errors.push({ msg: 'Password must be at least 6 characters' });
    } else if (newPassword !== confirmPassword) {
        errors.push({ msg: 'Passwords do not match' });
    }

    // check if errors exist
    if (errors.length > 0) {
        res.render('english/reset-password', {
            errors,
            id
        });
    } else {
        // hash password
        encrypt.hashData(newPassword).then(hash => {
            // reset password
            User.update({ password: hash }, { where: { id }}).then(val => {
                console.log(val);
                res.render('english/message', {
                    title: 'SUCCESS',
                    message: 'Password has been reset successfully'
                });
            }).catch(err => {
                console.log(err);
                res.render('english/message', {
                    title: 'ERROR',
                    message: 'Cannot reset password'
                });
            });
        }).catch(err => {
            res.render('english/message', {
                title: 'ERROR',
                message: 'Cannot hash password'
            });
        });
    }
});

// terms and condition route
router.get('/terms-and-conditions', (req, res) => {
    // render terms and conditions page
    res.render('english/terms');
});

/* ***** admin routes ***** */
router.get('/admin', sessionChecker, AdminController.home);
router.get('/admin/home', sessionChecker, AdminController.home);
router.get('/admin/profile', sessionChecker, AdminController.getProfile);
router.post('/admin/change-password', sessionChecker, AdminController.changePassword);
router.get('/admin/users', sessionChecker, AdminController.getUsers);
router.get('/admin/users/add-user', sessionChecker, AdminController.addAdminGet);
router.post('/admin/users/add-user', sessionChecker, AdminController.addAdminPost);
router.get('/admin/users/:id/delete', sessionChecker, AdminController.deleteUser);
router.get('/admin/users/:id/edit', sessionChecker, AdminController.editUserGet);
router.post('/admin/users/edit', sessionChecker, AdminController.editUserPost);
router.get('/admin/users/:email/:token', AdminController.verifyUserEmail);
router.get('/admin/institutes', sessionChecker, AdminController.getIntitutes);
router.get('/admin/institutes/add', sessionChecker, AdminController.addInstituteGet);
router.post('/admin/institutes/add', sessionChecker, AdminController.addInstitutePost);
router.get('/admin/institutes/:id/show', sessionChecker, AdminController.showInstituteDetails);
router.get('/admin/institutes/:id/add-user', sessionChecker, AdminController.addInstituteUserGet);
router.post('/admin/institutes/add-user', sessionChecker, AdminController.addInstituteUserPost);
router.get('/admin/institutes/:id/delete', sessionChecker, AdminController.deleteInstitute);
router.get('/admin/institutes/:id/edit', sessionChecker, AdminController.updateInstituteGet);
router.post('/admin/institutes/edit', sessionChecker, AdminController.updateInstitutePost);
router.get('/admin/companies', sessionChecker, AdminController.getCompanies);
router.get('/admin/companies/add', sessionChecker, AdminController.addCompanyGet);
router.post('/admin/companies/add', sessionChecker, AdminController.addCompnayPost);
router.get('/admin/companies/:id/add-user', sessionChecker, AdminController.addCompanyUserGet);
router.post('/admin/companies/add-user', sessionChecker, AdminController.addCompanyUserPost);
router.get('/admin/companies/:id/delete', sessionChecker, AdminController.deleteCompany);
router.get('/admin/companies/:id/edit', sessionChecker, AdminController.updateCompanyGet);
router.post('/admin/companies/edit', sessionChecker, AdminController.updateCompanyPost);
router.get('/admin/students', sessionChecker, AdminController.getStudents);
router.get('/admin/quotations', sessionChecker, AdminController.getQuotations);

/* ***** institute routes ***** */
router.get('/institute', sessionChecker, InstituteController.home);
router.get('/institute/home', sessionChecker, InstituteController.home);

/* ***** company routes ***** */
router.get('/company', sessionChecker, CompanyController.home);
router.get('/company/home', sessionChecker, CompanyController.home);

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