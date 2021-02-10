var mysql      = require('mysql');
var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'botdiscord',
  password : 'botdiscord35',
  database : 'stargatedb_dev'
});

connection.connect((err) => {
  if (err) {
    console.error('error connecting: ' + err.stack);
    return;
  }
  console.log('connected as id ' + connection.threadId)
});

setInterval(function () {
  connection.query('SELECT 1');
}, 5000);

module.exports = connection;