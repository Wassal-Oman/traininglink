// import needed libraries
const jwt = require('jsonwebtoken');
const emailValidator = require('email-validator');
const Sequelize = require('sequelize');
const User = require('../models/User');
const Institute = require('../models/Institute');
const Student = require('../models/Student');
const Company = require('../models/Company');
const Quotation = require('../models/Quotation');
const settings = require('../config/settings');
const encrypt = require('../config/encryption');
const mail = require('../config/sendmail');

// enable Sequelize Operations option
const Op = Sequelize.Op;

// get host
const host = settings.HOST_URL;

// secret key
const jwtSecretKey = settings.SECRET_KEY;

/* ***** controller functions ***** */

// home
module.exports.home = (req, res) => {

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
        res.render('english/admin/home', {
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
};

// get profile
module.exports.getProfile = (req, res) => {
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
    res.render('english/admin/profile', {
        user: req.session.user,
        pages
    });
};

// update profile
module.exports.updateProfile = (req, res) => {
    // get user input
    const { id, name, email, phone } = req.body;
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
    if (!name || !email || !phone) {
        errors.push({ msg: 'Please enter all fields' });
    } else if(!emailValidator.validate(email)) {
        errors.push({ msg: 'Email is invalid' });
    }

    // check if errors exist
    if (errors.length > 0) {
        res.render('english/admin/profile', {
            errors,
            user: req.session.user,
            pages
        });
    } else {
        // update profile
        User.update({ name, email, phone }, { where: { id }}).then(val => {

            // set session values
            req.session.user.id = id;
            req.session.user.name = name;
            req.session.user.email = email;
            req.session.user.phone = phone;

            // display success message
            console.log(val);
            req.flash('success', 'Profile updated successfully');
            res.redirect(req.get('referer'));
        }).catch(err => {
            // display error message
            console.log(err);
            req.flash('error', 'Cannot update profile');
            res.redirect(req.get('referer'));
        });
    }
};

// change password
module.exports.changePassword = (req, res) => {

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
        res.render('english/admin/profile', {
            user: req.session.user,
            pages,
            errors
        });
    } else {
        // get user data
        User.findOne({ where: { id }}).then(user => {
            if(!user) {
                console.log('User not found');
                res.redirect('/en/logout');
            } else {
                // check old password
                encrypt.compareData(oldPassword, user.dataValues.password).then(val => {
                    if(!val) {
                        // reload page
                        req.flash('error', 'Old password is incorrect');
                        res.redirect('/en/admin/profile');
                    } else {
                        // change password
                        encrypt.hashData(newPassword).then(hash => {
                            User.update({ password: hash }, { where: { id }}).then(val => {
                                console.log(val);
                                req.flash('success', 'Password has been changed successfully');
                                res.redirect('/en/admin/profile');
                            }).catch(err => {
                                console.log(err);
                                req.flash('error', 'Cannot change password');
                                res.redirect('/en/admin/profile');
                            });
                        }).catch(err => {
                            console.log(err);
                            req.flash('error', 'Cannot encrypt password');
                            res.redirect('/en/admin/profile');
                        });
                    }
                });
            }
        }).catch(err => {
            console.log(err);
            res.redirect('/en/logout');
        });
    }
};

// get dashboard users
module.exports.getUsers = (req, res) => {
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
        res.render('english/admin/users', {
            user: req.session.user,
            pages,
            data: val
        });
    }).catch(err => {
        console.log(err);
        res.redirect('/en/500');
    });
};

// add new admin - GET
module.exports.addAdminGet = (req, res) => {

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

    res.render('english/admin/addAdmin', {
        user: req.session.user,
        pages
    });
};

// add new admin - POST
module.exports.addAdminPost = (req, res) => {
    // get user input
    const { name, email, phone, password } = req.body;
    let errors = [];

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

    // validate input
    if (!name || !email || !phone || !password) {
        errors.push({ msg: 'Please enter all fields' });
    } else if(!emailValidator.validate(email)) {
        errors.push({ msg: 'Email is invalid' });
    } else if(password.length < 6) {
        errors.push({ msg: 'Password must be at least 6 characters' });
    }

    // check if errors exist
    if (errors.length > 0) {
        res.render('english/admin/addAdmin', {
            errors,
            user: req.session.user,
            pages
        });
    } else {

        // first check if user exists
        User.findOne({  where: { [Op.or]: [{ email }, { phone }] } }).then(user => {
                if(user) {
                    req.flash('error', 'User already exists');
                    res.redirect(req.get('referer'));
                } else {
                    // add new admin
                    User.create({
                        name,
                        email,
                        phone,
                        password,
                        dashboardUserTypeId: 1
                    }).then(val => {
                        console.log(val);

                        // create payload
                        const payload = { name, email, phone };

                        // sign a new token
                        jwt.sign({ payload }, jwtSecretKey, { expiresIn: '1h'}, (err, token) => {
                            if(err) {
                                console.log(err);
                                req.flash('error', 'Cannot generate token');
                                res.redirect(req.get('referer'));
                            } else {
                                // send a verification email
                                mail(email, 'Email Verification', `<p>Follow this link to verify your email address.</p><br><a href='${host}/en/admin/users/${email}/${token}'>Press Here</a>`).then(val => {
                                    console.log(val);
                                    req.flash('success', 'User has been created .. Verification email has been sent');
                                    res.redirect(req.get('referer'));
                                }).catch(err => {
                                    console.log(err);
                                    req.flash('error', 'Cannot send verification email');
                                    res.redirect(req.get('referer'));
                                });
                            }
                        });
                    }).catch(err => {
                        console.log(err);
                        req.flash('error', 'Cannot create user');
                        res.redirect(req.get('referer'));
                    });
                }
            }).catch(err => {
                console.log(err);
                res.redirect('en/500');
            });
    }
};

// edit admin - GET
module.exports.editUserGet = (req, res) => {

    // get admin id
    const id = req.params.id;

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

    // get user
    if(id != '') {
        User.findOne({ where: { id }}).then(user => {
            if(!user) {
                req.flash('error', 'Unknown user');
                res.redirect('/en/admin/users');
            } else {
                // get user details
                res.render('english/admin/editUser', {
                    user: req.session.user,
                    editUser: user.dataValues,
                    pages
                });
            }
        }).catch(err => {
            console.log(err);
            res.redirect('/en/500');
        });
    } else {
        req.flash('error', 'Unknown user id');
        res.redirect('/en/admin/users');
    }
};

// edit admin - POST
module.exports.editUserPost = (req, res) => {
    // get user inputs
    const { id, name, email, phone } = req.body;
    let errors = [];

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

    // validate input
    if (!id || !name || !email || !phone) {
        errors.push({ msg: 'Please enter all fields' });
    } else if(!emailValidator.validate(email)) {
        errors.push({ msg: 'Email is invalid' });
    } 

    // check if errors exist
    if (errors.length > 0) {
        res.render('english/admin/editUser', {
            errors,
            user: req.session.user,
            pages
        });
    } else {

        // update user data
        User.update({ name, phone }, { where: { id }}).then(val => {
            console.log(val);
            req.flash('success', 'User has been  updated successfully');
            res.redirect('/en/admin/users');
        }).catch(err => {
            console.log(err);
            res.redirect('/en/500');
        });
    }
};

// delete user - GET
module.exports.deleteUser = (req, res) => {
    // get user id
    id = req.params.id;

    // check if own id
    if(id != req.session.user.id) {

        // delete user account
        User.destroy({ where: { id }}).then(val => {
            if(val > 0) {
                req.flash('success', 'User has been deleted successfully');
                res.redirect('/en/admin/users');
            } else {
                req.flash('warning', 'User cannot be deleted');
                res.redirect('/en/admin/users');
            }
        }).catch(err => {
            console.log(err);
            res.redirect('/en/500');
        });
    } else {
        req.flash('warning', 'You cannot delete your own account');
        res.redirect('/en/admin/users');
    }
}

// verify user email
module.exports.verifyUserEmail = (req, res) => {

    // get email and token
    const email = req.params.email;
    const token = req.params.token;

    if(typeof email !== "undefined" && typeof token !== "undefined") {
        // verify email and token
        jwt.verify(token, jwtSecretKey, (err, val) => {
            if(err) {
                console.log(err);
                res.render('english/message', {
                    title: 'ERROR',
                    message: 'Cannot Verify Email .. Link might have expired'
                });
            } else {
                console.log(val);
                // update user data
                User.update({ isEmailVerified: 1 }, { where: { email }}).then(val => {
                    console.log(val);
                    res.render('english/message', {
                        title: 'SUCCESS',
                        message: 'Email has been verified'
                    });
                }).catch(err => {
                    console.log(err);
                    res.redirect('/en/500');
                });
            }
        });
    } else {
        res.redirect('/');
    }
};

// get institutes
module.exports.getIntitutes = (req, res) => {

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
        res.render('english/admin/institutes', {
            user: req.session.user,
            pages,
            data: val
        });
    }).catch(err => {
        console.log(err);
        res.redirect('/en/500');
    });
};

// add new institute - GET
module.exports.addInstituteGet = (req, res) => {
   
};

// add new istitute - POST
module.exports.addInstitutePost = (req, res) => {

};

// show institute details
module.exports.showInstituteDetails = (req, res) => {
    // get id
    const id = req.params.id;

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

    if(id) {
        Institute.findOne({ where: { institute_id: id }}).then(institute => {
            if(!institute) {
                req.flash('warning', 'No details available');
                res.redirect('/en/admin/institutes');
            } else {
                // get list of users 
                User.findAll({ where: { dashboardUserTypeId: 2,  instituteInstituteId: institute.dataValues.institute_id }}).then(users => {
                    res.render('english/admin/instituteDetails', {
                        user: req.session.user,
                        pages,
                        institute,
                        users
                    });
                }).catch(err => {
                    console.log(err);
                    res.redirect('/en/500');
                });
            }
        }).catch(err => {
            console.log(err);
            res.redirect('/en/500');
        });

    } else {
        req.flash('error', 'No details available');
        res.redirect('/en/admin/institutes');
    }
};

// add institute user - GET
module.exports.addInstituteUserGet = (req, res) => {
    // get institute id
    const institute_id = req.params.id;

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

    // display add user page
    res.render('english/admin/addInstituteUser.ejs', {
        user: req.session.user,
        institute_id,
        pages
    });
};

// add institute user - POST
module.exports.addInstituteUserPost = (req, res) => {
    // get user inputs
    const { institute_id, name, email, phone, password } = req.body;
    let errors = [];

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

    // validation
    if(!institute_id) {
        errors.push({ msg: 'Institute is unknown' });
    } else if(!name || !email || !phone || !password) {
        errors.push({ msg: 'Please enter all fields' });
    } else if(!emailValidator.validate(email)) {
        errors.push({ msg: 'Email is invalid' });
    }

    // check if errors exist
    if (errors.length > 0) {
        res.render('english/admin/addInstituteUser', {
            errors,
            user: req.session.user,
            pages,
            institute_id
        });
    } else {
        // first check if user exists
        User.findOne({  where: { [Op.or]: [{ email }, { phone }] } }).then(user => {
            if(user) {
                req.flash('error', 'User already exists');
                res.redirect(req.get('referer'));
            } else {
                // add new admin
                User.create({
                    name,
                    email,
                    phone,
                    password,
                    dashboardUserTypeId: 2,
                    instituteInstituteId: institute_id
                }).then(val => {
                    console.log(val);

                    // create payload
                    const payload = { name, email, phone };

                    // sign a new token
                    jwt.sign({ payload }, jwtSecretKey, { expiresIn: '1h'}, (err, token) => {
                        if(err) {
                            console.log(err);
                            req.flash('error', 'Cannot generate token');
                            res.redirect(req.get('referer'));
                        } else {
                            // send a verification email
                            mail(email, 'Email Verification', `<p>Follow this link to verify your email address.</p><br><a href='${host}/en/admin/users/${email}/${token}'>Press Here</a>`).then(val => {
                                console.log(val);
                                req.flash('success', 'User has been created .. Verification email has been sent');
                                res.redirect(req.get('referer'));
                            }).catch(err => {
                                console.log(err);
                                req.flash('error', 'Cannot send verification email');
                                res.redirect(req.get('referer'));
                            });
                        }
                    });
                }).catch(err => {
                    console.log(err);
                    req.flash('error', 'Cannot create user');
                    res.redirect(req.get('referer'));
                });
            }
        }).catch(err => {
            console.log(err);
            res.redirect('en/500');
        });
    }
};

// delete institute
module.exports.deleteInstitute = (req, res) => {

};

// update institute - GET
module.exports.updateInstituteGet = (req, res) => {

};

// update institute - POST
module.exports.updateInstitutePost = (req, res) => {

};

// get companies
module.exports.getCompanies = (req, res) => {

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
        res.render('english/admin/companies', {
            user: req.session.user,
            pages,
            data: val
        });
    }).catch(err => {
        console.log(err);
        res.redirect('/en/500');
    });
};

// add new company - GET
module.exports.addCompanyGet = (req, res) => {

};

// add new company - POST
module.exports.addCompnayPost = (req, res) => {

};

// add company user - GET
module.exports.addCompanyUserGet = (req, res) => {

};

// add company user - POST
module.exports.addCompanyUserPost = (req, res) => {

};

// delete company
module.exports.deleteCompany = (req, res) => {

};

// update company - GET
module.exports.updateCompanyGet = (req, res) => {

};

// update company - POST
module.exports.updateCompanyPost = (req, res) => {

};

// get students
module.exports.getStudents = (req, res) => {
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
        res.render('english/admin/students', {
            user: req.session.user,
            pages,
            data: val
        });
    }).catch(err => {
        console.log(err);
        res.redirect('/en/500');
    });
};

// get quotations
module.exports.getQuotations = (req, res) => {

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
        res.render('english/admin/quotations', {
            user: req.session.user,
            pages,
            host,
            data: val
        });
    }).catch(err => {
        console.log(err);
        res.redirect('/en/500');
    });
};

/* ***** common functions ***** */
// function to get dashboard users
function getUsers() {
    return new Promise((resolve, reject) => {
        User.findAll({ where: { }}).then(val => {
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