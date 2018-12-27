// import needed libraries
const nodemailer = require('nodemailer');
const settings = require('./settings');

// get mail server settings
const config = settings.EMAIL_CREDENTAILS;

// fmethod to send an email
module.exports = (title, mailBody) => {

    // mail server configuration
    let transporter = nodemailer.createTransport({
        host: config.SMTP_HOST,
        port: config.SMTP_PORT,
        secure: false,
        auth: config.AUTH,
        tls: config.TLS
    });
    
    // email options
    let mailOptions = {
        from: '"Trainig Link" <optimist_gm@hotmail.com>',
        to: 'optimist92809@gmail.com',
        subject: title,
        text: mailBody
    };
    
    // send email
    return new Promise((resolve, reject) => {
        transporter.sendMail(mailOptions, (error, info) => {
            if (error) {
                return reject(error.message);
            } else {
                return resolve('Email Sent: %s', info.messageId);
            }
        });
    });
};