const express = require('express');
const router = express.Router();
const mysql = require('mysql2');
const settings = require('../settings');

// import database settings
const connection = settings.DB_CONNECTION;

// create database connection
const connect = mysql.createConnection({
    host: connection.HOST,
    user: connection.USERNAME,
    password: connection.PASSWORD,
    database: connection.DATABASE
});

router.get('/', (req, res) => {
    res.render('pages/login');
});

// login route
router.get('/login', (req, res) => {
    res.redirect('/');
}).post('/login', (req, res) => {
    // read data from request
    let email = req.body.email;
    let password = req.body.password;

    // prepare sql
    const sql = 'SELECT * FROM `dashboard_users` WHERE `email` = ? AND `password` = ? LIMIT 1';

    // check from database
    connect.execute(sql, [email, password], (err, results, fields) => {
        if(err) res.send(err);
        else {
            let data = JSON.parse(JSON.stringify(fields))[0];
            if(data.length == 0) {
                res.send({
                    meg: 'username or password is not correct'
                });
            }
        }
    });
});

router.get('/terms-and-conditions', (req, res) => {
    res.render('pages/en-terms');
});

module.exports = router;