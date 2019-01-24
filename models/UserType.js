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
const UserType = sequelize.define('dashboard_user_types', {
    id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    type: {
        type: Sequelize.STRING,
        allowNull: false,
        unique: true
    }
});

// create table
sequelize.sync({ force: true }).then(() => {
    console.log('Dashboard User Types Table Created!');

    // add default user types
    UserType.create({
        type: 'Administrator'
    });

    UserType.create({
        type: 'Institute'
    });

    UserType.create({
        type: 'Company'
    });
}).catch((err) => {
    console.log(err);
});

// export module
module.exports = UserType;