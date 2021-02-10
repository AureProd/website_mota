const express = require('express');
const path = require('path');
const cookieParser = require('cookie-parser');
const logger = require('morgan');
const http = require('http');
const Discord = require('discord.js');
const bot_discord = require('./routes/bot_discord');
const config = require("./config.json");

const client = new Discord.Client();

const app = express();

const hostname = 'motagaming.ddns.net';
const port = 80;
const server = http.createServer(app);

if (typeof(server) !== 'undefined') {
    server.listen(port, hostname, () => {
        console.log(`Server running at http://${hostname}:${port}`);
    });
}

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use('/user', require("./routes/user"));
app.use('/bash', require("./routes/bash"));
app.use('/whitelist', require("./routes/whitelist"));
app.use('/server', require("./routes/server"));

client.on('guildMemberAdd', member => {
    bot_discord.guildMemberAdd(client, member);
});

client.on("message", message => {
    bot_discord.message(client, message);
}); 

client.on('messageReactionAdd', async (reaction, user) => {
    bot_discord.reactionTranslate(client, reaction);
});

client.on('ready', () => {
    console.log('Bot is ready !');

    setInterval(function(){ 
        bot_discord.runningBot(client);
    }, 1000 * 10);
});

client.login(config.BOT_TOKEN);

module.exports = app;

