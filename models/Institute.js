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
const Institute = sequelize.define('institutes', {
    institute_id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    name: {
        type: Sequelize.STRING,
        unique: true,
        allowNull: false
    },
    institute_description: {
        type: Sequelize.TEXT,
        unique: false,
        allowNull: true
    },
    institute_address: {
        type: Sequelize.STRING,
        unique: false,
        allowNull: true
    },
    arabic_name: {
        type: Sequelize.STRING,
        unique: true,
        allowNull: false
    },
    arabic_institute_description: {
        type: Sequelize.TEXT,
        unique: false,
        allowNull: true
    },
    arabic_institute_address: {
        type: Sequelize.STRING,
        unique: false,
        allowNull: true
    },
    institute_picture: {
        type: Sequelize.STRING,
        unique: false,
        allowNull: true
    },
    institute_phone: {
        type: Sequelize.STRING,
        unique: true,
        allowNull: false,
        validate: {
            max: 13,
            min: 13
        }
    },
    institute_location_latitude: {
        type: Sequelize.DOUBLE,
        allowNull: false,
        defaultValue: 0.0
    },
    institute_location_longitude: {
        type: Sequelize.DOUBLE,
        allowNull: false,
        defaultValue: 0.0
    },
    is_first_class: {
        type: Sequelize.TINYINT,
        allowNull: false
    }
});

// create table
sequelize.sync().then(() => {
    console.log('Institutes Table Created!');
}).catch((err) => {
    console.log(err);
});

// export module
module.exports = Institute;