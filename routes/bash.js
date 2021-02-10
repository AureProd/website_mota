
var express = require('express');
var router = express.Router();
var bdd = require('./module/bdd_site');
var shell = require('shelljs');
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

router.post('/lsServer', function(req, res, next) {
    accessFile.getAccess(req).then((users_acces) => {
        if (users_acces < 10) {
            res.sendStatus(401);
            return;
        }
        
        let id = req.body.id;

        bdd.query("SELECT * FROM servers WHERE serv_id = ? ", [id], function (err, result) {
            if (err) throw (err);
            
            if (result.length == 1) {
                let variable = shell.exec(
                    `server=$(screen -ls | awk '/\.${result[0].serv_name}\t/ {print strtonum($1)}')
                
                    if [ -n "$server" ]
                    then
                    
                        echo "demarer"
                    
                    else
                    
                        echo "stoper"
                    
                    fi`
                );
                res.send("" + variable);
            }
        });
    });
});

router.post('/serverStartStop', function(req, res, next) {
    accessFile.getAccess(req).then((users_acces) => {
        if (users_acces < 10) {
            res.sendStatus(401);
            return;
        }
    
        let id = req.body.id;
        let action = req.body.action;

        bdd.query("SELECT * FROM servers WHERE serv_id = ? ", [id], function (err, result) {
            if (err) throw (err);
            
            if (result.length == 1) {
                shell.exec(
                    `server=$(screen -ls | awk '/\.${result[0].serv_name}\t/ {print strtonum($1)}')

                    if [ ${action} = "stop" ]
                    then
                    
                        kill -KILL $server
                        screen -wipe $server
                    
                    elif [ ${action} = "restart" ]
                    then
                    
                        kill -KILL $server
                        screen -wipe $server
                    
                        sleep 3;
                    
                        screen -dmS "${result[0].serv_name}" bash -c "cd ${result[0].serv_path}; sh ${result[0].serv_executable}"
                    
                    elif [ ${action} = "start" ]
                    then
                    
                        screen -dmS "${result[0].serv_name}" bash -c "cd ${result[0].serv_path}; sh ${result[0].serv_executable}"
                    
                    fi`
                );
                res.sendStatus(200);
            }
        });
    });
});

module.exports = router;

