CREATE DATABASE  IF NOT EXISTS `blog_db` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `blog_db`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: blog_db
-- ------------------------------------------------------
-- Server version	5.7.19-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `comment` text,
  `update_time` timestamp NULL DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authorId` int(10) unsigned NOT NULL,
  `postId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comment-post_idx` (`postId`),
  KEY `comment-user_idx` (`authorId`),
  CONSTRAINT `comment-post` FOREIGN KEY (`postId`) REFERENCES `post` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `comment-user` FOREIGN KEY (`authorId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `content` text,
  `tags` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT NULL,
  `updateTime` timestamp NULL DEFAULT NULL,
  `authorId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Post_user_idx` (`authorId`),
  CONSTRAINT `fk_Post_user` FOREIGN KEY (`authorId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (60,'Hello From Jessica!','Omar is coming',NULL,'','2017-11-07 14:23:00',NULL,17),(61,'Oh indeed....','You come at the king, you best not miss',NULL,'','2017-11-07 14:24:00',NULL,16),(67,'A man must have a code....','Its from The Wire, google it',NULL,'','2017-11-08 15:29:10',NULL,19),(68,'Arushi\'s  recap for Project 2','If there is one thing I can admit to, it\'s that I have no idea what I am doing 99% of the time in terms of backend development. On the other hand I am really good with front end implementation. Because of this I went ahead and took charge of designing the layout of the website using a bootstrap template to save time, and handlebars. The original template was an ugly orange color, so I restyled everything, and added a drop down tab under \"Featured Bloggers\" for Jessica, Greg, and I. \n\nI also removed some unnecessary assets that were included and created the modal for creating a blog. I also worked on implementing the JavaScript for the front end. The greatest challenge for me was trying to see  the styling on handlebars with someone elses created routes page. It took a bit of trial and error to try and work with everyones code but since I am not comfortable completely with backend server side mechanics, but I learned a lot through the process and managed to make it work!',NULL,'','2017-11-09 08:54:10',NULL,16),(69,'Jessica\'s  recap for Project 2','I do a little bit of front end and backend development, but because Arushi is terrible at backend, I decided to do back end for this project. I worked with ORM and creating the routing for handlebars. I had to tie the front end and back end code together. The biggest challenge I had was getting the code to work on my local machine, as well as getting GitHub to work in general. I learned a lot with this project and am happy to apply all the knowledge we learned in class to practical use.',NULL,'','2017-11-09 08:55:15',NULL,17),(70,'Greg\'s recap for Project 2','I worked through a bulk of the backend code and implementing Passport into the app for user authentication I also worked with routing and created the MySQL database for each blog post. The biggest challenge I had with this project was learning the nuances of Passport, but I managed to somehow get it to work. With the time constraint of 2 weeks there were definitely a lot of nice to haves with this project that we couldn\'t get to which will be covered in a later blog post, but our main concern was getting the main purpose of this site to work and be presentable.',NULL,'','2017-11-08 16:57:09',NULL,19),(71,'My Take on Politics...','Kale chips pop-up adaptogen irony selfies. Plaid meh quinoa, health goth beard banjo banh mi art party slow-carb fingerstache venmo. Plaid pitchfork activated charcoal jean shorts locavore cardigan freegan XOXO synth. Listicle aesthetic DIY freegan truffaut, fixie tumeric succulents kogi normcore whatever quinoa. Microdosing health goth readymade shoreditch. Unicorn viral small batch master cleanse next level skateboard neutra woke VHS poke man bun sartorial food truck tattooed ugh. Freegan organic cardigan forage skateboard direct trade twee. XOXO knausgaard glossier, photo booth truffaut before they sold out intelligentsia thundercats microdosing hammock street art viral la croix umami four dollar toast. IPhone thundercats normcore wayfarers, cliche lyft raclette literally ethical. Shoreditch pug live-edge bitters VHS. Try-hard raw denim street art, letterpress iPhone flexitarian retro poke ethical cornhole beard vegan. Tattooed raw denim scenester, single-origin coffee pork belly trust fund knausgaard pug crucifix seitan whatever cloud bread. Pitchfork authentic knausgaard, mlkshk 3 wolf moon master cleanse hammock whatever next level live-edge YOLO yr. Cronut authentic asymmetrical taiyaki shaman messenger bag actually. Bespoke gochujang mlkshk church-key raw denim.',NULL,'','2017-11-08 16:43:02',NULL,19),(72,'Office\'isms','I\'ll book a meeting so we can solution this before the sprint is over what do you feel you would bring to the table if you were hired for this position. Back to the drawing-board work flows win-win-win collaboration through advanced technlogy for waste of resources I just wanted to give you a heads-up, nor baseline. Anti-pattern. Pixel pushing it\'s a simple lift and shift job we need more paper, so show pony, or win-win-win or low-hanging fruit waste of resources. Red flag good optics, but powerPointless, or nail jelly to the hothouse wall.',NULL,'','2017-11-08 09:44:35',NULL,16),(73,'Things clients say','Use a kpop logo that\'s not a kpop logo! ugh I have an awesome idea for a startup, i need you to build it for me or concept is bang on, but can we look at a better execution, but we don\'t need a contract, do we can you please change the color theme of the website to pink and purple? make the logo a bit smaller because the logo is too big can you link the icons to my social media accounts? oh and please put pictures of cats everywhere you are lucky to even be doing this for us, is there a way we can make the page feel more introductory without being cheesy.',NULL,'','2017-11-08 09:45:59',NULL,17);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posttag`
--

DROP TABLE IF EXISTS `posttag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posttag` (
  `postId` int(11) NOT NULL,
  `tagID` int(11) NOT NULL,
  PRIMARY KEY (`postId`,`tagID`),
  KEY `Tag_idx` (`tagID`),
  CONSTRAINT `Post` FOREIGN KEY (`postId`) REFERENCES `post` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Tag` FOREIGN KEY (`tagID`) REFERENCES `tag` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posttag`
--

LOCK TABLES `posttag` WRITE;
/*!40000 ALTER TABLE `posttag` DISABLE KEYS */;
/*!40000 ALTER TABLE `posttag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` char(60) NOT NULL,
  `email` varchar(60) DEFAULT NULL,
  `fName` varchar(30) DEFAULT NULL,
  `lName` varchar(30) DEFAULT NULL,
  `resetPasswordToken` varchar(50) DEFAULT NULL,
  `resetPasswordExpire` datetime DEFAULT NULL,
  `superUser` int(2) NOT NULL DEFAULT '0',
  `status` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (16,'arushi','$2a$10$QLhcFk9YBs2k8on/WVllMeztQqYh8xyWOLbQW5294AQ4.cDwwMrBy','arushiprakash1@Gmail.com','Arushi','Prakash',NULL,NULL,0,1),(17,'jessica','$2a$10$dQrSHweIq7UUJswv./E2XuUu3nwNeT0UQ6xVLNpuUc3Ur7Wpw6dyu','Hcdcorporation@gmail.com','Jessica','Fain',NULL,NULL,0,1),(18,'root','$2a$10$HQJp7gdai8hHFvedX3/v9ucIO3mYFJXWbcNEOMue2bgz693AUndE.','root@root.com','Super',' Freaking User',NULL,NULL,1,1),(19,'greg','$2a$10$LK0ogSJgTDlsf8U6lHy6Bu6Pyp/oiEqVsLtFEE1CFleY7VFvPfDGe','gregory.knightjr@gmail.com','Greg','Knight',NULL,NULL,0,1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-09 17:23:52
