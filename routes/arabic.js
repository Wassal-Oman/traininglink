const express = require('express');
const router = express.Router();

router.get('/', (req, res) => {
    res.render('login-ar');
});

router.get('/terms-and-conditions', (req, res) => {
    res.render('terms-ar');
});

module.exports = router;