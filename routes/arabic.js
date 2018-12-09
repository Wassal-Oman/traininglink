const express = require('express');
const router = express.Router();

router.get('/', (req, res) => {
    res.render('pages/login-ar');
});

router.get('/terms-and-conditions', (req, res) => {
    res.render('pages/terms-ar');
});

module.exports = router;