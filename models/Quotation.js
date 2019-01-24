// import needed libraries
const Sequelize = require('sequelize');
const settings = require('../config/settings');
const Institute = require('./Institute');

// import database connection details
const conn = settings.DB_CONNECTION;

// create connection
const sequelize = new Sequelize(conn.DATABASE, conn.USERNAME, conn.PASSWORD, {
    host: conn.HOST,
    dialect: conn.DIALECT,
    pool: {
        max: 5,
        min: 0,
        acquire: 30000,
        idle: 10000
    },
    operatorsAliases: false
});

// check database connection
sequelize.authenticate().then(() => {
    console.log('Connection has been established successfully.');
}).catch(err => {
    console.error('Unable to connect to the database:', err);
});

// schema
const Quotation = sequelize.define('quotations', {
    id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    quotation: {
        type: Sequelize.STRING,
        allowNull: false
    }
});

// foreign key relationship
Quotation.belongsTo(Institute);

// create table
sequelize.sync().then(() => {
    console.log('Quotations Table Created!');
}).catch((err) => {
    console.log(err);
});

// export module
module.exports = Quotation;