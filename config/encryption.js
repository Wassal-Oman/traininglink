// import needed libraries
const bcrypt = require('bcryptjs');

// salt rounds
const saltRounds = 10;

// method to hash data
const hashData = (text) => {
    return new Promise((resolve, reject) => {
        bcrypt.genSalt(saltRounds, (err, salt) => {
            // error geberating salt
            if (err) return reject(err);

            // hash data
            bcrypt.hash(text, salt, (err, hash) => {
                if (err) return reject(err);
                return resolve(hash);
            });
        });
    });
}

// method to verify data
const compareData = (text, hash) => {
    return new Promise((resolve, reject) => {
        // compare old hash with new hash
        bcrypt.compare(text, hash, (err, same) => {
            if(err) return reject(err);
            return resolve(same);
        });
    });
}

// export functions
module.exports.hashData = hashData;
module.exports.compareData = compareData;