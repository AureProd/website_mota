const bdd_dev = require('./module/bdd_dev');
const bdd = require('./module/bdd');
const LanguageDetect = require('languagedetect');
const lngDetector = new LanguageDetect();
const request = require('request');

const prefix = "!";

function accessCommandes(message) {
    if (!message.member.roles.cache.some(r=>["boss"].includes(r.name))) {
        message.reply(`Vous n'avez pas les droits pour cette commande`);      
        return false;
    }  
    return true;
}

function guildMemberAdd(client, member) {
    const channel = member.guild.channels.cache.find(ch => ch.name === 'général');
    
    if (!channel) return;
    
    channel.send(`Welcome to the server, ${member}`);
}

function message(client, message) {
    if (message.author.bot) return;  
    if (message.channel.name == "international") {
        let result = lngDetector.detect(message.content, 1)[0];

        if (result != null) {
            //console.log(result[0]);

            if (result[0] == "french") {
                let url = ("https://translate.googleapis.com/translate_a/single?client=gtx&sl=auto&tl=en&dt=t&q=" + encodeURI(message.content));

                request.get(url, function (error, response, body) { 
                    let result = JSON.parse(response.body);
                    result = result[0][0][0];

                    message.reply(result); 
                });
            } else {
                let url = ("https://translate.googleapis.com/translate_a/single?client=gtx&sl=auto&tl=fr&dt=t&q=" + encodeURI(message.content));

                request.get(url, function (error, response, body) { 
                    let result = JSON.parse(response.body);
                    result = result[0][0][0];

                    message.reply(result); 
                });
            }
        }

        return;
    }
    else {
        if (!message.content.startsWith(prefix)) return;

        const commandBody = message.content.slice(prefix.length);
        const args = commandBody.split(' ');
        const command = args.shift().toLowerCase();  
        
        if (command === "idchannel" && accessCommandes(message)) {
            if (args[0] === "this") {
                message.reply("Id de ce channel " + message.channel.id); 
            } else {
                client.channels.cache.forEach(channel => {
                    if (channel.type != "category") {
                        message.reply("Id du channel " + channel.type + " " + channel.name + " : " + channel.id);
                    }
                });
            }                  
        }  
        else if (command === "idserver" && accessCommandes(message)) {
            message.reply("Id de ce server : " + message.guild.id);                
        } 
        else if (command === "getroles" && accessCommandes(message)) {
            message.reply("Roles de `" + message.author.tag + "` : ");

            let membersid = message.author.id;
            let roles = message.guild.members.cache.get(id = membersid).roles.cache;
            roles.forEach(role => {
                message.reply("- `" + role.name + "` (id : " + role.id + ")");
            });                
        } 
        else if (command === "getname" && accessCommandes(message)) {
            if (args.length > 0) {
                const user = message.mentions.members.get(message.mentions.users.first().id);
                
                if (user) {
                    message.reply("Name de `" + user.displayName + "` : `" + user.user.tag + "`");
                }
            } else {
                message.reply("Name de `" + message.member.displayName + "` : `" + message.member.user.tag + "`");
            }                
        }
        else if (command === "whiteliste" && accessCommandes(message)) {
            const user = message.mentions.users.first();

            if ((args.length == 2) && user) {
                let valeurTag = user.tag.split('#');
                valeurTag[1] = "#" + valeurTag[1];

                bdd.query(`SELECT * FROM whitelist WHERE wl_tag = ? `, [valeurTag[1]], function(err, result) {
                    if (err) throw err;
                
                    if (result.length == 0) {
                        bdd.query(`INSERT INTO whitelist (wl_uid, wl_pseudo, wl_tag, wl_admin_level) VALUES ( ?, ?, ?, 0)`, [args[1], valeurTag[0], valeurTag[1]], function(err, result) {
                            if (err) throw err;
                            message.reply("OK, le joueur `" + user.tag + "` à été ajouté à la white liste du serveur stargate principal !!!");
                        });
                    } else {
                        bdd.query(`UPDATE whitelist SET wl_uid = ?, wl_pseudo = ? WHERE wl_tag = ?`, [args[1], valeurTag[0], valeurTag[1]], function(err, result) {
                            if (err) throw err;
                            message.reply("OK, l'uid steam du joueur `" + user.tag + "` à été modifié dans la white liste du serveur stargate principal !!!");
                        });
                    }
                });
            }               
        }
        else if (command === "whiteliste_dev" && accessCommandes(message)) {
            const user = message.mentions.users.first();

            if ((args.length == 2) && user) {
                let valeurTag = user.tag.split('#');
                valeurTag[1] = "#" + valeurTag[1];

                bdd_dev.query(`SELECT * FROM whitelist WHERE wl_tag = ? `, [valeurTag[1]], function(err, result) {
                    if (err) throw err;
                
                    if (result.length == 0) {
                        bdd_dev.query(`INSERT INTO whitelist (wl_uid, wl_pseudo, wl_tag, wl_admin_level) VALUES ( ?, ?, ?, 0)`, [args[1], valeurTag[0], valeurTag[1]], function(err, result) {
                            if (err) throw err;
                            message.reply("OK, le joueur `" + user.tag + "` à été ajouté à la white liste du serveur stargate de dev !!!");
                        });
                    } else {
                        bdd_dev.query(`UPDATE whitelist SET wl_uid = ?, wl_pseudo = ? WHERE wl_tag = ?`, [args[1], valeurTag[0], valeurTag[1]], function(err, result) {
                            if (err) throw err;
                            message.reply("OK, l'uid steam du joueur `" + user.tag + "` à été modifié dans la white liste du serveur stargate de dev !!!");
                        });
                    }
                });
            }               
        }
    }
} 

function reactionTranslate(client, reaction) {
    let message = reaction.message;
    let emoji = reaction.emoji.name;

    if (emoji === "🇫🇷") {
        let url = ("https://translate.googleapis.com/translate_a/single?client=gtx&sl=auto&tl=fr&dt=t&q=" + encodeURI(message.content));

        request.get(url, function (error, response, body) { 
            let result = JSON.parse(response.body);
            result = result[0][0][0];

            message.reply(result); 
        });
    } else if (emoji === "🇬🇧") {
        let url = ("https://translate.googleapis.com/translate_a/single?client=gtx&sl=auto&tl=en&dt=t&q=" + encodeURI(message.content));

        request.get(url, function (error, response, body) { 
            let result = JSON.parse(response.body);
            result = result[0][0][0];

            message.reply(result); 
        });
    } else if (emoji === "🇩🇪") {
        let url = ("https://translate.googleapis.com/translate_a/single?client=gtx&sl=auto&tl=de&dt=t&q=" + encodeURI(message.content));

        request.get(url, function (error, response, body) { 
            let result = JSON.parse(response.body);
            result = result[0][0][0];

            message.reply(result); 
        });
    }
}

function runningBot(client) {
    let guild = client.guilds.cache.get(id = "802304034085535754");
    let membres = guild.members.cache;

    membres.forEach(membre => {
        let valeurTag = membre.user.tag.split('#');
        valeurTag[1] = "#" + valeurTag[1];

        bdd_dev.query(`SELECT * FROM player INNER JOIN whitelist WHERE player.p_uid = whitelist.wl_uid AND whitelist.wl_tag =  ? `, [valeurTag[1]], function(err, result) {
            if (err) throw err;

            let roles = guild.roles.cache;

            let roleTaury = roles.find(r => r.name === "taury");
            let roleGoauld = roles.find(r => r.name === "goauld");

            if (result.length != 0) {
                if (result[0].p_race == 1) { // GOAULD
                    if (roles.some(r=>["taury"].includes(r.name))) {
                        membre.roles.remove(roleTaury).catch(console.error);
                    } 

                    membre.roles.add(roleGoauld).catch(console.error);
                } else { // TAURI
                    if (roles.some(r=>["goauld"].includes(r.name))) {
                        membre.roles.remove(roleGoauld).catch(console.error);
                    }

                    membre.roles.add(roleTaury).catch(console.error);
                }
            } else { // RIEN
                if (roles.some(r=>["goauld"].includes(r.name))) {
                    membre.roles.remove(roleGoauld).catch(console.error);
                }

                if (roles.some(r=>["taury"].includes(r.name))) {
                    membre.roles.remove(roleTaury).catch(console.error);
                }
            }
        });
    });
}

module.exports = { guildMemberAdd, message, runningBot, reactionTranslate };