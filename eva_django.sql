/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.20-12.3.3-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: eva_django
-- ------------------------------------------------------
-- Server version	12.3.3-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Current Database: `eva_django`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `eva_django` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci */;

USE `eva_django`;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add usuario',7,'add_usuario'),
(26,'Can change usuario',7,'change_usuario'),
(27,'Can delete usuario',7,'delete_usuario'),
(28,'Can view usuario',7,'view_usuario'),
(29,'Can add servicio contratado',8,'add_serviciocontratado'),
(30,'Can change servicio contratado',8,'change_serviciocontratado'),
(31,'Can delete servicio contratado',8,'delete_serviciocontratado'),
(32,'Can view servicio contratado',8,'view_serviciocontratado'),
(33,'Can add servicio',9,'add_servicio'),
(34,'Can change servicio',9,'change_servicio'),
(35,'Can delete servicio',9,'delete_servicio'),
(36,'Can view servicio',9,'view_servicio'),
(37,'Can add historial',10,'add_historial'),
(38,'Can change historial',10,'change_historial'),
(39,'Can delete historial',10,'delete_historial'),
(40,'Can view historial',10,'view_historial');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES
(1,'pbkdf2_sha256$1000000$h2ChSFGgtqArp5T01J85Up$WuTFS6pWGY9CxPFYgAybz7JQ8M6iA+5iivmOvxC2SU0=','2026-09-21 02:20:43.331624',1,'administrador','','','',1,1,'2026-09-21 02:17:11.344173');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(10,'entidad','historial'),
(9,'entidad','servicio'),
(8,'entidad','serviciocontratado'),
(7,'entidad','usuario'),
(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES
(1,'contenttypes','0001_initial','2026-09-20 02:50:40.062085'),
(2,'auth','0001_initial','2026-09-20 02:50:42.355940'),
(3,'admin','0001_initial','2026-09-20 02:50:42.797456'),
(4,'admin','0002_logentry_remove_auto_add','2026-09-20 02:50:42.814006'),
(5,'admin','0003_logentry_add_action_flag_choices','2026-09-20 02:50:42.832593'),
(6,'contenttypes','0002_remove_content_type_name','2026-09-20 02:50:43.078697'),
(7,'auth','0002_alter_permission_name_max_length','2026-09-20 02:50:43.206730'),
(8,'auth','0003_alter_user_email_max_length','2026-09-20 02:50:43.291443'),
(9,'auth','0004_alter_user_username_opts','2026-09-20 02:50:43.305597'),
(10,'auth','0005_alter_user_last_login_null','2026-09-20 02:50:43.436938'),
(11,'auth','0006_require_contenttypes_0002','2026-09-20 02:50:43.440705'),
(12,'auth','0007_alter_validators_add_error_messages','2026-09-20 02:50:43.453871'),
(13,'auth','0008_alter_user_username_max_length','2026-09-20 02:50:43.529737'),
(14,'auth','0009_alter_user_last_name_max_length','2026-09-20 02:50:43.606274'),
(15,'auth','0010_alter_group_name_max_length','2026-09-20 02:50:43.682716'),
(16,'auth','0011_update_proxy_permissions','2026-09-20 02:50:43.696455'),
(17,'auth','0012_alter_user_first_name_max_length','2026-09-20 02:50:43.772122'),
(18,'sessions','0001_initial','2026-09-20 02:50:43.900341'),
(19,'entidad','0001_initial','2026-09-20 04:12:40.857732'),
(20,'entidad','0002_historial','2026-09-20 05:02:34.931766');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES
('2v0pk9c53u795zo7qvx81xiw3xm5z5sd','eyJlc3RhZG9TZXNpb24iOnRydWUsImlkVXN1YXJpbyI6MSwibm9tVXN1YXJpbyI6IkFETUlOIn0:1x8ekW:QNDCyiNstrj9VuPJDb3hSv_2D8__Urp-6FXtZjHmmCs','2026-10-05 14:12:04.776805');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `entidad_historial`
--

DROP TABLE IF EXISTS `entidad_historial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `entidad_historial` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `descripcion_historial` longtext NOT NULL,
  `tabla_afectada_historial` longtext NOT NULL,
  `fecha_hora_historial` datetime(6) NOT NULL,
  `usuario_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `entidad_historial_usuario_id_055b2937_fk_entidad_usuario_id` (`usuario_id`),
  CONSTRAINT `entidad_historial_usuario_id_055b2937_fk_entidad_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `entidad_usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entidad_historial`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `entidad_historial` WRITE;
/*!40000 ALTER TABLE `entidad_historial` DISABLE KEYS */;
INSERT INTO `entidad_historial` VALUES
(1,'Inicio de Sesión','Usuario','2026-09-20 17:51:40.212800',1),
(2,'Cierre de Sesión','Usuario','2026-09-20 17:55:30.959007',1),
(3,'Inicio de Sesión','Usuario','2026-09-20 18:05:19.282606',2),
(4,'Registro de Servicio','Servicio','2026-09-20 18:06:42.726610',2),
(5,'Modificación de Servicio','Servicio','2026-09-20 18:27:43.483472',2),
(6,'Eliminación de Servicio','Servicio','2026-09-20 18:32:25.691760',2),
(7,'Cierre de Sesión','Usuario','2026-09-20 18:36:23.538946',2),
(8,'Inicio de Sesión','Usuario','2026-09-20 18:36:30.817620',1),
(9,'Registro de Servicio Contratado','ServicioContratado','2026-09-20 18:37:07.978549',1),
(10,'Inicio de Sesión','Usuario','2026-09-20 18:41:10.677358',1),
(11,'Modificación de Servicio Contratado','ServicioContratado','2026-09-20 18:41:34.349026',1),
(12,'Eliminación de Servicio Contratado','ServicioContratado','2026-09-20 18:45:27.497843',1),
(13,'Eliminación de Servicio Contratado','ServicioContratado','2026-09-20 18:52:54.134224',1),
(14,'Eliminación de Servicio Contratado','ServicioContratado','2026-09-20 18:52:59.222626',1),
(15,'Inicio de Sesión','Usuario','2026-09-20 18:53:20.026732',1),
(16,'Cierre de Sesión','Usuario','2026-09-20 19:16:20.762455',1),
(17,'Inicio de Sesión','Usuario','2026-09-20 19:16:28.738733',2),
(18,'Cierre de Sesión','Usuario','2026-09-20 19:24:02.929358',2),
(19,'Inicio de Sesión','Usuario','2026-09-20 19:24:09.421190',1),
(20,'Cierre de Sesión','Usuario','2026-09-20 19:38:29.699838',1),
(21,'Inicio de Sesión','Usuario','2026-09-20 19:38:37.481646',2),
(22,'Registro de Servicio','Servicio','2026-09-20 19:39:41.149538',2),
(23,'Eliminación de Servicio','Servicio','2026-09-20 19:40:21.217068',2),
(24,'Cierre de Sesión','Usuario','2026-09-20 22:00:20.781598',2),
(25,'Inicio de Sesión','Usuario','2026-09-20 22:00:27.947744',1),
(26,'Registro de Servicio Contratado','ServicioContratado','2026-09-20 22:01:10.593595',1),
(27,'Registro de Servicio Contratado','ServicioContratado','2026-09-20 22:04:22.242773',1),
(28,'Eliminación de Servicio Contratado','ServicioContratado','2026-09-20 22:05:49.833723',1),
(29,'Eliminación de Servicio Contratado','ServicioContratado','2026-09-20 22:06:51.305219',1),
(30,'Cierre de Sesión','Usuario','2026-09-20 22:14:47.968123',1),
(31,'Inicio de Sesión','Usuario','2026-09-20 22:14:55.474773',2),
(32,'Cierre de Sesión','Usuario','2026-09-20 22:16:37.281774',2),
(33,'Inicio de Sesión','Usuario','2026-09-20 22:16:43.844737',1),
(34,'Inicio de Sesión','Usuario','2026-09-20 22:31:10.693081',2),
(35,'Cierre de Sesión','Usuario','2026-09-20 22:32:44.626821',2),
(36,'Inicio de Sesión','Usuario','2026-09-20 22:39:06.755738',2),
(37,'Cierre de Sesión','Usuario','2026-09-20 22:52:29.396951',2),
(38,'Inicio de Sesión','Usuario','2026-09-20 22:52:36.291381',1),
(39,'Cierre de Sesión','Usuario','2026-09-20 23:18:23.169299',1),
(40,'Inicio de Sesión','Usuario','2026-09-20 23:30:05.669147',2),
(41,'Modificación de Servicio','Servicio','2026-09-20 23:42:38.446855',2),
(42,'Modificación de Servicio','Servicio','2026-09-20 23:46:51.895750',2),
(43,'Modificación de Servicio','Servicio','2026-09-20 23:48:25.078440',2),
(44,'Modificación de Servicio','Servicio','2026-09-20 23:48:40.453645',2),
(45,'Modificación de Servicio','Servicio','2026-09-20 23:53:40.234716',2),
(46,'Cierre de Sesión','Usuario','2026-09-20 23:54:48.398699',2),
(47,'Inicio de Sesión','Usuario','2026-09-20 23:54:54.939611',1),
(48,'Modificación de Servicio Contratado','ServicioContratado','2026-09-20 23:56:49.895714',1),
(49,'Modificación de Servicio Contratado','ServicioContratado','2026-09-21 00:04:11.165045',1),
(50,'Registro de Servicio Contratado','ServicioContratado','2026-09-21 00:05:34.032889',1),
(51,'Eliminación de Servicio Contratado','ServicioContratado','2026-09-21 00:13:05.316113',1),
(52,'Cierre de Sesión','Usuario','2026-09-21 00:15:09.378330',1),
(53,'Inicio de Sesión','Usuario','2026-09-21 00:15:15.927538',2),
(54,'Registro de Servicio','Servicio','2026-09-21 00:16:22.603241',2),
(55,'Eliminación de Servicio','Servicio','2026-09-21 00:19:50.860654',2),
(56,'Inicio de Sesión','Usuario','2026-09-21 11:12:04.551095',1);
/*!40000 ALTER TABLE `entidad_historial` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `entidad_servicio`
--

DROP TABLE IF EXISTS `entidad_servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `entidad_servicio` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `numero` int(11) NOT NULL,
  `cliente` longtext NOT NULL,
  `empresa` longtext NOT NULL,
  `precio_instalacion` int(11) NOT NULL,
  `servicio_contratado_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `entidad_servicio_servicio_contratado__522d2526_fk_entidad_s` (`servicio_contratado_id`),
  CONSTRAINT `entidad_servicio_servicio_contratado__522d2526_fk_entidad_s` FOREIGN KEY (`servicio_contratado_id`) REFERENCES `entidad_serviciocontratado` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entidad_servicio`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `entidad_servicio` WRITE;
/*!40000 ALTER TABLE `entidad_servicio` DISABLE KEYS */;
INSERT INTO `entidad_servicio` VALUES
(1,1001,'Cliente modificado','Empresa de Prueba',25000,1);
/*!40000 ALTER TABLE `entidad_servicio` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `entidad_serviciocontratado`
--

DROP TABLE IF EXISTS `entidad_serviciocontratado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `entidad_serviciocontratado` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre_servicio` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entidad_serviciocontratado`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `entidad_serviciocontratado` WRITE;
/*!40000 ALTER TABLE `entidad_serviciocontratado` DISABLE KEYS */;
INSERT INTO `entidad_serviciocontratado` VALUES
(1,'INSTALACIÓN INTERNET'),
(2,'INSTALACIÓN TELEVISIÓN'),
(3,'INSTALACIÓN TELEFONÍA');
/*!40000 ALTER TABLE `entidad_serviciocontratado` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `entidad_usuario`
--

DROP TABLE IF EXISTS `entidad_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `entidad_usuario` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre_usuario` longtext NOT NULL,
  `password_usuario` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entidad_usuario`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `entidad_usuario` WRITE;
/*!40000 ALTER TABLE `entidad_usuario` DISABLE KEYS */;
INSERT INTO `entidad_usuario` VALUES
(1,'ADMIN','123'),
(2,'OPERADOR','321');
/*!40000 ALTER TABLE `entidad_usuario` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Dumping routines for database 'eva_django'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2026-09-22 19:33:25
