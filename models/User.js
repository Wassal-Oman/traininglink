// import needed libraries
const Sequelize = require('sequelize');
const settings = require('../config/settings');
const encrypt = require('../config/encryption');
const UserType = require('./UserType');
const Institute = require('./Institute');
const Company = require('./Company');

// import database connection details
const conn = settings.DB_CONNECTION;

// import admin credentails
const admin = settings.ADMIN_USER;

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
const User = sequelize.define('dashboard_users', {
    id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    name: {
        type: Sequelize.STRING,
        unique: false,
        allowNull: false
    },
    email: {
        type: Sequelize.STRING,
        unique: true,
        allowNull: false,
        validate: {
            isEmail: true,
            notEmpty: true
        }
    },
    phone: {
        type: Sequelize.STRING,
        unique: true,
        allowNull: false,
        validate: {
            isNumeric: true,
            notEmpty: true
        }
    },
    password: {
        type: Sequelize.STRING,
        allowNull: false
    }
}, {
    hooks: {
        beforeCreate: (user) => {
            return encrypt.hashData(user.password).then((hash) => {
                user.password = hash;
            }).catch((err) => {
                if(err) console.log(err);
            });
        }
    }
});

// validate password through this method
User.prototype.validPassword = (password, hash) => {
    return encrypt.compareData(password, hash).then((val) => {
        return val;
    });
}

// foreign key relationship
User.belongsTo(UserType);
User.belongsTo(Institute);
User.belongsTo(Company);

// create table
sequelize.sync().then(() => {
    
    console.log('Dashboard Users Table Created!');
    
    // create super admin user
    return User.create({
        name: admin.NAME,
        email: admin.EMAIL,
        phone: admin.PHONE,
        password: admin.PASSWORD,
        dashboardUserTypeId: admin.TYPE
    });
}).catch((err) => {
    console.log(err);
});

// export module
module.exports = User;