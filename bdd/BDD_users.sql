CREATE USER 'siteweb'@localhost IDENTIFIED BY 'm6tBZ64t4X';
CREATE USER 'botdiscord'@localhost IDENTIFIED BY '3GLq86Cq4t';
CREATE USER 'armadb'@localhost IDENTIFIED BY 'XLaj9V673b';
CREATE USER 'stargatedb'@localhost IDENTIFIED BY '2uMj58Ts8M';
CREATE USER 'stargatedb_dev'@localhost IDENTIFIED BY 'U2G4tu9qX5';
CREATE USER 'syndromedb'@localhost IDENTIFIED BY '3cBWbKJqv7w8G37';
CREATE USER 'adminsyndrome'@'%' IDENTIFIED BY '7bagAmn2YCS894F';

GRANT ALL PRIVILEGES ON `sitewebdb`.* TO 'siteweb'@localhost;
GRANT ALL PRIVILEGES ON `stargatedb`.* TO 'botdiscord'@localhost;
GRANT ALL PRIVILEGES ON `stargatedb_dev`.* TO 'botdiscord'@localhost;
GRANT ALL PRIVILEGES ON `armadb`.* TO 'armadb'@localhost;
GRANT ALL PRIVILEGES ON `stargatedb`.* TO 'stargatedb'@localhost;
GRANT ALL PRIVILEGES ON `stargatedb_dev`.* TO 'stargatedb_dev'@localhost;
GRANT ALL PRIVILEGES ON `altislife`.* TO 'syndromedb'@localhost;
GRANT ALL PRIVILEGES ON `altislife`.* TO 'adminsyndrome'@'%';

FLUSH PRIVILEGES;