// import needed library
const express = require('express');
const emailValidator = require('email-validator');
const settings = require('../config/settings');
const mail = require('../config/sendmail');
const encrypt = require('../config/encryption');
const User = require('../models/User');
const Institute = require('../models/Institute');
const Student = require('../models/Student');
const Company = require('../models/Company');
const Quotation = require('../models/Quotation');
const router = express.Router();

// get host
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

// home route
router.get('/home', sessionChecker, (req, res) => {

    // active pages
    const pages = {
        home: 'active',
        profile: '',
        users: '',
        institutes: '',
        companies: '',
        students: '',
        quotations: ''
    };

    // promises
    const instPromise = getInstitutesCount();
    const compPromise = getCompaniesCount();
    const studPromise = getStudentsCount();
    const quotPromise = getQuotationsCount();

    // execute all promises
    Promise.all([instPromise, compPromise, studPromise, quotPromise]).then(val => {
         // render home page
        res.render('english/home', {
            user: req.session.user,
            pages,
            instCount: val[0],
            compCount: val[1],
            studCount: val[2],
            quotCount: val[3]
        });
    }).catch(err => {
        console.log(err);
        res.redirect('/en/500');
    });
});

// user profile - GET
router.get('/profile', sessionChecker, (req, res) => {
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

    // active pages
    const pages = {
        home: '',
        profile: 'active',
        users: '',
        institutes: '',
        companies: '',
        students: '',
        quotations: ''
    };

    // render profile page
    res.render('english/profile', {
        user: req.session.user,
        type: role,
        pages
    });
});

// user profile - POST
router.post('/profile', sessionChecker, (req, res) => {
    // get user input
    const id = req.session.user.id;
    const { name, email, phone } = req.body;
    let errors = [];

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

    // active pages
    const pages = {
        home: '',
        profile: 'active',
        users: '',
        institutes: '',
        companies: '',
        students: '',
        quotations: ''
    };

    // validation
    if (!name || !email || !phone) {
        errors.push({ msg: 'Please enter all fields' });
    } else if(!emailValidator.validate(email)) {
        errors.push({ msg: 'Email is invalid' });
    }

    // check if errors exist
    if (errors.length > 0) {
        res.render('english/profile', {
            errors,
            user: req.session.user,
            role,
            pages
        });
    } else {
        // update profile
    }
});

// change password - POST
router.post('/change-password', sessionChecker, (req, res) => {

        // get old and new password
        const id = req.session.user.id;
        const { oldPassword, newPassword, confirmPassword } = req.body;

        let errors = [];

        // active pages
        const pages = {
            home: '',
            profile: 'active',
            users: '',
            institutes: '',
            companies: '',
            students: '',
            quotations: ''
        };

        // validation
        if (!oldPassword || !newPassword || !confirmPassword) {
            errors.push({ msg: 'Please enter all fields' });
        } else if (oldPassword.length < 6 || newPassword.length < 6 || confirmPassword.length < 6 ) {
            errors.push({ msg: 'Password must be at least 6 characters' });
        } else if(newPassword !== confirmPassword) {
            errors.push({ msg: 'Passwords do not match' });
        }

        // check if errors exist
        if(errors.length > 0) {
            res.render('english/profile', {
                user: req.session.user,
                pages,
                errors
            });
        } else {
            // change password
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

// users router - GET
router.get('/users', sessionChecker, (req, res) => {
    // active pages
    const pages = {
        home: '',
        profile: '',
        users: 'active',
        institutes: '',
        companies: '',
        students: '',
        quotations: ''
    };

    // load data
    getUsers().then(val => {
        // render institutes view
        res.render('english/users', {
            user: req.session.user,
            pages,
            data: val
        });
    }).catch(err => {
        console.log(err);
        res.redirect('/en/500');
    });
});

// inistitute route - GET
router.get('/institutes', sessionChecker, (req, res) => {

    // active pages
    const pages = {
        home: '',
        profile: '',
        users: '',
        institutes: 'active',
        companies: '',
        students: '',
        quotations: ''
    };

    // load data
    getInstitutes().then(val => {
        // render institutes view
        res.render('english/institutes', {
            user: req.session.user,
            pages,
            data: val
        });
    }).catch(err => {
        console.log(err);
        res.redirect('/en/500');
    });
});

// companies route - GET
router.get('/companies', sessionChecker, (req, res) => {

    // active pages
    const pages = {
        home: '',
        profile: '',
        users: '',
        institutes: '',
        companies: 'active',
        students: '',
        quotations: ''
    };

    // load data
    getCompanies().then(val => {
        // render institutes view
        res.render('english/companies', {
            user: req.session.user,
            pages,
            data: val
        });
    }).catch(err => {
        console.log(err);
        res.redirect('/en/500');
    });
});

// students route - GET
router.get('/students', sessionChecker, (req, res) => {
    // active pages
    const pages = {
        home: '',
        profile: '',
        users: '',
        institutes: '',
        companies: '',
        students: 'active',
        quotations: ''
    };

    // load data
    getStudents().then(val => {
        // render institutes view
        res.render('english/students', {
            user: req.session.user,
            pages,
            data: val
        });
    }).catch(err => {
        console.log(err);
        res.redirect('/en/500');
    });
});

// quotations route - GET
router.get('/quotations', sessionChecker, (req, res) => {

    // active pages
    const pages = {
        home: '',
        profile: '',
        users: '',
        institutes: '',
        companies: '',
        students: '',
        quotations: 'active'
    };

    // load data
    getQuotations().then(val => {
        // render institutes view
        res.render('english/quotations', {
            user: req.session.user,
            pages,
            host,
            data: val
        });
    }).catch(err => {
        console.log(err);
        res.redirect('/en/500');
    });
});

// institute route - GET
router.get('/institute', sessionChecker, (req, res) => {
    res.send('Hello Institute User');
});

// company route - GET
router.get('/company', sessionChecker, (req, res) => {
    res.send('Hello Company User');
});

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

// function to get dashboard users
function getUsers() {
    return new Promise((resolve, reject) => {
        User.findAll().then(val => {
            return resolve(val);
        }).catch(err => {
            console.log(err);
            return reject(null);
        });
    });
}

// function to get students
function getStudents() {
    return new Promise((resolve, reject) => {
        Student.findAll().then(val => {
            return resolve(val);
        }).catch(err => {
            console.log(err);
            return reject(null);
        });
    });
}

// function to get institutes
function getInstitutes() {
    return new Promise((resolve, reject) => {
        Institute.findAll().then(val => {
            return resolve(val);
        }).catch(err => {
            console.log(err);
            return reject(null);
        });
    });
}

// function to get companies
function getCompanies() {
    return new Promise((resolve, reject) => {
        Company.findAll().then(val => {
            return resolve(val);
        }).catch(err => {
            console.log(err);
            return reject(null);
        });
    });
}

// function to get quotations
function getQuotations() {
    return new Promise((resolve, reject) => {
        Quotation.findAll().then(val => {
            return resolve(val);
        }).catch(err => {
            console.log(err);
            return reject(null);
        });
    });
}

// function to get count of dashboard users
function getUsersCount(type) {
    return new Promise((resolve, reject) => {
        User.findAndCountAll().then(val => {
            return resolve(val.count);
        }).catch(err => {
            return reject(err);
        });
    });
}

// function to get count of students
function getStudentsCount() {
    return new Promise((resolve, reject) => {
        Student.findAndCountAll().then(val => {
            return resolve(val.count);
        }).catch(err => {
            return reject(err);
        });
    });
}

// function to get count of institutes
function getInstitutesCount() {
    return new Promise((resolve, reject) => {
        Institute.findAndCountAll().then(val => {
            return resolve(val.count);
        }).catch(err => {
            return reject(err);
        });
    });
}

// function to get count of companies
function getCompaniesCount() {
    return new Promise((resolve, reject) => {
        Company.findAndCountAll().then(val => {
            return resolve(val.count);
        }).catch(err => {
            return reject(err);
        });
    });
}

// function to get count of students
function getQuotationsCount() {
    return new Promise((resolve, reject) => {
        Quotation.findAndCountAll().then(val => {
            return resolve(val.count);
        }).catch(err => {
            return reject(err);
        });
    });
}

// export router
module.exports = router;