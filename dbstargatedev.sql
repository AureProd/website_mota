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

-- Listage des données de la table armadb.player : ~13 rows (environ)
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` (`p_id`, `p_uid`, `p_name`, `p_money`, `p_tenues`, `p_kills`, `p_morts`, `p_win_games`, `p_games_played`, `p_niv_vip`, `p_niv_droits`) VALUES
	(1, '76561198291437537', 'AureProd', 42015, '"[[0,6,5,2],[0]]"', 0, 0, 0, 0, 3, 2),
	(2, '76561198208475892', '*M.O.T.A*fox alpha', 5370, '"[[0],[0]]"', 0, 0, 0, 0, 0, 0),
	(3, '76561198006133017', 'FondaTA : Mysterfreez', 23445, '"[[0,6],[0,2,5]]"', 0, 0, 0, 0, 3, 2),
	(4, '76561198992818947', 'haza', 5000, '"[[0],[0]]"', 0, 0, 0, 0, 0, 0),
	(5, '76561198144583758', 'Sigrid Haw', 2050, '"[[0],[0]]"', 0, 0, 0, 0, 0, 0),
	(6, '76561198144105979', '[F.R.A.G] Greg ®', 2125, '"[[0],[0]]"', 0, 0, 0, 0, 0, 0),
	(7, '76561198217742125', 'Yohann LARGO', 825, '"[[0],[0]]"', 0, 0, 0, 0, 0, 0),
	(8, '76561198177449939', 'Martin Fleaurus', 1050, '"[[0],[0]]"', 0, 0, 0, 0, 0, 0),
	(9, '76561198165061459', 'ytsuka452', 6955, '"[[0],[0]]"', 0, 0, 0, 0, 0, 0),
	(10, '76561199002016935', '*M.O.T.A* WarWolf', 360, '"[[0],[0]]"', 0, 0, 0, 0, 0, 0),
	(11, '76561198352629714', '[ANVIL]Billy Russo', 3270, '"[[0],[0]]"', 0, 0, 0, 0, 0, 0),
	(12, '76561198392862353', 'aissa', 0, '"[[0],[0]]"', 0, 0, 0, 0, 0, 0),
	(13, '76561197994740201', 'Raptor', 75, '"[[0],[0]]"', 0, 0, 0, 0, 0, 0);
/*!40000 ALTER TABLE `player` ENABLE KEYS */;


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
	(13, 'Lodox', 'sha1$0a41bbd1$1$36476887892269ac9662b701fb83ceb9fea41ba9', 10),
	(14, 'cc', 'sha1$798b4460$1$20503197813bf1c7a3860875c2154f68f4412635', 0);
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
  `p_quetes_dispo` text NOT NULL,
  `p_planete_visite` text NOT NULL,
  `p_quetes_actives` text NOT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- Listage des données de la table stargatedb.player : ~24 rows (environ)
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` (`p_id`, `p_uid`, `p_name`, `p_classe`, `p_race`, `p_exp`, `p_licence`, `p_level`, `p_vie`, `p_faim`, `p_soif`, `p_inv_reel`, `p_inv_virtuel`, `p_position`, `p_quetes_faites`, `p_quetes_dispo`, `p_planete_visite`, `p_quetes_actives`) VALUES
	(1, '76561198291437537', 'AureProd', 1, 2, 5, '"[]"', 1, 100, 100, 100, '"[[],[],[],[`U_C_Man_casual_1_F`,[]],[],[],``,``,[],[`ItemMap`,``,`ItemRadio`,`ItemCompass`,`ItemWatch`,``]]"', '"[]"', '"[38133.4,3126.75,0.00143886]"', '"[1]"', '"[2]"', '"[]"', '"[]"'),
	(2, '76561198006133017', 'FondaTA : Mysterfreez', 1, 1, 62, '"[]"', 1, 100, 96, 94, '"[[`sga_staffweapon_on`,``,``,``,[`sga_staffweapon_mag`,484],[`sga_staffweapon_mag_off`,10],``],[],[],[`SGA_jaffa_free`,[]],[],[],``,``,[],[`ItemMap`,``,`ItemRadio`,`ItemCompass`,``,``]]"', '"[[14,10]]"', '"[38883.4,38957.4,0.0014267]"', '"[]"', '"[1]"', '"[]"', '"[]"'),
	(3, '76561198165158755', 'Marcus Anderson', 1, 2, 0, '"[]"', 1, 100, 53, 21, '"[[],[],[`hgun_Rook40_F`,``,``,``,[`16Rnd_9x21_Mag`,16],[],``],[`U_C_Man_casual_1_F`,[]],[],[`B_OutdoorPack_blk`,[[`16Rnd_9x21_Mag`,1,16]]],``,``,[],[`ItemMap`,``,`ItemRadio`,`ItemCompass`,`ItemWatch`,``]]"', '"[[30,1],[6,1],[7,1],[8,1],[5,3],[1,1]]"', '"[39601.3,2208.78,0.0016799]"', '"[1]"', '"[2]"', '"[]"', '"[]"'),
	(4, '76561198025780224', 'Julien Pumperi', 3, 1, 1373, '"[]"', 4, 100, 60, 72, '"[[],[],[],[`SGA_jaffa_free`,[[`sga_staffweapon_mag_on`,1,10]]],[],[`B_OutdoorPack_blk`,[[[`sga_staffweapon_on`,``,``,``,[`sga_staffweapon_mag`,395],[`sga_staffweapon_mag_off`,10],``],1]]],``,``,[],[`ItemMap`,``,`ItemRadio`,`ItemCompass`,``,``]]"', '"[[31,1],[10,4],[9,5]]"', '"[38872.2,38957.4,0.00147069]"', '"[]"', '"[1]"', '"[]"', '"[]"'),
	(5, '76561198208475892', '*M.O.T.A*fox alpha', 3, 1, 400, '"[]"', 2, 100, 100, 99, '"[[],[],[],[`SGA_jaffa_free`,[]],[],[],``,``,[],[`ItemMap`,``,`ItemRadio`,`ItemCompass`,``,``]]"', '"[]"', '"[38878.9,38954.8,0.00138521]"', '"[]"', '"[1]"', '"[]"', '"[]"'),
	(6, '76561198165061459', 'ytsuka452', 2, 1, 9456, '"[]"', 12, 100, 96, 94, '"[[],[],[],[],[],[],``,``,[],[``,``,``,``,``,``]]"', '"[]"', '"[36918.3,3078.56,0.00143886]"', '"[]"', '"[1]"', '"[]"', '"[]"'),
	(7, '76561197995594735', 'Charlie', 3, 1, 1005, '"[]"', 3, 100, 83, 75, '"[[`sga_staffweapon_on`,``,``,``,[`sga_staffweapon_mag`,487],[`sga_staffweapon_mag_off`,10],``],[],[],[`SGA_jaffa_free`,[]],[],[],``,``,[],[``,``,`ItemRadio`,`ItemCompass`,``,``]]"', '"[]"', '"[33170.1,39241.8,-0.461188]"', '"[1]"', '"[2]"', '"[]"', '"[]"'),
	(8, '76561199002016935', '*M.O.T.A* WarWolf', 3, 1, 1555, '"[]"', 4, 100, 99, 98, '"[[],[],[],[`sga_commoner_uniform`,[]],[],[],``,`G_Aviator`,[],[``,``,`ItemRadio`,`ItemCompass`,``,``]]"', '"[]"', '"[33802.6,39326.1,0.00137538]"', '"[]"', '"[1]"', '"[]"', '"[]"'),
	(9, '76561198392862353', 'aissa', 3, 2, 0, '"[]"', 1, 100, 98, 97, '"[[],[],[],[`U_C_Man_casual_1_F`,[]],[],[],``,``,[],[``,``,`ItemRadio`,`ItemCompass`,`ItemWatch`,``]]"', '"[[6,4]]"', '"[33751.8,39311.2,1.05831]"', '"[]"', '"[1]"', '"[]"', '"[]"'),
	(10, '76561198303058318', '[Ltn-Col] J.Ellis', 1, 2, 1649, '"[1]"', 4, 100, 100, 100, '"[[],[],[],[`U_C_Man_casual_1_F`,[]],[],[],``,``,[],[``,``,`ItemRadio`,`ItemCompass`,`ItemWatch`,``]]"', '"[]"', '"[38139.4,3125.43,0.00143886]"', '"[1,2,3]"', '"[]"', '"[]"', '"[]"'),
	(11, '76561198140828094', 'A.foxtrot', 2, 2, 344, '"[2]"', 1, 100, 47, 24, '"[[],[],[],[],[],[],``,``,[],[``,``,``,``,``,``]]"', '"[[16,4],[30,1],[7,2],[8,2],[6,7],[22,3]]"', '"[36918.3,3078.57,0.00143886]"', '"[1,2,3]"', '"[]"', '"[]"', '"[]"'),
	(12, '76561198169985342', 'Sierra 018', 1, 2, 13, '"[1]"', 1, 100, 100, 100, '"[[],[],[],[`U_C_Man_casual_1_F`,[]],[],[],``,``,[],[`ItemMap`,``,`ItemRadio`,`ItemCompass`,`ItemWatch`,``]]"', '"[]"', '"[38143.7,3124.74,0.00143886]"', '"[1,2,3]"', '"[]"', '"[]"', '"[]"'),
	(13, '76561198196523477', 'Marc Skoll', 1, 2, 663, '"[1]"', 2, 97, 98, 97, '"[[],[],[],[`U_C_Man_casual_1_F`,[]],[],[],``,``,[],[``,``,`ItemRadio`,`ItemCompass`,`ItemWatch`,``]]"', '"[]"', '"[38119.1,3125.17,0.00146961]"', '"[1,2,3]"', '"[]"', '"[]"', '"[]"'),
	(14, '76561198098005406', '[F.R.A.G] Sihg_ttv', 1, 2, 5003, '"[]"', 8, 100, 85, 78, '"[[],[],[],[`U_C_Man_casual_1_F`,[]],[],[],``,`G_Aviator`,[],[``,``,`ItemRadio`,`ItemCompass`,`ItemWatch`,``]]"', '"[]"', '"[38142.4,3127.04,0.00143886]"', '"[1]"', '"[2]"', '"[]"', '"[]"'),
	(15, '76561197994740201', 'Raptor', 3, 1, 0, '"[]"', 1, 100, 39, 44, '"[[`sga_staffweapon_on`,``,``,``,[`sga_staffweapon_mag`,489],[`sga_staffweapon_mag_off`,10],``],[],[`sga_zat_open`,``,``,``,[`sga_zat_mag_open`,988],[],``],[`SGA_jaffa_free`,[[`sga_zat_mag_closed`,1,1]]],[],[`B_Carryall_ocamo`,[]],``,`G_Shades_Blue`,[],[`ItemMap`,``,`ItemRadio`,`ItemCompass`,``,``]]"', '"[[31,1],[10,6],[9,3],[31,1],[17,1],[14,5],[23,1],[40,2],[22,3],[19,2],[20,2],[21,2],[24,5],[39,2],[33,1],[35,1],[43,1],[41,1]]"', '"[38641.3,38967.1,-0.99978]"', '"[]"', '"[1]"', '"[]"', '"[]"'),
	(16, '76561198119969039', 'Max Carbon', 1, 2, 63, '"[1]"', 1, 100, 95, 92, '"[[],[],[],[`U_C_Man_casual_1_F`,[]],[],[],``,``,[],[`ItemMap`,``,`ItemRadio`,`ItemCompass`,`ItemWatch`,``]]"', '"[]"', '"[38138.3,3135.59,0.00141025]"', '"[1,2,3]"', '"[]"', '"[]"', '"[]"'),
	(17, '76561198061688421', 'xeldo', 3, 2, 5, '"[]"', 1, 100, 98, 97, '"[[],[],[],[`U_C_Man_casual_1_F`,[]],[],[],``,`G_Sport_Blackred`,[],[`ItemMap`,``,`ItemRadio`,`ItemCompass`,`ItemWatch`,``]]"', '"[]"', '"[37857.5,3013.54,0.7302]"', '"[1]"', '"[2]"', '"[]"', '"[]"'),
	(18, '76561197989856831', 'xanax', 3, 2, 5, '"[]"', 1, 100, 99, 99, '"[[],[],[],[`U_C_Man_casual_1_F`,[]],[],[],``,``,[],[`ItemMap`,``,`ItemRadio`,`ItemCompass`,`ItemWatch`,``]]"', '"[]"', '"[38876.3,38972,0.00145352]"', '"[1]"', '"[2]"', '"[]"', '"[]"'),
	(19, '76561198121649847', 'Docto', 3, 2, 61, '"[]"', 1, 98, 71, 59, '"[[],[],[],[`U_C_Man_casual_1_F`,[]],[],[],``,``,[],[``,``,`ItemRadio`,`ItemCompass`,`ItemWatch`,``]]"', '"[]"', '"[37888.6,3265.68,0.00143886]"', '"[]"', '"[2]"', '"[]"', '"[1]"'),
	(20, '76561197983265506', 'lerou', 3, 2, 0, '"[]"', 1, 100, 100, 99, '"[[],[],[],[`U_C_Man_casual_1_F`,[]],[],[],``,``,[],[``,``,`ItemRadio`,`ItemCompass`,`ItemWatch`,``]]"', '"[]"', '"[38119.9,3125.24,0.00143099]"', '"[]"', '"[2]"', '"[]"', '"[1]"'),
	(21, '76561198084730393', 'John Sheppard', 3, 2, 3, '"[]"', 1, 94, 74, 64, '"[[],[],[],[`U_C_Man_casual_1_F`,[]],[],[],``,``,[],[`ItemMap`,``,`ItemRadio`,`ItemCompass`,`ItemWatch`,``]]"', '"[]"', '"[38901,1532.03,0.00143886]"', '"[1]"', '"[]"', '"[]"', '"[2]"'),
	(22, '76561198045194376', 'Walter Bright', 1, 1, 0, '"[]"', 1, 100, 100, 100, '"[[],[],[],[],[],[],``,``,[],[``,``,``,``,``,``]]"', '"[]"', '"[36918.3,3078.57,0.00143886]"', '"[]"', '"[1]"', '"[]"', '"[]"'),
	(23, '76561198297962495', 'Max McCarthy', 3, 1, 73, '"[]"', 1, 100, 72, 60, '"[[`sga_staffweapon_on`,``,``,``,[`sga_staffweapon_mag`,498],[`sga_staffweapon_mag_off`,10],``],[],[],[`SGA_jaffa_free`,[]],[],[],``,``,[],[`ItemMap`,``,`ItemRadio`,`ItemCompass`,``,``]]"', '"[]"', '"[37615.8,38625.6,0.761457]"', '"[]"', '"[1]"', '"[]"', '"[]"'),
	(24, '76561197968903028', 'Caliceba', 3, 2, 5, '"[]"', 1, 100, 75, 64, '"[[],[],[],[],[],[],``,``,[],[``,``,``,``,``,``]]"', '"[]"', '"[36918.3,3078.56,0.00143886]"', '"[1]"', '"[2]"', '"[]"', '"[]"');
/*!40000 ALTER TABLE `player` ENABLE KEYS */;

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
	(8, 'fadas', NULL, 0, '76561198165158755'),
	(9, 'lodox', 'null', 5, '76561198025780224'),
	(10, 'fox-alpha', NULL, 0, '76561198208475892'),
	(11, 'ytsuka', NULL, 0, '76561198165061459'),
	(12, 'westen', NULL, 0, '76561197995594735'),
	(13, 'warwolf', NULL, 0, '76561199002016935'),
	(25, 'aissa', NULL, 0, '76561198392862353'),
	(26, 'Blackout', NULL, 0, '76561198303058318'),
	(27, 'Foxtrot', NULL, 0, '76561198140828094'),
	(28, 'Underwood', NULL, 0, '76561198169985342'),
	(29, 'Aquila Mark', NULL, 0, '76561198196523477'),
	(30, 'sylphius', NULL, 0, '76561197994740201'),
	(31, 'Ghis', NULL, 0, '76561198098005406'),
	(32, 'Jean Mario', NULL, 0, '76561198177449939'),
	(33, 'Titou', NULL, 0, '76561198035762149'),
	(34, 'black raven68', NULL, 0, '76561198066023085'),
	(35, 'soldat ghost', NULL, 0, '76561198082245360'),
	(36, 'Evan Keen', NULL, 0, '76561198249426408'),
	(37, 'Zebra', NULL, 0, '76561198072211790'),
	(38, 'crazysasa06220', NULL, 0, '76561198252972623'),
	(39, 'French Baguette', NULL, 0, '76561198175621873'),
	(40, 'Prosper le Purineur', NULL, 0, '76561197983265506'),
	(41, 'Gint0x', NULL, 0, '76561197975952412'),
	(42, 'MarcusPrimes', NULL, 0, '76561198137286812'),
	(43, 'Mikaz66', NULL, 0, '76561198050437189'),
	(44, 'Infinity', NULL, 0, '76561198119969039'),
	(45, 'SpidaChris', NULL, 0, '76561198061688421'),
	(46, 'xanax', NULL, 0, '76561197989856831'),
	(47, 'OniHunter', NULL, 0, '76561198027552784'),
	(48, 'Doctor Play', NULL, 0, '76561198121649847'),
	(49, 'Alex Murphy', NULL, 0, '76561198158191510'),
	(52, 'Ralf', NULL, 0, '76561197968387202'),
	(53, 'opti2025', NULL, 0, '76561198084730393'),
	(54, 'Controleur', NULL, 0, '76561198045194376'),
	(55, 'Mateja', NULL, 0, '76561198053858627'),
	(56, '[BYJ] Jey', NULL, 0, '76561198086170311'),
	(57, 'Max McCarthy', NULL, 0, '76561198297962495'),
	(58, 'Elton/225', NULL, 0, '76561198382786708'),
	(59, 'Edouard.S.', NULL, 0, '76561198013254407'),
	(60, 'Loann', NULL, 0, '76561198171075495'),
	(61, 'Bob McCarthy', NULL, 0, '76561198068556406'),
	(62, 'Caliceba', NULL, 0, '76561197968903028'),
	(63, 'Poutchev', NULL, 0, '76561198151858167'),
	(64, 'Yram', NULL, 0, '6561198076057832'),
	(65, 'Quentin187', NULL, 0, '76561198084833251'),
	(66, 'sasor14', NULL, 0, '76561198981324342'),
	(67, 'Tribaljo (John Martous)', '#2795', 0, '76561197975282714');
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
  `p_quetes_dispo` text NOT NULL,
  `p_planete_visite` text NOT NULL,
  `p_quetes_actives` text NOT NULL,
  `p_garage` text NOT NULL,
  `p_white_liste_soldat` int(10) NOT NULL,
  `p_documents` text NOT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- Listage des données de la table stargatedb_dev.player : ~6 rows (environ)
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` (`p_id`, `p_uid`, `p_name`, `p_classe`, `p_race`, `p_exp`, `p_licence`, `p_level`, `p_vie`, `p_faim`, `p_soif`, `p_inv_reel`, `p_inv_virtuel`, `p_position`, `p_quetes_faites`, `p_quetes_dispo`, `p_planete_visite`, `p_quetes_actives`, `p_garage`, `p_white_liste_soldat`, `p_documents`) VALUES
	(8, '76561198291437537', 'AureProd', 1, 2, 10000, '"[]"', 1, 100, 100, 100, '"[[],[],[],[`U_C_Man_casual_1_F`,[]],[],[],``,``,[],[``,``,`ItemRadio`,`ItemCompass`,`ItemWatch`,``]]"', '"[]"', '"[38897.4,39008.3,0.00138998]"', '"[1]"', '"[2]"', '"[[1],[1]]"', '"[]"', '"[]"', 1, '"[]"'),
	(9, '76561198006133017', 'FondaTA : Mysterfreez', 1, 1, 400, '"[]"', 1, 100, 95, 93, '"[[],[],[],[`SGA_jaffa_free`,[]],[],[],``,``,[],[``,``,`ItemRadio`,`ItemCompass`,``,``]]"', '"[]"', '"[38847.1,38955.7,0.00138021]"', '"[]"', '"[]"', '"[[],[]]"', '"[1]"', '"[]"', 1, '"[]"'),
	(13, '76561197975282714', 'John Martous', 2, 2, 3871, '"[1,2,5,4,9]"', 9, 95, 90, 85, '"[[],[],[],[`U_B_CombatUniform_mcam`,[[`16Rnd_9x21_Mag`,4,16]]],[`V_BandollierB_cbr`,[]],[`B_AssaultPack_khk`,[[[`sga_staffweapon_on`,``,``,``,[`sga_staffweapon_mag`,469],[`sga_staffweapon_mag_off`,10],``],1]]],`H_Helmet_Skate`,`G_Sport_Red`,[],[`ItemMap`,``,`ItemRadio`,`ItemCompass`,`ItemWatch`,``]]"', '"[[6,2],[8,2],[7,1],[1,2],[5,2]]"', '"[38176.1,2924.03,0.00143886]"', '"[1]"', '"[2]"', '"[[1],[1]]"', '"[]"', '"[1,2,3]"', 0, '"[]"'),
	(14, '76561198121649847', 'Doctorplay', 1, 2, 205, '"[1,2]"', 1, 97, 57, 40, '"[[],[],[],[`U_C_Man_casual_1_F`,[]],[],[],``,``,[],[``,``,`ItemRadio`,`ItemCompass`,`ItemWatch`,``]]"', '"[]"', '"[38873,1551.53,0.00143886]"', '"[1]"', '"[2]"', '"[[1],[1]]"', '"[]"', '"[1]"', 0, '"[]"'),
	(15, '76561198873009222', 'final', 2, 2, 330, '"[1]"', 1, 92, 71, 58, '"[[],[],[],[`U_C_Man_casual_1_F`,[]],[],[],``,``,[],[``,``,`ItemRadio`,`ItemCompass`,`ItemWatch`,``]]"', '"[]"', '"[38856.3,1548.48,0.00143886]"', '"[1]"', '"[2]"', '"[[1],[1]]"', '"[]"', '"[]"', 0, '"[]"'),
	(16, '76561198009148706', 'code34', 1, 1, 405, '"[]"', 1, 100, 83, 76, '"[[],[],[],[`SGA_jaffa_free`,[]],[],[],``,``,[],[``,``,`ItemRadio`,`ItemCompass`,``,``]]"', '"[]"', '"[15908.6,16239.2,-3.00353]"', '"[1]"', '"[2]"', '"[[82],[82]]"', '"[]"', '"[]"', 0, '"[]"');
/*!40000 ALTER TABLE `player` ENABLE KEYS */;

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
	(13, '*M.O.T.A* Fox-alpha', '#6609', 0, '76561198208475892'),
	(17, 'Lodox', '#0203', 5, '76561198025780224'),
	(20, 'Ralf', '#3240', 0, '100000000000'),
	(21, 'John Martous', '#2795', 0, '76561197975282714'),
	(22, 'DoctorPlay', '#6412', 0, '76561198121649847'),
	(23, 'wiwi33gaming', '#7682', 0, '76561198873009222'),
	(24, 'code34', '#0073', 0, '76561198009148706');
/*!40000 ALTER TABLE `whitelist` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
