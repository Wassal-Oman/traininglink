// import needed libraries
const User = require('../models/User');
const Institute = require('../models/Institute');
const Student = require('../models/Student');
const Company = require('../models/Company');
const Quotation = require('../models/Quotation');
const settings = require('../config/settings');

// get host
const host = settings.HOST_URL;

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
    const id = req.session.user.id;
    const { name, email, phone } = req.body;
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
        // change password
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