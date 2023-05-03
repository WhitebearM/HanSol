-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.6.8-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- sqldb 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `sqldb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `sqldb`;

-- 테이블 sqldb.backup_usertbl 구조 내보내기
CREATE TABLE IF NOT EXISTS `backup_usertbl` (
  `userID` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthyear` int(11) NOT NULL,
  `addr` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile1` char(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile2` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `height` smallint(6) DEFAULT NULL,
  `mDate` date DEFAULT NULL,
  `modType` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modDate` date DEFAULT NULL,
  `modUser` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 sqldb.backup_usertbl:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `backup_usertbl` DISABLE KEYS */;
/*!40000 ALTER TABLE `backup_usertbl` ENABLE KEYS */;

-- 테이블 sqldb.buytbl 구조 내보내기
CREATE TABLE IF NOT EXISTS `buytbl` (
  `num` int(11) NOT NULL,
  `userID` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prodName` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `groupName` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int(11) NOT NULL DEFAULT 0,
  `amount` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`num`),
  KEY `FK_buytbl_usertbl` (`userID`),
  CONSTRAINT `FK_buytbl_usertbl` FOREIGN KEY (`userID`) REFERENCES `usertbl` (`userID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 sqldb.buytbl:~12 rows (대략적) 내보내기
/*!40000 ALTER TABLE `buytbl` DISABLE KEYS */;
INSERT INTO `buytbl` (`num`, `userID`, `prodName`, `groupName`, `price`, `amount`) VALUES
	(1, 'KHD', '운동화', NULL, 480, 2),
	(2, 'KHD', '노트북', '전자', 16000, 1),
	(3, 'KYM', '모니터', '전자', 3200, 1),
	(4, 'PSH', '모니터', '전자', 3200, 5),
	(5, 'KHD', '청바지', '의류', 800, 3),
	(6, 'PSH', '메모리', '전자', 1280, 10),
	(7, 'KJD', '책', '서적', 240, 5),
	(8, 'LHJ', '책', '서적', 240, 2),
	(9, 'LHJ', '청바지', '의류', 800, 1),
	(10, 'PSH', '운동화', NULL, 480, 2),
	(11, 'LHJ', '책', '서적', 240, 1),
	(12, 'PSH', '운동화', NULL, 480, 2);
/*!40000 ALTER TABLE `buytbl` ENABLE KEYS */;

-- 프로시저 sqldb.caseproc 구조 내보내기
DELIMITER //
CREATE PROCEDURE `caseproc`()
BEGIN
	DECLARE point INT;
	DECLARE credit CHAR(1);
	SET POINT = 77;
	
	case
when POINT >= 90 then
SET credit = 'A';
when POINT >= 80 then
SET credit = 'B';
when POINT >= 70 then
SET credit = 'C';
when POINT >= 60 then
SET credit = 'D';
ELSE
SET credit = 'F';
	END CASE;
	SELECT CONCAT("취득점수==>",point),CONCAT("학점==>",credit);
END//
DELIMITER ;

-- 테이블 sqldb.clubtbl 구조 내보내기
CREATE TABLE IF NOT EXISTS `clubtbl` (
  `clubName` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roomNo` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`clubName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 sqldb.clubtbl:~4 rows (대략적) 내보내기
/*!40000 ALTER TABLE `clubtbl` DISABLE KEYS */;
INSERT INTO `clubtbl` (`clubName`, `roomNo`) VALUES
	('바둑', '102호'),
	('봉사', '104호'),
	('수영', '101호'),
	('축구', '103호');
/*!40000 ALTER TABLE `clubtbl` ENABLE KEYS */;

-- 프로시저 sqldb.ifproc 구조 내보내기
DELIMITER //
CREATE PROCEDURE `ifproc`()
BEGIN
	DECLARE var1 INT;
	SET var1 = 100;
	
	IF var1 = 100 then
		SELECT "100입니다.";
	ELSE
		SELECT "100이 아닙니다.";
	END IF;
END//
DELIMITER ;

-- 프로시저 sqldb.ifproc3 구조 내보내기
DELIMITER //
CREATE PROCEDURE `ifproc3`()
BEGIN
		DECLARE POINT INT ;
		DECLARE credit CHAR(1);
		SET POINT = 77;
		
		if POINT >= 90 then
			SET credit = 'A';
		ELSEif POINT >= 80 then
			SET credit = 'B';
		elseif POINT >= 70 then
			SET credit = 'c';
		elseif POINT >= 60 then
			SET credit = 'D';
		ELSE
			SET credit = 'F';
		END if;
			SELECT CONCAT("취득점수==>", POINT), CONCAT("학점==>",credit);
END//
DELIMITER ;

-- 테이블 sqldb.last_insert_id_table 구조 내보내기
CREATE TABLE IF NOT EXISTS `last_insert_id_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `col` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 sqldb.last_insert_id_table:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `last_insert_id_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `last_insert_id_table` ENABLE KEYS */;

-- 테이블 sqldb.last_insert_id_tabletwo 구조 내보내기
CREATE TABLE IF NOT EXISTS `last_insert_id_tabletwo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `col` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 sqldb.last_insert_id_tabletwo:~5 rows (대략적) 내보내기
/*!40000 ALTER TABLE `last_insert_id_tabletwo` DISABLE KEYS */;
INSERT INTO `last_insert_id_tabletwo` (`id`, `col`) VALUES
	(1, '1row'),
	(2, '2row'),
	(3, '3row'),
	(4, '2row'),
	(5, '3row');
/*!40000 ALTER TABLE `last_insert_id_tabletwo` ENABLE KEYS */;

-- 테이블 sqldb.membertbl 구조 내보내기
CREATE TABLE IF NOT EXISTS `membertbl` (
  `userID` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userName` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `addr` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 sqldb.membertbl:~6 rows (대략적) 내보내기
/*!40000 ALTER TABLE `membertbl` DISABLE KEYS */;
INSERT INTO `membertbl` (`userID`, `userName`, `addr`) VALUES
	('DJM', '동짜몽', '일본'),
	('KHD', '강후덜', '미국'),
	('KJD', '김제동', '경남'),
	('KSK', '김성주', '경기'),
	('LSM', '이상민', '서울');
/*!40000 ALTER TABLE `membertbl` ENABLE KEYS */;

-- 테이블 sqldb.stdclubtbl 구조 내보내기
CREATE TABLE IF NOT EXISTS `stdclubtbl` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `stdName` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clubName` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`num`),
  KEY `stdName` (`stdName`),
  KEY `clubName` (`clubName`),
  CONSTRAINT `stdclubtbl_ibfk_1` FOREIGN KEY (`stdName`) REFERENCES `stdtbl` (`stdName`),
  CONSTRAINT `stdclubtbl_ibfk_2` FOREIGN KEY (`clubName`) REFERENCES `clubtbl` (`clubName`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 sqldb.stdclubtbl:~6 rows (대략적) 내보내기
/*!40000 ALTER TABLE `stdclubtbl` DISABLE KEYS */;
INSERT INTO `stdclubtbl` (`num`, `stdName`, `clubName`) VALUES
	(27, '강호동', '바둑'),
	(28, '강호동', '축구'),
	(29, '김용만', '축구'),
	(30, '이휘재', '축구'),
	(31, '이휘재', '봉사'),
	(32, '박수홍', '봉사');
/*!40000 ALTER TABLE `stdclubtbl` ENABLE KEYS */;

-- 테이블 sqldb.stdtbl 구조 내보내기
CREATE TABLE IF NOT EXISTS `stdtbl` (
  `stdName` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `addr` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`stdName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 sqldb.stdtbl:~5 rows (대략적) 내보내기
/*!40000 ALTER TABLE `stdtbl` DISABLE KEYS */;
INSERT INTO `stdtbl` (`stdName`, `addr`) VALUES
	('강호동', '경북'),
	('김용만', '서울'),
	('김제동', '경남'),
	('박수홍', '서울'),
	('이휘재', '경기');
/*!40000 ALTER TABLE `stdtbl` ENABLE KEYS */;

-- 테이블 sqldb.testtbl 구조 내보내기
CREATE TABLE IF NOT EXISTS `testtbl` (
  `id` int(11) DEFAULT NULL,
  `txt` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 sqldb.testtbl:~3 rows (대략적) 내보내기
/*!40000 ALTER TABLE `testtbl` DISABLE KEYS */;
INSERT INTO `testtbl` (`id`, `txt`) VALUES
	(1, '이엑스아이디'),
	(2, '에프터스쿨'),
	(3, '에이핑크');
/*!40000 ALTER TABLE `testtbl` ENABLE KEYS */;

-- 테이블 sqldb.usertbl 구조 내보내기
CREATE TABLE IF NOT EXISTS `usertbl` (
  `userID` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userName` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthYear` int(11) NOT NULL DEFAULT 0,
  `addr` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `mobile1` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile2` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `height` int(11) NOT NULL,
  `mDate` date NOT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 sqldb.usertbl:~10 rows (대략적) 내보내기
/*!40000 ALTER TABLE `usertbl` DISABLE KEYS */;
INSERT INTO `usertbl` (`userID`, `userName`, `birthYear`, `addr`, `mobile1`, `mobile2`, `height`, `mDate`) VALUES
	('KHD', '강호동', 1970, '경북', '011', '22222222', 182, '2007-07-07'),
	('KJD', '김제동', 1974, '경남', '', '', 173, '2013-03-03'),
	('KKJ', '김국진', 1965, '서울', '019', '33333333', 171, '2009-09-09'),
	('KYM', '김용만', 1967, '서울', '010', '44444444', 177, '2015-05-05'),
	('LHJ', '이휘재', 1972, '경기', '011', '88888888', 180, '2006-04-04'),
	('LKK', '이경규', 1960, '경남', '018', '99999999', 170, '2004-12-12'),
	('NHS', '남희석', 1971, '충남', '016', '66666666', 180, '2017-04-04'),
	('PSH', '박수홍', 1970, '서울', '010', '00000000', 183, '2012-05-05'),
	('SDY', '신동엽', 1971, '경기', '', '', 176, '2018-10-10'),
	('YJS', '유재석', 1972, '서울', '010', '11111111', 178, '2008-08-08');
/*!40000 ALTER TABLE `usertbl` ENABLE KEYS */;

-- 트리거 sqldb.backUserTbl_DeleteTrg 구조 내보내기
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER backUserTbl_DeleteTrg
	AFTER DELETE
	ON usertbl
	FOR EACH ROW
BEGIN
		INSERT INTO backup_usertbl VALUES( OLD.userID , OLD.username , OLD.birthyear,
		OLD.addr , OLD.mobile1 , OLD.mobile2 , OLD.height, OLD.mDate,
		"삭제", CURDATE() , CURRENT_USER() );
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- 트리거 sqldb.backUserTbl_UpdateTrg 구조 내보내기
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER backUserTbl_UpdateTrg
	AFTER UPDATE
	ON userTbl
	FOR EACH ROW
	
BEGIN
	INSERT INTO backup_usertbl VALUES ( OLD.userID , OLD.username, OLD.birthyear,
	OLD.addr , OLD.mobile1 , OLD.mobile2, OLD.height, OLD.mDate,
	"수정",CURDATE(),CURRENT_USER() );
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- 트리거 sqldb.testTrg 구조 내보내기
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER testTrg
	AFTER DELETE
	ON testTbl
	FOR EACH ROW
BEGIN
	SET @msg = "가수그룹이 삭제됨";
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
