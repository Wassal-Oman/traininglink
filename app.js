// import needed libraries
const express = require('express');
const bodyParser = require('body-parser');
const ar = require('./routes/arabic');
const en = require('./routes/english');

const app = express();
const port = process.env.PORT || 3000;

// add middlewares
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: false}));
app.use(express.static('public'));

// set view engine
app.set('view engine', 'ejs');

// routes
app.use('/en', en);
app.use('/ar', ar);

app.use('/', (req, res) => {
    res.redirect('/en');
});

// start server
app.listen(port, () => console.log(`Listening on port ${port}`));