// AWS Credentails
const AWS = {
    EMAIL: "intisar.miran.48@gmail.com",
    PASSWORD: "Intisar@123#"
}

// database settings
const DB_CONNECTION = {
    HOST: '31.170.166.179',
    USERNAME: 'u327976002_tl',
    PASSWORD: 'Intisar',
    DATABASE: 'u327976002_tl',
    DIALECT: 'mysql'
};

// email settings
const EMAIL_CREDENTAILS = {
    SMTP_HOST: "smtp-mail.outlook.com",
    SMTP_PORT: 587,
    AUTH: {
        user: "optimist_gm@hotmail.com",
        pass: "GmOptimist9"
    },
    TLS: {
        rejectUnauthorized: false
    }
};

// Admin User
const ADMIN_USER = {
    NAME: 'Ghanim Al-Marzouqi',
    EMAIL: 'optimist_gm@hotmail.com',
    PHONE: '96132329',
    PASSWORD: 'ghanim123',
    TYPE: 1,
    IS_VERIFIED: true
}

// host base url
const HOST_URL = 'http://localhost:3000';

// secret key
const SECRET_KEY = 'traininglinksecret';

// export all settings
module.exports.DB_CONNECTION = DB_CONNECTION;
module.exports.EMAIL_CREDENTAILS = EMAIL_CREDENTAILS;
module.exports.ADMIN_USER = ADMIN_USER;
module.exports.HOST_URL = HOST_URL;
module.exports.SECRET_KEY = SECRET_KEY;