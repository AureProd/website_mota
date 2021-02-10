
const express = require('express');
const router = express.Router();
const bdd = require('./module/bdd');
const bdd_dev = require('./module/bdd_dev');
const accessFile = require('./module/access');

router.get('/stargatedb', function(req, res, next) {
    accessFile.getAccess(req).then((users_acces) => {
        if (users_acces < 10) {
            res.sendStatus(401);
            return;
        }
    
        bdd.query("SELECT * FROM whitelist", [], function (err, result) {
            if (err) throw err;

            res.send(result);
        });
    });
});

router.get('/stargatedb_dev', function(req, res, next) {
    accessFile.getAccess(req).then((users_acces) => {
        if (users_acces < 10) {
            res.sendStatus(401);
            return;
        }
    
        bdd_dev.query("SELECT * FROM whitelist", [], function (err, result) {
            if (err) throw err;

            res.send(result);
        });
    });
});

router.post('/stargatedb/insert', function(req, res, next) {
    accessFile.getAccess(req).then((users_acces) => {
        if (users_acces < 10) {
            res.sendStatus(401);
            return;
        }
    
        let pseudo = req.body.pseudo;
        let tag = req.body.tag;
        let uid = req.body.uid;
        let adminlevel = req.body.adminlevel;

        if ((pseudo != null) && (tag != null) && (uid != null) && (adminlevel != null)) {
            bdd.query("SELECT wl_pseudo, wl_tag, wl_uid FROM whitelist where wl_uid = ? ", [uid], function (err, result) {
                if (err) throw (err);

                if (result.length == 0) {
                    bdd.query("INSERT INTO whitelist (wl_pseudo, wl_tag, wl_uid, wl_admin_level) VALUES (?, ?, ?, ?)", [pseudo, tag, uid, adminlevel], function (err, result) {
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

router.post('/stargatedb_dev/insert', function(req, res, next) {
    accessFile.getAccess(req).then((users_acces) => {
        if (users_acces < 10) {
            res.sendStatus(401);
            return;
        }
    
        let pseudo = req.body.pseudo;
        let tag = req.body.tag;
        let uid = req.body.uid;
        let adminlevel = req.body.adminlevel;

        if ((pseudo != null) && (tag != null) && (uid != null) && (adminlevel != null)) {
            bdd_dev.query("SELECT wl_pseudo, wl_tag, wl_uid FROM whitelist where wl_uid = ? ", [uid], function (err, result) {
                if (err) throw (err);

                if (result.length == 0) {
                    bdd_dev.query("INSERT INTO whitelist (wl_pseudo, wl_tag, wl_uid, wl_admin_level) VALUES (?, ?, ?, ?)", [pseudo, tag, uid, adminlevel], function (err, result) {
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

router.post('/stargatedb/update', function(req, res, next) {
    accessFile.getAccess(req).then((users_acces) => {
        if (users_acces < 10) {
            res.sendStatus(401);
            return;
        }
    
        let id = req.body.id;
        let pseudo = req.body.pseudo;
        let tag = req.body.tag;
        let uid = req.body.uid;
        let adminlevel = req.body.adminlevel;

        if ((id != null) && (pseudo != null) && (tag != null) && (uid != null) && (adminlevel != null)) {
            bdd.query("SELECT wl_pseudo, wl_tag, wl_uid FROM whitelist where wl_id = ? ", [id], function (err, result) {
                if (err) throw (err);

                if (result.length == 1) {
                    bdd.query("UPDATE whitelist SET wl_pseudo = ?, wl_tag = ?, wl_uid = ?, wl_admin_level = ? WHERE wl_id = ? ", [pseudo, tag, uid, adminlevel, id], function (err, result) {
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

router.post('/stargatedb_dev/update', function(req, res, next) {
    accessFile.getAccess(req).then((users_acces) => {
        if (users_acces < 10) {
            res.sendStatus(401);
            return;
        }
    
        let id = req.body.id;
        let pseudo = req.body.pseudo;
        let tag = req.body.tag;
        let uid = req.body.uid;
        let adminlevel = req.body.adminlevel;

        if ((id != null) && (pseudo != null) && (tag != null) && (uid != null) && (adminlevel != null)) {
            bdd_dev.query("SELECT wl_pseudo, wl_tag, wl_uid FROM whitelist where wl_id = ? ", [id], function (err, result) {
                if (err) throw (err);

                if (result.length == 1) {
                    bdd_dev.query("UPDATE whitelist SET wl_pseudo = ?, wl_tag = ?, wl_uid = ?, wl_admin_level = ? WHERE wl_id = ? ", [pseudo, tag, uid, adminlevel, id], function (err, result) {
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

router.post('/stargatedb/delete', function(req, res, next) {
    accessFile.getAccess(req).then((users_acces) => {
        if (users_acces < 10) {
            res.sendStatus(401);
            return;
        }
    
        let id = req.body.id;

        if (id != null) {
            bdd_dev.query("SELECT wl_pseudo, wl_tag, wl_uid FROM whitelist where wl_id = ? ", [id], function (err, result) {
                if (err) throw (err);

                if (result.length == 1) {
                    bdd_dev.query("DELETE FROM whitelist WHERE wl_id = ? ", [id], function (err, result) {
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

router.post('/stargatedb_dev/delete', function(req, res, next) {
    accessFile.getAccess(req).then((users_acces) => {
        if (users_acces < 10) {
            res.sendStatus(401);
            return;
        }
    
        let id = req.body.id;

        if (id != null) {
            bdd_dev.query("SELECT wl_pseudo, wl_tag, wl_uid FROM whitelist where wl_id = ? ", [id], function (err, result) {
                if (err) throw (err);

                if (result.length == 1) {
                    bdd_dev.query("DELETE FROM whitelist WHERE wl_id = ? ", [id], function (err, result) {
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
