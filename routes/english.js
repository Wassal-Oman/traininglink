const express = require('express');
const routes = express.Router();

routes.get('/', (req, res) => {
    res.render('pages/index');
});

routes.get('/terms-and-conditions', (req, res) => {
    res.render('pages/en-terms');
});

module.exports = routes;