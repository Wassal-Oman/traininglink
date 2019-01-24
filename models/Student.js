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
const Student = sequelize.define('users', {
    email: {
        type: Sequelize.STRING,
        primaryKey: true,
        allowNull: false,
        validate: {
            isEmail: true,
            notEmpty: true
        }
    },
    name: {
        type: Sequelize.STRING,
        unique: false,
        allowNull: false
    },
    user_phone: {
        type: Sequelize.STRING,
        unique: true,
        allowNull: false,
        validate: {
            isNumeric: true,
            notEmpty: true
        }
    },
    password_hash: {
        type: Sequelize.STRING,
        allowNull: false
    },
    password_salt: {
        type: Sequelize.BLOB,
        allowNull: false
    },
    authentication_type: {
        type: Sequelize.STRING,
        allowNull: false
    }
});

// create table
sequelize.sync().then(() => {
    console.log('Users Table Created!');
}).catch((err) => {
    console.log(err);
});

// export module
module.exports = Student;