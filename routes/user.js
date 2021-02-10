
const express = require('express');
const router = express.Router();
const bdd = require('./module/bdd_site');
const accessFile = require('./module/access');
var passwordHash = require("password-hash");

router.get('/get_access', function(req, res, next) {
    accessFile.getAccess(req).then((users_acces) => {
        res.send({ access: users_acces });
    });
});

router.post('/login', function(req, res, next) {
    let username = req.body.username;
    let password = req.body.password;

    if ((username != null) && (password != null)) {
        bdd.query("SELECT users_id, users_name, users_password, users_acces FROM users where users_name = ? ", [username], function (err, result) {
            if (err) throw (err);

            if (result.length == 1) {
                if (passwordHash.verify(password, result[0].users_password)) {
                    if (result[0].users_acces > 0) {
                        res.cookie("userData", { id: result[0].users_id, username: result[0].users_name }, { expire: (400000 + Date.now()) });
                    
                        res.send("OK");
                    } else {
                        res.send("NOK_bis"); 
                    }
                } else {
                    res.send("NOK");
                }
            } else {
                res.send("NOK");
            }
        });
    } else {
        res.send("NOK");
    }
});

router.post('/register', function(req, res, next) {
    let username = req.body.username;
    let password = req.body.password;
    password = passwordHash.generate(password);

    if (username != null && password != null) {
        bdd.query("SELECT users_id, users_name FROM users WHERE users_name = ? ", [username], function (err, result) {
            if (err) throw err;

            if (result.length == 0) {
                bdd.query("INSERT INTO users(users_name, users_password, users_acces) VALUES (?, ?, 1)", [username, password], function (err, result) {
                    if (err) throw err;
                    
                    bdd.query("SELECT users_id, users_name FROM users WHERE users_name = ? ", [username], function (err, result) {
                        if (err) throw err;
            
                        res.cookie("userData", { id: result[0].users_id, username: result[0].users_name }, { expire: (400000 + Date.now()) });
                        res.send("OK");
                    });
                });
            } else {
                res.send("NOK");
            }
        });
    } else {
        res.send("NOK");
    }
});

router.get('/logout', function(req, res, next) {
    if (req.cookies.userData != null) {
        res.clearCookie("userData");
        
        res.redirect('/index.html');
    }
});

router.get('/get_all', function(req, res, next) {
    accessFile.getAccess(req).then((users_acces) => {
        if (users_acces < 10) {
            res.sendStatus(401);
            return;
        }
    
        bdd.query("SELECT * FROM users", [], function (err, result) {
            if (err) throw err;

            res.send(result);
        });
    });
});

router.post('/update', function(req, res, next) {
    accessFile.getAccess(req).then((users_acces) => {
        if (users_acces < 10) {
            res.sendStatus(401);
            return;
        }
    
        let id = req.body.id;
        let access = req.body.access;

        if ((id != null) && (access != null)) {
            bdd.query("SELECT users_id, users_name, users_acces FROM users where users_id = ? ", [id], function (err, result) {
                if (err) throw (err);

                if (result.length == 1) {
                    bdd.query("UPDATE users SET users_acces = ? WHERE users_id = ? ", [access, id], function (err, result) {
                        if (err) throw (err);
        
                        res.send("OK");
                    });
                } else {
                    res.send("NOK");
                }
            });
        } else {
            res.send("NOK");
        }
    });
});

module.exports = router;
