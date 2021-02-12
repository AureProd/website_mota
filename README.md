# Site web de la team MOTA

## Installation de la BDD

### Installation de MySQL Server

A ne pas faire si MySQL server est déjà installé

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

Installez ce gestionnaire de BDD [HeidiSQL](https://www.heidisql.com/installers/HeidiSQL_11.2.0.6213_Setup.exe) et connectez-vous via le tunnel SSH.

Importez les utilisateurs de la BDD avec le fichier [BDD_users.sql](bdd/BDD_users.sql) et importez les bases de données avec le fichier [BDD.sql](bdd/BDD.sql)

## Installation du site web

```
$ git clone git@github.com:HuetJB/website_mota.git
$ cd ./website_mota
$ npm install
$ npm install forever -g
```

## Lancement du site web

```
$ forever index.js
```
