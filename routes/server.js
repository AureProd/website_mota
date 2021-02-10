
const express = require('express');
const router = express.Router();
const bdd = require('./module/bdd_site');
const accessFile = require('./module/access');

router.get('/get_all', function(req, res, next) {
    accessFile.getAccess(req).then((users_acces) => {
        if (users_acces < 10) {
            res.sendStatus(401);
            return;
        }
    
        bdd.query("SELECT * FROM servers", [], function (err, result) {
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
        let titre = req.body.titre;

        if ((id != null) && (titre != null)) {
            bdd.query("SELECT serv_titre, serv_name FROM servers where serv_id = ? ", [id], function (err, result) {
                if (err) throw (err);

                if (result.length == 1) {
                    bdd.query("UPDATE servers SET serv_titre = ? WHERE serv_id = ? ", [titre, id], function (err, result) {
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
