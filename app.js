// import needed libraries
const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const session = require('express-session');
const flash = require('connect-flash');

// routes
const ar = require('./routes/arabic');
const en = require('./routes/english');

// initialize app and set port
const app = express();
const port = process.env.PORT || 3000;

// add middlewares
app.use(cors());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(flash());
app.use(express.static('public'));
app.use(session({
    key: 'user',
    secret: 'traininglink',
    resave: false,
    saveUninitialized: true
}));

// set the view engine and views folder
app.set('view engine', 'ejs');
app.set('views', 'views');

// notification messages
app.use((req, res, next) => {
    res.locals.success = req.flash('success');
    res.locals.error = req.flash('error');
    res.locals.warning = req.flash('warning');
    next();
});

// routes
app.use('/en', en);
app.use('/ar', ar);

// redirect to login page
app.get('/', (req, res) => {
    res.redirect('/en');
});

// if route does not exist
app.use((req, res, next) => {
    res.status(404).render('404');
});

// start server
app.listen(port, () => console.log(`Listening on port ${port}`));