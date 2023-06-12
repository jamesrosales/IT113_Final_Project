-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: extensionsys
-- ------------------------------------------------------
-- Server version	8.0.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'Facilitator'),(2,'Participant');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,13),(6,1,14),(7,1,15),(8,1,16),(9,1,17),(10,1,18),(11,1,19),(12,1,20),(13,1,21),(14,1,23),(15,1,24),(16,1,25),(17,1,27),(18,1,28),(19,1,29),(20,1,30),(21,1,31),(22,1,32),(23,1,33),(24,1,34),(25,1,35),(26,1,36),(27,1,37),(28,1,38),(29,1,39),(30,1,40),(31,1,41),(32,1,42),(33,1,43),(34,1,44),(35,1,45),(36,1,46),(37,1,47),(38,1,48),(39,1,49),(40,1,50),(41,1,51),(42,1,52),(43,1,53),(44,1,54),(45,1,55),(46,1,56),(47,1,57),(48,1,58),(49,1,59),(50,1,60),(51,1,61),(52,1,62),(53,1,63),(54,1,64),(55,1,65),(56,1,66),(57,1,67),(58,1,68),(61,1,72),(62,1,73),(63,1,74),(64,1,75),(65,1,76),(66,1,77),(67,1,78),(68,1,79),(69,1,80),(70,1,83),(71,1,84),(94,1,85),(95,1,86),(96,1,87),(93,1,88),(92,1,92),(89,1,93),(90,1,94),(91,1,95),(88,1,96),(72,2,32),(73,2,36),(78,2,44),(80,2,48),(86,2,56),(87,2,60),(74,2,68),(75,2,69),(76,2,70),(77,2,72),(79,2,76),(85,2,80),(81,2,81),(82,2,82),(83,2,83),(84,2,84);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',3,'add_logentry'),(2,'Can change log entry',3,'change_logentry'),(3,'Can delete log entry',3,'delete_logentry'),(4,'Can view log entry',3,'view_logentry'),(5,'Can add permission',4,'add_permission'),(6,'Can change permission',4,'change_permission'),(7,'Can delete permission',4,'delete_permission'),(8,'Can view permission',4,'view_permission'),(9,'Can add group',1,'add_group'),(10,'Can change group',1,'change_group'),(11,'Can delete group',1,'delete_group'),(12,'Can view group',1,'view_group'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can view content type',5,'view_contenttype'),(17,'Can add session',6,'add_session'),(18,'Can change session',6,'change_session'),(19,'Can delete session',6,'delete_session'),(20,'Can view session',6,'view_session'),(21,'Can add user',2,'add_user'),(22,'Can change user',2,'change_user'),(23,'Can delete user',2,'delete_user'),(24,'Can view user',2,'view_user'),(25,'Can add User Profile',7,'add_userprofile'),(26,'Can change User Profile',7,'change_userprofile'),(27,'Can delete User Profile',7,'delete_userprofile'),(28,'Can view User Profile',7,'view_userprofile'),(29,'Can add Extension Program',8,'add_extensionprogram'),(30,'Can change Extension Program',8,'change_extensionprogram'),(31,'Can delete Extension Program',8,'delete_extensionprogram'),(32,'Can view Extension Program',8,'view_extensionprogram'),(33,'Can add Extension Program Files',9,'add_extensionprogram_files'),(34,'Can change Extension Program Files',9,'change_extensionprogram_files'),(35,'Can delete Extension Program Files',9,'delete_extensionprogram_files'),(36,'Can view Extension Program Files',9,'view_extensionprogram_files'),(37,'Can add Extension Program Member',10,'add_extensionprogram_member'),(38,'Can change Extension Program Member',10,'change_extensionprogram_member'),(39,'Can delete Extension Program Member',10,'delete_extensionprogram_member'),(40,'Can view Extension Program Member',10,'view_extensionprogram_member'),(41,'Can add Extension Projects',11,'add_extensionproject'),(42,'Can change Extension Projects',11,'change_extensionproject'),(43,'Can delete Extension Projects',11,'delete_extensionproject'),(44,'Can view Extension Projects',11,'view_extensionproject'),(45,'Can add Extension Project Files',12,'add_extensionproject_files'),(46,'Can change Extension Project Files',12,'change_extensionproject_files'),(47,'Can delete Extension Project Files',12,'delete_extensionproject_files'),(48,'Can view Extension Project Files',12,'view_extensionproject_files'),(49,'Can add Extension Project Member',13,'add_extensionproject_member'),(50,'Can change Extension Project Member',13,'change_extensionproject_member'),(51,'Can delete Extension Project Member',13,'delete_extensionproject_member'),(52,'Can view Extension Project Member',13,'view_extensionproject_member'),(53,'Can add Category',14,'add_category'),(54,'Can change Category',14,'change_category'),(55,'Can delete Category',14,'delete_category'),(56,'Can view Category',14,'view_category'),(57,'Can add Workshop',15,'add_workshop'),(58,'Can change Workshop',15,'change_workshop'),(59,'Can delete Workshop',15,'delete_workshop'),(60,'Can view Workshop',15,'view_workshop'),(61,'Can add Workshop Partcipant',16,'add_workshopparticipant'),(62,'Can change Workshop Partcipant',16,'change_workshopparticipant'),(63,'Can delete Workshop Partcipant',16,'delete_workshopparticipant'),(64,'Can view Workshop Partcipant',16,'view_workshopparticipant'),(65,'Can add Lesson',17,'add_lesson'),(66,'Can change Lesson',17,'change_lesson'),(67,'Can delete Lesson',17,'delete_lesson'),(68,'Can view Lesson',17,'view_lesson'),(69,'Can add Lesson Completed',18,'add_lesson_completed'),(70,'Can change Lesson Completed',18,'change_lesson_completed'),(71,'Can delete Lesson Completed',18,'delete_lesson_completed'),(72,'Can view Lesson Completed',18,'view_lesson_completed'),(73,'Can add Lesson File',19,'add_lessonfile'),(74,'Can change Lesson File',19,'change_lessonfile'),(75,'Can delete Lesson File',19,'delete_lessonfile'),(76,'Can view Lesson File',19,'view_lessonfile'),(77,'Can add Lesson Activity',20,'add_lessonactivity'),(78,'Can change Lesson Activity',20,'change_lessonactivity'),(79,'Can delete Lesson Activity',20,'delete_lessonactivity'),(80,'Can view Lesson Activity',20,'view_lessonactivity'),(81,'Can add Activity Output',21,'add_activityoutput'),(82,'Can change Activity Output',21,'change_activityoutput'),(83,'Can delete Activity Output',21,'delete_activityoutput'),(84,'Can view Activity Output',21,'view_activityoutput'),(85,'Can add blog',22,'add_blog'),(86,'Can change blog',22,'change_blog'),(87,'Can delete blog',22,'delete_blog'),(88,'Can view blog',22,'view_blog'),(89,'Can add Workshop Completed',23,'add_workshop_completed'),(90,'Can change Workshop Completed',23,'change_workshop_completed'),(91,'Can delete Workshop Completed',23,'delete_workshop_completed'),(92,'Can view Workshop Completed',23,'view_workshop_completed'),(93,'Can add Workshop Facilitator',24,'add_workshopfacilitator'),(94,'Can change Workshop Facilitator',24,'change_workshopfacilitator'),(95,'Can delete Workshop Facilitator',24,'delete_workshopfacilitator'),(96,'Can view Workshop Facilitator',24,'view_workshopfacilitator');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_blog`
--

DROP TABLE IF EXISTS `blog_blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_blog` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `shortdescription` varchar(250) DEFAULT NULL,
  `header_image` varchar(100) DEFAULT NULL,
  `body` longtext,
  `tags` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `modified_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_blog`
--

LOCK TABLES `blog_blog` WRITE;
/*!40000 ALTER TABLE `blog_blog` DISABLE KEYS */;
INSERT INTO `blog_blog` VALUES (1,'Blog 1','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.','blog/header_images/6910747.png','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>','tag1, tag2, tag3, tag4, tag5','2022-09-24 06:14:04.633673','2022-09-24 06:14:15.830978'),(2,'Blog 2','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.','blog/header_images/6910747_VdIgx00.png','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>','tag1, tag2, tag3, tag4, tag5','2022-09-24 06:16:09.335599','2022-09-24 06:16:55.244945');
/*!40000 ALTER TABLE `blog_blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_registrations_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_registrations_user_id` FOREIGN KEY (`user_id`) REFERENCES `registrations_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=411 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (37,'2022-09-19 13:27:27.284477','3','Workshop 3',1,'[{\"added\": {}}]',15,2),(38,'2022-09-19 23:18:36.814182','1','Workshop 1',2,'[{\"changed\": {\"fields\": [\"Facilitator\"]}}]',15,3),(39,'2022-09-19 23:18:45.994181','2','Workshop 2',2,'[{\"changed\": {\"fields\": [\"Facilitator\"]}}]',15,3),(40,'2022-09-19 23:18:55.368311','3','Workshop 3',2,'[]',15,3),(41,'2022-09-19 23:23:51.349772','1','Workshop 1',2,'[{\"changed\": {\"fields\": [\"Author\"]}}]',15,3),(42,'2022-09-19 23:28:12.222268','2','Workshop 2',2,'[{\"changed\": {\"fields\": [\"Author\"]}}]',15,3),(174,'2022-09-24 01:16:09.730881','119','jaymontero17@gmail.com',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]',2,119),(175,'2022-09-24 01:16:54.013864','120','faci4@gmail.com',1,'[{\"added\": {}}]',2,119),(176,'2022-09-24 01:17:11.839505','120','faci4@gmail.com',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]',2,119),(177,'2022-09-24 06:14:04.643667','1','Blog',1,'[{\"added\": {}}]',22,119),(178,'2022-09-24 06:14:15.841978','1','Blog 1',2,'[{\"changed\": {\"fields\": [\"Title\"]}}]',22,119),(179,'2022-09-24 06:16:09.341600','2','Blog 2',1,'[{\"added\": {}}]',22,119),(180,'2022-09-24 06:16:55.257949','2','Blog 2',2,'[]',22,119),(181,'2022-09-24 08:05:55.521414','120','faci4@gmail.com',2,'[{\"changed\": {\"fields\": [\"Staff status\", \"Is facilitator\", \"Groups\"]}}]',2,119),(182,'2022-09-24 13:03:06.771338','1','Lesson_Completed object (1)',1,'[{\"added\": {}}]',18,119),(183,'2022-09-25 02:38:14.672754','1','Lesson_Completed object (1)',2,'[{\"changed\": {\"fields\": [\"Is taken\"]}}]',18,119),(184,'2022-09-25 02:42:32.129705','2','Lesson 2',1,'[{\"added\": {}}]',17,119),(185,'2022-09-25 03:42:17.250393','2','Participant Two',3,'',16,119),(186,'2022-09-25 11:01:06.389445','2','Category 2',1,'[{\"added\": {}}]',14,119),(187,'2022-09-25 11:01:18.473293','3','Category 3',1,'[{\"added\": {}}]',14,119),(188,'2022-09-25 11:01:30.804062','4','Category 4',1,'[{\"added\": {}}]',14,119),(189,'2022-09-25 11:01:39.898710','5','Category 5',1,'[{\"added\": {}}]',14,119),(190,'2022-09-25 11:01:41.449766','6','Category 5',1,'[{\"added\": {}}]',14,119),(191,'2022-09-26 13:28:57.797563','3','Added by Facilitator One',1,'[{\"added\": {}}]',8,2),(192,'2022-09-26 13:29:42.888496','3','Added by Facilitator One',3,'',8,2),(194,'2022-09-26 14:44:11.322909','1','Facilitator',2,'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',1,119),(195,'2022-09-26 15:15:46.602898','1','Facilitator',2,'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',1,119),(196,'2022-09-26 21:28:18.627031','2','Lesson 2',3,'',17,119),(197,'2022-09-26 21:28:18.643026','1','Lesson 1',3,'',17,119),(198,'2022-09-26 21:28:30.983730','2','PowerPoint Lesson File',3,'',19,119),(199,'2022-09-26 21:28:30.991729','1','Document Lesson File',3,'',19,119),(200,'2022-09-26 21:28:41.968383','1','Lesson 1 Activity 1',3,'',20,119),(201,'2022-09-26 22:24:35.737750','3','Facilitator Three',3,'',10,119),(202,'2022-09-26 22:24:35.761748','2','Facilitator Two',3,'',10,119),(203,'2022-09-26 22:24:35.769786','1','Facilitator One',3,'',10,119),(204,'2022-09-26 22:31:06.139186','1','Participant One',3,'',16,119),(205,'2022-09-27 13:27:51.426759','1','Smart Learning Technologies (Education 4.0)',2,'[{\"changed\": {\"fields\": [\"Name\", \"Description\"]}}]',14,119),(206,'2022-09-27 13:29:26.716520','2','Data Analytics and Business Intelligence',2,'[{\"changed\": {\"fields\": [\"Name\", \"Description\"]}}]',14,119),(207,'2022-09-27 13:29:53.288292','3','ICT Support for Sustainable Development',2,'[{\"changed\": {\"fields\": [\"Name\", \"Description\"]}}]',14,119),(208,'2022-09-27 13:30:34.244665','4','Cyber Intelligent Systems',2,'[{\"changed\": {\"fields\": [\"Name\", \"Description\"]}}]',14,119),(209,'2022-09-27 13:30:48.997905','5','Category 5',3,'',14,119),(210,'2022-09-27 13:30:59.056266','6','Category 5',3,'',14,119),(211,'2022-09-27 13:32:26.909979','3','Workshop 3',3,'',15,119),(212,'2022-09-27 13:32:26.925053','2','Workshop 2',3,'',15,119),(213,'2022-09-27 13:32:26.934029','1','Workshop 1',3,'',15,119),(214,'2022-09-29 03:23:14.270795','4','Workshop 1 in Extension Project 1 in Extension Program 1',1,'[{\"added\": {}}]',15,119),(215,'2022-10-11 11:53:09.163462','1','Sample Program File 1',1,'[{\"added\": {}}]',9,119),(216,'2022-10-11 12:01:30.060570','1','Sample Program File 1',3,'',9,119),(217,'2022-10-11 12:02:03.055281','4','Facilitator One',1,'[{\"added\": {}}]',10,119),(218,'2022-10-15 01:43:53.404167','4','Facilitator One',3,'',10,119),(219,'2022-10-15 01:52:02.133452','5','Extension Program by Facilitator 1',1,'[{\"added\": {}}]',8,2),(220,'2022-10-15 01:52:44.798722','5','Extension Program by Facilitator 1',3,'',8,119),(221,'2022-10-15 01:55:33.698294','6','Extension Program by Facilitator 1',1,'[{\"added\": {}}]',8,2),(222,'2022-10-15 01:57:41.124484','6','Extension Program by Facilitator 1',3,'',8,119),(223,'2022-10-15 01:58:24.621925','7','Extension Program by Facilitator 1',1,'[{\"added\": {}}]',8,2),(224,'2022-10-15 01:59:56.352708','7','Extension Program by Facilitator 1',3,'',8,119),(225,'2022-10-15 02:00:33.664273','8','Extension Program by Faci 1',1,'[{\"added\": {}}]',8,2),(226,'2022-10-15 02:03:48.452874','9','werrwerwe',1,'[{\"added\": {}}]',8,2),(227,'2022-10-15 02:04:16.332035','9','werrwerwe',3,'',8,119),(228,'2022-10-15 02:04:16.347030','8','Extension Program by Faci 1',3,'',8,119),(229,'2022-10-15 02:15:58.154934','10','sfsfe',1,'[{\"added\": {}}]',8,2),(230,'2022-10-15 02:16:21.145568','10','sfsfe',3,'',8,119),(231,'2022-10-15 02:17:30.189514','11','qweqeqw',1,'[{\"added\": {}}]',8,2),(232,'2022-10-15 02:24:43.144801','12','sfsfsd',1,'[{\"added\": {}}]',8,2),(233,'2022-10-15 02:25:26.839217','12','sfsfsd',3,'',8,119),(234,'2022-10-15 02:25:26.856225','11','qweqeqw',3,'',8,119),(235,'2022-10-15 02:30:20.018282','13','we s es',1,'[{\"added\": {}}]',8,2),(236,'2022-10-15 02:30:40.719784','13','we s es',3,'',8,2),(237,'2022-10-15 02:38:58.124091','14','sfsfsdf',1,'[{\"added\": {}}]',8,2),(238,'2022-10-15 02:40:37.211075','14','sfsfsdf',3,'',8,119),(239,'2022-10-15 02:40:58.863251','15','esfdeses',1,'[{\"added\": {}}]',8,2),(240,'2022-10-15 02:47:06.988163','16','asdsadsa',1,'[{\"added\": {}}]',8,2),(241,'2022-10-15 02:47:50.292027','16','asdsadsa',3,'',8,119),(242,'2022-10-15 02:47:50.307021','15','esfdeses',3,'',8,119),(243,'2022-10-15 02:50:10.175625','17','wqewqewqe',1,'[{\"added\": {}}]',8,2),(244,'2022-10-15 02:51:26.116505','17','wqewqewqe',3,'',8,119),(245,'2022-10-15 02:56:27.563083','18','sfsdfsd',1,'[{\"added\": {}}]',8,2),(246,'2022-10-15 02:57:45.887240','18','sfsdfsd',3,'',8,2),(247,'2022-10-15 02:58:04.583818','19','sfsdfsd',1,'[{\"added\": {}}]',8,2),(248,'2022-10-15 03:00:50.617625','19','sfsdfsd',2,'[]',8,2),(249,'2022-10-15 04:09:02.529837','20','sddsfdsf',1,'[{\"added\": {}}]',8,2),(250,'2022-10-15 04:32:08.533060','20','sddsfdsf',2,'[{\"changed\": {\"fields\": [\"Co facilitator\"]}}]',8,2),(251,'2022-10-15 05:55:55.886270','20','sddsfdsf',2,'[]',8,3),(252,'2022-10-15 05:58:45.072026','19','sfsdfsd',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',8,2),(253,'2022-10-15 05:59:49.346505','19','sfsdfsd',2,'[{\"changed\": {\"fields\": [\"Co facilitator\"]}}]',8,2),(254,'2022-10-15 06:01:21.813550','20','sddsfdsf',3,'',8,119),(255,'2022-10-15 06:01:21.824540','19','sfsdfsd',3,'',8,119),(256,'2022-10-15 06:07:09.535161','2','Extension Program 1 File 1',1,'[{\"added\": {}}]',9,119),(257,'2022-10-15 15:45:35.433193','1','Extension Project 1 File 1',1,'[{\"added\": {}}]',12,119),(258,'2022-10-25 02:55:59.333752','2','Extension Program 2',3,'',8,119),(259,'2022-10-25 02:55:59.351752','1','Extension Program 1',3,'',8,119),(260,'2022-10-25 02:56:12.960940','2','Extension Program 1 File 1',3,'',9,119),(261,'2022-10-25 02:56:28.903176','1','Extension Project 1 File 1',3,'',12,119),(262,'2022-10-25 02:56:49.161642','2','Extension Project 2',3,'',11,119),(263,'2022-10-25 02:56:49.174670','1','Extension Project 1',3,'',11,119),(264,'2022-10-25 03:17:37.096794','129','Sage Wieser',3,'',7,119),(265,'2022-10-25 03:17:37.123794','128','Leota Dilliard',3,'',7,119),(266,'2022-10-25 03:17:37.131794','127','Mitsue Tollner',3,'',7,119),(267,'2022-10-25 03:17:37.137790','126','Simona Morasca',3,'',7,119),(268,'2022-10-25 03:17:37.145799','125','Donette Foller',3,'',7,119),(269,'2022-10-25 03:17:37.154810','124','Lenna Paprocki',3,'',7,119),(270,'2022-10-25 03:17:37.161511','123','Art Venere',3,'',7,119),(271,'2022-10-25 03:17:37.169221','122','Josephine Darakjy',3,'',7,119),(272,'2022-10-25 03:17:37.174224','121','James Butt',3,'',7,119),(273,'2022-10-25 03:18:02.383793','123','art@venere.org',3,'',2,119),(274,'2022-10-25 03:18:02.391681','121','butt@gmail.com',3,'',2,119),(275,'2022-10-25 03:18:02.397684','125','donette.foller@cox.net',3,'',2,119),(276,'2022-10-25 03:18:02.402690','122','josephine_darakjy@darakjy.org',3,'',2,119),(277,'2022-10-25 03:18:02.406879','128','leota@hotmail.com',3,'',2,119),(278,'2022-10-25 03:18:02.413734','124','lpaprocki@hotmail.com',3,'',2,119),(279,'2022-10-25 03:18:02.420418','127','mitsue_tollner@yahoo.com',3,'',2,119),(280,'2022-10-25 03:18:02.425422','129','sage_wieser@cox.net',3,'',2,119),(281,'2022-10-25 03:18:02.430415','126','simona@morasca.com',3,'',2,119),(282,'2022-10-25 04:03:20.459597','4','Workshop 1 in Extension Project 1 in Extension Program 1',3,'',15,119),(283,'2022-10-29 13:35:00.995705','21','Extension Program 1',1,'[{\"added\": {}}]',8,2),(284,'2022-10-29 13:35:57.151213','3','Extension Program 1 File 1',1,'[{\"added\": {}}]',9,2),(285,'2022-10-29 13:36:18.339086','5','Facilitator Two',1,'[{\"added\": {}}]',10,2),(286,'2022-10-29 13:37:12.743902','6','Facilitator One',1,'[{\"added\": {}}]',10,2),(287,'2022-10-29 13:38:00.476205','6','Facilitator One',2,'[{\"changed\": {\"fields\": [\"Is leader\"]}}]',10,2),(288,'2022-10-29 13:42:46.440218','3','Extension Project 1 of Extension Program 1.',1,'[{\"added\": {}}]',11,2),(289,'2022-10-29 13:43:40.378078','2','Extension Project 1 of Extension Program 1 File 1',1,'[{\"added\": {}}]',12,2),(290,'2022-10-29 13:43:53.437578','3','Extension Project 1 of Extension Program 1',2,'[{\"changed\": {\"fields\": [\"Title\"]}}]',11,2),(291,'2022-10-29 13:44:20.401710','3','Facilitator Two',1,'[{\"added\": {}}]',13,2),(292,'2022-10-29 13:44:30.558943','4','Facilitator One',1,'[{\"added\": {}}]',13,2),(293,'2022-10-29 13:45:13.659105','5','Workshop 1 of  Extension Project 1',1,'[{\"added\": {}}]',15,2),(294,'2022-10-29 13:45:44.739060','1','Facilitator Two',1,'[{\"added\": {}}]',24,2),(295,'2022-10-29 13:46:01.504520','16','Participant One',1,'[{\"added\": {}}]',16,2),(296,'2022-10-29 13:46:43.491085','3','Lesson 1 of Workshop 1 of Extension Project 1',1,'[{\"added\": {}}]',17,2),(297,'2022-10-29 13:47:33.436658','3','Lesson File 1 of Lesson 1',1,'[{\"added\": {}}]',19,2),(298,'2022-10-29 13:49:07.208817','2','Lesson Activity 1 of Lesson 1',1,'[{\"added\": {}}]',20,2),(299,'2022-10-30 13:31:52.778398','17','Participant Two',1,'[{\"added\": {}}]',16,119),(300,'2022-10-30 14:58:53.501131','17','Participant Two',3,'',16,119),(301,'2022-10-30 15:08:05.213936','18','Participant Two',1,'[{\"added\": {}}]',16,119),(302,'2022-10-30 15:08:55.000079','18','Participant Two',3,'',16,119),(303,'2022-10-30 15:09:17.473152','19','Participant Two',1,'[{\"added\": {}}]',16,119),(304,'2022-11-01 04:20:27.621413','2','Lesson Activity 1 of Lesson 1',2,'[{\"changed\": {\"fields\": [\"Deadline\"]}}]',20,119),(305,'2022-11-01 04:21:46.389079','2','Lesson Activity 1 of Lesson 1',2,'[{\"changed\": {\"fields\": [\"Deadline\"]}}]',20,119),(306,'2022-11-01 05:18:54.292494','2','Participant 2 Activity Output for Lesson Activity 1 of Lesson 1',3,'',21,119),(307,'2022-11-01 05:18:54.329479','1','Participant 2 Activity Output for Lesson Activity 1 of Lesson 1',3,'',21,119),(308,'2022-11-01 12:06:11.291985','4','Participant 2 Activity Output for Lesson Activity 1 of Lesson 1',3,'',21,119),(309,'2022-11-01 12:06:11.323973','3','Participant 2 Activity Output for Lesson Activity 1 of Lesson 1',3,'',21,119),(310,'2022-12-20 01:53:35.794232','6','Workshop 2 of Extension Project 1',1,'[{\"added\": {}}]',15,119),(311,'2022-12-20 01:53:49.865602','7','Workshop 3 of Extension Project 1',1,'[{\"added\": {}}]',15,119),(312,'2022-12-20 01:54:03.914518','8','Workshop 4 of Extension Project 1',1,'[{\"added\": {}}]',15,119),(313,'2022-12-20 01:54:26.279459','9','Workshop 5 of Extension Project 1',1,'[{\"added\": {}}]',15,119),(314,'2022-12-20 01:54:37.809270','8','Workshop 4 of Extension Project 1',2,'[{\"changed\": {\"fields\": [\"Duration\"]}}]',15,119),(315,'2022-12-20 01:54:46.086627','7','Workshop 3 of Extension Project 1',2,'[{\"changed\": {\"fields\": [\"Duration\"]}}]',15,119),(316,'2022-12-20 01:54:54.529353','6','Workshop 2 of Extension Project 1',2,'[{\"changed\": {\"fields\": [\"Duration\"]}}]',15,119),(317,'2022-12-20 01:58:31.764870','6','Workshop 2 of Extension Project 1',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',15,119),(318,'2022-12-20 01:58:45.376210','7','Workshop 3 of Extension Project 1',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',15,119),(319,'2022-12-20 01:58:56.606118','8','Workshop 4 of Extension Project 1',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',15,119),(320,'2022-12-20 01:59:06.614920','9','Workshop 5 of Extension Project 1',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',15,119),(321,'2022-12-20 02:15:43.906159','5','Workshop 1 of  Extension Project 1',2,'[{\"changed\": {\"fields\": [\"Category\"]}}]',15,119),(322,'2022-12-20 02:16:15.166134','5','Workshop 1 of  Extension Project 1',2,'[{\"changed\": {\"fields\": [\"Category\"]}}]',15,119),(323,'2022-12-27 07:37:35.874568','3','Extension Project 1 of Extension Program 1',2,'[{\"changed\": {\"fields\": [\"Co facilitator\"]}}]',11,119),(324,'2022-12-27 07:38:34.190671','3','Facilitator Two',2,'[]',13,119),(325,'2022-12-27 07:51:40.848293','6','Facilitator One',2,'[{\"changed\": {\"fields\": [\"Is leader\"]}}]',10,2),(326,'2022-12-27 11:24:52.900801','5','Workshop 1 of  Extension Project 1',2,'[{\"changed\": {\"fields\": [\"Shortdescription\"]}}]',15,119),(327,'2022-12-27 11:59:27.559440','6','Workshop 2 of Extension Project 1',2,'[{\"changed\": {\"fields\": [\"Added by\"]}}]',15,119),(328,'2022-12-27 12:01:22.371604','5','Workshop 1 of  Extension Project 1',2,'[{\"changed\": {\"fields\": [\"Added by\", \"Co facilitator\"]}}]',15,119),(329,'2022-12-27 12:02:01.016494','5','Workshop 1 of  Extension Project 1',2,'[{\"changed\": {\"fields\": [\"Added by\"]}}]',15,119),(330,'2022-12-27 12:02:36.376151','5','Workshop 1 of  Extension Project 1',2,'[{\"changed\": {\"fields\": [\"Added by\", \"Co facilitator\"]}}]',15,119),(331,'2022-12-27 12:06:38.493188','4','Facilitator One',2,'[{\"changed\": {\"fields\": [\"Is leader\"]}}]',13,119),(332,'2022-12-27 12:06:55.568791','2','Facilitator One',1,'[{\"added\": {}}]',24,119),(333,'2022-12-27 12:07:32.760642','4','Facilitator One',3,'',13,119),(334,'2022-12-27 12:28:57.355751','6','Facilitator One',2,'[{\"changed\": {\"fields\": [\"Is leader\"]}}]',10,119),(335,'2022-12-27 12:29:15.040687','5','Facilitator One',1,'[{\"added\": {}}]',13,119),(336,'2022-12-27 12:32:06.812258','3','Facilitator Two',2,'[{\"changed\": {\"fields\": [\"Co facilitator\"]}}]',13,119),(337,'2022-12-27 13:04:54.506130','9','Workshop 5 of Extension Project 1',3,'',15,119),(338,'2022-12-27 13:04:54.538131','8','Workshop 4 of Extension Project 1',3,'',15,119),(339,'2022-12-27 13:04:54.546131','7','Workshop 3 of Extension Project 1',3,'',15,119),(340,'2022-12-27 13:04:54.554131','6','Workshop 2 of Extension Project 1',3,'',15,119),(341,'2022-12-27 13:04:54.554131','5','Workshop 1 of  Extension Project 1',3,'',15,119),(342,'2022-12-27 13:05:03.733473','3','Lesson File 1 of Lesson 1',3,'',19,119),(343,'2022-12-27 13:05:12.019455','19','Participant Two',3,'',16,119),(344,'2022-12-27 13:05:12.043487','16','Participant One',3,'',16,119),(345,'2022-12-27 13:05:23.969441','3','Lesson 1 of Workshop 1 of Extension Project 1',3,'',17,119),(346,'2022-12-27 13:05:31.678078','2','Lesson Activity 1 of Lesson 1',3,'',20,119),(347,'2022-12-27 13:06:06.618372','3','Extension Project 1 of Extension Program 1',3,'',11,119),(348,'2022-12-27 13:06:15.220112','2','Extension Project 1 of Extension Program 1 File 1',3,'',12,119),(349,'2022-12-27 13:06:22.354320','21','Extension Program 1',3,'',8,119),(350,'2022-12-27 13:06:34.170396','6','Facilitator One',3,'',10,119),(351,'2022-12-27 13:06:34.170396','5','Facilitator Two',3,'',10,119),(352,'2022-12-27 13:06:42.266556','3','Extension Program 1 File 1',3,'',9,119),(353,'2022-12-29 02:06:28.891852','22','Extension Program 1',1,'[{\"added\": {}}]',8,2),(354,'2022-12-29 02:14:05.929901','23','Workshop 1',1,'[{\"added\": {}}]',8,2),(355,'2022-12-29 02:15:23.065331','24','Workshop 1',1,'[{\"added\": {}}]',8,2),(356,'2022-12-29 02:16:24.845639','24','Workshop 1',3,'',8,2),(357,'2022-12-29 02:16:24.862346','23','Workshop 1',3,'',8,2),(358,'2022-12-29 02:48:46.808665','22','Extension Program 1',2,'[{\"changed\": {\"fields\": [\"Co facilitator\"]}}]',8,3),(359,'2022-12-29 02:49:19.923789','22','Extension Program 1',2,'[{\"changed\": {\"fields\": [\"Co facilitator\"]}}]',8,2),(360,'2022-12-29 02:50:00.736629','22','Extension Program 1',2,'[{\"changed\": {\"fields\": [\"Co facilitator\"]}}]',8,3),(361,'2022-12-29 03:02:11.871604','22','Extension Program 1',3,'',8,3),(362,'2022-12-29 03:02:11.887514','22','Extension Program 1',3,'',8,3),(363,'2022-12-29 03:03:03.970669','25','Extension Program 1',1,'[{\"added\": {}}]',8,2),(364,'2022-12-29 06:22:27.003987','26','Extension Program 2',1,'[{\"added\": {}}]',8,2),(365,'2022-12-29 06:22:38.044864','26','Extension Program 2',2,'[{\"changed\": {\"fields\": [\"Date added\"]}}]',8,2),(366,'2022-12-29 06:24:12.130138','25','Extension Program 1',2,'[]',8,2),(367,'2022-12-29 09:50:53.174143','4','Extension Project 1',1,'[{\"added\": {}}]',11,2),(368,'2022-12-29 09:52:07.755105','10','Workshop 1',1,'[{\"added\": {}}]',15,2),(369,'2022-12-29 09:56:38.353949','7','Facilitator One',1,'[{\"added\": {}}]',10,2),(370,'2022-12-29 09:56:55.658087','6','Facilitator One',1,'[{\"added\": {}}]',13,2),(371,'2022-12-29 09:57:05.979336','3','Facilitator One',1,'[{\"added\": {}}]',24,2),(372,'2022-12-29 09:57:27.286918','20','Participant One',1,'[{\"added\": {}}]',16,2),(373,'2022-12-29 09:58:05.476360','4','Lesson 1 of Workshop 1',1,'[{\"added\": {}}]',17,2),(374,'2022-12-29 09:59:36.017067','3','Lesson Activity 1 of Lesson 1',1,'[{\"added\": {}}]',20,2),(375,'2022-12-29 10:01:30.467483','6','participant2@gmail.com',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',2,119),(376,'2022-12-29 10:01:36.501884','6','participant2@gmail.com',2,'[]',2,119),(377,'2022-12-29 10:02:55.326850','5','participant1@gmail.com',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',2,119),(378,'2022-12-29 10:03:00.474360','5','participant1@gmail.com',2,'[]',2,119),(379,'2022-12-30 05:37:27.963729','1','Facilitator',2,'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',1,119),(380,'2022-12-30 06:04:13.625688','None','adasd',1,'[{\"added\": {}}]',21,119),(381,'2022-12-30 06:05:26.833816','None','ssdf',1,'[{\"added\": {}}]',21,119),(382,'2022-12-30 06:11:49.380801','5','cscsdc',1,'[{\"added\": {}}]',21,119),(383,'2022-12-30 06:12:02.752483','5','cscsdc',3,'',21,119),(384,'2022-12-30 08:09:38.021331','6','Sample Activity Output by Participant One',2,'[{\"changed\": {\"fields\": [\"File\"]}}]',21,119),(385,'2022-12-31 07:44:20.408771','6','Sample Activity Output by Participant One',3,'',21,119),(386,'2022-12-31 08:15:09.862051','7','asdsad',3,'',21,119),(387,'2023-01-02 06:09:07.487751','8','None',3,'',21,119),(388,'2023-01-02 06:23:55.733284','3','Lesson Activity 1 of Lesson 1',3,'',20,119),(389,'2023-01-02 06:32:53.136834','4','Lesson Activity 1 of Lesson 1',1,'[{\"added\": {}}]',20,2),(390,'2023-01-02 07:36:14.200508','4','Lesson 1 of Workshop 1',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',17,2),(391,'2023-01-02 07:44:00.532670','25','Extension Program 1',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',8,2),(392,'2023-01-02 07:44:08.806269','26','Extension Program 2',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',8,2),(393,'2023-01-02 07:44:21.888188','4','Extension Project 1',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',11,2),(394,'2023-01-02 07:44:32.251007','4','Lesson 1 of Workshop 1',2,'[]',17,2),(395,'2023-01-02 07:44:52.420363','10','Workshop 1',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',15,2),(396,'2023-01-02 07:58:27.676684','4','Lesson Activity 1 of Lesson 1',2,'[]',20,2),(397,'2023-01-02 07:59:35.495727','4','Lesson Activity 1 of Lesson 1',2,'[{\"changed\": {\"fields\": [\"Deadline\"]}}]',20,2),(398,'2023-01-03 00:07:52.781262','9','Sample Activity Output',3,'',21,119),(399,'2023-01-03 00:21:19.896707','15','sadsad',2,'[{\"changed\": {\"fields\": [\"File\"]}}]',21,119),(400,'2023-01-03 00:23:28.349120','15','sadsad',3,'',21,119),(401,'2023-01-04 07:48:16.027533','18','sfsdf',3,'',21,119),(402,'2023-01-04 07:49:26.780324','19','zsdf',3,'',21,119),(403,'2023-01-04 07:53:28.351591','20','SASFSDF',3,'',21,119),(404,'2023-01-04 08:08:00.582966','21','dsgdgfd',2,'[{\"changed\": {\"fields\": [\"File\"]}}]',21,119),(405,'2023-01-04 08:08:58.169842','21','dsgdgfd',3,'',21,119),(406,'2023-01-04 08:14:06.159595','22','eer',3,'',21,119),(407,'2023-01-04 08:14:42.495898','23','dfdf',3,'',21,119),(408,'2023-01-04 08:16:57.694417','24','eerer',2,'[{\"changed\": {\"fields\": [\"File\"]}}]',21,119),(409,'2023-01-04 08:18:35.886668','24','eerer',3,'',21,119),(410,'2023-01-04 08:24:27.230713','25','fgdfgfd',3,'',21,119);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (3,'admin','logentry'),(1,'auth','group'),(4,'auth','permission'),(22,'blog','blog'),(5,'contenttypes','contenttype'),(2,'registrations','user'),(7,'registrations','userprofile'),(6,'sessions','session'),(21,'workshop','activityoutput'),(14,'workshop','category'),(8,'workshop','extensionprogram'),(9,'workshop','extensionprogram_files'),(10,'workshop','extensionprogram_member'),(11,'workshop','extensionproject'),(12,'workshop','extensionproject_files'),(13,'workshop','extensionproject_member'),(17,'workshop','lesson'),(18,'workshop','lesson_completed'),(20,'workshop','lessonactivity'),(19,'workshop','lessonfile'),(15,'workshop','workshop'),(23,'workshop','workshop_completed'),(24,'workshop','workshopfacilitator'),(16,'workshop','workshopparticipant');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-09-15 06:24:30.470811'),(2,'contenttypes','0002_remove_content_type_name','2022-09-15 06:24:30.756798'),(3,'auth','0001_initial','2022-09-15 06:24:31.523805'),(4,'auth','0002_alter_permission_name_max_length','2022-09-15 06:24:31.822794'),(5,'auth','0003_alter_user_email_max_length','2022-09-15 06:24:31.847794'),(6,'auth','0004_alter_user_username_opts','2022-09-15 06:24:31.899799'),(7,'auth','0005_alter_user_last_login_null','2022-09-15 06:24:31.930800'),(8,'auth','0006_require_contenttypes_0002','2022-09-15 06:24:31.947801'),(9,'auth','0007_alter_validators_add_error_messages','2022-09-15 06:24:31.982795'),(10,'auth','0008_alter_user_username_max_length','2022-09-15 06:24:32.010803'),(11,'auth','0009_alter_user_last_name_max_length','2022-09-15 06:24:32.045795'),(12,'auth','0010_alter_group_name_max_length','2022-09-15 06:24:32.138798'),(13,'auth','0011_update_proxy_permissions','2022-09-15 06:24:32.175798'),(14,'auth','0012_alter_user_first_name_max_length','2022-09-15 06:24:32.214794'),(15,'registrations','0001_initial','2022-09-15 06:24:33.853028'),(16,'admin','0001_initial','2022-09-15 06:24:34.479034'),(17,'admin','0002_logentry_remove_auto_add','2022-09-15 06:24:34.531031'),(18,'admin','0003_logentry_add_action_flag_choices','2022-09-15 06:24:34.581030'),(19,'sessions','0001_initial','2022-09-15 06:24:34.814573'),(20,'users','0001_initial','2022-09-15 06:24:34.870574'),(21,'users','0002_alter_user_last_login_null','2022-09-15 06:24:34.913586'),(22,'workshop','0001_initial','2022-09-15 06:24:38.460426'),(23,'workshop','0002_auto_20220919_2028','2022-09-19 12:28:27.020273'),(24,'workshop','0003_auto_20220919_2030','2022-09-19 12:30:58.464349'),(25,'workshop','0004_auto_20220919_2107','2022-09-19 13:07:59.764853'),(26,'workshop','0005_auto_20220922_1154','2022-09-22 03:54:22.358268'),(27,'registrations','0002_auto_20220922_1521','2022-09-22 07:22:11.563778'),(28,'workshop','0006_auto_20220922_1528','2022-09-22 07:29:17.527986'),(29,'workshop','0007_auto_20220922_2343','2022-09-22 15:43:33.506676'),(30,'workshop','0008_auto_20220923_1157','2022-09-23 03:57:55.798485'),(31,'blog','0001_initial','2022-09-24 05:55:31.146555'),(32,'blog','0002_remove_blog_author','2022-09-24 06:10:26.004077'),(33,'workshop','0009_auto_20220924_2110','2022-09-24 13:10:28.155273'),(34,'workshop','0010_auto_20220925_1431','2022-09-25 06:32:07.322075'),(35,'workshop','0011_extensionprogram_added_by','2022-09-26 13:07:38.584858'),(36,'workshop','0012_auto_20220926_2222','2022-09-26 14:23:08.916876'),(37,'workshop','0013_auto_20220926_2310','2022-09-26 15:10:27.248340'),(38,'workshop','0014_auto_20220927_0516','2022-09-26 21:16:41.232233'),(39,'workshop','0015_rename_time_finished_workshopparticipant_time_updated','2022-09-26 21:25:18.034373'),(40,'workshop','0016_auto_20220927_2057','2022-09-27 12:57:33.401590'),(41,'workshop','0017_auto_20220927_2117','2022-09-27 13:18:23.251550'),(42,'workshop','0018_activityoutput_feedback','2022-09-27 13:18:23.454658'),(43,'workshop','0019_auto_20220930_1028','2022-09-30 02:30:05.325817'),(44,'workshop','0020_auto_20221225_2315','2022-12-25 15:15:17.169421'),(45,'workshop','0021_auto_20221229_1059','2022-12-29 03:00:09.902280'),(46,'workshop','0022_auto_20221229_1428','2022-12-29 06:28:40.490013'),(47,'workshop','0023_alter_activityoutput_score','2022-12-29 14:36:47.403923'),(48,'workshop','0024_lessonactivity_slug','2023-01-02 06:28:00.291728'),(49,'workshop','0025_alter_lessonactivity_slug','2023-01-02 07:01:10.435711'),(50,'workshop','0026_auto_20230102_1531','2023-01-02 07:32:03.313993');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0yzkibl2vc08dw887da4zepgttq0ttit','.eJxVjrluwzAQRP-FrWNiea1IlenduSd4rI5EEBGRqgz_eyTEhdPO8WYezIe9TX6vtPk5s54J4djHuxpD-qb1tPJXWMfCU1nbNkd-RvjLrfxWMi2fr-w_wBTqdLR1Z3TM1uSUo0UFwnQuWEUkFQlICYyMkFRHFBFVRDPkAQcVFWqDEumA_h040cUvZSx780uozW_0s1Ntx4gEqa4grqDvAntteuG4Beusu4DtAdjzF4KKTLc:1pCzOh:-dpDjTWFdWmS1cM3BUn6XrVm2n_HJI4caVsx0GCKB5I','2023-01-18 08:45:19.833797'),('3zw91freod4vseonyf87gxqw2wzjapfe','.eJxVjrkOwjAQRP_FLcSyd32ElPR09JaPDQGiWMROhfh3EkEB7Rxv5smcX-rglkKzuybWMSkPbP-rBh_vNG1WuvnpknnMU52vgW8R_nULP-VE4_Gb_QMMvgxrW1mtQmp1iim0BoXU9uBbJAIkKWIUGoKIaImCMRiM7lNvegxolDZgaIV-Dmzo7MZ8yUt1oy_VzfRYqNR1BARAI6EBOEvspOw0cmUtKtyJthOCvd6BN0ye:1p8Ds1:BMmo7SYAYTyhsCW8vLk6dl2qTAvWKOLKH3TKvVXBoqs','2023-01-05 05:11:53.530342'),('5okrj3gjnmfqtnzg9yy5rqhewhejfvln','.eJxVjrtywyAQRf-FNjGzsLBCKtOnS8_wWFl2NGIiUOXxv1sau4jb-zj33oQPW5v8Vnn1lywGoVQvPv-rMaRfXg4rX8NyLjKVpa2XKI-IfLlVfpfM89cr-waYQp32tumsidnZnHJ0hKBs1weHzBpZQUpgdYSEHXMkwkh2zCONGJGMJU28Q58HDnTxczmXrfk51OZX_tu4tn1Eg8YTqBOYH-UG4wY0knrlDHyAGwDE_QGCQkyr:1pD1Jy:Q_DSBXs_gxIvVOPlY2o8BTw2oBt98D0-W-rlNTT_JtE','2023-01-18 10:48:34.718847'),('6r6w57xio268nqp0ublxzmkacx13nqtr','.eJxVjr0SwiAQhN-FVmWOAxJIaW9nz3CAiZoJYyCV47ubjBba7s-3-2TOL3VwS0mzu0bWsYbtfzXy4Z6mzYg3P_WZhzzV-Up8i_CvW_gpxzQev9k_wODLsLaFBJ2iNmSFUfpCCARKE5KOwivZhlVRVia0ARpFxgf0FFSjdWqskXaFfg5s6OzG3OelutGX6ub0WFKp6wgC4kHgAeUZRQdtJzQ3RljAHZgOgL3e2ihLnA:1p8hlb:VEV-uj2bm8MdpOdQT-2fFJhwWChw2VErGSoa0uy-Yeg','2023-01-06 13:07:15.922677'),('8vlnrdvcxf5zdvxwwj87fsvp8q6q1yb2','.eJxVjrkOwjAQRP_FLWCtd2PnKOnp6C0fGwJEsYidCvHvJIIC2jnezFNYt5TBLplne42iE0q1Yv-rehfuPG1WvLnpkmRIU5mvXm4R-XWzPKXI4_Gb_QMMLg9ru6p15WOjY4i-MQRK161riBmJFYQAGj0Eqpm9MeSN7mNvevJkKm3Q8Ar9HNjQyY7pkpZiR5eLnfmxcC7rCALiQeEB2zNCB9gRyFpRpXAHTQcgXm-A-EyU:1pArcE:ARtlGFWhdqz5kIKjcv7L8XMhjKIn8udAYJ40YCppkGc','2023-01-12 12:02:30.733678'),('9votc3px6c3198bqlmye7uw5056kyr65','.eJxVjrluwzAQRP-FrWOC3CVXR5nenXuCx-pIBBERqcrwv0dCXDjtHG_mIZzf6-T2wpubk-iF1p34eFeDj9-8nlb68uuYZcxr3eYgz4h8uUXecuLl85X9B5h8mY62aawJqbUpptASKm2bzrfIDMhaxagsBBWxYQ5EGMgOaaABA5KxBMQH9O_Aic5uyWPeq1t8qW7jn51LPUZAAVw1XMHeAXvT9AalJuisvqi2V0o8fwGB_Uym:1p9TDz:p0eN-pRQZXDwFWKrG2xRrLmf6ChtmGgjRSsd3RtN0FY','2023-01-08 15:47:43.508077'),('acqiiogrr3g38zo32e8d3v5k7u3ervdx','.eJxVjrsSgjAQRf8lrZrJmw2lvZ19JiQbQBkyklA5_rswWmi593H2Ponzax3cWnBxYyQt4eT4q3U-3HHejXjzc59pyHNdxo7uEfp1C73kiNP5m_0DDL4MWzvZxooQQWFCzbgyQfsItovemCZBt50BFUiNSmmbpEmcg2AIRgYBEjboZ8COzm7KfV6rm3ypbsHHiqVuTwQT4sTsiesrh1bqljfUSFBCHBi0jJHXGyvfTDk:1oYmDF:lRwN83PuLWuzEc1EVhTGEUKtmnEX4LPt15N2lD0pNu8','2022-09-29 10:35:17.671417'),('cdgiswvuirdozfva2jwzs9nk4aeqwoy9','.eJxVjrkOwjAQRP_FLWCtd2PnKOnp6C0fGwJEsYidCvHvJIIC2jnezFNYt5TBLplne42iE0q1Yv-rehfuPG1WvLnpkmRIU5mvXm4R-XWzPKXI4_Gb_QMMLg9ru6p15WOjY4i-MQRK161riBmJFYQAGj0Eqpm9MeSN7mNvevJkKm3Q8Ar9HNjQyY7pkpZiR5eLnfmxcC7rCALiQeEB8Yyqw7ZDkjUpbGEHTQcgXm-BVUyd:1p8LdT:mTm08roGO8lp8f3ePDNAOg8GWrOoDZbW1hmwLxP7fTM','2023-01-05 13:29:23.784906'),('ea3wpwas2amg2aqzc8iq7d1n5jdefhvs','.eJxVjrkOwjAQRP_FLcRa2_HmKOnp6C0fmwOiWMROhfh3EpEC2jnezIsZu-bBrIkWMwbWMiEadv5VnfUPmncr3O3cR-7jnJfR8T3CDzfxaww0XY7sH2CwadjaZaVLF2odfHA1KhC6amytiKQiAd6Dlg68qogconKou9Bhp5zCUqNE2qDfAzs6min2cc1msimbhZ4rpbyNSJCyELJQcBPYQtOWgleotWhOULcA7P0BgedMqQ:1pBAST:yNuIodFaHZ2DE42L8mztlSLqc6wdQYwfL9fWSLb9qeM','2023-01-13 08:09:41.783958'),('ecxxoglmfytz62itn7xvliss4m45z9qw','.eJxVjrkOwjAQRP_FLWCtvbHjpKSno7d8bA6IYhE7FeLfSQQFtHO8mSezbi2DXTMtdoysZUI07PirehfuNO9WvLm5TzykuSyj53uEf93MLynSdP5m_wCDy8PWrmpV-WhUDNEbjSBU3TiDRBJJQAigpIeANZHXGr1WXex0hx51pbTUtEE_B3Z0slPq01rs5HKxCz1WymUbkSDxBOIEeBWmRWil4I1SopYHMC0Ae70BgUVMng:1pCeYn:0W8ilfxGqPogScTSFKUB0kXeTAR_UQ1QEtS_gd7ynbQ','2023-01-17 10:30:21.975173'),('f63wze3xe2pyjqaiktpdn2e3ij9qp75t','.eJxVjjsPgjAUhf9LV6W59xZoy-ju5t70FUAJjbRMxv8uRAZNznQeX86LGbuWwaw5LmYMrGPEzr-es_4R5z0Idzv3ifs0l2V0fK_wI838mkKcLkf3DzDYPGzrFmovZOuFAC2V2IQSaok-2AChCY4UgfaoSbToVINohQ4SCJz2LTUb9HtgRyczpT6txUw2F7PE5xpz2b8DUYVUkb6h6kh2iBw0bOgTqA6AvT9gUUp7:1pAq7z:X34JXsCaLCa55uJTuOAJBpcW2At7JARIcQIccjLKgdM','2023-01-12 10:27:11.103717'),('fhyb8do2rkblz7frouj10lqmt5v3yfwn','.eJxVjrkOwjAQRP_FLWCt10eclPR09JaPDQGiWMROhfh3EkEB7Rxv5smcX-rglkKzuybWMSFatv9Vg493mjYr3fx0yTzmqc7XwLcI_7qFn3Ki8fjN_gEGX4a1rRqtQrI6xRSskSB003oriVCSgBhBY4AoG6JgjAxG96k3vQzSKG3Q0Ar9HNjQ2Y35kpfqRl-qm-mxUKnrCALiQeAB2zNCp0QnJLcAtlE7sB0Ae70BgZpMoQ:1pAsDh:kW4U4b0tY4g8N8AL2Hl8n2aTxNVi8Itp4Us3zOf8e_w','2023-01-12 12:41:13.825510'),('frca6qbjlygkyddby56kvpsk42gqxna4','.eJxVjrtyxCAMRf-FNllGFkYCl-nTpWeEwetNPGZicLWz_x57skWi8j6O7l0F2dsc9pq3cEtqUFa9_tWijF95PY30Keu16LGsbbtFfUb00636vaS8vD2z_wCz1Plod11vaDqPxHOinjk5y4ZGsjEiAXm2k7B4EkxunBghGucZfO7ZwgH9HXCiS1jKtewtLFJb2PL3nms7niAgXsBf0H50_WDMYFEDI7nuBdwAoB4_7QBLqw:1ocLD6:iifJfc7rWSHGKTZugodH9lWhGS8_9y531y9K64pJV6k','2022-10-09 06:33:52.120927'),('g2ojjk01rrrdygmmfd5bq3jjn5gq4qaz','.eJxVjrluwzAQRP-FbSJil8eKVunenXuCx8pyIoiwSFWG_z0S4iJp53gzT-HD1ia_VV79PYtBIJ7E5181hvTNy2Hlr7Dcikxlaes9yiMi326Vl5J5Pr-z_wBTqNPeNr01MTubU46ONKDtT8FpZqUZISWwKkLSPXMk0pHsmEcaddRkLCniHfp74EAXP5db2ZqfQ21-5cfGte0jCpTqUHUKrggD0qCN7A2iww9wA4B4_QCAy0yX:1p7SBG:ttPH06t3327qOSO0884A7vq21q62_dgX06PARcxW5yE','2023-01-03 02:16:34.790951'),('gswsy8z1ky0mydd017ywe3jito9zvty4','.eJxVjrluwzAQRP-FrWNiuRRXlMr07twTPFZHIoiISFWG_z0S4sJp53gzD-H8Xie3F97cnEQvlOrEx7safPzm9bTSl1_HLGNe6zYHeUbkyy3ylhMvn6_sP8Dky3S0m9Y0IVmTYgqWNCjTdt5qZtSsIEYwGCDqljkQ6UBmSAMNOmhqDCHxAf07cKKzW_KY9-oWX6rb-GfnUo8RBMQrdFds76h76HpF0lpFDV7A9gDi-QuC90yx:1odCCz:lQiLwQhX9RBc0Kfo6Q7Jdcydcd757D8GdqCv2vHy9nE','2022-10-11 15:09:17.211463'),('izlyf6ybcgda3xtzdtjg7erjwoqi86i8','.eJxVjruywiAQht-FVmW4LS4pT29nzxBYjJoJcwKpHN_dZLTQcv_Lt_-D-bC0wS-VZn9NrGOS7b-1PsQ7TZuRbmG6FB7L1OZrz7cI_7iVn0qi8e-T_QEMoQ5rO7ujUzGhoUwgpLERQkLXp2DtMWO_npEMaiBjwGVts5SoBKHVUaHGFfoesKGLH8ulLM2PoTY_0_9Cta1PlFDqINxBwlnaDqDTioNC52AnsBOCPV8sKkxD:1oYkei:3Ng8vZwwjjsB0HS4yEBtxf43Uyh12TJlfMEXZ170UCs','2022-09-29 08:55:32.640995'),('jgyy7ct5mkyvul0dg99v8vu4f75w9wuu','.eJxVjjkOwjAQRe_iFrDGnthOUtLT0VteJgtEsYidCnF3EkEB0lR_efOfzLq1DHbNtNgxspYJ0bDjr-pduNO8W_Hm5j7xkOayjJ7vEf51M7-kSNP5m_0DDC4PW7syqvKxVjFEX2sEoUzjaiSSSAJCACU9BDREXmv0WnWx0x161JXSUtMG_QzY0clOqU9rsZPLxS70WCmX7YkEKU9CnhCuwrRgWqy4UM12B6hbAPZ6A4HBTKc:1pBBMU:MGtuT7XpC9i9vc8bxbvB6_1QAtqpRZZd7Sm21WoSkcc','2023-01-13 09:07:34.174781'),('lmrxjb6vx8j4paioe68bt38m5k9xsjo5','.eJxVjrsOwiAYhd-FVUt-oFxHdzd3wi1ttSmx0Mn47pbYQZMzncuX80LWbXW0W0mrnSIyiKLzr-ddeKSlBfHuliHjkJe6Th63Cj7Sgq85pvlydP8AoyvjvhbQByZFYAy0VGwXkdBLEqKLEHn0VFHQgWjKBPGKE-KYjhIoeB0E5Tv0e6Chs53zkLdqZ1eqXdNzS6W270BZB6QDeiPccG0Yx5JLqfgJlAFA7w9gqkqL:1pCFjL:4eLjlp2OqC9ttr-4Kjgv0r1XBqmR7Ub1axDbKEihUVE','2023-01-16 07:59:35.777589'),('m4u5fv4k8cyixczygikhkg4jghaw60pb','.eJxVjrsSwiAQRf-FVmV4bMiS0t7OniGwGDUTxkAqx383GS203Ps4e5_M-aUObik0u2tkHZNs_6v1Ptxp2ox489Ml85CnOl97vkX41y38lCONx2_2DzD4MqztZFurQkSgRI2QYELjI9o-emPahP16BgLUDQE0NmmTpEQlCI0OCjWu0M-ADZ3dmC95qW70pbqZHguVuj5RQqmDsAdpzqLtlO0UcGwBNOwEdkKw1xssIEw-:1oYyIO:7N7rZQnjJf4_oZyv3E-YXq6Fvf3Owz3sLhqnWMPVxyo','2022-09-29 23:29:24.931830'),('nswaf9njwgg9qrua5trk41jkq22xntif','.eJxVjjkOwjAQRe_iFmKN7XiylPR09JaXyQJRLGKnQtydRKSAcv7y5r-YsWsezJpoMWNgLROiYedf1Vn_oHm3wt3OfeQ-znkZHd8j_HATv8ZA0-XI_gEGm4atXVa6dKHWwQdXowKhq8bWikgqEuA9aOnAq4rIISqHugsddsopLDVKpA36HbCjo5liH9dsJpuyWei5UsrbEwlSFkIUoG6ibgFaiVw3KHRzgv1m7w-Bikym:1oqX1O:J4BMGwe0thhOlXzCs4TG6DNRMpOdpyrPZb7u5Vptuws','2022-11-17 10:00:26.620176'),('o6sgq3m2pqniznk7iwgf8soa5g1mv33w','.eJxVjjsPgjAUhf9LV6W5vaX0Mbq7uTd9BVBCIy2T8b8LkUGTM53Hl_Mi1q11sGtJix0jMQTJ-dfzLjzSvAfx7uY-05Dnuoye7hV6pIVec0zT5ej-AQZXhm3dQRu47ALnoKXim5iEVrIQXYQookeFoAPTyDvmlWDMcR0lIHgdOhQb9HtgR2c75T6v1U6uVLuk55pK3b8DYsOwQXlDZkAYwalUUov2BMoAkPcHYJxKiA:1pA9eT:ebNOmumErZfJFDiyUvCOUwP7SL3BdAxCz_JQGkNj174','2023-01-10 13:05:53.811952'),('ra22t1rnlkazwd6z2x3e26odkcvt75go','.eJxVjrtuwzAMRf9Fa2uBpERL9pg9W3ZBr8RpDQux5CnIv9dGM7QbcR-H9ymc39rktppXd09iFCw-_2rBx--8HEb68sutyFiWtt6DPCLy7VZ5LinPp3f2H2DyddrbkW1vA2QbDVPgHiJa9KQhJSYTGVGpqwEfVTL7mXxv0GitBya-YqAd-jvgQBc3l1vZmpt9bW7Njy3Xtj8hIOqQOgUXNKPGEZUceNCgP8COAOL1A6iXSwg:1pBBt4:w80QeSCaL261mseNpQKymMGDZ4Hm6raas8CaB5M-px0','2023-01-13 09:41:14.156132'),('touhttp7ocpiqguux4kh1s9a44ihw8ha','.eJxVjrsSgjAQRf8lrZLZTciClPZ29pk8FlEZMpJQOf67MFpoex_n3qewbimDXTLP9hpFJxAPYv-rehfuPG1WvLnpkmRIU5mvXm4R-XWzPKXI4_Gb_QMMLg9ru25M7WNrYoi-JQ1omoNrNbPSjBACGOUh6IbZE2lPpo899dprqg0p4hX6ObChkx3TJS3Fji4XO_Nj4VzWEQVKVagqjWekDk2HIBEU1riDtgMQrzeAaUyL:1pBX1K:azZ8yIxywL8kXUyUWoe6rEnGOLxs4QD2XudcoxeUXic','2023-01-14 08:15:10.116139'),('tq0wnn37upuur1h2gcfwy3nuru6zukwd','.eJxVjrkSwiAQht-FVmUWNpCjtLezZzg2h2bCGEjl-O6S0ULL_Y9v_yczdsuj2RKtZgqsY0K07PirOuvvtOxWuNlliNzHJa-T43uEf93ELzHQfP5m_wCjTWNpV7WqXGhU8ME1GkGourUNEkkkAd6Dkg481kROa3Ra9aHXPTrUldJSU4F-BuzoaOY4xC2b2aZsVnpslHJ5IkHiCcQJ8ApNJ1UnkLeyLsBDuQHY6w2Br0ym:1pCV7B:ULO0xxVntdaMqLHLm6nouw1P1n6FNdox7-B24StdoAM','2023-01-17 00:25:13.943711'),('vlejxm3fa3eqvwz5ife2g0l17if2zt1k','.eJxVjDsKwzAQRO-iOojVyvqlTO8zCGlXRE6CDJZdhdw9NrhIYKp5b-YtYtrWGrdeljixuAoUl98uJ3qWdgB-pHafJc1tXaYsD0WetMtx5vK6ne7fQU297msLA2lnSWsIzus9ysHgFHFiYMMZPUIgFVBblb1RKunADhByIItGfL6f_zYU:1ojYTj:ndIxMHEPbR--U2AbAKhVVxu14n1zo2jxvsZm8OZXAt0','2022-10-29 04:08:51.335261'),('vza4vsdzykxlq2x8wdhya2dwdtp2ki6l','.eJxVjjsPwiAUhf8Lq0ru5UKBju5u7oRXrNqUWOhk_O-20UGTM53Hl_Nkzi9tcEvNs7sm1jPB9r9e8PGepy1INz9dCo9lavM18K3Cv2nlp5LyePx2_wCDr8O67kBG0l0kAqsNrUINUmNMPkFSKQgjwEa0gjoMRiF6skmDgGBjJ9QK_RzY0MWN5VKW5kZfm5vzY8m1bd9B0AHwAPKMtle2l8ilMIpoB6YHYK83YGZKgA:1pD2Qn:h-c-iTaWZVHBf0DX8zZuzyIPsBhuU0iNI__nFwa-8Qw','2023-01-18 11:59:41.657054'),('w7abzxgfetm22equmvot0a7s84ogf052','.eJxVjrGOwyAQRP-F9i5oWbMEXKZPlx6xwMW5s4xicBXdvx9WUuSkqWZm3-xD-LC1yW81r_6WxCiM-Hz3OMSfvOxB-g7LtchYlrbeWO4V-UqrPJeU59Or-w8whTr1azUA5USWnbKavhiBQRMjU1JBD8fYHe2GjC6C0WxDxMBRG6JsnB1chz4f2NHFz-VatubnUJtf833LtfURBMSDwgMeL8qNSF2StAMyH2BHAPH7B9stS6k:1pA85I:MZx5RJ8hTWJB6LV_nBvH2SXgdmXWYS7ZvyahWE-527U','2023-01-10 11:25:28.074377'),('wtk71x6i9ux6oputni1r1vcgbs626imz','.eJxVjjsPgjAUhf9LV6W59xZayuju5t70FUAJjbRMxv8uRAZNznQeX86LGbuWwaw5LmYMrGPEzr-es_4R5z0Idzv3ifs0l2V0fK_wI838mkKcLkf3DzDYPGxrCbUXSnohQKtWbEIFtUIfbIDQBEctgfaoSUh0bYNohQ4KCJz2kpoN-j2wo5OZUp_WYiabi1nic4257N-BqEKqSN-w7kh3CJwkgcQTtB0Ae38AX-lKdA:1pAmPe:i4T6OLqNJjZtIQp6inJBsTUOp1MSS_guvhU5GFUeMjA','2023-01-12 06:29:10.278060'),('xjvs6n2nxi0t140n0fb329ynlbbpyvcq','.eJxVjrtywyAQRf-FNjGz7AJCKtOnS8_wWFl2NGIiUOXxv1sau4jb-zj33oQPW5v8Vnn1lywGoVQvPv-rMaRfXg4rX8NyLjKVpa2XKI-IfLlVfpfM89cr-waYQp32tu6MjtmZnHJ0lkCZrg-OmJFYQUpgMEKijjlaS9GaMY92pEhWG4uWd-jzwIEufi7nsjU_h9r8yn8b17aPICCeFJ6w_0EYtB7QSHKK-u4D3AAg7g-CKkyr:1pAsGn:3ogfaSSpIS9S32HmHiTjLsuTaMyDxz6x7xnDw9Ri_30','2023-01-12 12:44:25.406707'),('zh477c0ekm1qv1j8ir6gq5gg0m5xb11v','.eJxVjjsPwiAUhf8Lq5Zc7i1QOrq7uRNesWpTYqGT8b_bxg6anOk8vpwXs26pg11Kmu0tsp4hO_563oVHmrYg3t10zTzkqc43z7cK39PCzzmm8bR3_wCDK8O6VtAG0ioQgdEdrRIaWi1CdBGijB47BBOEQVLCd1IIRyZqQPAmKJQr9HtgQ2c75mteqh1dqXZOzyWVun0HxAZMg-qC1BP1kjhqCcYcoOsB2PsDYPNKiA:1ocq7F:m_jPc9O2rxCYKYuskSzU5cUMxiC-aUWavoyM3qnLZzg','2022-10-10 15:33:53.421100'),('zthrlsoct9h22m90b0nlx1lexkwtbn9x','.eJxVjrtuhDAQRf_FbbLWeAYPhjJ9uvSWH8OyCcIKNtVq_z2gbJG093HuvSsf9jb7vcrmb1mNyphBvf5VY0hfsp5W_gzrtehU1rbdoj4j-ulW_V6yLG_P7D_AHOp8tLvedjE7m1OOjgmM7YfgSARJDKQEFiMk6kUiM0W2U554okjcWUaWA_p74EQXv5Rr2ZtfQm1-k-9dajtGEBAvBi_oPgyPgCOxJhjA9i_gRgD1-AGB2Eyk:1pAROW:r0oaHSD5qDCNV2h4EhlfyIXNM1-Spn1NLfv1tGLp_78','2023-01-11 08:02:36.341056');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registrations_user`
--

DROP TABLE IF EXISTS `registrations_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registrations_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_facilitator` tinyint(1) NOT NULL,
  `is_participant` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registrations_user`
--

LOCK TABLES `registrations_user` WRITE;
/*!40000 ALTER TABLE `registrations_user` DISABLE KEYS */;
INSERT INTO `registrations_user` VALUES (2,'pbkdf2_sha256$260000$THOjXGv7EC71RB0dZAyfpA$9Zv0ybOUaJ2t1PyksuVVHu0OuYkQnTjGIM/caGlF7to=','2023-01-04 10:54:17.826919',0,'Facilitator','One',1,1,'2022-09-19 09:03:02.000000','faci1@gmail.com',1,0),(3,'pbkdf2_sha256$260000$ucpDnLu83IOXZSxdjfIwzA$2ibi26xWDFOWbA64fcVgca1780VTOQma7E2fxim/8mw=','2022-12-29 02:10:50.464449',0,'Facilitator','Two',1,1,'2022-09-19 09:05:31.000000','faci2@gmail.com',1,0),(4,'pbkdf2_sha256$260000$Yr8fS6FdGkFIXb8GZBrDsG$MUHaC6UXjKnrqxLmj5QDIEOrHUEY0G4UYgoy8Qc/ICI=','2022-12-29 03:04:35.102318',0,'Facilitator','Three',1,1,'2022-09-19 09:08:39.000000','faci3@gmail.com',1,0),(5,'pbkdf2_sha256$260000$mLhXWlpIpT3Kkl1P9ZgBkt$0Jg0lbMQSZsxNLXlKBfyjjixFh4qNJjk4rkKQtqZTX4=','2023-01-04 10:51:48.728607',0,'Participant','One',0,1,'2022-09-19 12:37:55.000000','participant1@gmail.com',0,1),(6,'pbkdf2_sha256$260000$HMcuoNuLjlcWQVOBwoyDm5$+shA98gJKzneKHeBHQIoVQi3K2vav0+2JG01AK8HoyA=','2022-12-27 11:20:41.000000',0,'Participant','Two',0,1,'2022-09-20 14:54:11.000000','participant2@gmail.com',0,1),(119,'pbkdf2_sha256$260000$MyMNqr4mnhPU3JEkE7gkRZ$b5OB53Kj++mLEUH8JYTVzJIuV7E8MfFPxrX1lywEXz8=','2023-01-04 10:48:29.928832',1,'System','Administrator',1,1,'2022-09-24 01:15:07.000000','jaymontero17@gmail.com',0,0),(120,'pbkdf2_sha256$260000$Eih1UbfN5qN0usKkKw9pCV$069Zz5K8hRIMtO5tBiZsQTC1UVnl5Cr9guiovzsiqcg=',NULL,0,'Facilitator','Four',1,1,'2022-09-24 01:16:53.000000','faci4@gmail.com',1,0);
/*!40000 ALTER TABLE `registrations_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registrations_user_groups`
--

DROP TABLE IF EXISTS `registrations_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registrations_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `registrations_user_groups_user_id_group_id_d1904afe_uniq` (`user_id`,`group_id`),
  KEY `registrations_user_groups_group_id_1ffd9d9d_fk_auth_group_id` (`group_id`),
  CONSTRAINT `registrations_user_g_user_id_6bd15d83_fk_registrat` FOREIGN KEY (`user_id`) REFERENCES `registrations_user` (`id`),
  CONSTRAINT `registrations_user_groups_group_id_1ffd9d9d_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registrations_user_groups`
--

LOCK TABLES `registrations_user_groups` WRITE;
/*!40000 ALTER TABLE `registrations_user_groups` DISABLE KEYS */;
INSERT INTO `registrations_user_groups` VALUES (1,2,1),(2,3,1),(3,4,1),(4,5,2),(5,6,2),(6,120,1);
/*!40000 ALTER TABLE `registrations_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registrations_user_user_permissions`
--

DROP TABLE IF EXISTS `registrations_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registrations_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `registrations_user_user__user_id_permission_id_02a99b9b_uniq` (`user_id`,`permission_id`),
  KEY `registrations_user_u_permission_id_3b4c592c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `registrations_user_u_permission_id_3b4c592c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `registrations_user_u_user_id_c706454a_fk_registrat` FOREIGN KEY (`user_id`) REFERENCES `registrations_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registrations_user_user_permissions`
--

LOCK TABLES `registrations_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `registrations_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `registrations_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registrations_userprofile`
--

DROP TABLE IF EXISTS `registrations_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registrations_userprofile` (
  `user_id` bigint NOT NULL,
  `contact` varchar(100) NOT NULL,
  `dob` date DEFAULT NULL,
  `address` longtext,
  `avatar` varchar(100) DEFAULT NULL,
  `gender` varchar(100) DEFAULT NULL,
  `date_added` datetime(6) NOT NULL,
  `date_updated` datetime(6) NOT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `registrations_userpr_user_id_9bac1243_fk_registrat` FOREIGN KEY (`user_id`) REFERENCES `registrations_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registrations_userprofile`
--

LOCK TABLES `registrations_userprofile` WRITE;
/*!40000 ALTER TABLE `registrations_userprofile` DISABLE KEYS */;
INSERT INTO `registrations_userprofile` VALUES (2,'09123456789','2022-06-22','Address','','Male','2022-09-19 09:03:02.000000','2023-01-04 10:54:17.844920'),(3,'09123456789','2022-06-22','Address','','Female','2022-09-19 09:05:31.000000','2022-12-29 02:10:50.490676'),(4,'09123456789','2022-06-22','Address','','Male','2022-09-19 09:08:40.000000','2022-12-29 03:04:35.139999'),(5,'09123456789','2022-06-22','Address','userprofile_images/testimonial-3.jpg','Male','2022-09-19 12:37:56.000000','2023-01-04 10:51:48.763608'),(6,'09123456789','2022-06-21','Address','','Female','2022-09-20 14:54:12.000000','2022-12-29 10:01:36.489884'),(119,'',NULL,NULL,'',NULL,'2022-09-24 01:15:07.854361','2023-01-04 10:48:29.942922'),(120,'',NULL,NULL,'',NULL,'2022-09-24 01:16:53.973867','2022-09-24 08:05:55.486412');
/*!40000 ALTER TABLE `registrations_userprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workshop_activityoutput`
--

DROP TABLE IF EXISTS `workshop_activityoutput`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workshop_activityoutput` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(250) DEFAULT NULL,
  `text_answer` longtext,
  `file` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `is_checked` tinyint(1) NOT NULL,
  `score` double NOT NULL,
  `time_submitted` datetime(6) DEFAULT NULL,
  `lessonactivity_id` bigint DEFAULT NULL,
  `participant_id` bigint DEFAULT NULL,
  `feedback` longtext,
  `date_added` datetime(6) NOT NULL,
  `date_updated` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `workshop_activityout_lessonactivity_id_a8693a9e_fk_workshop_` (`lessonactivity_id`),
  KEY `workshop_activityout_participant_id_cbe40f92_fk_workshop_` (`participant_id`),
  CONSTRAINT `workshop_activityout_lessonactivity_id_a8693a9e_fk_workshop_` FOREIGN KEY (`lessonactivity_id`) REFERENCES `workshop_lessonactivity` (`id`),
  CONSTRAINT `workshop_activityout_participant_id_cbe40f92_fk_workshop_` FOREIGN KEY (`participant_id`) REFERENCES `workshop_workshopparticipant` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workshop_activityoutput`
--

LOCK TABLES `workshop_activityoutput` WRITE;
/*!40000 ALTER TABLE `workshop_activityoutput` DISABLE KEYS */;
INSERT INTO `workshop_activityoutput` VALUES (26,'sfsdfd','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>','activityoutput_files/Sample_Activity_Output.pdf','',0,0,'2023-01-04 08:25:06.622903',4,20,NULL,'2023-01-03 16:00:00.000000','2023-01-04 08:45:13.136911');
/*!40000 ALTER TABLE `workshop_activityoutput` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workshop_category`
--

DROP TABLE IF EXISTS `workshop_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workshop_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(250) DEFAULT NULL,
  `description` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workshop_category`
--

LOCK TABLES `workshop_category` WRITE;
/*!40000 ALTER TABLE `workshop_category` DISABLE KEYS */;
INSERT INTO `workshop_category` VALUES (1,'Smart Learning Technologies (Education 4.0)','<p>Smart Learning Technologies Program deals with advanced technology&rsquo;s application in education segment and explores technological involvement within the interaction between educators and learners. It collects researches on the enhancements of teaching and learning through technologies in creating a digital education surroundings and analyze the most recent trends of technology use in education. Implements new development of technologies that enables learners to learn more effectively, efficiently, flexibly and comfortably. It can create effective digital learning environments that supply convenience to learners and keep up with the dynamic demands of the digital age.</p>'),(2,'Data Analytics and Business Intelligence','<p>The Data Analytics and Business Intelligence Program focus on the development of methods and algorithms for the aggregation, analysis and visualization of data to strategize and manage business processes and policies. Research under this program are centered on the application of techniques in data engineering, data science and artificial intelligence to generate actionable insights from big data.</p>'),(3,'ICT Support for Sustainable Development','<p>ICT Support for Development Program supports the UNDP or Global Goals which are universal call to action to end poverty, protect the planet and ensure that all people enjoy peace and prosperity. ICT will act as an enabler to all goals that are interconnected with each other since its success are interdependent. ICT support will make the interconnection effective and efficient.</p>'),(4,'Cyber Intelligent Systems','<p>Cyber Intelligent Systems Program refers to the emerging computing systems based on intelligent techniques that has a coherent set of components and subsystems working together to engage in a goal-driven activity. Researches under this program could perceive, learn, and respond to the world around them as well as have the capacity to gather and analyze data and communicate with other systems. It includes not just intelligent devices but also interconnected collections of such devices, including networks and other types of larger systems and come in many forms and have many applications, from processing huge data sets to controlling robots and drones. The ideas and concepts are drawn from, but not limited to AI and IOT.</p>');
/*!40000 ALTER TABLE `workshop_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workshop_extensionprogram`
--

DROP TABLE IF EXISTS `workshop_extensionprogram`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workshop_extensionprogram` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL,
  `shortdescription` varchar(250) DEFAULT NULL,
  `description` longtext,
  `image` varchar(100) DEFAULT NULL,
  `duration` bigint DEFAULT NULL,
  `date_added` datetime(6) NOT NULL,
  `date_updated` datetime(6) NOT NULL,
  `added_by_id` bigint DEFAULT NULL,
  `slug` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `workshop_extensionpr_added_by_id_628b4f72_fk_registrat` (`added_by_id`),
  KEY `workshop_extensionprogram_slug_cdc1df38` (`slug`),
  CONSTRAINT `workshop_extensionpr_added_by_id_628b4f72_fk_registrat` FOREIGN KEY (`added_by_id`) REFERENCES `registrations_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workshop_extensionprogram`
--

LOCK TABLES `workshop_extensionprogram` WRITE;
/*!40000 ALTER TABLE `workshop_extensionprogram` DISABLE KEYS */;
INSERT INTO `workshop_extensionprogram` VALUES (25,'Extension Program 1','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>','extensionprogram_coverimages/default-background.png',108000000000,'2022-12-29 03:03:02.000000','2023-01-02 07:44:00.508640',2,'extension-program-1'),(26,'Extension Program 2','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>','extensionprogram_coverimages/default-background_W4WXjdf.png',108000000000,'2022-12-29 06:22:36.000000','2023-01-02 07:44:08.806269',2,'extension-program-2');
/*!40000 ALTER TABLE `workshop_extensionprogram` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workshop_extensionprogram_co_facilitator`
--

DROP TABLE IF EXISTS `workshop_extensionprogram_co_facilitator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workshop_extensionprogram_co_facilitator` (
  `id` int NOT NULL AUTO_INCREMENT,
  `extensionprogram_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `workshop_extensionprogra_extensionprogram_id_user_d94ca0e9_uniq` (`extensionprogram_id`,`user_id`),
  KEY `workshop_extensionpr_user_id_6347cc3d_fk_registrat` (`user_id`),
  CONSTRAINT `workshop_extensionpr_extensionprogram_id_c7e4f4ee_fk_workshop_` FOREIGN KEY (`extensionprogram_id`) REFERENCES `workshop_extensionprogram` (`id`),
  CONSTRAINT `workshop_extensionpr_user_id_6347cc3d_fk_registrat` FOREIGN KEY (`user_id`) REFERENCES `registrations_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workshop_extensionprogram_co_facilitator`
--

LOCK TABLES `workshop_extensionprogram_co_facilitator` WRITE;
/*!40000 ALTER TABLE `workshop_extensionprogram_co_facilitator` DISABLE KEYS */;
INSERT INTO `workshop_extensionprogram_co_facilitator` VALUES (15,25,3),(16,26,3);
/*!40000 ALTER TABLE `workshop_extensionprogram_co_facilitator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workshop_extensionprogram_files`
--

DROP TABLE IF EXISTS `workshop_extensionprogram_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workshop_extensionprogram_files` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL,
  `file` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `date_added` datetime(6) NOT NULL,
  `date_updated` datetime(6) NOT NULL,
  `added_by_id` bigint DEFAULT NULL,
  `extensionprogram_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `workshop_extensionpr_added_by_id_5bd39102_fk_registrat` (`added_by_id`),
  KEY `workshop_extensionpr_extensionprogram_id_b5c52d90_fk_workshop_` (`extensionprogram_id`),
  CONSTRAINT `workshop_extensionpr_added_by_id_5bd39102_fk_registrat` FOREIGN KEY (`added_by_id`) REFERENCES `registrations_user` (`id`),
  CONSTRAINT `workshop_extensionpr_extensionprogram_id_b5c52d90_fk_workshop_` FOREIGN KEY (`extensionprogram_id`) REFERENCES `workshop_extensionprogram` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workshop_extensionprogram_files`
--

LOCK TABLES `workshop_extensionprogram_files` WRITE;
/*!40000 ALTER TABLE `workshop_extensionprogram_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `workshop_extensionprogram_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workshop_extensionprogram_files_co_facilitator`
--

DROP TABLE IF EXISTS `workshop_extensionprogram_files_co_facilitator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workshop_extensionprogram_files_co_facilitator` (
  `id` int NOT NULL AUTO_INCREMENT,
  `extensionprogram_files_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `workshop_extensionprogra_extensionprogram_files_i_662693a6_uniq` (`extensionprogram_files_id`,`user_id`),
  KEY `workshop_extensionpr_user_id_6f95513a_fk_registrat` (`user_id`),
  CONSTRAINT `workshop_extensionpr_extensionprogram_fil_b362c2b3_fk_workshop_` FOREIGN KEY (`extensionprogram_files_id`) REFERENCES `workshop_extensionprogram_files` (`id`),
  CONSTRAINT `workshop_extensionpr_user_id_6f95513a_fk_registrat` FOREIGN KEY (`user_id`) REFERENCES `registrations_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workshop_extensionprogram_files_co_facilitator`
--

LOCK TABLES `workshop_extensionprogram_files_co_facilitator` WRITE;
/*!40000 ALTER TABLE `workshop_extensionprogram_files_co_facilitator` DISABLE KEYS */;
/*!40000 ALTER TABLE `workshop_extensionprogram_files_co_facilitator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workshop_extensionprogram_member`
--

DROP TABLE IF EXISTS `workshop_extensionprogram_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workshop_extensionprogram_member` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `is_leader` tinyint(1) NOT NULL,
  `extensionprogram_id` bigint DEFAULT NULL,
  `member_id` bigint DEFAULT NULL,
  `added_by_id` bigint DEFAULT NULL,
  `date_added` datetime(6) NOT NULL,
  `date_updated` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `workshop_extensionpr_extensionprogram_id_8fd19a22_fk_workshop_` (`extensionprogram_id`),
  KEY `workshop_extensionpr_member_id_dff7fb68_fk_registrat` (`member_id`),
  KEY `workshop_extensionpr_added_by_id_06084e47_fk_registrat` (`added_by_id`),
  CONSTRAINT `workshop_extensionpr_added_by_id_06084e47_fk_registrat` FOREIGN KEY (`added_by_id`) REFERENCES `registrations_user` (`id`),
  CONSTRAINT `workshop_extensionpr_extensionprogram_id_8fd19a22_fk_workshop_` FOREIGN KEY (`extensionprogram_id`) REFERENCES `workshop_extensionprogram` (`id`),
  CONSTRAINT `workshop_extensionpr_member_id_dff7fb68_fk_registrat` FOREIGN KEY (`member_id`) REFERENCES `registrations_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workshop_extensionprogram_member`
--

LOCK TABLES `workshop_extensionprogram_member` WRITE;
/*!40000 ALTER TABLE `workshop_extensionprogram_member` DISABLE KEYS */;
INSERT INTO `workshop_extensionprogram_member` VALUES (7,0,25,2,2,'2022-12-29 09:56:30.000000','2022-12-29 09:56:38.336200');
/*!40000 ALTER TABLE `workshop_extensionprogram_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workshop_extensionprogram_member_co_facilitator`
--

DROP TABLE IF EXISTS `workshop_extensionprogram_member_co_facilitator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workshop_extensionprogram_member_co_facilitator` (
  `id` int NOT NULL AUTO_INCREMENT,
  `extensionprogram_member_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `workshop_extensionprogra_extensionprogram_member__3f1a7b3b_uniq` (`extensionprogram_member_id`,`user_id`),
  KEY `workshop_extensionpr_user_id_ae4706f0_fk_registrat` (`user_id`),
  CONSTRAINT `workshop_extensionpr_extensionprogram_mem_259eabbb_fk_workshop_` FOREIGN KEY (`extensionprogram_member_id`) REFERENCES `workshop_extensionprogram_member` (`id`),
  CONSTRAINT `workshop_extensionpr_user_id_ae4706f0_fk_registrat` FOREIGN KEY (`user_id`) REFERENCES `registrations_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workshop_extensionprogram_member_co_facilitator`
--

LOCK TABLES `workshop_extensionprogram_member_co_facilitator` WRITE;
/*!40000 ALTER TABLE `workshop_extensionprogram_member_co_facilitator` DISABLE KEYS */;
INSERT INTO `workshop_extensionprogram_member_co_facilitator` VALUES (7,7,3);
/*!40000 ALTER TABLE `workshop_extensionprogram_member_co_facilitator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workshop_extensionproject`
--

DROP TABLE IF EXISTS `workshop_extensionproject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workshop_extensionproject` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(250) DEFAULT NULL,
  `shortdescription` varchar(250) DEFAULT NULL,
  `description` longtext,
  `image` varchar(100) DEFAULT NULL,
  `extensionprogram_id` bigint DEFAULT NULL,
  `added_by_id` bigint DEFAULT NULL,
  `date_added` datetime(6) NOT NULL,
  `date_updated` datetime(6) NOT NULL,
  `slug` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `workshop_extensionpr_extensionprogram_id_211ca62d_fk_workshop_` (`extensionprogram_id`),
  KEY `workshop_extensionpr_added_by_id_8d1519d6_fk_registrat` (`added_by_id`),
  KEY `workshop_extensionproject_slug_ec01ddf3` (`slug`),
  CONSTRAINT `workshop_extensionpr_added_by_id_8d1519d6_fk_registrat` FOREIGN KEY (`added_by_id`) REFERENCES `registrations_user` (`id`),
  CONSTRAINT `workshop_extensionpr_extensionprogram_id_211ca62d_fk_workshop_` FOREIGN KEY (`extensionprogram_id`) REFERENCES `workshop_extensionprogram` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workshop_extensionproject`
--

LOCK TABLES `workshop_extensionproject` WRITE;
/*!40000 ALTER TABLE `workshop_extensionproject` DISABLE KEYS */;
INSERT INTO `workshop_extensionproject` VALUES (4,'Extension Project 1','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>','extensionproject_coverimages/default-background.png',25,2,'2022-12-29 09:50:00.000000','2023-01-02 07:44:21.872212','extension-project-1');
/*!40000 ALTER TABLE `workshop_extensionproject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workshop_extensionproject_co_facilitator`
--

DROP TABLE IF EXISTS `workshop_extensionproject_co_facilitator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workshop_extensionproject_co_facilitator` (
  `id` int NOT NULL AUTO_INCREMENT,
  `extensionproject_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `workshop_extensionprojec_extensionproject_id_exte_13dabdeb_uniq` (`extensionproject_id`,`user_id`),
  KEY `workshop_extensionpr_user_id_002ed4aa_fk_registrat` (`user_id`),
  CONSTRAINT `workshop_extensionpr_extensionproject_id_24d4a47e_fk_workshop_` FOREIGN KEY (`extensionproject_id`) REFERENCES `workshop_extensionproject` (`id`),
  CONSTRAINT `workshop_extensionpr_user_id_002ed4aa_fk_registrat` FOREIGN KEY (`user_id`) REFERENCES `registrations_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workshop_extensionproject_co_facilitator`
--

LOCK TABLES `workshop_extensionproject_co_facilitator` WRITE;
/*!40000 ALTER TABLE `workshop_extensionproject_co_facilitator` DISABLE KEYS */;
INSERT INTO `workshop_extensionproject_co_facilitator` VALUES (3,4,3);
/*!40000 ALTER TABLE `workshop_extensionproject_co_facilitator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workshop_extensionproject_files`
--

DROP TABLE IF EXISTS `workshop_extensionproject_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workshop_extensionproject_files` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL,
  `file` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `date_added` datetime(6) NOT NULL,
  `date_updated` datetime(6) NOT NULL,
  `added_by_id` bigint DEFAULT NULL,
  `extensionproject_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `workshop_extensionpr_added_by_id_f229f77a_fk_registrat` (`added_by_id`),
  KEY `workshop_extensionpr_extensionproject_id_981dbfdc_fk_workshop_` (`extensionproject_id`),
  CONSTRAINT `workshop_extensionpr_added_by_id_f229f77a_fk_registrat` FOREIGN KEY (`added_by_id`) REFERENCES `registrations_user` (`id`),
  CONSTRAINT `workshop_extensionpr_extensionproject_id_981dbfdc_fk_workshop_` FOREIGN KEY (`extensionproject_id`) REFERENCES `workshop_extensionproject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workshop_extensionproject_files`
--

LOCK TABLES `workshop_extensionproject_files` WRITE;
/*!40000 ALTER TABLE `workshop_extensionproject_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `workshop_extensionproject_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workshop_extensionproject_files_co_facilitator`
--

DROP TABLE IF EXISTS `workshop_extensionproject_files_co_facilitator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workshop_extensionproject_files_co_facilitator` (
  `id` int NOT NULL AUTO_INCREMENT,
  `extensionproject_files_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `workshop_extensionprojec_extensionproject_files_i_e2a06871_uniq` (`extensionproject_files_id`,`user_id`),
  KEY `workshop_extensionpr_user_id_fb5667fd_fk_registrat` (`user_id`),
  CONSTRAINT `workshop_extensionpr_extensionproject_fil_6c0f2971_fk_workshop_` FOREIGN KEY (`extensionproject_files_id`) REFERENCES `workshop_extensionproject_files` (`id`),
  CONSTRAINT `workshop_extensionpr_user_id_fb5667fd_fk_registrat` FOREIGN KEY (`user_id`) REFERENCES `registrations_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workshop_extensionproject_files_co_facilitator`
--

LOCK TABLES `workshop_extensionproject_files_co_facilitator` WRITE;
/*!40000 ALTER TABLE `workshop_extensionproject_files_co_facilitator` DISABLE KEYS */;
/*!40000 ALTER TABLE `workshop_extensionproject_files_co_facilitator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workshop_extensionproject_member`
--

DROP TABLE IF EXISTS `workshop_extensionproject_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workshop_extensionproject_member` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `is_leader` tinyint(1) NOT NULL,
  `member_id` bigint DEFAULT NULL,
  `extensionproject_id` bigint DEFAULT NULL,
  `added_by_id` bigint DEFAULT NULL,
  `date_added` datetime(6) NOT NULL,
  `date_updated` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `workshop_extensionpr_member_id_a1d779bf_fk_workshop_` (`member_id`),
  KEY `workshop_extensionpr_extensionproject_id_8474950a_fk_workshop_` (`extensionproject_id`),
  KEY `workshop_extensionpr_added_by_id_e0152d42_fk_registrat` (`added_by_id`),
  CONSTRAINT `workshop_extensionpr_added_by_id_e0152d42_fk_registrat` FOREIGN KEY (`added_by_id`) REFERENCES `registrations_user` (`id`),
  CONSTRAINT `workshop_extensionpr_extensionproject_id_8474950a_fk_workshop_` FOREIGN KEY (`extensionproject_id`) REFERENCES `workshop_extensionproject` (`id`),
  CONSTRAINT `workshop_extensionpr_member_id_a1d779bf_fk_workshop_` FOREIGN KEY (`member_id`) REFERENCES `workshop_extensionprogram_member` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workshop_extensionproject_member`
--

LOCK TABLES `workshop_extensionproject_member` WRITE;
/*!40000 ALTER TABLE `workshop_extensionproject_member` DISABLE KEYS */;
INSERT INTO `workshop_extensionproject_member` VALUES (6,0,7,4,2,'2022-12-29 09:56:44.000000','2022-12-29 09:56:55.640716');
/*!40000 ALTER TABLE `workshop_extensionproject_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workshop_extensionproject_member_co_facilitator`
--

DROP TABLE IF EXISTS `workshop_extensionproject_member_co_facilitator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workshop_extensionproject_member_co_facilitator` (
  `id` int NOT NULL AUTO_INCREMENT,
  `extensionproject_member_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `workshop_extensionprojec_extensionproject_member__64bfd082_uniq` (`extensionproject_member_id`,`user_id`),
  KEY `workshop_extensionpr_user_id_cc8f1009_fk_registrat` (`user_id`),
  CONSTRAINT `workshop_extensionpr_extensionproject_mem_e2f6a910_fk_workshop_` FOREIGN KEY (`extensionproject_member_id`) REFERENCES `workshop_extensionproject_member` (`id`),
  CONSTRAINT `workshop_extensionpr_user_id_cc8f1009_fk_registrat` FOREIGN KEY (`user_id`) REFERENCES `registrations_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workshop_extensionproject_member_co_facilitator`
--

LOCK TABLES `workshop_extensionproject_member_co_facilitator` WRITE;
/*!40000 ALTER TABLE `workshop_extensionproject_member_co_facilitator` DISABLE KEYS */;
INSERT INTO `workshop_extensionproject_member_co_facilitator` VALUES (6,6,3);
/*!40000 ALTER TABLE `workshop_extensionproject_member_co_facilitator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workshop_lesson`
--

DROP TABLE IF EXISTS `workshop_lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workshop_lesson` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(250) DEFAULT NULL,
  `description` longtext,
  `duration` bigint DEFAULT NULL,
  `is_open` tinyint(1) NOT NULL,
  `workshop_id` bigint DEFAULT NULL,
  `added_by_id` bigint DEFAULT NULL,
  `is_taken` tinyint(1) NOT NULL,
  `date_added` datetime(6) NOT NULL,
  `date_updated` datetime(6) NOT NULL,
  `slug` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `workshop_lesson_workshop_id_377bda4f_fk_workshop_workshop_id` (`workshop_id`),
  KEY `workshop_lesson_added_by_id_73ba2c0a_fk_registrations_user_id` (`added_by_id`),
  KEY `workshop_lesson_slug_d6f00a14` (`slug`),
  CONSTRAINT `workshop_lesson_added_by_id_73ba2c0a_fk_registrations_user_id` FOREIGN KEY (`added_by_id`) REFERENCES `registrations_user` (`id`),
  CONSTRAINT `workshop_lesson_workshop_id_377bda4f_fk_workshop_workshop_id` FOREIGN KEY (`workshop_id`) REFERENCES `workshop_workshop` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workshop_lesson`
--

LOCK TABLES `workshop_lesson` WRITE;
/*!40000 ALTER TABLE `workshop_lesson` DISABLE KEYS */;
INSERT INTO `workshop_lesson` VALUES (4,'Lesson 1 of Workshop 1','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>',108000000000,1,10,2,0,'2022-12-29 09:57:33.000000','2023-01-02 07:44:32.243007','lesson-1-of-workshop-1');
/*!40000 ALTER TABLE `workshop_lesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workshop_lesson_co_facilitator`
--

DROP TABLE IF EXISTS `workshop_lesson_co_facilitator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workshop_lesson_co_facilitator` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lesson_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `workshop_lesson_co_facil_lesson_id_workshopfacili_c26d3813_uniq` (`lesson_id`,`user_id`),
  KEY `workshop_lesson_co_f_user_id_407de651_fk_registrat` (`user_id`),
  CONSTRAINT `workshop_lesson_co_f_lesson_id_9f6c0a1e_fk_workshop_` FOREIGN KEY (`lesson_id`) REFERENCES `workshop_lesson` (`id`),
  CONSTRAINT `workshop_lesson_co_f_user_id_407de651_fk_registrat` FOREIGN KEY (`user_id`) REFERENCES `registrations_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workshop_lesson_co_facilitator`
--

LOCK TABLES `workshop_lesson_co_facilitator` WRITE;
/*!40000 ALTER TABLE `workshop_lesson_co_facilitator` DISABLE KEYS */;
INSERT INTO `workshop_lesson_co_facilitator` VALUES (2,4,3);
/*!40000 ALTER TABLE `workshop_lesson_co_facilitator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workshop_lesson_participant`
--

DROP TABLE IF EXISTS `workshop_lesson_participant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workshop_lesson_participant` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lesson_id` bigint NOT NULL,
  `workshopparticipant_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `workshop_lesson_particip_lesson_id_workshoppartic_4c67498f_uniq` (`lesson_id`,`workshopparticipant_id`),
  KEY `workshop_lesson_part_workshopparticipant__dadeb2da_fk_workshop_` (`workshopparticipant_id`),
  CONSTRAINT `workshop_lesson_part_lesson_id_1cc008be_fk_workshop_` FOREIGN KEY (`lesson_id`) REFERENCES `workshop_lesson` (`id`),
  CONSTRAINT `workshop_lesson_part_workshopparticipant__dadeb2da_fk_workshop_` FOREIGN KEY (`workshopparticipant_id`) REFERENCES `workshop_workshopparticipant` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workshop_lesson_participant`
--

LOCK TABLES `workshop_lesson_participant` WRITE;
/*!40000 ALTER TABLE `workshop_lesson_participant` DISABLE KEYS */;
INSERT INTO `workshop_lesson_participant` VALUES (2,4,20);
/*!40000 ALTER TABLE `workshop_lesson_participant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workshop_lessonactivity`
--

DROP TABLE IF EXISTS `workshop_lessonactivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workshop_lessonactivity` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(250) DEFAULT NULL,
  `description` longtext,
  `file` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `is_open` tinyint(1) NOT NULL,
  `deadline` datetime(6) DEFAULT NULL,
  `total_items` double NOT NULL,
  `lesson_id` bigint DEFAULT NULL,
  `added_by_id` bigint DEFAULT NULL,
  `date_added` datetime(6) NOT NULL,
  `date_updated` datetime(6) NOT NULL,
  `slug` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `workshop_lessonactivity_lesson_id_27126f49_fk_workshop_lesson_id` (`lesson_id`),
  KEY `workshop_lessonactiv_added_by_id_ff59dfed_fk_registrat` (`added_by_id`),
  KEY `workshop_lessonactivity_slug_ce72bdbe` (`slug`),
  CONSTRAINT `workshop_lessonactiv_added_by_id_ff59dfed_fk_registrat` FOREIGN KEY (`added_by_id`) REFERENCES `registrations_user` (`id`),
  CONSTRAINT `workshop_lessonactivity_lesson_id_27126f49_fk_workshop_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `workshop_lesson` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workshop_lessonactivity`
--

LOCK TABLES `workshop_lessonactivity` WRITE;
/*!40000 ALTER TABLE `workshop_lessonactivity` DISABLE KEYS */;
INSERT INTO `workshop_lessonactivity` VALUES (4,'Lesson Activity 1 of Lesson 1','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>','lessonactivity_files/Sample_Lesson_Activity_File.pdf','',1,'2023-01-02 10:00:00.000000',50,4,2,'2023-01-02 06:31:27.000000','2023-01-02 07:59:35.486382','lesson-activity-1-of-lesson-1');
/*!40000 ALTER TABLE `workshop_lessonactivity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workshop_lessonactivity_co_facilitator`
--

DROP TABLE IF EXISTS `workshop_lessonactivity_co_facilitator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workshop_lessonactivity_co_facilitator` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lessonactivity_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `workshop_lessonactivity__lessonactivity_id_worksh_f00c26dd_uniq` (`lessonactivity_id`,`user_id`),
  KEY `workshop_lessonactiv_user_id_f643077d_fk_registrat` (`user_id`),
  CONSTRAINT `workshop_lessonactiv_lessonactivity_id_220b0fa7_fk_workshop_` FOREIGN KEY (`lessonactivity_id`) REFERENCES `workshop_lessonactivity` (`id`),
  CONSTRAINT `workshop_lessonactiv_user_id_f643077d_fk_registrat` FOREIGN KEY (`user_id`) REFERENCES `registrations_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workshop_lessonactivity_co_facilitator`
--

LOCK TABLES `workshop_lessonactivity_co_facilitator` WRITE;
/*!40000 ALTER TABLE `workshop_lessonactivity_co_facilitator` DISABLE KEYS */;
INSERT INTO `workshop_lessonactivity_co_facilitator` VALUES (3,4,3);
/*!40000 ALTER TABLE `workshop_lessonactivity_co_facilitator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workshop_lessonfile`
--

DROP TABLE IF EXISTS `workshop_lessonfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workshop_lessonfile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(250) DEFAULT NULL,
  `description` longtext,
  `file` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `lesson_id` bigint DEFAULT NULL,
  `added_by_id` bigint DEFAULT NULL,
  `date_added` datetime(6) NOT NULL,
  `date_updated` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `workshop_lessonfile_lesson_id_d698d654_fk_workshop_lesson_id` (`lesson_id`),
  KEY `workshop_lessonfile_added_by_id_a80e675c_fk_registrat` (`added_by_id`),
  CONSTRAINT `workshop_lessonfile_added_by_id_a80e675c_fk_registrat` FOREIGN KEY (`added_by_id`) REFERENCES `registrations_user` (`id`),
  CONSTRAINT `workshop_lessonfile_lesson_id_d698d654_fk_workshop_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `workshop_lesson` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workshop_lessonfile`
--

LOCK TABLES `workshop_lessonfile` WRITE;
/*!40000 ALTER TABLE `workshop_lessonfile` DISABLE KEYS */;
/*!40000 ALTER TABLE `workshop_lessonfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workshop_lessonfile_co_facilitator`
--

DROP TABLE IF EXISTS `workshop_lessonfile_co_facilitator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workshop_lessonfile_co_facilitator` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lessonfile_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `workshop_lessonfile_co_f_lessonfile_id_workshopfa_b0800dfe_uniq` (`lessonfile_id`,`user_id`),
  KEY `workshop_lessonfile__user_id_c1444dac_fk_registrat` (`user_id`),
  CONSTRAINT `workshop_lessonfile__lessonfile_id_9e3e2d8c_fk_workshop_` FOREIGN KEY (`lessonfile_id`) REFERENCES `workshop_lessonfile` (`id`),
  CONSTRAINT `workshop_lessonfile__user_id_c1444dac_fk_registrat` FOREIGN KEY (`user_id`) REFERENCES `registrations_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workshop_lessonfile_co_facilitator`
--

LOCK TABLES `workshop_lessonfile_co_facilitator` WRITE;
/*!40000 ALTER TABLE `workshop_lessonfile_co_facilitator` DISABLE KEYS */;
/*!40000 ALTER TABLE `workshop_lessonfile_co_facilitator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workshop_workshop`
--

DROP TABLE IF EXISTS `workshop_workshop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workshop_workshop` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(250) DEFAULT NULL,
  `shortdescription` varchar(250) DEFAULT NULL,
  `description` longtext,
  `image` varchar(100) DEFAULT NULL,
  `duration` bigint DEFAULT NULL,
  `extensionproject_id` bigint DEFAULT NULL,
  `added_by_id` bigint DEFAULT NULL,
  `date_added` datetime(6) NOT NULL,
  `date_updated` datetime(6) NOT NULL,
  `slug` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `workshop_workshop_extensionproject_id_7a36e684_fk_workshop_` (`extensionproject_id`),
  KEY `workshop_workshop_added_by_id_3928e0fc_fk_registrations_user_id` (`added_by_id`),
  KEY `workshop_workshop_slug_bc9a67da` (`slug`),
  CONSTRAINT `workshop_workshop_added_by_id_3928e0fc_fk_registrations_user_id` FOREIGN KEY (`added_by_id`) REFERENCES `registrations_user` (`id`),
  CONSTRAINT `workshop_workshop_extensionproject_id_7a36e684_fk_workshop_` FOREIGN KEY (`extensionproject_id`) REFERENCES `workshop_extensionproject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workshop_workshop`
--

LOCK TABLES `workshop_workshop` WRITE;
/*!40000 ALTER TABLE `workshop_workshop` DISABLE KEYS */;
INSERT INTO `workshop_workshop` VALUES (10,'Workshop 1','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>','workshop_coverimages/default-background.png',108000000000,4,2,'2022-12-29 09:51:29.000000','2023-01-02 07:44:52.404270','workshop-1');
/*!40000 ALTER TABLE `workshop_workshop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workshop_workshop_category`
--

DROP TABLE IF EXISTS `workshop_workshop_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workshop_workshop_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `workshop_id` bigint NOT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `workshop_workshop_category_workshop_id_category_id_831a6904_uniq` (`workshop_id`,`category_id`),
  KEY `workshop_workshop_ca_category_id_feba13c3_fk_workshop_` (`category_id`),
  CONSTRAINT `workshop_workshop_ca_category_id_feba13c3_fk_workshop_` FOREIGN KEY (`category_id`) REFERENCES `workshop_category` (`id`),
  CONSTRAINT `workshop_workshop_ca_workshop_id_03e05dac_fk_workshop_` FOREIGN KEY (`workshop_id`) REFERENCES `workshop_workshop` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workshop_workshop_category`
--

LOCK TABLES `workshop_workshop_category` WRITE;
/*!40000 ALTER TABLE `workshop_workshop_category` DISABLE KEYS */;
INSERT INTO `workshop_workshop_category` VALUES (12,10,3);
/*!40000 ALTER TABLE `workshop_workshop_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workshop_workshop_co_facilitator`
--

DROP TABLE IF EXISTS `workshop_workshop_co_facilitator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workshop_workshop_co_facilitator` (
  `id` int NOT NULL AUTO_INCREMENT,
  `workshop_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `workshop_workshop_co_fac_workshop_id_extensionpro_a25cbda0_uniq` (`workshop_id`,`user_id`),
  KEY `workshop_workshop_co_user_id_c49e5fc5_fk_registrat` (`user_id`),
  CONSTRAINT `workshop_workshop_co_user_id_c49e5fc5_fk_registrat` FOREIGN KEY (`user_id`) REFERENCES `registrations_user` (`id`),
  CONSTRAINT `workshop_workshop_co_workshop_id_126dc3a4_fk_workshop_` FOREIGN KEY (`workshop_id`) REFERENCES `workshop_workshop` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workshop_workshop_co_facilitator`
--

LOCK TABLES `workshop_workshop_co_facilitator` WRITE;
/*!40000 ALTER TABLE `workshop_workshop_co_facilitator` DISABLE KEYS */;
INSERT INTO `workshop_workshop_co_facilitator` VALUES (8,10,3);
/*!40000 ALTER TABLE `workshop_workshop_co_facilitator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workshop_workshopfacilitator`
--

DROP TABLE IF EXISTS `workshop_workshopfacilitator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workshop_workshopfacilitator` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `is_active` tinyint(1) NOT NULL,
  `added_by_id` bigint DEFAULT NULL,
  `facilitator_id` bigint DEFAULT NULL,
  `workshop_id` bigint DEFAULT NULL,
  `date_added` datetime(6) NOT NULL,
  `date_updated` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `workshop_workshopfac_added_by_id_d5995cff_fk_registrat` (`added_by_id`),
  KEY `workshop_workshopfac_facilitator_id_2460708e_fk_workshop_` (`facilitator_id`),
  KEY `workshop_workshopfac_workshop_id_2eabccdd_fk_workshop_` (`workshop_id`),
  CONSTRAINT `workshop_workshopfac_added_by_id_d5995cff_fk_registrat` FOREIGN KEY (`added_by_id`) REFERENCES `registrations_user` (`id`),
  CONSTRAINT `workshop_workshopfac_facilitator_id_2460708e_fk_workshop_` FOREIGN KEY (`facilitator_id`) REFERENCES `workshop_extensionproject_member` (`id`),
  CONSTRAINT `workshop_workshopfac_workshop_id_2eabccdd_fk_workshop_` FOREIGN KEY (`workshop_id`) REFERENCES `workshop_workshop` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workshop_workshopfacilitator`
--

LOCK TABLES `workshop_workshopfacilitator` WRITE;
/*!40000 ALTER TABLE `workshop_workshopfacilitator` DISABLE KEYS */;
INSERT INTO `workshop_workshopfacilitator` VALUES (3,1,2,6,10,'2022-12-29 09:56:57.000000','2022-12-29 09:57:05.956626');
/*!40000 ALTER TABLE `workshop_workshopfacilitator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workshop_workshopfacilitator_co_facilitator`
--

DROP TABLE IF EXISTS `workshop_workshopfacilitator_co_facilitator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workshop_workshopfacilitator_co_facilitator` (
  `id` int NOT NULL AUTO_INCREMENT,
  `workshopfacilitator_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `workshop_workshopfacilit_workshopfacilitator_id_e_b8141c96_uniq` (`workshopfacilitator_id`,`user_id`),
  KEY `workshop_workshopfac_user_id_585a69bc_fk_registrat` (`user_id`),
  CONSTRAINT `workshop_workshopfac_user_id_585a69bc_fk_registrat` FOREIGN KEY (`user_id`) REFERENCES `registrations_user` (`id`),
  CONSTRAINT `workshop_workshopfac_workshopfacilitator__df07c65f_fk_workshop_` FOREIGN KEY (`workshopfacilitator_id`) REFERENCES `workshop_workshopfacilitator` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workshop_workshopfacilitator_co_facilitator`
--

LOCK TABLES `workshop_workshopfacilitator_co_facilitator` WRITE;
/*!40000 ALTER TABLE `workshop_workshopfacilitator_co_facilitator` DISABLE KEYS */;
INSERT INTO `workshop_workshopfacilitator_co_facilitator` VALUES (5,3,3);
/*!40000 ALTER TABLE `workshop_workshopfacilitator_co_facilitator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workshop_workshopparticipant`
--

DROP TABLE IF EXISTS `workshop_workshopparticipant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workshop_workshopparticipant` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `participant_id` bigint DEFAULT NULL,
  `workshop_id` bigint DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `added_by_id` bigint DEFAULT NULL,
  `is_finished` tinyint(1) NOT NULL,
  `date_added` datetime(6) NOT NULL,
  `date_updated` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `workshop_workshoppar_workshop_id_42d62625_fk_workshop_` (`workshop_id`),
  KEY `workshop_workshoppar_participant_id_4d3e84be_fk_registrat` (`participant_id`),
  KEY `workshop_workshoppar_added_by_id_a1e75624_fk_registrat` (`added_by_id`),
  CONSTRAINT `workshop_workshoppar_added_by_id_a1e75624_fk_registrat` FOREIGN KEY (`added_by_id`) REFERENCES `registrations_user` (`id`),
  CONSTRAINT `workshop_workshoppar_participant_id_4d3e84be_fk_registrat` FOREIGN KEY (`participant_id`) REFERENCES `registrations_user` (`id`),
  CONSTRAINT `workshop_workshoppar_workshop_id_42d62625_fk_workshop_` FOREIGN KEY (`workshop_id`) REFERENCES `workshop_workshop` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workshop_workshopparticipant`
--

LOCK TABLES `workshop_workshopparticipant` WRITE;
/*!40000 ALTER TABLE `workshop_workshopparticipant` DISABLE KEYS */;
INSERT INTO `workshop_workshopparticipant` VALUES (20,5,10,1,2,0,'2022-12-29 09:57:15.000000','2022-12-29 09:57:27.271192');
/*!40000 ALTER TABLE `workshop_workshopparticipant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workshop_workshopparticipant_co_facilitator`
--

DROP TABLE IF EXISTS `workshop_workshopparticipant_co_facilitator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workshop_workshopparticipant_co_facilitator` (
  `id` int NOT NULL AUTO_INCREMENT,
  `workshopparticipant_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `workshop_workshoppartici_workshopparticipant_id_w_2ea620ab_uniq` (`workshopparticipant_id`,`user_id`),
  KEY `workshop_workshoppar_user_id_f6ec9728_fk_registrat` (`user_id`),
  CONSTRAINT `workshop_workshoppar_user_id_f6ec9728_fk_registrat` FOREIGN KEY (`user_id`) REFERENCES `registrations_user` (`id`),
  CONSTRAINT `workshop_workshoppar_workshopparticipant__24e959a7_fk_workshop_` FOREIGN KEY (`workshopparticipant_id`) REFERENCES `workshop_workshopparticipant` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workshop_workshopparticipant_co_facilitator`
--

LOCK TABLES `workshop_workshopparticipant_co_facilitator` WRITE;
/*!40000 ALTER TABLE `workshop_workshopparticipant_co_facilitator` DISABLE KEYS */;
INSERT INTO `workshop_workshopparticipant_co_facilitator` VALUES (5,20,3);
/*!40000 ALTER TABLE `workshop_workshopparticipant_co_facilitator` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-04 21:24:06
