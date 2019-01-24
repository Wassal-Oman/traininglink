-- MySQL dump 10.13  Distrib 5.6.35, for linux-glibc2.5 (x86_64)
--
-- Host: localhost    Database: training_links
-- ------------------------------------------------------
-- Server version	5.6.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES UTF8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `access_token_lookup`
--

DROP TABLE IF EXISTS `access_token_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access_token_lookup` (
  `access_token` char(255) NOT NULL,
  `last_activity_datetime` bigint(11) NOT NULL,
  `email` varchar(45) NOT NULL,
  UNIQUE KEY `access_token_UNIQUE` (`access_token`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `_idx` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access_token_lookup`
--

LOCK TABLES `access_token_lookup` WRITE;
/*!40000 ALTER TABLE `access_token_lookup` DISABLE KEYS */;
INSERT INTO `access_token_lookup` VALUES ('001785cf-90b0-459f-8e68-d5371dec8a49',1517379915536,'intisar@abc.com'),('03be489f-1025-4db5-863f-d5a0d3e8fde9',1528697303808,'alkharousi46@gmail.com'),('0488197b-2ca6-4ec2-bca6-5753d290a808',1505377476558,'samera@gmail.com'),('0497adce-df42-42a2-b5e3-d4442d748a1e',1519554442061,'hhbg@gmail.com'),('08721149-58ab-4c2c-b2ee-79a8c9ae67e1',1528700989613,'tora-1991@hotmail.com'),('10a5d871-fccc-4bc5-a96d-1ac1deb291e7',1508828265999,'ahmed@gmail.com'),('12ef7cd7-e013-4383-a110-c0f0b44ac699',1505891461171,'tester11@gmail.com'),('180a5499-f50d-4c9c-92a2-66fe6c0bcc2e',1508824587362,'ahmed4@gmail.com'),('18ab5515-9a97-43f4-aa91-f4be206d7e9f',1502708188455,'mohammed@gmail.com'),('1beb8c53-928d-407f-b9aa-68be910f3c42',1501136328608,'prasannavj@hcl.com'),('1d34dfdc-9018-4957-982c-697eeb29dbf5',1518942773820,'sayuishimizy@hotmail.com'),('28d68237-c65a-42c0-a996-d9cf87b2951a',1507529397956,'najah.hood@gmail.com'),('2a5d3844-bad6-4889-bf25-3415bfb36e80',1517986627394,'aillmaktoob@gmail.com'),('2c1c0888-5f06-41e3-90fd-11f901028828',1505886927288,'marwa@hotmail.com'),('31ab1a49-a09b-4591-a8aa-66c0ba66c244',1516102469671,'amani@gmail.com'),('350f340c-66b2-4563-8e18-307e6a98fd76',1507700062442,'z@gmail.com'),('35591373-b9cf-4ad0-a308-fe2e549b1160',1526543190585,'twittserx@gmail.com'),('3582a324-9f85-4a6a-987d-8d3fcdaa8649',1528003723318,'hana92900@hotmail.com'),('37b5c989-e8f8-4df5-a220-176ee67acaf2',1520063789448,'hana99@gmail.com'),('38f03ef4-52bf-4816-8610-744f6d38e4df',1517983325654,'alkarousi1995@hotmail.com'),('3b22456d-f8cb-4b86-a26e-e690d12a87e1',1501485712767,'tester@gmail.com'),('3cf1ffaa-ff25-47d5-b157-d0f28854201e',1521711007499,'hh92900@gmail.com'),('3d492abb-e6b1-45ce-a8e2-3f85dc6cd753',1526960740150,'prasannavj@gmail.com'),('3f1f9650-6191-4ec4-8b9d-e5ce9c091dac',1509269757368,'facebooker@gmail.com'),('3f3e9573-93a3-44c1-bd8c-66d279ea55e3',1503295712024,'salem@gmail.com'),('40ede783-e2e9-47a1-8a6d-a2139f616f5e',1518516002682,'twitterz@gmail.com'),('46054090-d92c-47b6-940a-fb261edd03cd',1517986510759,'t-flower-1990@hotmail.com'),('460bfcdd-62b4-4875-b91a-43bdd41cf62f',1528015080357,'marwa123101@gmail.com'),('47bee514-4a7c-4c2a-a5b9-197cc0728b2e',1523870036599,'wardah9658@gmail.com'),('48e1398c-223c-4d7f-8225-bfe976d40574',1529391633757,'Assoolah37@hotmail.com'),('50fd92cc-935a-421f-b9b1-99d4b1e7344e',1529474629671,'pceng13r@gmail.com'),('569e9b93-4b57-42a0-a598-78db155fee63',1526358630386,'myTestEmail@gmail.com'),('593394e0-614d-4518-b4a4-7ff49faa5f9f',1513677184337,'jassim@gmail.com'),('5d4f35cc-44c6-4b6c-add2-b58cb45262a0',1528016405953,'twitterx@gmail.com'),('5dd7665d-af99-42de-bd56-079a56b37535',1528697273041,'hanoo9289@gmail.com'),('6a2724b0-1aba-4df0-8f14-14739920c7d5',1510733883404,'prs@gmail.com'),('6ba53a2e-8457-4119-a7c6-c9b489f5f422',1528271196484,'sas-test-fatma1@hotmail.com'),('6cbdb0b4-6b44-4831-b13a-9de6500ded7e',1510568649798,'tftdtrs@www.com'),('6dba1241-8095-479f-bfdf-17b160f2c691',1517465402459,'nhh90999@gmail.com'),('6f7e4032-ad46-4146-98c6-d21032ee7d4f',1528267982078,'sas-test-fatma3@hotmail.com'),('70664514-89b6-42b2-b56c-dcc16248188d',1513845202455,'jana.malli@gmail.com'),('7067e245-db3f-450d-ac9a-faaf27d94f59',1527575664877,'hana92900@gmail.com'),('72fcdf6e-673d-4d71-b501-43a8e284e87f',1528271977676,'rahma11048@cceoman.net'),('73db110d-8ac9-4905-a352-6c04329fa98a',1503299907632,'a.software_2015@hotmail.com'),('83de6144-a1df-4c63-9569-c5ff33c5ddcc',1514783650134,'keerththi.pro@gmail.com'),('853ddca0-ddf4-4252-b5cf-ef5bc719a6b8',1507804104505,'beenishshafi@outlook.com'),('856a4503-58c2-4a93-9312-4f1caf953434',1519725930702,'hhhh@gmail.com'),('8601f758-61de-4111-92ed-a8c548340c67',1508742617775,'m@gmail.com'),('8910902d-be03-41df-b36e-75b108534fe5',1510485009278,'marym@www.com'),('8c26cf87-2429-4534-b5c5-7cd7df0fe4dd',1519728059404,'shdhhd@h.com'),('8d1ad532-66b2-40bf-bafd-ec0ce4afae2b',1527908571259,'darren@ielts.om'),('8dbf5ba3-e309-4d36-a037-af1ce75b9f75',1517476253492,'ojp4sasmob@gmail.com'),('8f28402e-9462-431e-b251-c5dfd298bd5c',1516103144442,'alkarousi46@gmail.com'),('8fcfb0fb-f3c5-4541-8a9e-731a2c288bc8',1528268919444,'pceng13@gmail.com'),('90448092-7e92-42a7-b434-c7896017ca2e',1526355727311,'abcd@gmail.com'),('916821c5-d17b-48c1-8573-df3ecdfabf45',1501486911453,'abdallah@hotmail.com'),('9264daeb-11a7-4164-af50-fe2eedb46c4f',1528186367420,'sas-test-fatma2@hotmail.com'),('9bfd8461-f975-41f1-add8-6c1c5148b436',1518512595268,'open_wyrlppu_user@tfbnw.net'),('a1af9f58-f957-4f6a-85e6-0c3bb76da78f',1509534163717,'jana.malli2@gmail.com'),('a5cad0a7-476d-467c-99c9-9ef01e9254f5',1525681909682,'traininglink@gmail.com'),('a7da2147-ccc9-456f-9b43-42b35b7b3361',1503296747855,'alwarith@gmail.com'),('ÀaÆýí¨ÍÛEZ‰¤}ŸÖ¿B˜Î+Õ°SM³c›Æ',1495434269113,'sabri@email.com'),('ae35de98-76fc-4ef2-83fc-8417180e351f',1519726096451,'gjcjcjfjcjf@g.com'),('af0b85b5-823f-4f2b-9a2f-a0c1c08128ee',1519728112547,'rosesalim07@gmail.com'),('af35b411-79ab-4703-ae5c-cc425b840c1c',1501407136621,'tester@hotmail.com'),('b10c354b-73a4-4e43-a30f-7db6320bfd3e',1525590180302,'traininglink979@gmail.com'),('b344c459-9a82-49e7-8d6d-114b4d1f7c63',1519553593692,'hahahha@gmail.com'),('b38153b8-3a63-4a31-acbb-10a4fc3148ec',1517400104255,'abc@xyzc.com'),('b42bb57b-7d7e-4330-b125-c1efc1f82013',1514361625702,'beenishshafi@htc.co.in'),('b6252000-8af9-456d-a957-6720e56f4dd6',1510485244458,'dggfxfggv@fggg.com'),('b9f7b46f-e562-4d46-8a48-f3e98dac646b',1514030554705,'aljoory383@gmail.com'),('bbf36cec-08f7-4206-a3e4-957dca4189da',1528021496937,'sayurishimizy@hotmail.com'),('bc7cd195-59f8-4203-9bce-1578b9648972',1502262838827,'ihz100@hotmail.com'),('bdb031a2-0727-44bd-a266-e0e28b40a975',1516098268394,'abc@hotmail.com'),('bdb93974-5208-499f-8f1c-6e95ae381a81',1510480197420,'sas_mobile2020@outlook.com'),('c31bf38f-ffdc-471f-90e5-54806fa70492',1526921976756,'intisar1@moe.om'),('c3af6bfa-6247-4ce3-9a3c-b4ca6e6a23dd',1508313447693,'l@gmail.com'),('ccfe47e7-609b-4d87-a289-a60be665d896',1528014825440,'marwa96693@gmail.com'),('d1be127e-772c-4be1-b7d0-bbb27090a0fb',1516535186694,'ahmed@hotmail.com'),('d353c2a5-98e6-4d2f-9d96-c8bf17ff3a87',1501058484116,'ali@gmil.com'),('d4cfcafe-87c9-4701-843d-869e87ae8de9',1514286702139,'al87azri@gmail.com'),('db5a772c-a3bc-412a-97e4-d1dab551946a',1514712723082,'aaa@gmail.com'),('db734d50-88ea-46eb-acea-69ee5244680a',1516096108236,'abc@gmail.com'),('ddc7418f-d0c3-4dcf-94be-67a49dc10bb3',1505886824385,'aberre@gmail.com'),('df3a1e3b-f971-408d-b5c5-e3feb496ab2a',1531655988517,'abc@xyz.com'),('dfa276a3-719c-4125-9673-ff066dbe17cc',1505886420700,'jahena@gmail.com'),('e05e7419-76b1-497d-bee5-f1375b05e643',1511978819712,'najah.albusaidi@gmail.com'),('e083ac58-f37e-4af3-bf01-cbf8546cdbac',1528701745313,'alkharousi@gmail.com'),('e0ca8929-4260-4b7d-9c0c-c42f9853ef78',1507699798247,'aa@gmail.com'),('e200d726-dc63-4e4b-ad5f-0fd55bafa85b',1520748135578,'tuon_16@g-mail.com'),('e55ea210-1f5a-496d-84de-7530622110f5',1525323687245,'sbrkrs@gmail.com'),('e9c2ce5a-4aff-4c30-af7f-5241f92725eb',1528182987945,'alwadhahi.rahma@gmail.com'),('ea987d66-d3f3-49ef-8e75-43f841a00fc6',1517488812825,'aaykindi@gmail.com'),('f10d9ab5-c4e3-4426-a753-f8e6068aff87',1513687619633,'traininglike979@gmail.com'),('f315bde1-594a-49fe-9b32-59c72251e61b',1519554441003,'hana929@gmail.com'),('f49f01e9-b65f-4f49-868a-6cda49570f39',1518514367867,'twittery@gmail.com'),('f533beb6-78b0-4232-ace3-1a0c4657036e',1505896727703,'najah@gmail.com'),('f70e2365-00c4-4dc0-85fd-c93a4bfa19f8',1509271619310,'a@gmail.com'),('ff0b1be2-9754-4663-8c79-adabdfe4f8c9',1526892396575,'omani16@gmail.com'),('TLï;àôOÀêø¹l¥¹WðO	(çÏàQ? æYB\0',1495450438420,'sdfaeaw@ssdfas.com');
/*!40000 ALTER TABLE `access_token_lookup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `advertisement`
--

DROP TABLE IF EXISTS `advertisement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advertisement` (
  `advertisement_id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `target_url` varchar(255) DEFAULT NULL,
  `clicks` int(11) DEFAULT NULL,
  `views` int(11) DEFAULT NULL,
  `institute_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`advertisement_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advertisement`
--

LOCK TABLES `advertisement` WRITE;
/*!40000 ALTER TABLE `advertisement` DISABLE KEYS */;
INSERT INTO `advertisement` VALUES (1,'advertisement/ad_1.png','http://nationalgeographic.com',32,55,1),(2,'advertisement/ad_2.png','http://bbc.co.uk',12,88,NULL);
/*!40000 ALTER TABLE `advertisement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authentication_log`
--

DROP TABLE IF EXISTS `authentication_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authentication_log` (
  `email` varchar(255) NOT NULL,
  `datetime` int(11) NOT NULL,
  KEY `email_auth_log_idx` (`email`),
  CONSTRAINT `email_auth_log` FOREIGN KEY (`email`) REFERENCES `users` (`email`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authentication_log`
--

LOCK TABLES `authentication_log` WRITE;
/*!40000 ALTER TABLE `authentication_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `authentication_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_categories`
--

DROP TABLE IF EXISTS `course_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_categories` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(64) NOT NULL,
  `arabic_category` varchar(64) NOT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `arabic_category_UNIQUE` (`arabic_category`),
  UNIQUE KEY `category_UNIQUE` (`category`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_categories`
--

LOCK TABLES `course_categories` WRITE;
/*!40000 ALTER TABLE `course_categories` DISABLE KEYS */;
INSERT INTO `course_categories` VALUES (1,'Pyschology','علم النفس'),(2,'Programming','برمجة'),(3,'Languages','لغات');
/*!40000 ALTER TABLE `course_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses` (
  `course_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `course_description` varchar(1024) NOT NULL,
  `activities` varchar(1024) NOT NULL,
  `milestones` varchar(1024) NOT NULL,
  `course_address` varchar(255) NOT NULL,
  `arabic_title` varchar(255) NOT NULL,
  `arabic_course_description` varchar(1024) NOT NULL,
  `arabic_activities` varchar(1024) NOT NULL,
  `arabic_milestones` varchar(1024) NOT NULL,
  `arabic_course_address` varchar(255) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `price` float NOT NULL,
  `time_post` bigint(15) NOT NULL,
  `time_course_start` bigint(15) NOT NULL,
  `time_registration_deadline` int(11) NOT NULL,
  `course_picture` varchar(255) NOT NULL,
  `is_at_morning` tinyint(4) NOT NULL,
  `is_online` tinyint(4) NOT NULL,
  `course_location_latitude` float NOT NULL,
  `course_location_longitude` float NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  UNIQUE KEY `course_id_UNIQUE` (`course_id`),
  KEY `fk_course_category_idx` (`category_id`),
  CONSTRAINT `fk_course_category` FOREIGN KEY (`category_id`) REFERENCES `course_categories` (`category_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'Self Control','This is my description One','These are my activities','These are my milestones','Nizwa','عنوان','الوصف','الأنشطة','الإنجازات','نزوى',1,99.999,1508674576,1508674576,1496742391,'institute/1.png',-1,0,23.6873,57.9103,0),(2,'Python','Python description','Pythong activities','Python Milestones','SQU','عنوانعنوان','الوصفالوصف','الوصفالوصف','الإنجازاتv','الجامعة',2,89.999,1508750040,1508750040,1496088392,'institute/2.png',0,-1,23.6341,58.1561,0),(3,'Java','Python \r\ndescription','Pythong \r\nactivities','Python\r\n Milestones','SQU','عنوانعنوان','الو\r\nصفالوصف','الوصفال\r\nصف','الإن\r\nجازاتv','الجامعة',2,89.999,1508577240,1508577240,1496088392,'institute/2.png',0,-1,23.5863,58.3484,0),(4,'javascript','deleted Python \r\ndescription','deleted Pythong \r\nactivities','deleted Python\r\n Milestones','deleted SQU','deleted عنوانعنوان','deleted الو\r\nصفالوصف','deleted الوصفال\r\nصف','deleted الإن\r\nجازاتv','الجامعdeleted  ',2,89.999,1508490840,1508674576,1496088392,'institute/2.png',0,-1,23.5372,58.1932,1),(5,'swift','This is my\r\n description2','These are \r\nmy activities2','These are my \r\nmilestones2','Nizwa','عنوان','الوصف\r\nالوصف','الأنشطة\r\nالوصف','الإنجازات\r\nالوصف','نزوى',1,99.999,1508674576,1508836440,1496742391,'institute/1.png',-1,0,23.6873,58.3484,0),(6,'Html','This is my description','These are my activities','These are my milestones','Nizwa','عنوان','الوصف','الأنشطة','الإنجازات','نزوى',1,99.999,1508922840,1508922840,1496742391,'institute/1.png',-1,0,23.6341,58.3484,0),(7,'Ios','Python description','Pythong activities','Python Milestones','SQU','عنوانعنوان','الوصفالوصف','الوصفالوصف','الإنجازاتv','الجامعة',2,89.999,1509009240,1509009240,1496088392,'institute/2.png',0,-1,23.5863,58.1561,0),(8,'hyperd','Python \r\ndescription','Pythong \r\nactivities','Python\r\n Milestones','SQU','عنوانعنوان','الو\r\nصفالوصف','الوصفال\r\nصف','الإن\r\nجازاتv','الجامعة',2,89.999,1509095640,1509095640,1496088392,'institute/2.png',0,-1,1.24324,1.49823,0),(9,'android','deleted Python \r\ndescription','deleted Pythong \r\nactivities','deleted Python\r\n Milestones','deleted SQU','deleted عنوانعنوان','deleted الو\r\nصفالوصف','deleted الوصفال\r\nصف','deleted الإن\r\nجازاتv','الجامعdeleted  ',2,89.999,1509182040,1509182040,1496088392,'institute/2.png',0,-1,1.24324,1.49823,1),(10,'linux','This is my\r\n description2','These are \r\nmy activities2','These are my \r\nmilestones2','Nizwa','عنوان','الوصف\r\nالوصف','الأنشطة\r\nالوصف','الإنجازات\r\nالوصف','نزوى',1,99.999,1509268440,1509268440,1496742391,'institute/1.png',-1,0,1.23423,2.32412,0),(11,'windows','Python \r\ndescription','Pythong \r\nactivities','Python\r\n Milestones','SQU','عنوانعنوان','الو\r\nصفالوصف','الوصفال\r\nصف','الإن\r\nجازاتv','الجامعة',2,89.999,1509268440,1509268440,1496088392,'institute/2.png',0,-1,1.24324,1.49823,0),(12,'css','This is my\r\n description2','These are \r\nmy activities2','These are my \r\nmilestones2','Nizwa','عنوان','الوصف\r\nالوصف','الأنشطة\r\nالوصف','الإنجازات\r\nالوصف','نزوى',1,99.999,1509268440,1509268440,1496742391,'institute/1.png',-1,0,1.23423,2.32412,0),(13,'Writing course for the IELTS exam','The results of the IELTS test indicate that the written part of the exam is often the most challenging for students.\nA new IELTS writing course has been designed to support students in this part of the academic class.\n\nCourse Duration: 12 hours 1 lesson per week for 4 weeks\nLevels: Intermediate and higher.\nRegistration: through the leveling exam','Writing','Through the IELTS writing course with English language experts in the world you will be able to:\nReview the basic requirements for each of the written tasks\nGet tips on what to do - and what should not - in both tasks\nLearn how to analyze questions and plan and structure your responses\nPractice writing and receiving feedback from an experienced teacher.','North Ghubra','دورة الكتابة لامتحان الـ \"IELTS ','تشير بيانات نتائج نظام امتحان اللغة الإنجليزية العالمي الـ \"IELTS \" إلى أن القسم الكتابي من الامتحان غالباً ما يكون الأكثر تحدياً بالنسبة للطلاب.\nلذلك، تم تصميم دورة جديدة للتركيز على الكتابة لامتحان الـ \"IELTS\" لدعم الطلاب في هذا الجزء من الاختبار المعدّ للفئة الأكاديمية.\n\nمدة الدورة : 12 ساعة درس واحد بالاسبوع على مدى 4 اسابيع \nالمستويات : المستوى المتوسط \"intermediate\" فأعلى .\nالتسجيل : عن طريق امتحان تحديد المستوى\n','الكتابة','من خلال الدورة مع خبراء اللغة الإنجليزية سوف تكون قادرا على:\nمراجعة المتطلبات الأساسية لكل مهمة من المهام المكتوبة\nالحصول على نصائح حول ما يجب القيام به - وما لا ينبغي - في كل من المهام\nتعرف على كيفية تحليل الأسئلة والتخطيط لهيكل الاجابات\nممارسة الكتابة وتلقي الاراء من المعلم من ذوي الخبرة.','غبرة الشمالية',3,50,1509282743,1511913600,1528973027,'institute/2.png',0,0,23.5852,58.3941,0),(14,'IELTS Preparation Course (72 hours intense course)','Course Information:\nCourse Duration: 15 hours five lessons over one week.\nLevels: Intermediate, above the average Upper intermediate and   Advanced','Listening, Speaking, Reading and Writing.','Your intensive IELTS course with English language experts in the world will enable you to:\nLearning by an experienced teacher with extensive IELTS experience and can provide you with the guidance you need to succeed\nGet guidance on your strengths and aspects that need improvement through practical IELTS exams\nExamining the format of the exam and the different types of questions using the latest preparation materials for the \"IELTS\"\nGet a login and password to use 30 hours of online training resources on the \"Road to IELTS\"\nFeeling more confident on the exam day - because we are partners in preparing this exam, there is no better than the British Council to help you get the best results.','North Ghoubra','دورات التحضير لامتحان \"IELTS\" (الدورات المكثفة 72 ساعة)','مدة الدورة : 30 ساعة خمس دروس على مدى اسبوع واحد.\nالمستويات : المتوسط \"Intermediate\" فوق المتوسط \"Upper intermediate\" المتقدم \"Advanced\n','التحدث, الاستماع, القراءة الكتابة','التعلم على يد معلم متمرس ولديه خبرة واسعة في امتحان \"IELTS\" ويمكنه تزويدك بالتوجيه الذي تحتاجه للنجاح\nالحصول على التوجيه فيما يتعلق بنقاط القوة لديك، والجوانب التي تحتاج إلى تحسينها من خلال التمارين العملية على امتحان \"IELTS\"\nالتعرف على شكل الامتحان وأنواع الأسئلة المختلفة باستخدام أحدث مواد التحضير لامتحان \"IELTS\"\nالحصول على تسجيل دخول وكلمة مرور لاستخدام 30 ساعة من موارد التدريب الإلكترونية على موقع التحضير للامتحان \"Road to IELTS\"\nالشعور بثقة أكبر يوم الامتحان - فلأننا شركاء في إعداد هذا الامتحان فلا يوجد أفضل من المجلس الثقافي البريطاني لمساعدتك في تحصيل أفضل النتائج.\n','الغبرةالشمالية',3,50,1509284301,1513036800,1512777600,'institute/2.png',0,0,23.5852,58.3941,0),(15,'Standard IELTS course','This course helps you learn strategies to help you get the highest scores on the exam.\nGet guidance on your strengths, and areas that need to be improved through practical exercises on the IELTS exam.','Activities:\nIdentify and train on the four sections of the IELTS exam.\nDevelop the required language and language skills.\nTraining in writing, speaking and learning basic grammar and vocabulary.','Obtaining a certified certificate from the Institute.\nIt is important that you get a certificate proving your course and the effort you have made to master your English language.\nUpon completion of your course with the London Institute of Training you will receive a certificate of completion of the course documenting your level in English and the proportion of your attendance at the Institute. We are proud that we are accredited by the world\'s largest and most prestigious institutions in our countries.','North Ghoubra','دورة إيلتس العام','تساعدك هذه الدورة لتعلم الاستراتيجيات اللازمة لمساعدتك في تحصيل أعلى الدرجات في الامتحان\nوالحصول على التوجيه فيما يتعلق بنقاط القوة لديك، والجوانب التي تحتاج إلى تحسينها من خلال التمارين العملية على امتحان الايلتس.','التعرف والتدرب على الأقسام الأربعة التي تُكوّن امتحان IELTS.\n تطوير المهارات الدراسية واللغوية المطلوبة.\nالتدرب على الكتابة والتحدث وتعلم قواعد ومفردات اللغة الأساسية.\n','الحصول على شهادة موثقة من المعهد\nمن المهم أن تحصل على شهادة تثبت بها دراستك للدورة والجهد الذي بذلته لإتقانك اللغة الإنجليزية.\nعند انتهاء دورتك مع معهد لندن للتدريب ستحصل على شهادة اتمام الدورة توثق مستواك باللغة الإنجليزية ونسبة حضورك في المعهد. نحن نفخر بأننا معتمدين من قبل كبرى المؤسسات العالمية والمرموقة في الدول التي نتواجد بها.\n','الغبرة الشمالية',3,60,1509285296,1512518400,1512086400,'institute/2.png',1,0,23.5852,58.3941,0),(16,'Speaking in English','This course is ideal for you if you want to improve your listening, confident speaking and clear communication. The speaking course helps you improve all aspects of oral communication and by developing your listening skills, we will help you keep up with conversations . Beyond the basic phrases in English; we will teach you the language you need to know in order to speak more fluently in a wide range of different situations. We will also help you develop your conversational skills and encourage you to speak with roleplay, debates and discussions.','Speaking','Practice listening more attentively\nLearn phrases that will help you improve your English language\nLearn to speak with greater confidence','North Ghubra','دورة المحادثة باللغة الإنجليزية','تعد هذه الدورة مثالية لك إذا كنت ترغب بتحسين مهاراتك في الاستماع والتحدث بثقة والتواصل مع الآخرين بوضوح أكبر، إذ تساعدك دورة المحادثة على تحسين جميع جوانب التواصل الشفهي ومن خلال تطوير مهاراتك في الاستماع، سوف نساعدك على متابعة المحادثات والمشاركة فيها بشكل أفضل سوف تتعلم ما هو أكثر من بعض العبارات الأساسية في اللغة الإنجليزية؛ حيث سنعلمك اللغة التي تحتاج لمعرفتها من أجل التحدث بطلاقة أكبر في نطاق واسع من المواقف المختلفة. كما سنساعدك على تنمية مهاراتك في المحادثة ونشجعك على التحدث من خلال تمثيل الأدوار والمناظرات والمناقشات\n\nمدة الدورة : 12 ساعة درس واحد بالاسبوع على مدى 4 اسابيع \nتتكون هذه الدورات من خمس دروس مدة كل منها ساعتين ونصف الساعة وتعقد مرة في الأسبوع .\n','المحادثة','التدرب على الاستماع بانتباه أكبر \nتعلم عبارات تساعدك في تحسين طلاقتك باللغة الإنجليزية\nتعلم التحدث بثقة أكبر\n','الغبرة الشمالية',3,50,1510138679,1511089072,1510916272,'institute/1.png',1,0,23.5852,58.3941,0),(17,'IELTS Preperation course (24 hours)','Course Duration: 30 hours Five lessons over one week.\nLevels: Intermediate, above average, Upper intermediate and Advanced','Reading, writing, speaking and listenting.','Learning by an experienced teacher with extensive IELTS experience and can provide you with the guidance you need to succeed\nGet guidance on your strengths and aspects that need improvement through practical IELTS exams\nExamining the format of the exam and the different types of questions using the latest preparation materials for the \"IELTS\"\nGet a login and password to use 30 hours of online training resources on the \"Road to IELTS\"','North Ghoubra',' دورات التحضير لامتحان \"IELTS\" (الدورات المكثفة 24 ساعة)','مدة الدورة : 30 ساعة خمس دروس على مدى اسبوع واحد.\nالمستويات : المتوسط \"Intermediate\" فوق المتوسط \"Upper intermediate\" المتقدم \"Advanced\" \n','القراءة والكتابة والتحدث والاستماع.','التعلم على يد معلم متمرس ولديه خبرة واسعة في امتحان \"IELTS\" ويمكنه تزويدك بالتوجيه الذي تحتاجه للنجاح\nالحصول على التوجيه فيما يتعلق بنقاط القوة لديك، والجوانب التي تحتاج إلى تحسينها من خلال التمارين العملية على امتحان \"IELTS\"\nالتعرف على شكل الامتحان وأنواع الأسئلة المختلفة باستخدام أحدث مواد التحضير لامتحان \"IELTS\"\nالحصول على تسجيل دخول وكلمة مرور لاستخدام 30 ساعة من موارد التدريب الإلكترونية على موقع التحضير للامتحان \"Road to IELTS\"\n','الغبرة الشمالية ',3,50,1510139896,1511521072,1511175472,'institute/1.png',0,0,23.5852,58.3941,0),(18,'ILETS 4 Course','Course duration: 72 hours Five lessons over two weeks.\nLevels: Intermediate, about Average, Upper intermediate, and Advanced','-','-','North Ghoubra','دورة IELTS 2','مدة الدورة : 72 ساعة خمس دروس على مدى اسبوعين .\nالمستويات : المتوسط \"Intermediate\" فوق المتوسط \"Upper intermediate\" المتقدم \"Advanced\" \n','-','-','الغبرة الشمالية',3,150,1510140534,1512125872,1511866672,'institute/2.png',0,0,23.5852,58.3941,0),(19,'ILETS 7 Course','The preparation and preparation of the IELTS exam increases the chances of success and the achievement of higher grades, and because we are part of the examination board, there is no better to help to get the score you need, this course is designed to give you a competitive advantage when you enter the exam.','Identify the four components of the exam: listening, reading, writing and speaking\nDeveloping the skills and methods of answering the exam\nGet typical tests and special notes','-','North Ghoubra','دورة IELTS 7','إن الاستعداد والتحضير لامتحان الآيلتس (IELTS) يزيد من فرص النجاح وتحصيل درجات أعلى، ولأننا أحد المشاركين في وضع هذا الامتحان فلا يوجد أفضل منا لمساعدتك في تحصيل الدرجة التي تحتاجها، إذ صُممت هذه الدورة لمنحك ميزة تنافسية عند دخولك الامتحان. \n','التعرف على مكونات الامتحان الأربعة: الاستماع والقراءة والكتابة والمحادثة\nتطوير مهارات وأساليب الإجابة على الامتحان\nالحصول على اختبارات نموذجية وملاحظات خاصة\n','-','الغبرة الشمالية',3,199,1510140911,1512989872,1512903472,'institute/2.png',0,0,23.5852,58.3941,0);
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favourites`
--

DROP TABLE IF EXISTS `favourites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favourites` (
  `favourite_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`favourite_id`),
  KEY `course_id_idx` (`course_id`),
  KEY `email_idx` (`email`),
  CONSTRAINT `course_id` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `email` FOREIGN KEY (`email`) REFERENCES `users` (`email`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=302 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favourites`
--

LOCK TABLES `favourites` WRITE;
/*!40000 ALTER TABLE `favourites` DISABLE KEYS */;
INSERT INTO `favourites` VALUES (27,2,'ahmed@gmail.com'),(28,1,'tester@hotmail.com'),(32,4,'abc@xyz.com'),(36,7,'ihz100@hotmail.com'),(52,11,'samera@gmail.com'),(53,5,'samera@gmail.com'),(61,1,'tester11@gmail.com'),(63,5,'aa@gmail.com'),(82,5,'beenishshafi@outlook.com'),(83,1,'al87azri@gmail.com'),(106,11,'al87azri@gmail.com'),(107,6,'sas_mobile2020@outlook.com'),(108,13,'sas_mobile2020@outlook.com'),(109,12,'sas_mobile2020@outlook.com'),(118,1,'prs@gmail.com'),(161,2,'najah.albusaidi@gmail.com'),(162,8,'najah.albusaidi@gmail.com'),(169,2,'aljoory383@gmail.com'),(180,1,'rosesalim07@gmail.com'),(181,10,'rosesalim07@gmail.com'),(187,15,'aaykindi@gmail.com'),(188,19,'aaykindi@gmail.com'),(190,1,'aillmaktoob@gmail.com'),(192,12,'aillmaktoob@gmail.com'),(201,1,'ojp4sasmob@gmail.com'),(202,3,'ojp4sasmob@gmail.com'),(203,5,'ojp4sasmob@gmail.com'),(219,1,'wardah9658@gmail.com'),(220,12,'wardah9658@gmail.com'),(222,11,'wardah9658@gmail.com'),(223,10,'wardah9658@gmail.com'),(236,2,'traininglink979@gmail.com'),(237,1,'hana92900@gmail.com'),(238,11,'hana92900@gmail.com'),(239,13,'hana92900@gmail.com'),(241,1,'omani16@gmail.com'),(255,5,'Assoolah37@hotmail.com'),(269,5,'sas-test-fatma2@hotmail.com'),(270,1,'sas-test-fatma2@hotmail.com'),(272,8,'Assoolah37@hotmail.com'),(274,11,'Assoolah37@hotmail.com'),(275,19,'Assoolah37@hotmail.com'),(280,6,'tora-1991@hotmail.com'),(282,10,'tora-1991@hotmail.com'),(284,13,'tora-1991@hotmail.com'),(285,15,'tora-1991@hotmail.com'),(286,18,'tora-1991@hotmail.com'),(290,12,'tora-1991@hotmail.com'),(292,14,'tora-1991@hotmail.com'),(295,2,'alkharousi@gmail.com'),(296,1,'alkharousi@gmail.com'),(299,7,'pceng13r@gmail.com'),(300,6,'abc@xyz.com'),(301,19,'abc@xyz.com');
/*!40000 ALTER TABLE `favourites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedback` (
  `feedback_id` int(11) NOT NULL AUTO_INCREMENT,
  `feedback_text` varchar(2048) DEFAULT NULL,
  `rating` int(11) NOT NULL,
  `is_anonymous` tinyint(4) NOT NULL,
  `datetime` bigint(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `institute_id` int(11) NOT NULL,
  PRIMARY KEY (`feedback_id`),
  KEY `feedback_email_idx` (`email`),
  KEY `feedback_institute_id_idx` (`institute_id`),
  CONSTRAINT `feedback_email` FOREIGN KEY (`email`) REFERENCES `users` (`email`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `feedback_institute_id` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`institute_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=274 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (31,'Yellow comment comment',2,1,1497255697,'ahmed@gmail.com',1),(32,'Yellow comment comment',2,1,1497255771,'ahmed@gmail.com',1),(33,'Yellow comment comment',2,1,1497256296,'ahmed@gmail.com',1),(34,'Yellow comment comment',2,1,1497256296,'ahmed@gmail.com',1),(35,'Yellow comment comment',2,1,1497256296,'ahmed@gmail.com',1),(36,'Yellow comment comment',2,1,1497256386,'ahmed@gmail.com',1),(37,'Yellow comment comment',2,1,1497256386,'ahmed@gmail.com',1),(38,'Yellow comment comment',2,1,1497256397,'ahmed@gmail.com',1),(39,'Yellow comment comment',2,1,1497256397,'ahmed@gmail.com',1),(40,'Yellow comment comment',2,1,1497256397,'ahmed@gmail.com',1),(41,'Yellow comment comment',2,1,1497256516,'ahmed@gmail.com',1),(57,'First FeedBack Testing.....!',5,1,1501402770,'tester@hotmail.com',1),(59,'Good',4,0,1502283127,'najah.albusaidi@gmail.com',2),(60,'Good Course',4,0,1502626587,'najah.albusaidi@gmail.com',2),(61,'Good Course',4,0,1502626589,'najah.albusaidi@gmail.com',2),(62,'Good Course',4,0,1502626591,'najah.albusaidi@gmail.com',2),(63,'Good Course',4,0,1502626596,'najah.albusaidi@gmail.com',2),(64,'Good',2,0,1502788821,'abc@xyz.com',1),(65,'Good',2,0,1502788824,'abc@xyz.com',1),(66,'V.Good',2,0,1502946982,'najah.albusaidi@gmail.com',2),(67,'',2,0,1505286389,'najah.albusaidi@gmail.com',2),(68,'G00d',2,0,1505641016,'najah.albusaidi@gmail.com',1),(69,'Very nice course',2,0,1505641067,'najah.albusaidi@gmail.com',2),(70,'Very nice course',2,0,1505641138,'najah.albusaidi@gmail.com',2),(71,'',4,0,1505641411,'najah.albusaidi@gmail.com',1),(72,'Interesting Course^^',4,0,1505641450,'najah.albusaidi@gmail.com',1),(73,'Interesting Course^^',4,0,1505641453,'najah.albusaidi@gmail.com',1),(74,'Interesting Course^^',4,0,1505641456,'najah.albusaidi@gmail.com',1),(75,'Interesting Course',4,0,1505641462,'najah.albusaidi@gmail.com',1),(76,'Interesting Course',4,0,1505641471,'najah.albusaidi@gmail.com',1),(77,'Interesting Course',4,0,1505641472,'najah.albusaidi@gmail.com',1),(78,'interesting Course',2,0,1505641500,'najah.albusaidi@gmail.com',1),(79,'interesting Course',2,0,1505641530,'najah.albusaidi@gmail.com',1),(80,'interesting Course',2,0,1505641535,'najah.albusaidi@gmail.com',1),(81,'interesting Course',2,0,1505641623,'najah.albusaidi@gmail.com',1),(82,'interesting Course',2,0,1505641625,'najah.albusaidi@gmail.com',1),(83,'interesting Course',2,0,1505641630,'najah.albusaidi@gmail.com',1),(84,'interesting Course',2,0,1505641693,'najah.albusaidi@gmail.com',1),(85,'interesting Course',2,0,1505641718,'najah.albusaidi@gmail.com',1),(86,'interesting Course',2,0,1505641729,'najah.albusaidi@gmail.com',1),(87,'json',2,0,1505641914,'najah.albusaidi@gmail.com',2),(88,'json',2,0,1505641919,'najah.albusaidi@gmail.com',2),(89,'json',2,0,1505641921,'najah.albusaidi@gmail.com',2),(90,'json',2,0,1505641939,'najah.albusaidi@gmail.com',2),(91,'json',2,0,1505641943,'najah.albusaidi@gmail.com',2),(92,'vg',2,0,1505642745,'najah.albusaidi@gmail.com',2),(93,'vg',2,0,1505642775,'najah.albusaidi@gmail.com',2),(94,'Good',2,0,1505643557,'najah.albusaidi@gmail.com',2),(95,'',2,0,1505643666,'najah.albusaidi@gmail.com',1),(96,'',2,0,1505747014,'najah.albusaidi@gmail.com',2),(97,'هههه',2,0,1505748293,'najah.albusaidi@gmail.com',2),(98,'نجاح البوسعيديه',5,0,1505748359,'najah.albusaidi@gmail.com',2),(99,'Good ^^',4,0,1505803002,'najah.albusaidi@gmail.com',2),(100,'good Course',2,0,1506590854,'najah.albusaidi@gmail.com',2),(101,'Woo0',2,0,1507096341,'aa@gmail.com',2),(102,'fjxhh',5,0,1507458224,'abc@xyz.com',2),(103,'hhgg',5,0,1507465363,'abc@xyz.com',2),(104,'ggg',3,0,1507465474,'abc@xyz.com',2),(105,'nn',2,0,1507465675,'abc@xyz.com',2),(106,'',2,0,1507465845,'abc@xyz.com',2),(107,'good',4,0,1507526705,'abc@xyz.com',2),(108,'',2,0,1507526852,'najah.albusaidi@gmail.com',2),(109,'xxxxx',4,0,1507538101,'najah.albusaidi@gmail.com',1),(110,'xxxxx',4,0,1507538107,'najah.albusaidi@gmail.com',1),(111,'xxxxx',4,0,1507538108,'najah.albusaidi@gmail.com',1),(112,'xxxx',3,0,1507538214,'najah.albusaidi@gmail.com',1),(113,'OOOO',2,0,1507538363,'najah.albusaidi@gmail.com',2),(114,'OOOO',2,0,1507538379,'najah.albusaidi@gmail.com',2),(115,'OOOO',2,0,1507538379,'najah.albusaidi@gmail.com',2),(116,'OOOO',2,0,1507538380,'najah.albusaidi@gmail.com',2),(117,'',2,0,1507539873,'najah.albusaidi@gmail.com',2),(118,'sss',2,0,1507540322,'najah.albusaidi@gmail.com',2),(119,'XXXX00XXXXX',5,0,1507540959,'najah.albusaidi@gmail.com',2),(120,'OOOOO-_-000000',2,0,1507541043,'najah.albusaidi@gmail.com',2),(121,'QQQQQ',5,0,1507541405,'najah.albusaidi@gmail.com',2),(122,'QQQQQ',5,0,1507541420,'najah.albusaidi@gmail.com',2),(123,'',2,0,1507541701,'najah.albusaidi@gmail.com',2),(124,'Excelent Course',2,0,1507542371,'najah.albusaidi@gmail.com',1),(125,'KKK',5,0,1507542470,'najah.albusaidi@gmail.com',1),(126,'LLLLL',5,1,1507542767,'najah.albusaidi@gmail.com',2),(127,'WWW',5,0,1507543115,'najah.albusaidi@gmail.com',2),(128,'Ex',4,0,1507543176,'najah.albusaidi@gmail.com',2),(129,'',2,0,1507543205,'najah.albusaidi@gmail.com',2),(130,'SSSS',3,0,1507543293,'najah.albusaidi@gmail.com',1),(131,'AAAAABBBBBBCCCC',5,0,1507543599,'najah.albusaidi@gmail.com',1),(132,'HHHHHHH',5,0,1507543796,'abc@xyz.com',2),(133,'ggg',5,0,1507544639,'najah.albusaidi@gmail.com',2),(134,'ppp',5,0,1507544832,'najah.albusaidi@gmail.com',1),(135,'abcdefghijk',2,0,1507545324,'abc@xyz.com',2),(136,'rrrr',5,0,1507545683,'najah.albusaidi@gmail.com',2),(137,'',5,0,1507545705,'najah.albusaidi@gmail.com',2),(138,'FFFFF',5,0,1507577214,'najah.albusaidi@gmail.com',2),(139,'DDDD',2,1,1507577246,'najah.albusaidi@gmail.com',2),(140,'Goooo00d',2,1,1507577800,'najah.albusaidi@gmail.com',1),(141,'NNNN',5,0,1507577845,'najah.albusaidi@gmail.com',1),(142,'bb',2,1,1507722245,'prasannavj@gmail.com',2),(143,'',5,1,1507797128,'beenishshafi@outlook.com',2),(144,'',5,1,1507803555,'beenishshafi@outlook.com',1),(145,'',2,0,1508742075,'najah.albusaidi@gmail.com',2),(146,'thanks\n12-11-2017',5,1,1510471275,'sas_mobile2020@outlook.com',2),(147,'fhcbvv',5,1,1510480996,'abc@xyz.com',1),(148,'very good\n ',5,0,1510572698,'abc@xyz.com',2),(149,'Najah',4,1,1510750659,'najah.albusaidi@gmail.com',2),(150,'^_^  *_* ^_^',2,1,1512775458,'aaykindi@gmail.com',3),(151,'انتصار\n\n\n\n\n',4,1,1513717603,'aljoory383@gmail.com',2),(152,'This is written by Ms. Intisar',2,1,1513844414,'jana.malli@gmail.com',2),(153,'New Comment',2,1,1513844603,'jana.malli@gmail.com',2),(154,'٧٧٧٧\n',4,1,1513980733,'aljoory383@gmail.com',2),(155,'it\'s Good',2,1,1514364793,'abc@xyz.com',2),(156,'good',3,1,1514439651,'abc@xyz.com',2),(157,'Enter your comment here',5,0,1516272076,'aillmaktoob@gmail.com',2),(158,'Enter your comment here',5,0,1516272077,'aillmaktoob@gmail.com',2),(159,'Enter your comment here',5,0,1516272078,'aillmaktoob@gmail.com',2),(160,'Enter your comment here',5,0,1516272079,'aillmaktoob@gmail.com',2),(161,'Enter your comment here',5,0,1516272079,'aillmaktoob@gmail.com',2),(162,'Enter your comment here',2,0,1516609497,'aillmaktoob@gmail.com',2),(163,'fjfg',2,1,1517294432,'abc@xyz.com',2),(164,'',2,1,1517299382,'abc@xyz.com',2),(166,'good\n',5,1,1519030510,'wardah9658@gmail.com',1),(167,'I like course',5,1,1526807345,'hana92900@gmail.com',2),(168,'جيدة جدا ومفيدة \n',3,1,1526882769,'hana92900@gmail.com',3),(169,'Interesting ',4,1,1527671285,'tora-1991@hotmail.com',2),(170,'Interesting app go ahead ',5,1,1528355839788,'tora-1991@hotmail.com',1),(171,'hello ',4,1,1528355925713,'tora-1991@hotmail.com',1),(172,'hello from ',5,0,1528356959616,'tora-1991@hotmail.com',1),(173,'hello from ',5,0,1528356959799,'tora-1991@hotmail.com',1),(174,'hello from ',5,0,1528356959982,'tora-1991@hotmail.com',1),(175,'hello from ',5,0,1528356960154,'tora-1991@hotmail.com',1),(176,'hello from ',5,0,1528356960298,'tora-1991@hotmail.com',1),(177,'hello from ',5,0,1528356960445,'tora-1991@hotmail.com',1),(178,'hello from ',5,0,1528356960966,'tora-1991@hotmail.com',1),(179,'hello from ',5,0,1528356961161,'tora-1991@hotmail.com',1),(180,'hello from ',5,0,1528356961376,'tora-1991@hotmail.com',1),(181,'hello from ',5,0,1528356961829,'tora-1991@hotmail.com',1),(182,'hello from ',5,0,1528356962169,'tora-1991@hotmail.com',1),(183,'hello from ',5,0,1528356962484,'tora-1991@hotmail.com',1),(184,'hello from ',5,0,1528356962787,'tora-1991@hotmail.com',1),(185,'hello from ',5,0,1528356963169,'tora-1991@hotmail.com',1),(186,'hello from ',5,0,1528356963469,'tora-1991@hotmail.com',1),(187,'hello from ',5,0,1528356963751,'tora-1991@hotmail.com',1),(188,'hello from ',5,0,1528356964060,'tora-1991@hotmail.com',1),(189,'hello from ',5,0,1528356964302,'tora-1991@hotmail.com',1),(190,'hello from ',5,0,1528356964651,'tora-1991@hotmail.com',1),(191,'hello from ',5,0,1528356964888,'tora-1991@hotmail.com',1),(192,'hello from ',5,0,1528356965116,'tora-1991@hotmail.com',1),(193,'hello from ',5,0,1528356965297,'tora-1991@hotmail.com',1),(194,'hello from ',5,0,1528356965499,'tora-1991@hotmail.com',1),(195,'hello from ',5,0,1528356965680,'tora-1991@hotmail.com',1),(196,'hello from ',5,0,1528356965847,'tora-1991@hotmail.com',1),(197,'hello from ',5,0,1528356966025,'tora-1991@hotmail.com',1),(198,'hello from ',5,0,1528356966239,'tora-1991@hotmail.com',1),(199,'hello from ',5,0,1528356966348,'tora-1991@hotmail.com',1),(200,'hello from ',5,0,1528356966515,'tora-1991@hotmail.com',1),(201,'hello from ',5,0,1528356966656,'tora-1991@hotmail.com',1),(202,'hello from ',5,0,1528356966814,'tora-1991@hotmail.com',1),(203,'hello from ',5,0,1528356966966,'tora-1991@hotmail.com',1),(204,'hello from ',5,0,1528356967128,'tora-1991@hotmail.com',1),(205,'hello from ',5,0,1528356995594,'tora-1991@hotmail.com',1),(206,'hello from ',5,0,1528356995802,'tora-1991@hotmail.com',1),(207,'hello from ',5,0,1528356995867,'tora-1991@hotmail.com',1),(208,'hello from ',5,0,1528356995913,'tora-1991@hotmail.com',1),(209,'hello from ',5,0,1528356995962,'tora-1991@hotmail.com',1),(210,'hello from ',5,0,1528357034162,'tora-1991@hotmail.com',1),(211,'hello from ',5,0,1528357034313,'tora-1991@hotmail.com',1),(212,'hello from ',5,0,1528357034440,'tora-1991@hotmail.com',1),(213,'Hello from IOS\n',4,1,1528357091687,'tora-1991@hotmail.com',1),(214,'Hello from IOS\n',4,1,1528357092273,'tora-1991@hotmail.com',1),(215,'Hello from IOS\n',4,1,1528357092662,'tora-1991@hotmail.com',1),(216,'Hello from IOS\n',4,0,1528357093500,'tora-1991@hotmail.com',1),(217,'Hello from IOS\n',4,0,1528357093917,'tora-1991@hotmail.com',1),(218,'Hello from IOS\n',4,0,1528357094197,'tora-1991@hotmail.com',1),(219,'Hello from IOS\n',4,0,1528357094495,'tora-1991@hotmail.com',1),(220,'Hello from IOS\n',4,0,1528357094730,'tora-1991@hotmail.com',1),(221,'Hello from IOS\n',4,0,1528357094935,'tora-1991@hotmail.com',1),(222,'Hello from IOS\n',4,0,1528357095114,'tora-1991@hotmail.com',1),(223,'Hello from IOS\n',4,0,1528357095280,'tora-1991@hotmail.com',1),(224,'Hello from IOS\n',4,0,1528357095448,'tora-1991@hotmail.com',1),(225,'Hello from IOS\n',4,0,1528357095780,'tora-1991@hotmail.com',1),(226,'Hello from IOS\n',4,0,1528357096013,'tora-1991@hotmail.com',1),(227,'Hello from IOS\n',4,0,1528357096348,'tora-1991@hotmail.com',1),(228,'Hello from IOS\n',4,0,1528357096570,'tora-1991@hotmail.com',1),(229,'Hello from IOS\n',4,0,1528357096733,'tora-1991@hotmail.com',1),(230,'Hello from IOS\n',4,0,1528357096913,'tora-1991@hotmail.com',1),(231,'Hello from IOS\n',4,0,1528357099083,'tora-1991@hotmail.com',1),(232,'Hello from IOS\n',4,0,1528357099676,'tora-1991@hotmail.com',1),(233,'Hello from IOS\n',4,0,1528357107080,'tora-1991@hotmail.com',1),(234,'Hello from IOS\n',4,0,1528357107259,'tora-1991@hotmail.com',1),(235,'Hello from IOS\n',4,0,1528357107408,'tora-1991@hotmail.com',1),(236,'Hello from IOS\n',4,0,1528357107542,'tora-1991@hotmail.com',1),(237,'Hello from IOS\n',4,0,1528357107692,'tora-1991@hotmail.com',1),(238,'Hello from IOS\n',4,0,1528357107838,'tora-1991@hotmail.com',1),(239,'Hello from IOS\n',4,0,1528357107991,'tora-1991@hotmail.com',1),(240,'Hello from IOS\n',4,0,1528357108158,'tora-1991@hotmail.com',1),(241,'Hello from IOS\n',4,0,1528357108316,'tora-1991@hotmail.com',1),(242,'Hello from IOS\n',4,0,1528357108474,'tora-1991@hotmail.com',1),(243,'Hello from IOS\n',4,0,1528357108641,'tora-1991@hotmail.com',1),(244,'Hello from IOS\n',4,0,1528357108817,'tora-1991@hotmail.com',1),(245,'Hello from IOS\n',4,0,1528357108975,'tora-1991@hotmail.com',1),(246,'Hello from IOS\n',4,0,1528357109140,'tora-1991@hotmail.com',1),(247,'Hello from IOS\n',4,0,1528357109846,'tora-1991@hotmail.com',1),(248,'Hello from IOS\n',4,0,1528357110008,'tora-1991@hotmail.com',1),(249,'Hello from IOS\n',4,0,1528357110158,'tora-1991@hotmail.com',1),(250,'Hello from IOS\n',4,0,1528357111067,'tora-1991@hotmail.com',1),(251,'Hello from IOS\n',4,0,1528357111237,'tora-1991@hotmail.com',1),(252,'Hello from IOS\n',4,0,1528357115550,'tora-1991@hotmail.com',1),(253,'Hello from IOS\n',4,0,1528357116335,'tora-1991@hotmail.com',1),(254,'Hello from IOS\n',4,0,1528357116495,'tora-1991@hotmail.com',1),(255,'Hello from IOS\n',4,0,1528357116647,'tora-1991@hotmail.com',1),(256,'hello from ios\n ',5,0,1528357159889,'tora-1991@hotmail.com',1),(257,'hello from ios\n ',5,0,1528357160241,'tora-1991@hotmail.com',1),(258,'hello from ios\n ',5,0,1528357160307,'tora-1991@hotmail.com',1),(259,'hello from ios\n ',5,0,1528357160464,'tora-1991@hotmail.com',1),(260,'hello from ios\n ',5,0,1528357160645,'tora-1991@hotmail.com',1),(261,'hello from ios\n ',5,0,1528357160797,'tora-1991@hotmail.com',1),(262,'hello from ios\n ',5,0,1528357160963,'tora-1991@hotmail.com',1),(263,'hello from ios\n ',5,0,1528357161742,'tora-1991@hotmail.com',1),(264,'hello from ios\n ',5,0,1528357161904,'tora-1991@hotmail.com',1),(265,'hello from ios\n ',5,0,1528357162034,'tora-1991@hotmail.com',1),(266,'hello from ios\n ',5,0,1528357162155,'tora-1991@hotmail.com',1),(267,'كورس جيد',3,1,1528361123463,'pceng13r@gmail.com',2),(268,'...',1,1,1528620686668,'pceng13r@gmail.com',2),(269,'Same text for Testing the feedback',2,1,1528621181080,'abc@xyz.com',3),(270,'Llsfghjkkjvvhjj',1,0,1529390027650,'pceng13r@gmail.com',2),(271,'تعليق مسموح',5,1,1529391117314,'pceng13r@gmail.com',1),(272,'',2,0,1531654198558,'abc@xyz.com',2),(273,'',2,1,1531654882964,'abc@xyz.com',2);
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institute_course_relationship`
--

DROP TABLE IF EXISTS `institute_course_relationship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `institute_course_relationship` (
  `course_id` int(11) NOT NULL,
  `institute_id` int(11) NOT NULL,
  UNIQUE KEY `course_id_UNIQUE` (`course_id`),
  KEY `institute_course_institute_id_idx` (`institute_id`),
  CONSTRAINT `institute_course_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `institute_course_institute_id` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`institute_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institute_course_relationship`
--

LOCK TABLES `institute_course_relationship` WRITE;
/*!40000 ALTER TABLE `institute_course_relationship` DISABLE KEYS */;
INSERT INTO `institute_course_relationship` VALUES (2,1),(3,1),(7,1),(8,1),(11,1),(1,2),(4,2),(5,2),(6,2),(9,2),(10,2),(12,2),(13,3),(14,3),(15,3),(16,3),(17,3),(18,3),(19,3);
/*!40000 ALTER TABLE `institute_course_relationship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institutes`
--

DROP TABLE IF EXISTS `institutes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `institutes` (
  `institute_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `institute_description` varchar(1024) NOT NULL,
  `institute_address` varchar(255) NOT NULL,
  `arabic_name` varchar(255) NOT NULL,
  `arabic_institute_description` varchar(1024) NOT NULL,
  `arabic_institute_address` varchar(255) NOT NULL,
  `institute_picture` varchar(255) NOT NULL,
  `institute_phone` varchar(13) NOT NULL,
  `institute_location_latitude` float NOT NULL,
  `institute_location_longitude` float NOT NULL,
  `is_first_class` tinyint(4) NOT NULL,
  PRIMARY KEY (`institute_id`),
  UNIQUE KEY `institute_id_UNIQUE` (`institute_id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  UNIQUE KEY `arabic_name_UNIQUE` (`arabic_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institutes`
--

LOCK TABLES `institutes` WRITE;
/*!40000 ALTER TABLE `institutes` DISABLE KEYS */;
INSERT INTO `institutes` VALUES (1,'SAS Mobile','We teach Mobile stuff ','KOM 4','ساس','ونحن تعليم المحمول والأشياء','واحة المعرفة 4','institute/1.png','952382764',23.5677,58.1732,0),(2,'Polyglot','We teach languages and stuff','Wattaya','بولغلوت','نحن نعلم اللغات والاشياء','وطاية','institute/2.png','952232764',23.5677,58.1732,1),(3,'London Institute of Training','The London Institute of Training is licensed by Cambridge to provide internationally recognized IELTS tests as well as IELTS preparatory courses, general and special English courses for all levels and ages.','Northern Ghubra ','معهد لندن لالتدريب','معهد لندن للتدريب مرخص من قبل كامبريدج لتوفير اختبارات إيلتس المعترف بها دوليا وكذلك دورات إيلتس التحضيرية، دورات اللغة الإنجليزية العامة والخاصة لجميع المستويات والأعمار.','غبرة الشمالية','institute/2.png','90901382',23.5852,58.3941,0);
/*!40000 ALTER TABLE `institutes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_course_enrolment`
--

DROP TABLE IF EXISTS `student_course_enrolment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_course_enrolment` (
  `enrolment_id` int(11) NOT NULL AUTO_INCREMENT,
  `registered_name` varchar(255) NOT NULL,
  `registered_phone` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`enrolment_id`),
  KEY `email_idx` (`email`),
  KEY `course_id_idx` (`course_id`),
  CONSTRAINT `enrolment_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `enrolment_email` FOREIGN KEY (`email`) REFERENCES `users` (`email`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_course_enrolment`
--

LOCK TABLES `student_course_enrolment` WRITE;
/*!40000 ALTER TABLE `student_course_enrolment` DISABLE KEYS */;
INSERT INTO `student_course_enrolment` VALUES (5,'Sabri','9447366326','ahmed@gmail.com',1),(6,'Sabri','9447366326','ahmed@gmail.com',2),(7,'Ahmed','9447366326','ahmed@gmail.com',1),(8,'New Enrolment for coures id number 1','99990000','tester@hotmail.com',1),(9,'Malli','9447366326','abc@xyz.com',3),(10,'Malli','9447366326','abc@xyz.com',4),(11,'Muhanned','97462831','abc@xyz.com',7),(12,'Najah','97462222','abc@xyz.com',10),(13,'Najah','99999999','najah.albusaidi@gmail.com',1),(17,'Malli','99999999','abc@xyz.com',1),(18,'Malli','99666699','abc@xyz.com',7),(19,'Tester test','98765498','salem@gmail.com',1),(20,'samera vgvvfd ggfrcfx','90000528','samera@gmail.com',1),(21,'samera','963855289','samera@gmail.com',1),(22,'samera','96386655289','samera@gmail.com',11),(23,'Najah Hood Albusaidi','99999999','najah.albusaidi@gmail.com',1),(24,'samera','96386655289','samera@gmail.com',7),(25,'Najah','98844339','najah.albusaidi@gmail.com',6),(26,'Najah','98844339','najah.albusaidi@gmail.com',5),(27,'Tester ','99990000','tester11@gmail.com',1),(28,'persinna','99999900','aa@gmail.com',1),(29,'persinna','99585564','aa@gmail.com',5),(30,'Najah','98844339','najah.albusaidi@gmail.com',2),(31,'prasanna','+96894879819','prasannavj@gmail.com',12),(32,'prasanna','+96894879819','prasannavj@gmail.com',3),(33,'prasanna','+968121212','prasannavj@gmail.com',2),(34,'prasanna','+96894879819','prasannavj@gmail.com',5),(35,'beenish','98104045','beenishshafi@outlook.com',1),(36,'Asma','95815650','aaykindi@gmail.com',6),(37,'ادخل اسمك الكامل','ادخل رقم هاتفك','aaykindi@gmail.com',1),(38,'A B','99669966','sas_mobile2020@outlook.com',12),(40,'A B','99999535','sas_mobile2020@outlook.com',14),(41,'A B','99999535','sas_mobile2020@outlook.com',6),(43,'beenish','98104078','beenishshafi@htc.co.in',1),(44,'Keerthi','94175450','keerththi.pro@gmail.com',11),(45,'Keerthi','94175450','keerththi.pro@gmail.com',1),(46,'Mallikarjuna Jana','99999999','jana.malli@gmail.com',1),(47,'براسنل','98765498','prs@gmail.com',7),(48,'براسنل','98765498','prs@gmail.com',1),(49,'Asma','9876543','aaykindi@gmail.com',13),(50,'jassim','92380950','jassim@gmail.com',1),(51,'intisar','93831010','aljoory383@gmail.com',1),(52,'Malli','99666699','abc@xyz.com',6),(53,'مريم علي','9876543','Assoolah37@hotmail.com',6),(54,'مريم علي','9876543','Assoolah37@hotmail.com',5),(55,'trainingLinkOJP','98765432','ojp4sasmob@gmail.com',1),(60,'Rozella Hct','96714318','wardah9658@gmail.com',1),(61,'Rozella Hct','96714318','wardah9658@gmail.com',7),(63,'Rozella Hct','96714310','wardah9658@gmail.com',11),(64,'hana','92900000','hana92900@gmail.com',1),(67,'hana','92900000','hana92900@gmail.com',6),(68,'hana','92900000','hana92900@gmail.com',13),(69,'almotasim','99468968','omani16@gmail.com',10),(70,'intisar ','91227070','intisar1@moe.om',1),(72,'Fatima almaharbi','99840201','tora-1991@hotmail.com',7),(73,'Fatima almaharbi','99840201','tora-1991@hotmail.com',5),(74,'FatimaTesting2','99840201','sas-test-fatma2@hotmail.com',5),(75,'FatimaTesting2','99840201','sas-test-fatma2@hotmail.com',1),(76,'Fatima almaharbi','99840201','tora-1991@hotmail.com',1),(77,'Fatima almaharbi','99840201','tora-1991@hotmail.com',6),(78,'Malli','99666699','abc@xyz.com',14),(79,'hana ahmed','92900870','alkharousi@gmail.com',1),(80,'hanaahmed','92900870','alkharousi@gmail.com',1),(81,'hanaa','92900870','alkharousi@gmail.com',1),(82,'hana','92900870','alkharousi@gmail.com',1),(83,'rahma','91214440','pceng13r@gmail.com',6),(84,'rahma','91214440','pceng13r@gmail.com',5),(85,'Malli','99666699','abc@xyz.com',5);
/*!40000 ALTER TABLE `student_course_enrolment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `email` varchar(255) NOT NULL,
  `name` varchar(128) NOT NULL,
  `password_hash` char(64) DEFAULT NULL,
  `password_salt` blob,
  `user_phone` varchar(20) NOT NULL,
  `authentication_type` enum('email','facebook','twitter') NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('a.software_2015@hotmail.com','samera','4q4Pcou83vMzOFKbG6afkBtsy0rwIogg6sIrZlCoJAo=','�k�7 ����z�5�V�R$���=\r-j0@�\"�m��I�cj�<$ܓ���3��>�XaN���','96396396','email'),('a@gmail.com','Arwa','Jhu2AoAZesee4EaCZQjnRpqy/upV9cKn+wejmYFU++A=','ŢF0���)&-�����/,�L7�!\"�S�Cfq� ��j����p�:���� E|�H}^�O�','99887766','email'),('aa@gmail.com','persinna','hp2bKBwxMm6PTrnmRQlZDn6rm8HiPL9ZeQVZGuSCwpk=','�Ȥ�vS�u��MG$f��N���7�1�\r�^�WyZ(��G���lX^�&�Y�ծz���W�y','99585564','email'),('aaa@gmail.com','Ahmed AL Kindi','JRLSe2rW2/8IjB2w2fk569yn+MMbQUcS26SpToR47q4=','�|����A#n����u\r�����X)���D�����Ѓ�r�j�6�KhA�,��*d�\r��O\'','987654321','email'),('aaykindi@gmail.com','Asma Al Kindi','nPqkMVytRpc+l/gJhUAnZlDSb8BJb0E3OrubSt0jgdc=','l�7��Z�	����`!Z�N\"�vbR�����C�\Z�Y��D^�\n�l�	\nh|��Ϙ�&�=�mr','0096898765432','email'),('abc@gmail.com','Tahani alkaroisi','+tfjgsXssc4N1ypoL2jhamlm+FW4Y0v6fqef4Rj7x20=','Qj�11N��3�&�ԑ��.��)8�����6��6Nw#���G1*0�h_js���\'}n~Y�','123','email'),('abc@hotmail.com','Eiman','MoKnguCTQWNGj0LYIbEWzn6QW+tRcG0ALGUMewviAnk=','v�M��\r�\'!�\'�����T�A�%7���*54^�f� Z�ት���DOEϗH*=`�8�k','97219811','email'),('abc@xyz.com','Malli','ri/asXbQ6Ur9tuF/bzy0yeE7JG038JH/WovJctbMqhU=','����xԞ��bsg�n��~ӈ�B�i��_׸R��)�M�\r���w��iG����n%p��B','99666699','email'),('abc@xyzc.com','مران مران',NULL,NULL,'12345678','facebook'),('abcd@gmail.com','Rowan Atkinson',NULL,NULL,'97847391','twitter'),('abdallah@hotmail.com','      عبدالله صالح ','R2GIKmwDgUzhCuqOOzcaeKPpesvuAJ9ksSO8ivOsVQM=','H�1�Uư\ZhmS@��g�(m�w/�\r���Z��.�^�F�IgұWѿH��%|�B\rfa���;�\rdr','9519519519','email'),('aberre@gmail.com','عبير بنت احمد بن محمد السيابية','+XPA/m63tRASb48e0zJEXFRJ13PdwtSV/slfURNtnqQ=','��^Q�^mUYA����͙]��<�09�#���$G����B���\'e�S�	�V�p�_N�R�','98766432','email'),('ahmed23233@gmail.com','ahmed',NULL,NULL,'12341234','facebook'),('ahmed2@gmail.com','ahmed',NULL,NULL,'12341234','facebook'),('ahmed3@gmail.com','ahmed',NULL,NULL,'12341234','facebook'),('ahmed4@gmail.com','ali',NULL,NULL,'41234','facebook'),('ahmed@gmail.com','Yellow Blue Green','btML8La7LvIqT4/lnPKjIQ6d89KN63iiWjlC4BAHDIY=','��X�בQ����-�!,��2�٫���.o/&\ZnN�C!i�$��/J>����-�Io!\rWL��','90009000','email'),('ahmed@hotmail.com','Ahmed','GzQ0X8qbi/CwbSrIgSc2wj9mXaXJbCvzG/46+qSU/D8=','v��o3��Hh5�L:�{��	���l�1�)��>|��ɸV�.%o�$�O5-�bL@�R���BF�','987654321','email'),('aillmaktoob@gmail.com','Azhar','5b8IoeU8LBk9BN8Z3j+taBlT1aR7Mmrq+QtMUoHBktM=','��\rt��ֺ��\'�t`�.b�Fi=:_m{��f�F���~I}�V���zC�X�tHЮ���y','97219811','email'),('al87azri@gmail.com','Ibrahim Hamed','mDlGznro1avui17/RjeqNxuUGxU80gSlea9D5mJTTJA=','|ތ!��\r��`�}myҰ@�G�3ɺ���4[S�m��?=�-0���r�#���W\r.ۤpX$� �:l','95241311','email'),('ali@gmil.com','Ali1','rddYUk7Yfs4r3arquIjo3XyGs+JQHQSK+FDRmBgbdkU=','¾��@-�����d?\nvR����F�9T2�2G�������!}N\ZI���z:�7�X�~','666666777','email'),('aljoory383@gmail.com','intisar','KdBvm9NnvDzfZVQ6t8Dr4hrMJstwk2jZf6/7kUdjM8g=',' �\"sS�Y����YX�%pf��D�-���\\\n�PdȾ��\'���|yq�Xm�KLu���a�','93831010','email'),('alkarousi1995@hotmail.com','basant','w1VkV1cTr0PLkcNEPJCOsOWQuoSiE76bzppzY2Wekng=','�_C�iY@̃����o>9�$z\\/�Tm7�|�֗#,�5�-��f�V�]/�EfF�5�,$SI��,�F','973212p','email'),('alkharousi46@gmail.com','hana','Iw+o6Xgw05kkQp+IlxiE48sZCs3QOmfE+YGsAvRe+hU=','�u3GNW6z�g��5�\r\Z����-�p+�l��(���_�Z���R�%�A�>q�Z�@���eV>\'�','92900870','email'),('alkharousi@gmail.com','hana','nJehPYkE9j5Gn0sCO2YuIr6ge/53PIyN4joKqXnZ4e4=','�U�jU���?\"���$��3!���\Z� �S͑4Κhn6 r���b� :u.x��-�l��D���','00968929000870','email'),('alwarith@gmail.com','really ','MMW7F/WQQxfm+Q6nLdwnu35AiROp/6d4v4VpPb+uvtk=','�H�����W�����}��%�K|�u09�9�n��j4�����XQ\r�wU8��Bk����,','97864532','email'),('amani@gmail.com','Amani','NYMXPCqG/u70HfXpNFfUWVXmRJ0nUGUat3dox46DQu0=','��vA���A��L���6\\KG�.�];�����;���������j^\Z�̐o��� uUM���\n','97219811','email'),('Assoolah37@hotmail.com','مريم علي',NULL,NULL,'9876543','facebook'),('beenishshafi@htc.co.in','beenish','cYes5dzBtBOSf45zcjfUjOa7ZZRJZr8UpTekeCvQfQg=','��wl��q\\F+�+��>��/o�8�0��ρ^��}2�暚�Z�=>\n�fV`��?Y�6\r�','98104078','email'),('beenishshafi@outlook.com','beenish','rCdxkzmbNNZFVXQoo3nxWH/qqPLqGm8AmZcjLZEhYis=','�)�����Ըd���j��\0~x���q&7sK!���@A�m�`���\'�ǒ�x�!6��н�','98104045','email'),('darren@ielts.om','darren','x694NNIzW2lpxedHk8pmEM/7ALlGusNheNdzpbpEyeA=','��lF��|^�&}/I\\�n�L@�}Ƿ�s��n�������urHn����h͖wl9����ٍ�','90901382','email'),('dggfxfggv@fggg.com','sasa','sEpPbze2UqjHUIbQQcEw7VtNgQsMwmq0dq4f+Dhkf8k=','mA~\0��@Dz�����3{\ZΜ\rT��w���!!�lE�na�Oji^��ީ�[�\"{`X��l\'','96396396','email'),('facebooker@gmail.com','facebook al-Facebooki',NULL,NULL,'12341234','facebook'),('gjcjcjfjcjf@g.com','ghhhhfhfhfhvjvvj','IDEbht/OVVtlnkMTvLb0dsiF+D+SLTwSuEcEyFpkk6g=','�Nۜ��P���N�»������!��$w��~C��0G���zo�<3����Ц���','99999999','email'),('hahahha@gmail.com','nbdhs','jcIr5V8bM0+Hrw7GlssS8yLT9vYa1c4L4ofISRyyvtc=','������n���g(�Q{�8�?ʆ}{��e�\r��϶\r��%w�V��T���I�϶15Ԥ7P,','9999999999','email'),('hamdan@gmail.com','ahmed','iob2jX/Z5z8Z6urVGkZ7ZrekKsmaRlDblcDdbZiyrGE=','��9�oj��hUp�&��s�\r��)1�7���������#%�,[��ʮ�eY$�];�&͑�&��','11234123','email'),('hana92900@gmail.com','hana','zSjRwVDRGGsW8/+cOOLeUjNerxYDQ4eqUWHm94JikjQ=','\0}�d��M+�Q���������6␁�m���ˎ�^@���%f�J��C���ۻu���`','92900000','email'),('hanoo9289@gmail.com','hana','2KSVFusXOn1R6tKCOUI7a5w1BBbRfR0VJ6vhbL0Ferw=','�5�ԆGάt{�[���uA�}�4zr�q����I�<1���V�~zO�M$Y�7�U','92900870','email'),('ihz100@hotmail.com','Ibrahim al azri','Vv1VPhGHr55P2auRhl34r9MppgpPyMySzjEuSUplkOo=','��O^�6ۧځ���SOF\r:�c��X����!Up;Vn��5��d�<\r�\0\0�h_D��1�>L�','95241311','email'),('intisar1@moe.om','intisar448 ','0ErtMsZv7sJUTXvTytibGWjAYmPDCYl6YjlsdJ3L2nY=','\r����j�܈��Z,��䯈9���]ʬU�s��\'�\Z?�R?�8U\"��uw�����,�H','91227070','email'),('intisar@abc.com','مران مران',NULL,NULL,'12345678','facebook'),('jahena@gmail.com','جهينه','WH4v3m0cOdwxsRrHgjegNb8SD5ZxKcBAYGqn2F2IZd0=','��ӿ�N�:����i_��v��7ɔ��` �^��Z��s�<���{b�P���\"WO����_4��ӑ�','96396398','email'),('jana.malli@gmail.com','Mallikarjuna Jana',NULL,NULL,'99999999','facebook'),('jassim@gmail.com','jassim','onOAURYmh6Ihl6b9SbyOSwuxT2J3TNnMd5SNcAygbdk=','8W�֫x�^EC\'���{ߤ�� n��|��\"�����O�����U��1�}I.�9#�C::��	_','92380950','email'),('keerththi.pro@gmail.com','Keerthi','wJhEGWAkGYsH5vT0yzyrYgjgP35QtmkWN7JXMoW6wVU=','��3�� gkA;s뚧r{�[�|6��8Z�:�k��h^�n�w��b��T:bԖ)U*���','94175450','email'),('l@gmail.com','Amal','ReWE0x6U8fKwT1dWOx+cJmn8QQOOSGVtjmzrrQ5f9k8=','!P.<�N��uq�0�3G�o���l��B˩h9�-���d����h �&��v_%�i�/���','99887766','email'),('m@gmail.com','Majed','0C3QoXg4UiETHizDDN2h2KbtPxYqRK3GWFIQB0U31AA=','j�\"&���w��tj=|����cÖ@�u �氡��3v��@����P�]&�:.�)�UJ','99887766','email'),('marwa123101@gmail.com','Noor Ahmad',NULL,NULL,'93989669','facebook'),('marwa96693@gmail.com','M4RW7',NULL,NULL,'93989669','twitter'),('marwa@hotmail.com','marwa ahmed mohanmed Al syabi','cpJDHO2ABDC6WwWa72Jynab3Bl20w4SNRoNlgTHT4dY=','V#N���U��Ca�K�\r��m0�ˑ���\n䋭KR+���FH���خ���<��e�c��~�','98058099','email'),('marym@www.com','مريم محمد علي الغافري','ka4r2Rw8M18bIDqMXrH02sFxY3ygdSkNBP6nFzgi+tM=','��h+i��{P��D:R��P���X�M�M�[Ҏ&�]>p\0.ۡD?QXV �^\r|���)x&\Z\n','95195195','email'),('mohammed@gmail.com','محمد علي','ZcL0nNiOfyYsMRROctGkifG2vqWngOnUEMLSYp0WJCk=','B�\0���J�K�<�qf�h�r\r�]Ț:��g��\Z^ؽv�]��xL�]~��o3R�.Rԍ','99998888','email'),('myTestEmail@gmail.com','Rowan Atkinson',NULL,NULL,'97847391','twitter'),('najah.albusaidi@gmail.com','Najah','VBk+n6yhC62ML/QdconGnWjJ4Mrnys+EIevWRdRDb+A=','\"7�]���V�؟��N���7QMY���A0b5���.�N=����c_�P~�Mi�D����h5','98844339','email'),('najah@gmail.com','نجاح','Ux1FUSTv8mXIxNLEzabvqxQMf+SQGsrLJotEZHln1iQ=','��C[4��9���[�OwAxR0�ߞ;�A*U�%fUe���4�>VoQ�ov�\\��pBq�','99887788','email'),('ojp4sasmob@gmail.com','trainingLinkOJP',NULL,NULL,'98765432','twitter'),('omani16@gmail.com','almotasim','Te8QEiL/3ax12BYy1LQNITHn8PQ8jbpzj4GY2va9614=','ޕ�ֶ茞F@H�1G��~֕s����&��c��Uo`�{��t������i�:}<8x�y0�','99468968','email'),('open_wyrlppu_user@tfbnw.net','Sabri_Test',NULL,NULL,'94879818','facebook'),('pceng13r@gmail.com','Rahma','Oqty5fDUADA7tnMoyuJAs1kBJ/1OteU9bZTfDMzObzc=','���o��1\\�_F��o�p�����ƭ�J��F��aܿ��s��Z�$��jwx�:��d��','0096891214440','email'),('prasannavj@gmail.com','prasanna','Xvmi3qwlT2HSHEZwTxyoheMnDgwt6xRgi+gIrzoiZQA=','���(��h�jLV����+�yά�T�h�h�r\nI�����]�ͮ޹&���hAhEM���ӆ�','+96894879819','email'),('prasannavj@hcl.com','peasants','maB8p83sa/xCC9Fle2HpNl7sk3eFLvmg6v5fGVtpcc0=',']�V�\r&TS�M,b	��٭\n�����-4�4��L��>YP���E~\"7���B��h�?X��%ad��','12345678','email'),('prs@gmail.com','براسنل','ePPnEVKUvAIHLmQqIOmqgY3LtnRb/8gBNO0Cvj6gVUo=','[hB\0�w�h\'hď0������3������B�ʝ������Q.e-��J_ty;g#f�M5�\ZU','98765498','email'),('rahma11048@cceoman.net','Rahma00000000',NULL,NULL,'91214440','twitter'),('rosesalim07@gmail.com','hana','A7KxZek+jokF8g5YBCy+Yg0VEEYchFFTOyk+Z5bRoPk=','�3.|�/��i�S����n!�͊ἾM���$���̩�uU2Ȉ�E��bή\n�f��sh��e�','99999999','email'),('sabri@email.com','awefawefa','/vWGQ9ye+T5wZM/TV92akHLx9m6hUtRF+g1EZKbBDcM=','O����\\�;��\r�>���An$�J~�O�oP�.ؑ�N?�0�3�`�}�>�]���}��^Ux�','32423423','email'),('salem@gmail.com','Tester test','lYCGcb82+YOZ7r07JiQy7KYdYAFn6x8JWsfeYvsfdMc=','�-;�\'f1<�;���M��c��R�/��9��3�US�	�K���2I΂��S���M�E|8�GjK��','98765498','email'),('samera@gmail.com','samera','aMaAJ/BwpPABqjvtgzI0BrVH+1rwLaZZA0B58wn7qIg=','��5���-���ִ��Y#�漋�,��P���{��I\01��:	�}�f����\n��/9�X��#��FZ=','96385289','email'),('sas-test-fatma1@hotmail.com','FatimaTesting',NULL,NULL,'99840201','twitter'),('sas-test-fatma2@hotmail.com','FatimaTesting2',NULL,NULL,'99840201','twitter'),('sas-test-fatma3@hotmail.com','Fatima Tester',NULL,NULL,'99840201','facebook'),('sas_mobile2020@outlook.com','A B',NULL,NULL,'99999535','facebook'),('sbrkrs@gmail.com','sabri','zYp6Bb9pVYi4W+Da2BlScmxvP9zDXzq+GKBhhjgkhV0=','Oe�~�y���!J�E���\"\ZTp��B}8�Yz{ڍ/G���l2��u.��֎q}���\"lD\n','95045882','email'),('sdfaeaw@ssdfas.com','Yellow Blue Green','q7SjGxpMjfxd+jUWoUEj8C30+hVXMjBGwQzZIbU4IZQ=','\0ժ���k���� �M�\'[��|��CfU��j�lS�+�@И�d�~�R՟����r��;�=l�','95045882','email'),('shdhhd@h.com','rahma','TUlvgLgR2/7DEdBjVX6z0gHg7oyOjTTEWzVs5ZCmvmA=','�r�������Y_Q�\0����䷒?��Ӭ� >5��� �j�d5�*�/SHSL��/A�:���m|2�D','92900870','email'),('t-flower-1990@hotmail.com','sas','sKYTyaF/0NUtoDZuk9YpfNLBa+0P9n+bZkmaqM72AjY=','0@�B���K�~d�$��f� ��ٴ9��$<hZ!�m�y�2�Ȼ=Z]�������k��ǿ�','97219811','email'),('tester11@gmail.com','Tester ','OD9ZgT4KROFn4gFOfSt29aOvsGIQncrgcHR42Xj+rj4=','S��\0 �|Mȃ���0Z�s��A5z�������6s+���Ug6�Ty�����d|E-qV�4PN','99996666','email'),('tester@gmail.com','tester1','/Rf0qINFlW/N9KDCw6XXzn2/4V3vxd8CCtyY8m17EZk=','��k�q�=��z\n���g\r��H|�rIq8��rs����ˑ���=N�a��N� }��\n�','98989898','email'),('tester@hotmail.com','Feedback Tester','kesY+1KuRDlvqGdBaCCwhWoBaiE8HkBFmaCSHk0z7jU=','��|�о�!���rjN�����oO���hAR�v����Z� rm�2n��d3g��wrk5����� ','98989898','twitter'),('tftdtrs@www.com','ali','Z85d6DqTLFv35Q7k4drZmPzNQ2fEM/Fkw+2W2m5bDas=','x+��g�yWM�}���pq)�c�;�ү[�i>�P���ZDy��Q�� �p4-�Eڥ\\�','333666555','email'),('tora-1991@hotmail.com','Fatima almaharbi','9l8zddnCpnmRwtTketUypMAI65KcclDT5HN/5YHfHPE=','�\0�`��]�璀d�Oܭ�\r���tuRc�����������x�h���\'㦄��(�)�e�aڬ*','0096899','email'),('traininglike979@gmail.com','intisar juma','AouJyYhdTh7HbmsalUYA76QBxzFZH0VNpHCmlnRvuGk=','�*w(��T@�H\r��b�ձTfy��ö�񊂵��w��������\\[�������ϻ\Z�zA!�','93831010','email'),('traininglink979@gmail.com','traininglink979',NULL,NULL,'92900870','twitter'),('twitterx@gmail.com','Rowan Atkinson',NULL,NULL,'97847391','twitter'),('twittery@gmail.com','Rowan Atkinson',NULL,NULL,'97847391','twitter'),('twitterz@gmail.com','Rowan Atkinson',NULL,NULL,'97847391','twitter'),('twittserx@gmail.com','Rowan Atkinson',NULL,NULL,'97847391','twitter'),('wardah9658@gmail.com','Rozella Hct',NULL,NULL,'96714310','facebook'),('z@gmail.com','Zainab','gSrfIgqXpTRm6QDqDTbhy+SMT2s7acsU8qczCRCtFSI=','���uz��\'���ң�������A]�O� ���0Vr�8��m�͔�6%|Y�U�f:�Y\0�','99887788','email');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-24  7:07:44
