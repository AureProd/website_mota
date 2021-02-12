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

Installer un gestionnaire de BDD (par exemple :  [HeidiSQL](https://www.heidisql.com/installers/HeidiSQL_11.2.0.6213_Setup.exe))

Importer les utilisateurs de la BDD avec le fichier [BDD_users.sql](bdd/BDD_users.sql) et importer les BDD avec le fichier [BDD.sql](bdd/BDD.sql)

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
