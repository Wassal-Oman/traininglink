// define settings
const DB_CONNECTION = {
    HOST: 'training-link.c3jyfdlgayhq.us-east-2.rds.amazonaws.com',
    USERNAME: 'Intisar',
    PASSWORD: '$Intisar54321',
    DATABASE: 'traininglink',
};

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

// export all settings
module.exports.DB_CONNECTION = DB_CONNECTION;
module.exports.EMAIL_CREDENTAILS = EMAIL_CREDENTAILS;