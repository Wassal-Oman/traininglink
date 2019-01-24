const express = require('express');
const router = express.Router();

// default route
router.get('/', (req, res) => {
    res.redirect('ar/login');
});

// login route - GET
router.get('/login', (req, res) => {
    res.render('arabic/login');
});

// forget password route - GET
router.get('/forget-password', (req, res) => {
    res.render('arabic/forget-password');
});

// terms and conditions - GET
router.get('/terms-and-conditions', (req, res) => {
    res.render('arabic/terms');
});

// export router
module.exports = router;