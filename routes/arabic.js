const express = require('express');
const routes = express.Router();

routes.get('/', (req, res) => {
    res.render('pages/index-ar');
});

routes.get('/terms-and-conditions', (req, res) => {
    res.render('pages/ar-terms');
});

module.exports = routes;