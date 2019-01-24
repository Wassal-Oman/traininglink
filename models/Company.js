// import needed libraries
const Sequelize = require('sequelize');
const settings = require('../config/settings');

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
const Company = sequelize.define('companies', {
    company_id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    name: {
        type: Sequelize.STRING,
        unique: true,
        allowNull: false
    },
    company_description: {
        type: Sequelize.TEXT,
        unique: false,
        allowNull: true
    },
    company_address: {
        type: Sequelize.STRING,
        unique: false,
        allowNull: true
    },
    arabic_company_name: {
        type: Sequelize.STRING,
        unique: true,
        allowNull: false
    },
    arabic_company_description: {
        type: Sequelize.TEXT,
        unique: false,
        allowNull: true
    },
    arabic_company_address: {
        type: Sequelize.STRING,
        unique: false,
        allowNull: true
    },
    company_picture: {
        type: Sequelize.STRING,
        unique: false,
        allowNull: true
    },
    company_phone: {
        type: Sequelize.STRING,
        unique: true,
        allowNull: false,
        validate: {
            max: 13,
            min: 13
        }
    },
    company_location_latitude: {
        type: Sequelize.DOUBLE,
        allowNull: false,
        defaultValue: 0.0
    },
    company_location_longitude: {
        type: Sequelize.DOUBLE,
        allowNull: false,
        defaultValue: 0.0
    }
});

// create table
sequelize.sync().then(() => {
    console.log('Companies Table Created!');
}).catch((err) => {
    console.log(err);
});

// export module
module.exports = Company;