# Site web de la team MOTA

## Installation de Screen

A ne pas faire si Screen est déjà installé

```
$ sudo apt update
$ sudo apt upgrade
$ sudo apt install screen
```

## Installation de la BDD

### Installation de MySQL Server

A ne pas faire si MySQL server est déjà installé.

```
$ sudo apt update
$ sudo apt upgrade
$ sudo apt install mysql-server
$ sudo mysql_secure_installation
$ mysql -u root -p
$ CREATE USER '<USERNAME>'@'%' IDENTIFIED BY '<PASSWORD>';
$ GRANT ALL PRIVILEGES ON *.* TO '<USERNAME>'@'%' WITH GRANT OPTION;
```

### Importation des utilisateurs et des bases de données sur la BDD

Installez ce gestionnaire de BDD [HeidiSQL](https://www.heidisql.com/download.php) et connectez-vous via le tunnel SSH.

Via HeidiSQL, importez les utilisateurs de la BDD avec le fichier [BDD_users.sql](bdd/BDD_users.sql) et les bases de données avec le fichier [BDD.sql](bdd/BDD.sql).

## Installation du site web

```
$ cd
$ git clone git@github.com:HuetJB/website_mota.git
$ cd ~/website_mota
$ npm install
$ npm install forever -g
```

## Lancement du site web

```
$ screen -S website
$ cd ~/website_mota
$ forever index.js
$ ctrl + A + D
```

## Arrêt du site web

```
$ screen -r website
$ ctrl + C
$ ctrl + D
```
