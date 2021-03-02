-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           10.1.47-MariaDB-0+deb9u1 - Debian 9.13
-- SE du serveur:                debian-linux-gnu
-- HeidiSQL Version:             11.1.0.6116
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour armadb
CREATE DATABASE IF NOT EXISTS `armadb` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `armadb`;

-- Listage de la structure de la table armadb. player
CREATE TABLE IF NOT EXISTS `player` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `p_uid` varchar(100) NOT NULL,
  `p_name` varchar(100) NOT NULL,
  `p_money` int(100) NOT NULL,
  `p_tenues` text NOT NULL,
  `p_kills` int(100) NOT NULL,
  `p_morts` int(100) NOT NULL,
  `p_win_games` int(100) NOT NULL,
  `p_games_played` int(100) NOT NULL,
  `p_niv_vip` int(10) NOT NULL,
  `p_niv_droits` int(10) NOT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- Listage de la structure de la base pour sitewebdb
CREATE DATABASE IF NOT EXISTS `sitewebdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `sitewebdb`;

-- Listage de la structure de la table sitewebdb. servers
CREATE TABLE IF NOT EXISTS `servers` (
  `serv_id` int(10) NOT NULL AUTO_INCREMENT,
  `serv_titre` varchar(50) NOT NULL,
  `serv_name` varchar(50) NOT NULL,
  `serv_executable` varchar(100) NOT NULL,
  `serv_path` varchar(255) NOT NULL,
  PRIMARY KEY (`serv_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Listage des données de la table sitewebdb.servers : ~3 rows (environ)
/*!40000 ALTER TABLE `servers` DISABLE KEYS */;
INSERT INTO `servers` (`serv_id`, `serv_titre`, `serv_name`, `serv_executable`, `serv_path`) VALUES
	(1, 'Serveur StarGate', 'stargate', 'run.sh', '/home/arma3/stargate'),
	(2, 'Serveur StarGate Dev', 'stargate-dev', 'run.sh', '/home/arma3/stargate-dev'),
	(3, 'Serveur Airsoft', 'airsoft', 'run.sh', '/home/arma3/airsoft');
/*!40000 ALTER TABLE `servers` ENABLE KEYS */;

-- Listage de la structure de la table sitewebdb. users
CREATE TABLE IF NOT EXISTS `users` (
  `users_id` int(11) NOT NULL AUTO_INCREMENT,
  `users_name` varchar(100) NOT NULL,
  `users_password` varchar(100) NOT NULL,
  `users_acces` int(11) NOT NULL,
  PRIMARY KEY (`users_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- Listage des données de la table sitewebdb.users : ~4 rows (environ)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`users_id`, `users_name`, `users_password`, `users_acces`) VALUES
	(10, 'Mysterfreez', 'sha1$faba4b11$1$e18e3c5b18b939882a6ebddecf77840ae72432e8', 10),
	(12, 'aureprod', 'sha1$422145e8$1$f382b3ca9487aa59a5deb343ea6d719f63fef0dd', 10),
	(13, 'Lodox', 'sha1$0a41bbd1$1$36476887892269ac9662b701fb83ceb9fea41ba9', 10);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Listage de la structure de la base pour stargatedb
CREATE DATABASE IF NOT EXISTS `stargatedb` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `stargatedb`;

-- Listage de la structure de la table stargatedb. player
CREATE TABLE IF NOT EXISTS `player` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `p_uid` varchar(100) NOT NULL,
  `p_name` varchar(100) NOT NULL,
  `p_classe` int(10) NOT NULL,
  `p_race` int(10) NOT NULL,
  `p_exp` int(100) NOT NULL,
  `p_licence` text NOT NULL,
  `p_level` int(10) NOT NULL,
  `p_vie` int(10) NOT NULL,
  `p_faim` int(10) NOT NULL,
  `p_soif` int(10) NOT NULL,
  `p_inv_reel` text NOT NULL,
  `p_inv_virtuel` text NOT NULL,
  `p_position` text NOT NULL,
  `p_quetes_faites` text NOT NULL,
  `p_planete_visite` text NOT NULL,
  `p_quetes_actives` text NOT NULL,
  `p_garage` text NOT NULL,
  `p_white_liste_soldat` int(10) NOT NULL,
  `p_documents` text NOT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- Listage de la structure de la table stargatedb. whitelist
CREATE TABLE IF NOT EXISTS `whitelist` (
  `wl_id` int(11) NOT NULL AUTO_INCREMENT,
  `wl_pseudo` varchar(100) NOT NULL,
  `wl_tag` varchar(10) DEFAULT NULL,
  `wl_admin_level` int(10) NOT NULL,
  `wl_uid` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`wl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

-- Listage des données de la table stargatedb.whitelist : ~49 rows (environ)
/*!40000 ALTER TABLE `whitelist` DISABLE KEYS */;
INSERT INTO `whitelist` (`wl_id`, `wl_pseudo`, `wl_tag`, `wl_admin_level`, `wl_uid`) VALUES
	(1, 'AureProd', 'null', 5, '76561198291437537'),
	(7, 'MysterFreeze', 'null', 5, '76561198006133017'),
	(9, 'lodox', 'null', 5, '76561198025780224');
/*!40000 ALTER TABLE `whitelist` ENABLE KEYS */;

-- Listage de la structure de la base pour stargatedb_dev
CREATE DATABASE IF NOT EXISTS `stargatedb_dev` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `stargatedb_dev`;

-- Listage de la structure de la table stargatedb_dev. player
CREATE TABLE IF NOT EXISTS `player` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `p_uid` varchar(100) NOT NULL,
  `p_name` varchar(100) NOT NULL,
  `p_classe` int(10) NOT NULL,
  `p_race` int(10) NOT NULL,
  `p_exp` int(100) NOT NULL,
  `p_licence` text NOT NULL,
  `p_level` int(10) NOT NULL,
  `p_vie` int(10) NOT NULL,
  `p_faim` int(10) NOT NULL,
  `p_soif` int(10) NOT NULL,
  `p_inv_reel` text NOT NULL,
  `p_inv_virtuel` text NOT NULL,
  `p_position` text NOT NULL,
  `p_quetes_faites` text NOT NULL,
  `p_planete_visite` text NOT NULL,
  `p_quetes_actives` text NOT NULL,
  `p_garage` text NOT NULL,
  `p_white_liste_soldat` int(10) NOT NULL,
  `p_documents` text NOT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- Listage de la structure de la table stargatedb_dev. whitelist
CREATE TABLE IF NOT EXISTS `whitelist` (
  `wl_id` int(11) NOT NULL AUTO_INCREMENT,
  `wl_pseudo` varchar(100) NOT NULL,
  `wl_tag` varchar(10) DEFAULT NULL,
  `wl_admin_level` int(10) NOT NULL,
  `wl_uid` varchar(100) NOT NULL,
  PRIMARY KEY (`wl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- Listage des données de la table stargatedb_dev.whitelist : ~9 rows (environ)
/*!40000 ALTER TABLE `whitelist` DISABLE KEYS */;
INSERT INTO `whitelist` (`wl_id`, `wl_pseudo`, `wl_tag`, `wl_admin_level`, `wl_uid`) VALUES
	(1, 'AureProd', '#6830', 5, '76561198291437537'),
	(2, '*M.O.T.A*Mysterfreez', '#4593', 5, '76561198006133017'),
	(17, 'Lodox', '#0203', 5, '76561198025780224');
/*!40000 ALTER TABLE `whitelist` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
