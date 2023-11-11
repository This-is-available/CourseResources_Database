-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: lab2
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `administrator`
--

DROP TABLE IF EXISTS `administrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrator` (
  `idadministrator` char(10) NOT NULL,
  `name` varchar(45) NOT NULL,
  `password` varchar(20) NOT NULL,
  `phonecall` varchar(20) NOT NULL,
  PRIMARY KEY (`idadministrator`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrator`
--

LOCK TABLES `administrator` WRITE;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `idbook` char(10) NOT NULL,
  `name` varchar(45) NOT NULL,
  `author` varchar(25) DEFAULT NULL,
  `address` char(20) DEFAULT NULL,
  `status` enum('可借','已被借出') NOT NULL,
  `cover` blob,
  `e_edition` mediumblob,
  `reserve_num` int DEFAULT NULL,
  `input_time` date DEFAULT NULL,
  `borrow_time` int DEFAULT '0',
  PRIMARY KEY (`idbook`),
  UNIQUE KEY `idbook_UNIQUE` (`idbook`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrow`
--

DROP TABLE IF EXISTS `borrow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `borrow` (
  `book_id` char(10) NOT NULL,
  `student_id` char(10) NOT NULL,
  `borrow_date` date NOT NULL,
  `return_date` date DEFAULT NULL,
  PRIMARY KEY (`book_id`,`student_id`,`borrow_date`),
  KEY `borrow_fk2_idx` (`student_id`),
  CONSTRAINT `borrow_fk1` FOREIGN KEY (`book_id`) REFERENCES `book` (`idbook`),
  CONSTRAINT `borrow_fk2` FOREIGN KEY (`student_id`) REFERENCES `student` (`idstudent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrow`
--

LOCK TABLES `borrow` WRITE;
/*!40000 ALTER TABLE `borrow` DISABLE KEYS */;
/*!40000 ALTER TABLE `borrow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserve`
--

DROP TABLE IF EXISTS `reserve`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reserve` (
  `book_id` char(10) NOT NULL,
  `student_id` char(10) NOT NULL,
  `reserve_date` date NOT NULL DEFAULT (curdate()),
  PRIMARY KEY (`book_id`,`student_id`,`reserve_date`),
  KEY `reserve_fk2_idx` (`student_id`),
  CONSTRAINT `reserve_fk1` FOREIGN KEY (`book_id`) REFERENCES `book` (`idbook`),
  CONSTRAINT `reserve_fk2` FOREIGN KEY (`student_id`) REFERENCES `student` (`idstudent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserve`
--

LOCK TABLES `reserve` WRITE;
/*!40000 ALTER TABLE `reserve` DISABLE KEYS */;
/*!40000 ALTER TABLE `reserve` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `idstudent` char(10) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `sexuality` enum('M','F') DEFAULT NULL,
  `password` varchar(12) NOT NULL,
  `head` blob,
  `grade` enum('大一','大二','大三','大四') DEFAULT NULL,
  `college` varchar(45) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `register_day` date DEFAULT NULL,
  `status` enum('正常','封禁') NOT NULL,
  `credit` int NOT NULL,
  PRIMARY KEY (`idstudent`),
  UNIQUE KEY `idstudent_UNIQUE` (`idstudent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `student_AFTER_UPDATE` AFTER UPDATE ON `student` FOR EACH ROW BEGIN
	update student set status = 2 where student.credit<0;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'lab2'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `update_event` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `update_event` ON SCHEDULE EVERY 1 DAY STARTS '2023-06-08 20:27:56' ON COMPLETION PRESERVE ENABLE DO CALL updatecredit() */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
/*!50106 DROP EVENT IF EXISTS `update_event2` */;;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `update_event2` ON SCHEDULE EVERY 1 MONTH STARTS '2023-06-10 15:49:16' ON COMPLETION PRESERVE ENABLE DO CALL updatecredit2() */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'lab2'
--
/*!50003 DROP PROCEDURE IF EXISTS `addadministrator` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addadministrator`(
IN id1 char(10),in password1 varchar(20),
IN id2 char(10),in password2 varchar(20),IN name2 char(45),in phonecall2 varchar(20),
out state int, out tex varchar(45))
BEGIN

	declare cur_d DATE default current_date();
    declare s int default 0;##是否有该管理员
	declare s2 int default 0;##是否有该账号

	SELECT count(*) FROM administrator where idadministrator = id1 into s;
	SELECT count(*) FROM administrator where idadministrator = id2 into s2;
if s=0 then 
		set state =1;
        set tex = '没有权限';
else
	if s2 >0 then
		set state =2;
		set tex = '已经存在该管理员账号';
	else
		set state =0;
        insert into administrator (idadministrator,name,password,phonecall) value 
        (id2,name2,password2,head1,phonecall2);
        set tex = '添加成功';
	end if;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addbook` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addbook`(
IN stid char(10),in bookid char(10),in name1 varchar(45),in author1 varchar(25),
in address1 char(20),in cover1 blob,in e_edition1 mediumblob,
out state int, out tex varchar(45))
BEGIN

declare cur_d DATE default current_date();
    declare s int default 0;##是否有该书和读者
    declare c1 int default 0;  ##是否当天借过

	SELECT count(*) FROM administrator where idadministrator = stid into s;
    select count(*) from book where idbook = bookid  into c1;
 ##   select count(*) from reserve where reserve.book_id = bookid into c2;
####   select count(*) from  borrow where (student_id = stid)and (return_Date IS NULL ) into c4;
if s=0 then 
		set state =1;
        set tex = '不存在该管理员';
else
	if c1 >0 then
		set state =2;
        set tex = '已经存在该图书编号';
	else
		set state =0;
        insert into book (idbook,name,author,address,status,cover,e_edition,reserve_num,input_time,borrow_time) value 
        (bookid,name1,author1,address1,0,cover1,e_edition1,0,curdate(),0);
        set tex = '添加成功';
	end if;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `borrowBook` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `borrowBook`(IN stid char(10),in bookid char(10),out state int, out tex varchar(45))
BEGIN
	declare cur_d DATE default current_date();
    declare s int default 0;##是否有该书和读者
    declare c1 int default 0;  ##是否当天借过
    declare c2 int default 0;  ##预约数
    declare c3 int default 0;  ##该读者是否预约
    declare c4 int default 0; ##借书数量
    declare c5 int default 0; ##是否封禁
    declare c6 int default 0; ##是否丢失
    SELECT count(*) FROM student, book where student.idstudent = stid and book.idbook = bookid into s;
    SELECT count(*) FROM book where book.status = 3 and book.idbook = bookid into c6;
    select count(*) from borrow where borrow.student_id = stid and borrow.book_id = bookid and borrow_Date = cur_d into c1;
    select count(*) from reserve where reserve.book_id = bookid into c2;
	select count(*) from reserve where student_id = stid and book_id = bookid into c3;
    select count(*) from borrow where (student_id = stid)and (return_Date IS NULL ) into c4;
	select status from student where student_id = stid into c5;
    if s=0 then 
		set state =1;
        set tex = 'error: not found';
	elseif c6 = 1 then
		set state =5;
        set tex = '该书丢失，无法借阅';
	elseif c1 = 1 then
		set state =2;
        set tex = '当天已经借过该书了';
	elseif c2>0 then ##有人预约
		if c3 = 0 then
			set state=0;
			insert into borrow value(bookid,stid,cur_d,null);
			update  book set book.status = 1 where book.idbook = bookid;
			update  book set book.borrow_times = book.borrow_times+1 where book.idbook = bookid;
			set tex = '借书成功';
		else
			set state = 0;
            delete FROM reserve where book_id = bookid and reader_id = readerid;
            insert into borrow value(bookid,stid,cur_d,NULL);
			update  book set book.status = 1 where book.idbook = bookid;
			update  book set book.borrow_times = book.borrow_times+1 where book.idbook = bookid;
			set tex = '借书成功';
		end if;
	elseif c4 >=3 then
		set state =4;
        set tex='借书数量超过3';
	elseif c5 >=2 then
		set state =3;
        set tex='账号被封禁';
	else
		set state=0;
        insert into borrow value(bookid,stid,cur_d,null);
        update  book set book.status = 1 where book.idbook = bookid;
        update  book set book.borrow_times = book.borrow_times+1 where book.idbook = bookid;
        set tex = '借书成功';
	end if;
    
    

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `losebook` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `losebook`(
IN stid char(10),in bkid char(10),
out state int, out tex varchar(45))
BEGIN

declare cur_d DATE default current_date();
    declare s int default 0;##是否有该书和读者


	SELECT count(*) FROM borrow where student_id = stid and book_id = bkid into s;

if s=0 then 
		set state =1;
        set tex = '不存在该借阅记录';
else
		set state=0;
        update  book set book.status = 3 where book.idbook = bookid;
        update  borrow set borrow.return_Date= cur_d where borrow.book_id = bookid and borrow.return_Date is null;
		update student set credit = credit-4 where idstudent = stid;
        set tex = '登记成功';
##	end if;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `register` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `register`(
IN stid char(10),in name1 varchar(45),in sexuality1 enum('M','F'),
in password1 varchar(12),in head1 blob,in grade1 enum('大一','大二','大三','大四'),
in college1 varchar(45),in birthday1 date,
out state int, out tex varchar(45))
BEGIN

declare cur_d DATE default current_date();
    declare s int default 0;##是否有该书和读者


	SELECT count(*) FROM student where idstudent = stid into s;

if s>0 then 
		set state =1;
        set tex = '已存在该学生';
else
##	if c1 >0 then
##		set state =2;
 ##       set tex = '已经存在该图书编号';
##	else
		set state =0;
        insert into student (idstudent,name,sexuality,password,head,grade,college,birthday,register_time,status,credit) value 
        (stid,name1,sexuality1,password1,head1,grade1,college1,birthday1,curdate(),0,20);
        set tex = '注册成功';
##	end if;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `returnBook` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `returnBook`(in bookid char(8),out state int, out tex varchar(45))
BEGIN
		declare cur_d DATE default current_date();
    declare s int default 0;##是否有该书

    declare c1 int default 0;  ##是否被借过
    declare c2 int default 0;  ##预约数
	
    SELECT count(*) FROM  book where book.idbook= bookid into s;
    select count(*) from borrow where borrow.book_id = bookid and borrow.return_Date is null into c1;
    select count(*) from reserve where reserve.book_id = bookid into c2;
	
    if s=0 then 
		set state =1;
        set tex = 'error: not found';
	elseif c1 = 0 then
		set state =2;
        set tex = '该书并未外借';
	elseif c2>0 then ##有人预约
		set state=0;
        update  book set book.status = 2 where book.idbook = bookid;
        update  borrow set borrow.return_Date= cur_d where book.idbook = bookid;
        set tex = '还书成功';
		call sendmessage(bookid);
	else
		set state=0;
        update  book set book.status = 0 where book.idbook = bookid;
        update  borrow set borrow.return_Date= cur_d where borrow.book_id = bookid and borrow.return_Date is null;
        set tex = '还书成功';
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sendmessage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sendmessage`(in bookid char(8))
BEGIN
		declare stid char(10);
		declare ss int DEFAULT 0;
        declare re CURSOR FOR select student_id from reserve where reserve.book_id = bookid;
		declare CONTINUE HANDLER FOR NOT FOUND SET ss=1;
        open re;
			fetch re into stid;
            while s<>1 do
            ##sendmessage
            fetch re into stid;
            end while;
		close re;
			
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updatecredit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updatecredit`()
BEGIN
		declare stid char(10);
		declare ss int DEFAULT 0;
        declare re CURSOR FOR select student_id from borrow where curdate()-borrow_date >30;
		declare CONTINUE HANDLER FOR NOT FOUND SET ss=1;
        open re;
			fetch re into stid;
            while ss<>1 do
            update student set credit = credit-1 where idstudent = stid;
            fetch re into stid;
            end while;
		close re;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updatecredit2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updatecredit2`()
BEGIN
		declare stid char(10);
		declare ss int DEFAULT 0;
        declare re CURSOR FOR select idstudent from student;
		declare CONTINUE HANDLER FOR NOT FOUND SET ss=1;
        open re;
			fetch re into stid;
            while ss<>1 do
            update student set credit = credit+5 where idstudent = stid;
            fetch re into stid;
            end while;
		close re;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateinfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateinfo`(
IN stid char(10),in name1 varchar(45),in sexuality1 enum('M','F'),
in head1 blob,in grade1 enum('大一','大二','大三','大四'),
in college1 varchar(45),in birthday1 date,
out state int, out tex varchar(45))
BEGIN

declare cur_d DATE default current_date();
    declare s int default 0;##是否有该书和读者


	SELECT count(*) FROM student where idstudent = stid into s;

 ##   select count(*) from reserve where reserve.book_id = bookid into c2;
####   select count(*) from  borrow where (student_id = stid)and (return_Date IS NULL ) into c4;
if s=0 then 
		set state =1;
        set tex = '不存在该学生';
else
		set state =0;
		update student set name=name1,sexuality=sexuality1,head = head1,grade = grade1,college = college1,birthday = birthday1 where idstudent = stid;
        
        set tex = '修改成功';

end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-10 16:42:32
