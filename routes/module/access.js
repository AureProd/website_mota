
const bdd = require('./bdd_site');

function getAccess(req) {
    return new Promise((resolve, reject) => {
        if (req.cookies.userData != null) {
            bdd.query("SELECT users_acces FROM users WHERE users_name = ? ", [req.cookies.userData.username], function (err, result) {
                if (err) return reject(err);

                if (result != null && result[0] != null && result[0].users_acces != null) {
                    return resolve(result[0].users_acces);
                } else {
                    return resolve(0);
                }
            });
        } else {
            return resolve(0);
        }
    });
}

module.exports = { getAccess };