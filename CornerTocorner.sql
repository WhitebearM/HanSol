-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.6.8-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- ctc 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `ctc` /*!40100 DEFAULT CHARACTER SET utf8mb3 */;
USE `ctc`;

-- 테이블 ctc.airport 구조 내보내기
CREATE TABLE IF NOT EXISTS `airport` (
  `airport_num` int(11) NOT NULL,
  `airport_name` varchar(50) NOT NULL,
  `airport_latitude` varchar(30) NOT NULL,
  `airport_longitude` varchar(30) NOT NULL,
  PRIMARY KEY (`airport_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 ctc.airport:~16 rows (대략적) 내보내기
/*!40000 ALTER TABLE `airport` DISABLE KEYS */;
INSERT INTO `airport` (`airport_num`, `airport_name`, `airport_latitude`, `airport_longitude`) VALUES
	(1, '서울 (SEL)', '123', '123'),
	(2, '제주 (CJU)', '123', '123'),
	(3, '부산 (PUS)', '123', '123'),
	(4, '김포 (GMP)', '123', '123'),
	(5, '인천 (ICN)', '123', '123'),
	(6, '광주 (KWJ)', '123', '123'),
	(7, '무안 (MWX)', '123425', '12352'),
	(8, '군산 (KUV)', '1234', '1234'),
	(9, '대구 (TAE)', '41324', '43123'),
	(10, '사천 (HIN)', '143124', '14124'),
	(11, '여수 (RSU)', '115512', '1444'),
	(12, '울산 (USN)', '123', '123'),
	(13, '원주 (WJU)', '123', '123'),
	(14, '청주 (CJJ)', '123', '123'),
	(15, '포항 (KPO)', '1234', '1234'),
	(16, '양양 (YNY)', '14141', '14141');
/*!40000 ALTER TABLE `airport` ENABLE KEYS */;

-- 테이블 ctc.board_detail_image 구조 내보내기
CREATE TABLE IF NOT EXISTS `board_detail_image` (
  `board_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `event_num` int(11) DEFAULT NULL,
  `faq_num` int(11) DEFAULT NULL,
  `notice_num` int(11) DEFAULT NULL,
  `qna_num` int(11) DEFAULT NULL,
  `qna_answer_num` int(11) DEFAULT NULL,
  `review_num` int(11) DEFAULT NULL,
  `board_fileName` varchar(200) DEFAULT NULL,
  `board_reg_id` varchar(20) DEFAULT NULL,
  `board_fileType` varchar(40) DEFAULT NULL,
  `board_credate` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`board_image_id`),
  KEY `FK_board_datail_image_event` (`event_num`),
  KEY `FK_board_datail_image_faq` (`faq_num`),
  KEY `FK_board_datail_image_notice` (`notice_num`),
  KEY `FK_board_datail_image_qna_answer` (`qna_answer_num`),
  KEY `FK_board_datail_image_review` (`review_num`),
  CONSTRAINT `FK_board_datail_image_event` FOREIGN KEY (`event_num`) REFERENCES `event` (`event_num`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_board_datail_image_faq` FOREIGN KEY (`faq_num`) REFERENCES `faq` (`faq_num`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_board_datail_image_notice` FOREIGN KEY (`notice_num`) REFERENCES `notice` (`notice_num`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_board_datail_image_qna_answer` FOREIGN KEY (`qna_answer_num`) REFERENCES `qna_answer` (`qna_answer_num`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_board_datail_image_review` FOREIGN KEY (`review_num`) REFERENCES `review` (`review_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb3 COMMENT='이벤트, 공지사항, 문의, 후기 등 게시판에 들어가는 사진 파일 테이블';

-- 테이블 데이터 ctc.board_detail_image:~7 rows (대략적) 내보내기
/*!40000 ALTER TABLE `board_detail_image` DISABLE KEYS */;
INSERT INTO `board_detail_image` (`board_image_id`, `event_num`, `faq_num`, `notice_num`, `qna_num`, `qna_answer_num`, `review_num`, `board_fileName`, `board_reg_id`, `board_fileType`, `board_credate`) VALUES
	(31, NULL, NULL, NULL, 100, NULL, NULL, '%EA%B5%AC%EC%A1%B0.png', NULL, NULL, '2023-04-11 16:30:08'),
	(32, NULL, NULL, NULL, 101, NULL, NULL, '%EA%B5%AC%EC%A1%B0.png', NULL, NULL, '2023-04-11 16:30:31'),
	(33, NULL, NULL, NULL, 102, NULL, NULL, 'gadsg.png', NULL, NULL, '2023-04-11 16:32:09'),
	(34, NULL, NULL, NULL, 103, NULL, NULL, 'gadsg.png', NULL, NULL, '2023-04-12 09:15:00'),
	(35, NULL, NULL, NULL, 104, NULL, NULL, 'gadsg.png', NULL, NULL, '2023-04-13 11:48:49'),
	(36, NULL, NULL, NULL, 105, NULL, NULL, 'gadsg.png', NULL, NULL, '2023-04-18 14:26:45'),
	(37, NULL, NULL, NULL, 106, NULL, NULL, 'gadsg.png', NULL, NULL, '2023-04-18 16:20:24');
/*!40000 ALTER TABLE `board_detail_image` ENABLE KEYS */;

-- 테이블 ctc.cart 구조 내보내기
CREATE TABLE IF NOT EXISTS `cart` (
  `member_id` varchar(10) NOT NULL,
  `goods_code` varchar(12) NOT NULL,
  `cart_id` int(11) NOT NULL AUTO_INCREMENT,
  `cart_headcount` int(11) DEFAULT 1,
  `cart_credate` timestamp NOT NULL DEFAULT date_format(current_timestamp(),'%Y%m%d'),
  KEY `FK_cart_goods` (`goods_code`),
  KEY `cart_id` (`cart_id`),
  KEY `FK_cart_member` (`member_id`),
  CONSTRAINT `FK_cart_goods` FOREIGN KEY (`goods_code`) REFERENCES `goods` (`goods_code`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_cart_member` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 ctc.cart:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;

-- 테이블 ctc.company 구조 내보내기
CREATE TABLE IF NOT EXISTS `company` (
  `com_num` int(11) NOT NULL AUTO_INCREMENT COMMENT '사업체 번호(자동증가)',
  `com_id` varchar(50) NOT NULL COMMENT '사업체 아이디',
  `com_pw` varchar(50) NOT NULL COMMENT '사업체 비밀번호',
  `com_name` varchar(50) NOT NULL COMMENT '사업체명',
  `com_ceo` varchar(20) NOT NULL COMMENT '사업체 대표성함',
  `com_tel1` varchar(30) NOT NULL DEFAULT '0' COMMENT '사업체 전화번호',
  `com_tel2` varchar(30) NOT NULL DEFAULT '0' COMMENT '사업체 전화번호',
  `com_tel3` varchar(30) NOT NULL COMMENT '사업체 전화번호',
  `com_email` varchar(40) NOT NULL COMMENT '사업체 이메일',
  `com_crn1` varchar(13) NOT NULL DEFAULT '0' COMMENT '사업자등록번호',
  `com_crn2` varchar(13) NOT NULL DEFAULT '0' COMMENT '사업자등록번호',
  `com_crn3` varchar(13) NOT NULL DEFAULT '0' COMMENT '사업자등록번호',
  `com_email_yn` varchar(5) NOT NULL DEFAULT 'n' COMMENT '사업자등록번호 인증 여부',
  `com_zipcode` varchar(12) NOT NULL COMMENT '사업체 우편번호',
  `com_road_address` varchar(50) NOT NULL COMMENT '사업체 도로명 주소',
  `com_local_address` varchar(50) DEFAULT NULL COMMENT '사업체 지번 주소',
  `com_rest_address` varchar(50) DEFAULT NULL COMMENT '사업체 나머지 주소',
  `com_joindate` timestamp NOT NULL DEFAULT current_timestamp() COMMENT '사업체 가입일',
  `com_status` int(11) NOT NULL DEFAULT 1 COMMENT '사업체 상태 1) 가입요청중 2)승인 완료 3) 탈퇴요청 4) 삭제',
  `com_unregister_date` timestamp NULL DEFAULT current_timestamp(),
  `com_deldate` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`com_id`),
  KEY `com_num` (`com_num`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 ctc.company:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` (`com_num`, `com_id`, `com_pw`, `com_name`, `com_ceo`, `com_tel1`, `com_tel2`, `com_tel3`, `com_email`, `com_crn1`, `com_crn2`, `com_crn3`, `com_email_yn`, `com_zipcode`, `com_road_address`, `com_local_address`, `com_rest_address`, `com_joindate`, `com_status`, `com_unregister_date`, `com_deldate`) VALUES
	(1, 'company01', 'Comtest01!', '사업체1', '이영민', '010', '1234', '5678', 'com01@test.com', '123', '4567', '890', 'y', '06044', '서울특별시 강남구 강남대로 556', NULL, NULL, '2023-04-19 00:57:23', 1, NULL, NULL),
	(2, 'company02', 'Comtest!', '사업체2', '배한솔', '010', '5678', '1234', 'com02@test.com', '098', '7654', '321', 'y', '06339', '서울특별시 강남구 개포로124길 27', NULL, NULL, '2023-04-19 00:58:51', 1, NULL, NULL);
/*!40000 ALTER TABLE `company` ENABLE KEYS */;

-- 테이블 ctc.del_goods 구조 내보내기
CREATE TABLE IF NOT EXISTS `del_goods` (
  `flight_code` int(11) DEFAULT NULL,
  `hotel_code` int(11) DEFAULT NULL,
  `rent_code` int(11) DEFAULT NULL,
  `package_code` int(11) DEFAULT NULL,
  `com_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 ctc.del_goods:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `del_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `del_goods` ENABLE KEYS */;

-- 테이블 ctc.del_member 구조 내보내기
CREATE TABLE IF NOT EXISTS `del_member` (
  `member_id` int(11) DEFAULT NULL,
  `com_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 ctc.del_member:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `del_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `del_member` ENABLE KEYS */;

-- 테이블 ctc.event 구조 내보내기
CREATE TABLE IF NOT EXISTS `event` (
  `com_id` varchar(10) NOT NULL,
  `event_num` int(11) NOT NULL AUTO_INCREMENT,
  `event_title` varchar(50) NOT NULL,
  `event_content` varchar(500) NOT NULL,
  `event_start_date` date NOT NULL,
  `event_end_date` date NOT NULL,
  `event_write_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `event_status` int(11) NOT NULL,
  `event_category` varchar(10) NOT NULL,
  KEY `event_num` (`event_num`),
  KEY `FK_event_company` (`com_id`),
  CONSTRAINT `FK_event_company` FOREIGN KEY (`com_id`) REFERENCES `company` (`com_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 ctc.event:~4 rows (대략적) 내보내기
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` (`com_id`, `event_num`, `event_title`, `event_content`, `event_start_date`, `event_end_date`, `event_write_date`, `event_status`, `event_category`) VALUES
	('company01', 1, 'CornerToCorner 1주년 감사제!', 'CornerToCorner 1주년 감사제!', '2023-03-20', '2023-05-22', '2023-03-20 11:06:27', 1, '호텔'),
	('company01', 2, 'CornerToCorner 1주년 감사제!', 'CornerToCorner 1주년 감사제!', '2023-03-18', '2023-06-20', '2023-03-20 11:49:19', 1, '항공권'),
	('company02', 3, '렌트 관련 이벤트', '렌트 관련 이벤트입니다.', '2023-03-29', '2023-03-29', '2023-03-29 17:45:37', 1, '렌트'),
	('company02', 4, '패키지 관련 이벤트', '패키지 관련 이벤트입니다.', '2023-03-29', '2023-03-29', '2023-03-29 17:45:46', 1, '패키지');
/*!40000 ALTER TABLE `event` ENABLE KEYS */;

-- 테이블 ctc.faq 구조 내보내기
CREATE TABLE IF NOT EXISTS `faq` (
  `faq_num` int(11) NOT NULL AUTO_INCREMENT,
  `faq_title` varchar(100) NOT NULL,
  `faq_content` varchar(500) NOT NULL,
  `faq_write_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `faq_category` int(11) NOT NULL,
  KEY `faq_num` (`faq_num`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 ctc.faq:~12 rows (대략적) 내보내기
/*!40000 ALTER TABLE `faq` DISABLE KEYS */;
INSERT INTO `faq` (`faq_num`, `faq_title`, `faq_content`, `faq_write_date`, `faq_category`) VALUES
	(1, '공항내에서 마스크를 착용해야 하나요??', '정부의 실내마스크 착용 의무가 조정됨(\'23.3.20)에 따라, 실내 및 대중교통수단 내 마스크 착용 의무가 해제되었으나, \r\n혼잡 시간대에는 마스크 착용을 권고 드립니다.', '2023-04-03 17:31:31', 2),
	(2, '공항내에서 마스크구입이 가능한가요??', '공항 내 편의점, 약국 등 상점에서 구입이 가능합니다.\r\n(자세한 사항은 현장 내 공항직원에 문의가능)', '2023-04-03 17:33:42', 2),
	(3, '열이 나는 경우는 어떻게 해야하나요??', '발열증세가 있으신 경우 항공기 탑승이 제한될 수 있으며, 자세한 사항은 항공사로 문의바랍니다.', '2023-04-03 17:34:13', 2),
	(4, '레이트 체크아웃 추가 되나요??', '레이트 체크아웃은 사전 추가가 불가하여 체크인 시 프론트에 문의 해주셔야 합니다.', '2023-04-03 00:00:00', 1),
	(5, '아동동반 숙박이 가능한가요??', '기준 투숙 인원 외 아동을 동반하실 경우 만 12세 미만이라할지라도 호텔에 따라 동반 투숙이\r\n 불가능할 수 있습니다.\r\n (유료 추가 침대 의무 사용 혹은 객실당 최대투숙인원 초과 등)', '2023-04-03 00:00:00', 1),
	(6, '숙박권을 출력 해야하나요??', '숙박권은 사전에 예약 확정 및 결제를 완료했다는 증빙서류입니다.\r\n가능하면 숙박권을 프론트에 제출하시는것을 추천드립니다.', '2023-04-03 00:00:00', 1),
	(7, '예약시 운전면허증 정보를 꼭 등록해야하나요??', '대여방법이 대여업체 방문인 경우에는 운전면허증 등록 없이 대여가 가능하지만,\r\n 대여방법이 배달대여일 경우에는 운전면허증을 등록해주셔야합니다.', '2023-04-03 00:00:00', 3),
	(8, '예약 완료후 대여업체에서 연락이 따로오나요??', '렌트킹 예약시스템은 고객님께서 차량을 예약하시면\r\n대여업체에서 예약정보를 받아 접수하는 방식입니다.', '2023-04-03 00:00:00', 3),
	(9, '검색되는 차량이 실제로 대여가 가능한 차량인가요??', '고객님이 렌트킹에서 실시간으로 검색하신 차량은 실제로 대여가 가능한 차량입니다.', '2023-04-03 00:00:00', 3),
	(10, '상담후 결제는 무엇인가요?', '테마여행의 경우 최소 출발 인원이 있기 때문에 인원 모객이 되면 출발 가능 합니다.', '2023-04-03 00:00:00', 4),
	(11, '패키지여행이 끝나고 현지에서 돌아오는 날짜를 변경할수있나요?', '일정이 모두 끝난후 개별귀가를 원하시는 경우에는, 출발전에 우선 돌아오실 날짜와 좌석가능여부를 사전에 체크·예약완료 하셔야하며, \r\n현지에서 돌아오실때 일정금액을 해당 공항에서 지불하셔야 하시면 됩니다.\r\n노선에 따라서 또는 항공편에 따라서 리턴변경이 불가한 경우도 있으니, 출발전에 필히 가능여부를 체크하시는 것이 중요합니다.', '2023-04-03 00:00:00', 4),
	(12, '결제 수단의 변경이 가능한가요?', '결제를 완료하신 후 결제 수단의 변경은 해당 예약 건의 체크인 1일 전(업무일 기준) 까지만 가능합니다.\r\n그 이후에는 어떠한 사유로도 절대 결제 수단을 변경 할 수 없습니다.', '2023-04-03 17:44:10', 4);
/*!40000 ALTER TABLE `faq` ENABLE KEYS */;

-- 테이블 ctc.goods 구조 내보내기
CREATE TABLE IF NOT EXISTS `goods` (
  `com_id` varchar(10) NOT NULL,
  `airport_num` int(11) DEFAULT NULL,
  `goods_code` varchar(12) NOT NULL,
  `goods_category` varchar(20) NOT NULL COMMENT '숙박 / 항공 / 렌트 / 패키지',
  `goods_name` varchar(50) DEFAULT NULL,
  `package_hotel_name` varchar(50) DEFAULT NULL COMMENT '패키지 상품의 호텔 이름',
  `goods_exp` varchar(2000) DEFAULT NULL,
  `class_grade` int(11) DEFAULT NULL COMMENT '비행기 / 호텔 등급',
  `goods_location` varchar(255) NOT NULL,
  `goods_latitude` varchar(30) DEFAULT NULL,
  `goods_longitude` varchar(30) DEFAULT NULL,
  `room_type` varchar(20) DEFAULT NULL COMMENT '숙박',
  `car_model` varchar(20) DEFAULT NULL COMMENT '차 모델',
  `goods_price` int(11) NOT NULL DEFAULT 0 COMMENT '정가',
  `goods_saleprice` int(20) NOT NULL DEFAULT 0 COMMENT '판매가',
  `goods_departures` varchar(12) DEFAULT NULL,
  `goods_departure_date` date DEFAULT NULL,
  `goods_departure_time` time DEFAULT NULL,
  `goods_arrivals` varchar(12) DEFAULT NULL,
  `goods_arrival_date` date DEFAULT NULL,
  `goods_arrival_time` time DEFAULT NULL,
  `goods_status` int(11) NOT NULL DEFAULT 1,
  `goods_charge` int(11) NOT NULL DEFAULT 0,
  `goods_mileage` int(11) NOT NULL DEFAULT 0,
  `goods_entered_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`goods_code`),
  KEY `FK_goods_company` (`com_id`),
  KEY `FK_goods_airport` (`airport_num`),
  CONSTRAINT `FK_goods_airport` FOREIGN KEY (`airport_num`) REFERENCES `airport` (`airport_num`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_goods_company` FOREIGN KEY (`com_id`) REFERENCES `company` (`com_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 ctc.goods:~46 rows (대략적) 내보내기
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` (`com_id`, `airport_num`, `goods_code`, `goods_category`, `goods_name`, `package_hotel_name`, `goods_exp`, `class_grade`, `goods_location`, `goods_latitude`, `goods_longitude`, `room_type`, `car_model`, `goods_price`, `goods_saleprice`, `goods_departures`, `goods_departure_date`, `goods_departure_time`, `goods_arrivals`, `goods_arrival_date`, `goods_arrival_time`, `goods_status`, `goods_charge`, `goods_mileage`, `goods_entered_date`) VALUES
	('company01', 13, 'FL0001', '항공', '아시아나', NULL, NULL, 2, '청주', NULL, NULL, NULL, NULL, 114000, 114000, '청주', '2023-03-30', '15:30:00', '제주', '2023-03-30', '16:30:00', 1, 0, 0, '2023-03-30 12:09:46'),
	('company01', 1, 'FL0002', '항공', '진에어', NULL, NULL, 1, '김포', '', NULL, NULL, NULL, 78000, 64200, '김포', '2023-03-30', '12:30:00', '제주', '2023-03-30', '14:00:00', 1, 0, 0, '2023-03-30 11:36:00'),
	('company02', 13, 'FL0003', '항공', '아시아나', NULL, NULL, 2, '청주', NULL, NULL, NULL, NULL, 114000, 114000, '청주', '2023-03-30', '15:30:00', '제주', '2023-03-30', '16:30:00', 1, 0, 0, '2023-03-30 12:09:46'),
	('company02', 1, 'FL0004', '항공', '진에어', NULL, NULL, 1, '김포', '', NULL, NULL, NULL, 78000, 64200, '김포', '2023-03-30', '12:30:00', '제주', '2023-03-30', '14:00:00', 1, 0, 0, '2023-03-30 11:36:00'),
	('company01', NULL, 'HT0001', '숙박', '플레이스 캠프 제주', NULL, '주차 및 Wi-Fi가 항상 무료로 제공되므로 언제든지 차량을 입출차할 수 있으며 연락을 취하실 수 있습니다. 제주의 성산에 위치한 본 숙소는 관광 명소 및 흥미로운 레스토랑과 가깝습니다. 떠나기 전 유명한 성산일출봉을/를 방문해 보세요. 본 4성급 숙소는 숙박의 질과 즐거움을 향상시키기 위한 숙소 내 다양한 편의시설로 가득 차 있습니다.', 3, '제주', '3333', '2222', '1', NULL, 178400, 156000, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2023-04-04 09:34:25'),
	('company01', NULL, 'HT0002', '숙박', '탐라스테이호텔제주', NULL, ' 116개 객실에는 냉장고 및 평면 TV도 갖추어져 있어 편하게 머무실 수 있습니다. 무료 유선 및 무선 인터넷이 지원되며 케이블 프로그램도 시청하실 수 있습니다. 샤워 시설을 갖춘 전용 욕실에는 비데 및 헤어드라이어도 마련되어 있습니다. 편의 시설/서비스로는 전화 외에 금고 및 전기 주전자도 있습니다.\r\n  피트니스 센터 및 시즌별로 운영되는 야외 수영장 등의 레크리에이션 시설을 십분 활용하시기 바랍니다. 이 호텔에는 무료 무선 인터넷 및 연회장도 편의 시설/서비스로 마련되어 있습니다.\r\n  이 호텔에 있는 Cuore에서 맛있는 식사를 즐겨보세요. 커피숍/카페에서는 스낵이 제공됩니다. 아침 식사(뷔페)를 매일 07:00 ~ 09:30에 유료로 이용하실 수 있습니다.\r\n  거리는 0.1km 단위로 최대한 가깝게 표시됩니다. 구엄리돌염전 - 1.8km 월대 - 4.9km 항파두리 항몽 유적지 - 5.3km 이호해수욕장 - 6.7km 제주공룡랜드 - 7.3km 도두항 - 8.7km 도두봉 - 8.9km 제주 민속 오일시장 - 8.9km 테마파크 프시케월드 - 9.5km 제주 테지움 박물관 - 9.5km 제주한라병원 - 9.9km 한담해변 - 10.1km 금산공원 - 10.1km 브릭캠퍼스 - 10.5km Nuwemaru Street - 10.7km 탐라스테이호텔제주에서 이용하기 편리한 공항은 제주 (CJU-제주국제공항)이며, 11.9km 거리에 있습니다.', 4, '제주', '32333', '1111', '1', NULL, 115000, 73140, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2023-04-04 17:27:11'),
	('company01', NULL, 'HT0003', '숙박', '함덕 비치 스테이 제주', NULL, '주차 및 Wi-Fi가 항상 무료로 제공되므로 언제든지 차량을 입출차할 수 있으며 연락을 취하실 수 있습니다. 제주의 조천에 위치한 본 숙소는 관광 명소 및 흥미로운 레스토랑과 가깝습니다. 시간을 내어 성산일출봉 및 근처 함덕 비치을/를 방문해 보세요. 본 4성급 숙소는 숙박의 질과 즐거움을 향상시키기 위한 숙소 내 다양한 편의시설로 가득 차 있습니다.', 4, '제주', '694871', '57451', '1', NULL, 220000, 78400, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2023-04-04 09:32:57'),
	('company01', NULL, 'HT0004', '숙박', '롯데시티호텔 제주', NULL, '기본 정보\r\n∙    체크인 : 3:00 PM ~ 체크아웃 : 12:00 PM\r\n∙    체크인 최소 연령 : 만 19세\r\n∙    미성년자는 보호자 동반없이 이용하실 수 없습니다.\r\n∙    호텔 전화 번호 : 82-64-7301000\r\n∙    호텔 팩스 번호 : 82-64-7301900\r\n특별 공지\r\n[잠깐! 이용 전 참고 해주세요]\r\n\r\n※ 미성년자의 경우 보호자의 동행없이 투숙불가 합니다. (해당년도 생일이 지난 만 19세 이상부터 투숙가능)\r\n\r\n※ 미성년자는 보호자 동반 투숙만 가능하며 서면 등 동의서를 얻는다고 하여도 보호자 동반이 아니면 투숙이 불가 합니다.\r\n\r\n \r\n\r\n✦조/중/석식 이용 요금 안내✦\r\n\r\n• 조식 : 성인 - 30,000원 / 소아 - 25,000원\r\n\r\n• 중식 : 성인 - 47,000원 / 소아 - 25,000원 \r\n\r\n• 석식 : 성인 - 80,000원 / 소아 - 40,000원\r\n\r\n \r\n\r\n✦포인트 적립 관련 안내✦\r\n\r\n※ 2023년 1월 1일 부 롯데호텔 리워즈 포인트 적립이 불가합니다.\r\n\r\n \r\n\r\n✦건식 사우나✦\r\n\r\n• 한시적 운영 중단\r\n\r\n \r\n\r\n✦야외 수영장 & 테라스 리노베이션 안내✦\r\n\r\n- 일정 : 2023.01.04(12:00) ~ 2023.05.31\r\n\r\n- 오픈 : 2023.06.01(유료전환)\r\n\r\n- 해당 기간 공사로 인해 수영장 이용이 불가합니다.\r\n\r\n- 공사기간은 공사 사정 상 연장 될 수 있습니다.\r\n\r\n• 이용시간 및 요금 추후 공지 예정입니다.', 4, '제주', '12345', '54321', '1', NULL, 145000, 137800, NULL, '2023-03-30', NULL, NULL, '2023-03-31', NULL, 1, 0, 0, '2023-03-30 11:39:40'),
	('company01', NULL, 'HT0005', '숙박', '호텔 브릿지 서귀포', NULL, '호텔 브릿지 서귀포는 제주 국제 공항에서 차로 약 1시간 10분 거리에 있습니다. 주변 관광지인 이중섭 거리는 도보 약 5분, 서귀포 매일올레시장은 도보 약 8분이면 가실 수 있습니다. 또한, 차로 약 35분 거리에는 천제연 폭포, 여미지식물원 등이 있는 중문관광단지도 있습니다.', 4, '제주', '78967', '7696345', '1', NULL, 140000, 114800, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2023-04-06 11:50:21'),
	('company01', NULL, 'HT0006', '숙박', '기린빌라리조트', NULL, '본 리조트 빌라은/는 모든 객실 내 무료 Wi-Fi 및 무료 주차를 제공합니다. 제주의 한라산 국립공원에 위치한 본 숙소는 관광 명소 및 흥미로운 레스토랑과 가깝습니다. 떠나기 전 유명한 성산일출봉을/를 방문해 보세요. 본 4성급 숙소는 숙박의 질과 즐거움을 향상시키기 위한 숙소 내 다양한 편의시설로 가득 차 있습니다.', 4, '제주', '123412', '213412', '1', NULL, 180000, 148000, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2023-04-06 12:00:04'),
	('company01', NULL, 'HT0007', '숙박', '오션스위츠 제주호텔', NULL, '주차 및 Wi-Fi가 항상 무료로 제공되므로 언제든지 차량을 입출차할 수 있으며 연락을 취하실 수 있습니다. 제주 시내에 위치해 있어 현지 명소 및 관광지와 인접해 있습니다. 떠나기 전 유명한 성산일출봉을/를 방문해 보세요. 별 4개를 받은 본 고급 숙소는 투숙객에게 숙소 내 레스토랑 및 피트니스 센터을/를 제공합니다.', 4, '제주', '88675', '34357', '1', NULL, 140000, 98000, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2023-04-06 12:01:40'),
	('company01', NULL, 'HT0008', '숙박', '제이뷰호텔', NULL, '주차 및 Wi-Fi가 항상 무료로 제공되므로 언제든지 차량을 입출차할 수 있으며 연락을 취하실 수 있습니다. 제주의 중문에 위치한 본 숙소는 관광 명소 및 흥미로운 레스토랑과 가깝습니다. 떠나기 전 유명한 성산일출봉을/를 방문해 보세요. 별 3개를 받은 본 고급 숙소는 투숙객에게 숙소 내 레스토랑, 실외 수영장 및 스파을/를 제공합니다.', 3, '제주', '11111', '22222', '1', NULL, 89000, 75000, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2023-04-06 12:03:28'),
	('company01', NULL, 'HT0009', '숙박', '씨오르리조트', NULL, '최고경관의 청정휴양지 제주올레길 환상의 7코스에 위치한 제주 씨오르 리조트입니다.', NULL, '제주', '77777', '525555', '1', NULL, 77500, 76000, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2023-04-06 12:05:31'),
	('company01', NULL, 'HT0010', '숙박', '키아오라펜션', NULL, '성산 일출봉, 우도, 섭지코지 관광 최적 키아오라 펜션\r\n독채 펜션같은 분리형의 깔끔한 객실 아름다운 2천평 정원, 방에서 보이는 일출봉 뷰\r\n비 내리면 더 정취있는 전천후 바베큐장\r\n세미나와 스터디 시설 갖춘 무료 카페\r\n원하는 가족·단체엔 이봉수 교수의 글쓰기/인문한 무료 강연', NULL, '제주', '88888', '77777', '1', NULL, 55000, 48900, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2023-04-06 12:07:39'),
	('company01', NULL, 'HT0011', '숙박', '어반아일랜드', NULL, '어반 아일랜드 - <3성급> - 어반 아일랜드는 제주국제공항에서 차로 단 5분 거리에 있어 편리한 위치를 자랑합니다. 주변 관광지로는 두 마리 조랑말 등대가 유명한 이호테우 해변, 용두암, 용연 계곡 등이 차로 15분 거리에 있으며 세계자연유산으로 지정된 만장굴은 차로 55분 거리에 있습니다.', 3, '제주', '77777', '44444', '1', NULL, 55000, 55000, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2023-04-06 12:09:00'),
	('company02', NULL, 'HT0012', '숙박', '플레이스 캠프 제주', NULL, '주차 및 Wi-Fi가 항상 무료로 제공되므로 언제든지 차량을 입출차할 수 있으며 연락을 취하실 수 있습니다. 제주의 성산에 위치한 본 숙소는 관광 명소 및 흥미로운 레스토랑과 가깝습니다. 떠나기 전 유명한 성산일출봉을/를 방문해 보세요. 본 4성급 숙소는 숙박의 질과 즐거움을 향상시키기 위한 숙소 내 다양한 편의시설로 가득 차 있습니다.', 3, '제주', '3333', '2222', '1', NULL, 178400, 156000, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2023-04-04 09:34:25'),
	('company02', NULL, 'HT0013', '숙박', '탐라스테이호텔제주', NULL, ' 116개 객실에는 냉장고 및 평면 TV도 갖추어져 있어 편하게 머무실 수 있습니다. 무료 유선 및 무선 인터넷이 지원되며 케이블 프로그램도 시청하실 수 있습니다. 샤워 시설을 갖춘 전용 욕실에는 비데 및 헤어드라이어도 마련되어 있습니다. 편의 시설/서비스로는 전화 외에 금고 및 전기 주전자도 있습니다.\r\n  피트니스 센터 및 시즌별로 운영되는 야외 수영장 등의 레크리에이션 시설을 십분 활용하시기 바랍니다. 이 호텔에는 무료 무선 인터넷 및 연회장도 편의 시설/서비스로 마련되어 있습니다.\r\n  이 호텔에 있는 Cuore에서 맛있는 식사를 즐겨보세요. 커피숍/카페에서는 스낵이 제공됩니다. 아침 식사(뷔페)를 매일 07:00 ~ 09:30에 유료로 이용하실 수 있습니다.\r\n  거리는 0.1km 단위로 최대한 가깝게 표시됩니다. 구엄리돌염전 - 1.8km 월대 - 4.9km 항파두리 항몽 유적지 - 5.3km 이호해수욕장 - 6.7km 제주공룡랜드 - 7.3km 도두항 - 8.7km 도두봉 - 8.9km 제주 민속 오일시장 - 8.9km 테마파크 프시케월드 - 9.5km 제주 테지움 박물관 - 9.5km 제주한라병원 - 9.9km 한담해변 - 10.1km 금산공원 - 10.1km 브릭캠퍼스 - 10.5km Nuwemaru Street - 10.7km 탐라스테이호텔제주에서 이용하기 편리한 공항은 제주 (CJU-제주국제공항)이며, 11.9km 거리에 있습니다.', 4, '제주', '32333', '1111', '1', NULL, 115000, 73140, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2023-04-04 17:27:11'),
	('company02', NULL, 'HT0014', '숙박', '함덕 비치 스테이 제주', NULL, '주차 및 Wi-Fi가 항상 무료로 제공되므로 언제든지 차량을 입출차할 수 있으며 연락을 취하실 수 있습니다. 제주의 조천에 위치한 본 숙소는 관광 명소 및 흥미로운 레스토랑과 가깝습니다. 시간을 내어 성산일출봉 및 근처 함덕 비치을/를 방문해 보세요. 본 4성급 숙소는 숙박의 질과 즐거움을 향상시키기 위한 숙소 내 다양한 편의시설로 가득 차 있습니다.', 4, '제주', '694871', '57451', '1', NULL, 220000, 78400, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2023-04-04 09:32:57'),
	('company02', NULL, 'HT0015', '숙박', '롯데시티호텔 제주', NULL, '기본 정보\r\n∙    체크인 : 3:00 PM ~ 체크아웃 : 12:00 PM\r\n∙    체크인 최소 연령 : 만 19세\r\n∙    미성년자는 보호자 동반없이 이용하실 수 없습니다.\r\n∙    호텔 전화 번호 : 82-64-7301000\r\n∙    호텔 팩스 번호 : 82-64-7301900\r\n특별 공지\r\n[잠깐! 이용 전 참고 해주세요]\r\n\r\n※ 미성년자의 경우 보호자의 동행없이 투숙불가 합니다. (해당년도 생일이 지난 만 19세 이상부터 투숙가능)\r\n\r\n※ 미성년자는 보호자 동반 투숙만 가능하며 서면 등 동의서를 얻는다고 하여도 보호자 동반이 아니면 투숙이 불가 합니다.\r\n\r\n \r\n\r\n✦조/중/석식 이용 요금 안내✦\r\n\r\n• 조식 : 성인 - 30,000원 / 소아 - 25,000원\r\n\r\n• 중식 : 성인 - 47,000원 / 소아 - 25,000원 \r\n\r\n• 석식 : 성인 - 80,000원 / 소아 - 40,000원\r\n\r\n \r\n\r\n✦포인트 적립 관련 안내✦\r\n\r\n※ 2023년 1월 1일 부 롯데호텔 리워즈 포인트 적립이 불가합니다.\r\n\r\n \r\n\r\n✦건식 사우나✦\r\n\r\n• 한시적 운영 중단\r\n\r\n \r\n\r\n✦야외 수영장 & 테라스 리노베이션 안내✦\r\n\r\n- 일정 : 2023.01.04(12:00) ~ 2023.05.31\r\n\r\n- 오픈 : 2023.06.01(유료전환)\r\n\r\n- 해당 기간 공사로 인해 수영장 이용이 불가합니다.\r\n\r\n- 공사기간은 공사 사정 상 연장 될 수 있습니다.\r\n\r\n• 이용시간 및 요금 추후 공지 예정입니다.', 4, '제주', '12345', '54321', '1', NULL, 145000, 137800, NULL, '2023-03-30', NULL, NULL, '2023-03-31', NULL, 1, 0, 0, '2023-03-30 11:39:40'),
	('company02', NULL, 'HT0016', '숙박', '호텔 브릿지 서귀포', NULL, '호텔 브릿지 서귀포는 제주 국제 공항에서 차로 약 1시간 10분 거리에 있습니다. 주변 관광지인 이중섭 거리는 도보 약 5분, 서귀포 매일올레시장은 도보 약 8분이면 가실 수 있습니다. 또한, 차로 약 35분 거리에는 천제연 폭포, 여미지식물원 등이 있는 중문관광단지도 있습니다.', 4, '제주', '78967', '7696345', '1', NULL, 140000, 114800, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2023-04-06 11:50:21'),
	('company02', NULL, 'HT0017', '숙박', '기린빌라리조트', NULL, '본 리조트 빌라은/는 모든 객실 내 무료 Wi-Fi 및 무료 주차를 제공합니다. 제주의 한라산 국립공원에 위치한 본 숙소는 관광 명소 및 흥미로운 레스토랑과 가깝습니다. 떠나기 전 유명한 성산일출봉을/를 방문해 보세요. 본 4성급 숙소는 숙박의 질과 즐거움을 향상시키기 위한 숙소 내 다양한 편의시설로 가득 차 있습니다.', 4, '제주', '123412', '213412', '1', NULL, 180000, 148000, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2023-04-06 12:00:04'),
	('company02', NULL, 'HT0018', '숙박', '오션스위츠 제주호텔', NULL, '주차 및 Wi-Fi가 항상 무료로 제공되므로 언제든지 차량을 입출차할 수 있으며 연락을 취하실 수 있습니다. 제주 시내에 위치해 있어 현지 명소 및 관광지와 인접해 있습니다. 떠나기 전 유명한 성산일출봉을/를 방문해 보세요. 별 4개를 받은 본 고급 숙소는 투숙객에게 숙소 내 레스토랑 및 피트니스 센터을/를 제공합니다.', 4, '제주', '88675', '34357', '1', NULL, 140000, 98000, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2023-04-06 12:01:40'),
	('company02', NULL, 'HT0019', '숙박', '제이뷰호텔', NULL, '주차 및 Wi-Fi가 항상 무료로 제공되므로 언제든지 차량을 입출차할 수 있으며 연락을 취하실 수 있습니다. 제주의 중문에 위치한 본 숙소는 관광 명소 및 흥미로운 레스토랑과 가깝습니다. 떠나기 전 유명한 성산일출봉을/를 방문해 보세요. 별 3개를 받은 본 고급 숙소는 투숙객에게 숙소 내 레스토랑, 실외 수영장 및 스파을/를 제공합니다.', 3, '제주', '11111', '22222', '1', NULL, 89000, 75000, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2023-04-06 12:03:28'),
	('company02', NULL, 'HT0020', '숙박', '씨오르리조트', NULL, '최고경관의 청정휴양지 제주올레길 환상의 7코스에 위치한 제주 씨오르 리조트입니다.', NULL, '제주', '77777', '525555', '1', NULL, 77500, 76000, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2023-04-06 12:05:31'),
	('company02', NULL, 'HT0021', '숙박', '키아오라펜션', NULL, '성산 일출봉, 우도, 섭지코지 관광 최적 키아오라 펜션\r\n독채 펜션같은 분리형의 깔끔한 객실 아름다운 2천평 정원, 방에서 보이는 일출봉 뷰\r\n비 내리면 더 정취있는 전천후 바베큐장\r\n세미나와 스터디 시설 갖춘 무료 카페\r\n원하는 가족·단체엔 이봉수 교수의 글쓰기/인문한 무료 강연', NULL, '제주', '88888', '77777', '1', NULL, 55000, 48900, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2023-04-06 12:07:39'),
	('company02', NULL, 'HT0022', '숙박', '어반아일랜드', NULL, '어반 아일랜드 - <3성급> - 어반 아일랜드는 제주국제공항에서 차로 단 5분 거리에 있어 편리한 위치를 자랑합니다. 주변 관광지로는 두 마리 조랑말 등대가 유명한 이호테우 해변, 용두암, 용연 계곡 등이 차로 15분 거리에 있으며 세계자연유산으로 지정된 만장굴은 차로 55분 거리에 있습니다.', 3, '제주', '77777', '44444', '1', NULL, 55000, 55000, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2023-04-06 12:09:00'),
	('company01', 4, 'PCK0001', '패키지', '내차로 떠나는 울릉도 자유여행!! ◈차량선적비용 포함◈', '비치온 관광호텔', '포항영일만국제부두 04월 03일 (월) 23:50 뉴씨다오펄 출발 - 울릉도 사동항 04월 04일 (화) 06:20 도착\r\n울릉도 사동항 04월 06일 (목) 12:30 뉴씨다오펄 출발 - 포항영일만국제부두 04월 06일 (목) 19:00 도착\r\n\r\n★ 포항 - 울릉도 대형크루즈 왕복 6인1실(침대선실)\r\n★ 차량선적비용(국산 중형승용차(세단, 해치백, 왜건) 기준), 양/하적비 포함\r\n★ 포항/울릉도 왕복 항구 터미널 이용료\r\n★ 비치온관광호텔 한실 또는 양실 2인1실 2박', NULL, '울릉도', '11111', '55555', NULL, NULL, 499000, 456000, '포항영일만국제부두', '2023-04-03', '23:50:00', '울릉도 사동항', '2023-04-06', '12:30:00', 1, 0, 0, '2023-03-30 11:49:21'),
	('company01', NULL, 'PCK0002', '패키지', '■진에어타고가요~■영일만친구 포항 구룡포/호미곶/영일대/갯마을차차차 1박 2일', '스테이 포항 호텔', '서울(김포) 03월 31일 (금) 08:25 LJ397 출발 - 포항 03월 31일 (금) 09:25 도착\r\n포항 04월 01일 (토) 18:20 LJ400 출발 - 서울(김포) 04월 01일 (토) 19:20 도착\r\n\r\n[특전] 구룡포근대문화역사거리hk 구룡포(근대문화거리)"동백꽃 필무렵"촬영지\r\n[특전] 호미곶해맞이광장hk 호미곶 해맞이 광장\r\n[특전] 호미해안둘레길hk 호미반도 해안둘레길-연오랑과세오녀 테마공원\r\n[특전] 죽도어시장hk 죽도 시장\r\n[특전] 포항 스페이스워크 영일대 스페이스워크\r\n[특전] 청하시장 \'갯마을차차차\' 드라마 촬영지(공진상가)\r\n[특전] 이가리닻전망대 이가리 닻 전망대\r\n[특전] 사방기념공원 사방기념공원_\'갯마을차차차"드라마촬영지(언덕 위 배)', NULL, '서울(김포) (GMP)', NULL, NULL, '1', NULL, 349000, 349000, '포항 (KPO)', '2023-03-31', '08:25:00', '포항', '2023-04-01', '19:20:00', 1, 0, 0, '2023-03-30 12:15:34'),
	('company02', 4, 'PCK0003', '패키지', '내차로 떠나는 울릉도 자유여행!! ◈차량선적비용 포함◈', '비치온 관광호텔', '포항영일만국제부두 04월 03일 (월) 23:50 뉴씨다오펄 출발 - 울릉도 사동항 04월 04일 (화) 06:20 도착\r\n울릉도 사동항 04월 06일 (목) 12:30 뉴씨다오펄 출발 - 포항영일만국제부두 04월 06일 (목) 19:00 도착\r\n\r\n★ 포항 - 울릉도 대형크루즈 왕복 6인1실(침대선실)\r\n★ 차량선적비용(국산 중형승용차(세단, 해치백, 왜건) 기준), 양/하적비 포함\r\n★ 포항/울릉도 왕복 항구 터미널 이용료\r\n★ 비치온관광호텔 한실 또는 양실 2인1실 2박', NULL, '울릉도', '11111', '55555', NULL, NULL, 499000, 456000, '포항영일만국제부두', '2023-04-03', '23:50:00', '울릉도 사동항', '2023-04-06', '12:30:00', 1, 0, 0, '2023-03-30 11:49:21'),
	('company02', NULL, 'PCK0004', '패키지', '■진에어타고가요~■영일만친구 포항 구룡포/호미곶/영일대/갯마을차차차 1박 2일', '스테이 포항 호텔', '서울(김포) 03월 31일 (금) 08:25 LJ397 출발 - 포항 03월 31일 (금) 09:25 도착\r\n포항 04월 01일 (토) 18:20 LJ400 출발 - 서울(김포) 04월 01일 (토) 19:20 도착\r\n\r\n[특전] 구룡포근대문화역사거리hk 구룡포(근대문화거리)"동백꽃 필무렵"촬영지\r\n[특전] 호미곶해맞이광장hk 호미곶 해맞이 광장\r\n[특전] 호미해안둘레길hk 호미반도 해안둘레길-연오랑과세오녀 테마공원\r\n[특전] 죽도어시장hk 죽도 시장\r\n[특전] 포항 스페이스워크 영일대 스페이스워크\r\n[특전] 청하시장 \'갯마을차차차\' 드라마 촬영지(공진상가)\r\n[특전] 이가리닻전망대 이가리 닻 전망대\r\n[특전] 사방기념공원 사방기념공원_\'갯마을차차차"드라마촬영지(언덕 위 배)', NULL, '서울(김포) (GMP)', NULL, NULL, '1', NULL, 349000, 349000, '포항 (KPO)', '2023-03-31', '08:25:00', '포항', '2023-04-01', '19:20:00', 1, 0, 0, '2023-03-30 12:15:34'),
	('company01', NULL, 'RT0001', '렌트', 'INTERACTIVE K5', NULL, NULL, 1, '서울(강남)', '67890', '09876', NULL, '중형', 167000, 114100, '서울(강남)', '2023-03-30', '13:00:00', '제주', '2023-03-31', '13:00:00', 1, 0, 0, '2023-03-30 11:43:26'),
	('company01', NULL, 'RT0002', '렌트', '캐스퍼', NULL, NULL, NULL, '제주', NULL, NULL, NULL, '소형', 28600, 34000, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2023-04-06 12:10:58'),
	('company01', NULL, 'RT0003', '렌트', '쏘나타 DN8', NULL, NULL, NULL, '제주', NULL, NULL, NULL, '소형', 40000, 56000, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2023-04-06 12:11:30'),
	('company01', NULL, 'RT0004', '렌트', '코나 SX2', NULL, NULL, NULL, '제주', NULL, NULL, NULL, '소형', 25100, 35600, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2023-04-06 12:12:27'),
	('company01', NULL, 'RT0005', '렌트', 'EV6 롱 레인지', NULL, NULL, NULL, '제주', NULL, NULL, NULL, '중형', 31800, 31000, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2023-04-06 12:12:56'),
	('company01', NULL, 'RT0006', '렌트', '미니 컨버터블', NULL, NULL, NULL, '제주', NULL, NULL, NULL, '소형', 280000, 178000, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2023-04-06 12:15:21'),
	('company01', NULL, 'RT0007', '렌트', '그랜드 스타렉스(12인승)', NULL, NULL, NULL, '제주', NULL, NULL, NULL, '대형', 44000, 65000, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2023-04-06 12:15:51'),
	('company01', NULL, 'RT0008', '렌트', 'G70', NULL, NULL, NULL, '제주', NULL, NULL, NULL, '중형', 99000, 110000, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2023-04-06 12:16:17'),
	('company02', NULL, 'RT0009', '렌트', 'INTERACTIVE K5', NULL, NULL, 1, '서울(강남)', '67890', '09876', NULL, '중형', 167000, 114100, '서울(강남)', '2023-03-30', '13:00:00', '제주', '2023-03-31', '13:00:00', 1, 0, 0, '2023-03-30 11:43:26'),
	('company02', NULL, 'RT0010', '렌트', '캐스퍼', NULL, NULL, NULL, '제주', NULL, NULL, NULL, '소형', 28600, 34000, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2023-04-06 12:10:58'),
	('company02', NULL, 'RT0011', '렌트', '쏘나타 DN8', NULL, NULL, NULL, '제주', NULL, NULL, NULL, '소형', 40000, 56000, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2023-04-06 12:11:30'),
	('company02', NULL, 'RT0012', '렌트', '코나 SX2', NULL, NULL, NULL, '제주', NULL, NULL, NULL, '소형', 25100, 35600, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2023-04-06 12:12:27'),
	('company02', NULL, 'RT0013', '렌트', 'EV6 롱 레인지', NULL, NULL, NULL, '제주', NULL, NULL, NULL, '중형', 31800, 31000, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2023-04-06 12:12:56'),
	('company02', NULL, 'RT0014', '렌트', '미니 컨버터블', NULL, NULL, NULL, '제주', NULL, NULL, NULL, '소형', 280000, 178000, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2023-04-06 12:15:21'),
	('company02', NULL, 'RT0015', '렌트', '그랜드 스타렉스(12인승)', NULL, NULL, NULL, '제주', NULL, NULL, NULL, '대형', 44000, 65000, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2023-04-06 12:15:51'),
	('company02', NULL, 'RT0016', '렌트', 'G70', NULL, NULL, NULL, '제주', NULL, NULL, NULL, '중형', 99000, 110000, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2023-04-06 12:16:17');
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;

-- 테이블 ctc.goods_detail_image 구조 내보내기
CREATE TABLE IF NOT EXISTS `goods_detail_image` (
  `goods_image_id` int(11) NOT NULL,
  `goods_code` varchar(10) DEFAULT NULL,
  `goods_fileName` varchar(50) DEFAULT NULL,
  `goods_reg_id` varchar(20) DEFAULT NULL,
  `goods_fileType` varchar(40) DEFAULT NULL,
  `goods_credate` timestamp NULL DEFAULT current_timestamp(),
  KEY `FK_goods_detail_image_flight` (`goods_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='모든 상품 들어가는 사진 파일 테이블\r\n';

-- 테이블 데이터 ctc.goods_detail_image:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `goods_detail_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `goods_detail_image` ENABLE KEYS */;

-- 테이블 ctc.member 구조 내보내기
CREATE TABLE IF NOT EXISTS `member` (
  `member_num` int(11) NOT NULL AUTO_INCREMENT COMMENT '회원 번호(자동증가)',
  `member_id` varchar(50) NOT NULL COMMENT '회원 아이디',
  `member_pw` varchar(50) NOT NULL COMMENT '회원 비밀번호',
  `member_name` varchar(30) NOT NULL COMMENT '회원 이름',
  `member_ph1` varchar(30) NOT NULL COMMENT '회원 핸드폰번호',
  `member_ph2` varchar(30) NOT NULL COMMENT '회원 핸드폰번호',
  `member_ph3` varchar(30) NOT NULL COMMENT '회원 핸드폰번호',
  `member_rrn1` varchar(13) NOT NULL COMMENT '회원 주민등록번호',
  `member_rrn2` varchar(13) NOT NULL COMMENT '회원 주민등록번호',
  `member_email` varchar(30) NOT NULL COMMENT '회원 이메일',
  `member_email_yn` varchar(5) NOT NULL DEFAULT 'n' COMMENT '회원 이메일 인증여부',
  `member_zipcode` varchar(12) NOT NULL COMMENT '회원 우편번호',
  `member_road_address` varchar(50) NOT NULL COMMENT '회원 도로명 주소',
  `member_local_address` varchar(50) DEFAULT NULL COMMENT '회원 지번 주소',
  `member_rest_address` varchar(50) DEFAULT NULL COMMENT '회원 나머지 주소',
  `member_joindate` timestamp NOT NULL DEFAULT current_timestamp() COMMENT '회원 가입일',
  `member_status` int(11) NOT NULL DEFAULT 1 COMMENT '회원 상태 1)가입중 2) 탈퇴요청중 3) 삭제',
  `member_unregister_date` timestamp NULL DEFAULT current_timestamp(),
  `member_deldate` timestamp NULL DEFAULT current_timestamp(),
  `member_mileage` int(20) DEFAULT NULL,
  PRIMARY KEY (`member_id`),
  KEY `member_num` (`member_num`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 ctc.member:~3 rows (대략적) 내보내기
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` (`member_num`, `member_id`, `member_pw`, `member_name`, `member_ph1`, `member_ph2`, `member_ph3`, `member_rrn1`, `member_rrn2`, `member_email`, `member_email_yn`, `member_zipcode`, `member_road_address`, `member_local_address`, `member_rest_address`, `member_joindate`, `member_status`, `member_unregister_date`, `member_deldate`, `member_mileage`) VALUES
	(3, 'admin', '12341234', '관리자', '010', '0000', '0000', '000000', '0000000', 'admin@admin.com', 'y', '00000', 'd', NULL, NULL, '2023-04-18 01:02:54', 1, NULL, NULL, 0),
	(1, 'hong0001', 'Qwer1234!', '홍길동', '010', '1234', '5678', '000909', '2500000', 'hong@test.com', 'y', '50330', '	경상남도 창녕군 창녕읍 말흘4길 1', NULL, NULL, '2023-04-19 00:52:59', 1, NULL, NULL, 1500),
	(2, 'jang0001', 'Jangjang123!', '장덕배', '010', '5678', '1234', '800808', '1600000', 'jang@test.com', 'y', '22144', '인천광역시 미추홀구 경원대로 지하 848', NULL, NULL, '2023-04-19 00:54:40', 1, NULL, NULL, 2300);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;

-- 테이블 ctc.notice 구조 내보내기
CREATE TABLE IF NOT EXISTS `notice` (
  `notice_num` int(11) NOT NULL AUTO_INCREMENT,
  `notice_title` varchar(100) NOT NULL DEFAULT '0',
  `notice_content` varchar(500) NOT NULL DEFAULT '0',
  `notice_write_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `notice_category` varchar(10) DEFAULT NULL COMMENT '1) 일반 2) 안전정보 3) 서비스 4) 당첨자발표',
  KEY `notice_num` (`notice_num`)
) ENGINE=InnoDB AUTO_INCREMENT=681 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 ctc.notice:~5 rows (대략적) 내보내기
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` (`notice_num`, `notice_title`, `notice_content`, `notice_write_date`, `notice_category`) VALUES
	(1, '[개인정보보호] 개인정보 처리방침 변경', '안녕하세요. ㈜코너투코너입니다.\r\n항상 저희 코너투코너를 이용해 주시는 고객님께 깊은 감사를 드립니다.\r\n\r\n개인정보 활용 변경으로 인한 개인정보 처리방침이 다음과 같이 변경되어 안내드립니다.\r\n\r\n* 변경 적용일인 2023년 3월 24일 전까지 별도 의사표시가 없으신 분은 개인정보 처리방침의 변경사항 적용에 동의하신 것으로 간주됩니다.\r\n* 개정된 위치정보이용약관에 동의하지 않으시는 경우, 회원탈퇴를 요청하실 수 있습니다.\r\n\r\n▶변경 일시 : (시행일) 2023년 3월 24일\r\n\r\n▶주요 변경 내용', '2023-03-28 11:09:59', '서비스'),
	(2, '코로나19 PCR/RAT 의무 검사 중단 안내', '안녕하세요 코너투코너입니다. \r\n\r\n9월 3일부 모든 입국자들에게 실시하였던 입국 전 PCR/RAT(신속항원) 의무검사가 전면 해제 되었다는 정부 지침이 발표되었습니다. \r\n\r\n이에 따라, 여행상품을 이용하시는 고객님들께 안내 드립니다. \r\n\r\n\r\n\r\n [해외 입국자 입국 전 PCR/RAT 검사 중단 안내] \r\n\r\n\r\n\r\n- 기존 : 국내 입국자 전원, 입국 48시간 혹은 24시간 이내 실시한 코로나 검사 음성 확인서 제출 필수 \r\n\r\n- 변경 : 9/3(토) 0시부터 국내 입국자 전원 코로나 검사 음성확인서 제출 의무 면제 \r\n\r\n*단 입국 후 1일차 검사 의무 유지 \r\n\r\n\r\n\r\n▶질병관리청 홈페이지 바로 가기\r\n\r\n\r\n\r\n하나투어는 안전한 고객님의 여행을 위해 항상 최선을 다하고 있으며, 추가 지침 발생 및 변경 시 별도 공지 안내 드리겠습니다.', '2023-03-28 11:10:39', '안전정보'),
	(3, '설 연휴 국내/해외 항공 업무 안내', '안녕하세요, 코너투코너입니다. \r\n\r\n설 연휴 동안 국내 항공 업무가 일부 제한됩니다. \r\n\r\n \r\n\r\n일시 : 2023년 3월 21일 (토) ~ 3월 24일 (화) \r\n\r\n제한 업무: 항공권 변경, 취소, 환불 상담 / 일부 항공권 발권, 국내 기상 악화와 관련한 상담 등 \r\n\r\n \r\n\r\n문의사항은 하기 안내대로 접수 주시면, 영업일인  1월 25일 (수) 부터 순차적으로 답변 드리겠습니다. \r\n\r\n \r\n\r\n[국내 항공 예약 변경, 환불 문의 사항 안내]\r\n\r\n\r\n국내항공: [1:1 게시판 문의하기] 취소 접수  \r\n\r\n\r\n\r\n설연휴 기간 및 출발일이 임박한 항공권의 취소나 변경이 필요한 경우는 항공사로 직접 취소 처리 해 주시기 바라며 \r\n\r\n노쇼(NO-SHOW) 처리 시 항공사 노쇼 수수료가 부과 될 수 있으니 주의 부탁드립니다.\r\n\r\n \r\n\r\n넓은 양해 부탁드립니다. \r\n\r\n감사합니다. ', '2023-03-28 11:12:11', '일반'),
	(4, '<CornerToCorner> C-Collection 구매 이벤트 당첨 안내 (갤러리아 모바일교환권 3만원권)', '안녕하세요 코너투코너 이벤트 담당자입니다.\r\n\r\n\r\n\r\nC-Collecion 기획전 전시 호텔 3박 + 항공권 구매 이벤트에 참여해 주신 모든 고객님들께 감사의 말씀을 드리며, 아래와 같이 당첨자를 발표합니다.\r\n\r\n당첨되신 분께 축하의 말씀을 전하며, 앞으로도 하나투어의 다양한 이벤트에도 많은 관심 부탁드립니다.\r\n\r\n\r\n\r\n[고객 참여 이벤트 당첨자 안내사항]\r\n\r\n※ 경품 수령을 위한 개인 정보 기재 및 동의 여부 확인 기간은 04월 10일(월)까지입니다. (개인정보 입력하러 가기 ▶)\r\n\r\n※ 경품은 23년 4월 중 발송 예정이며, 당사 사정에 따라 다소 지연될 수 있습니다.\r\n\r\n※ 경품으로 지급된 특전은 교환, 환불 및 양도가 불가합니다.\r\n\r\n※ 경품 발송 이후 분실, 삭제에 대해서는 당사는 책임지지 않습니다.\r\n\r\n※ 당사는 잘못된 정보 입력으로 인한 경품 미수령 및 당첨 취소에 대해 책임지지 않습니다.', '2023-03-28 11:17:47', '당첨자발표'),
	(5, '[개인정보보호] 위치정보이용약관 변경 안내', '안녕하세요. ㈜코너투코너입니다.\r\n항상 저희 코너투코너를 이용해 주시는 고객님께 깊은 감사를 드립니다.\r\n\r\n개인정보 활용 변경으로 인한 위치정보이용약관이 다음과 같이 변경되어 안내드립니다.\r\n\r\n* 변경 적용일인 2023년 2월 1일 전까지 별도 의사표시가 없으신 분은 위치정보이용약관 의 변경사항 적용에 동의하신 것으로 간주됩니다.\r\n* 개정된 위치정보이용약관에 동의하지 않으시는 경우, 동의거부를 요청하실 수 있습니다.\r\n\r\n▶변경 일시 : (시행일) 2023년 2월 1일\r\n\r\n▶주요 변경 내용', '2023-03-28 15:16:51', '서비스');
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;

-- 테이블 ctc.qna 구조 내보내기
CREATE TABLE IF NOT EXISTS `qna` (
  `member_id` varchar(10) NOT NULL,
  `qna_num` int(11) NOT NULL AUTO_INCREMENT,
  `qna_answer_num` int(11) DEFAULT NULL,
  `good_code` varchar(50) DEFAULT NULL,
  `qna_type` varchar(50) DEFAULT NULL,
  `qna_title` varchar(50) NOT NULL,
  `qna_content` varchar(3000) DEFAULT NULL,
  `qna_write_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `qna_status` varchar(50) DEFAULT '미답변',
  `board_fileName` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`qna_num`),
  KEY `FK_qna_qna_answer` (`qna_answer_num`),
  KEY `good_code` (`good_code`),
  KEY `member_id` (`member_id`),
  CONSTRAINT `FK_qna_goods_code` FOREIGN KEY (`good_code`) REFERENCES `goods` (`goods_code`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_qna_member` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_qna_qna_answer` FOREIGN KEY (`qna_answer_num`) REFERENCES `qna_answer` (`qna_answer_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 ctc.qna:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `qna` DISABLE KEYS */;
/*!40000 ALTER TABLE `qna` ENABLE KEYS */;

-- 테이블 ctc.qna_answer 구조 내보내기
CREATE TABLE IF NOT EXISTS `qna_answer` (
  `member_id` varchar(10) NOT NULL,
  `com_id` varchar(10) NOT NULL,
  `qna_num` int(11) NOT NULL,
  `qna_answer_num` int(11) NOT NULL AUTO_INCREMENT,
  `qna_answer_title` varchar(30) NOT NULL DEFAULT '0',
  `qna_answer_content` varchar(500) NOT NULL DEFAULT '0',
  `qna_answer_write_date` timestamp NOT NULL DEFAULT current_timestamp(),
  KEY `qna_answer_num` (`qna_answer_num`),
  KEY `FK_qna_answer_member` (`member_id`),
  KEY `FK_qna_answer_company` (`com_id`),
  KEY `FK_qna_answer_qna` (`qna_num`),
  CONSTRAINT `FK_qna_answer_company` FOREIGN KEY (`com_id`) REFERENCES `company` (`com_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_qna_answer_member` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_qna_answer_qna` FOREIGN KEY (`qna_num`) REFERENCES `qna` (`qna_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 ctc.qna_answer:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `qna_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `qna_answer` ENABLE KEYS */;

-- 테이블 ctc.reservation 구조 내보내기
CREATE TABLE IF NOT EXISTS `reservation` (
  `member_id` varchar(10) NOT NULL,
  `goods_code` varchar(12) DEFAULT NULL,
  `order_num` int(11) NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(50) DEFAULT NULL,
  `goods_category` varchar(50) DEFAULT NULL,
  `order_date` timestamp NULL DEFAULT current_timestamp(),
  `order_status` int(11) DEFAULT 1,
  `pay_status` int(11) DEFAULT 1,
  `pay_order_time` timestamp NULL DEFAULT current_timestamp(),
  `goods_saleprice` int(20) DEFAULT NULL,
  `card_com_name` varchar(50) DEFAULT NULL,
  `card_pay_month` varchar(50) DEFAULT NULL,
  `refund_price` int(11) DEFAULT 0,
  `total_charge_price` int(11) DEFAULT 0,
  `use_mileage` int(11) DEFAULT 0,
  `plus_mileage` int(11) DEFAULT 0,
  `license_id` varchar(13) DEFAULT NULL,
  `license_date` varchar(50) DEFAULT NULL,
  `reser_start_date` datetime DEFAULT NULL,
  `reser_end_date` datetime DEFAULT NULL,
  `reser_period` varchar(10) DEFAULT NULL COMMENT 'ex) 1일 8시간',
  `reser_headcount` int(11) DEFAULT 1,
  KEY `order_num` (`order_num`) USING BTREE,
  KEY `FK_order_goods` (`goods_code`),
  CONSTRAINT `FK_order_goods` FOREIGN KEY (`goods_code`) REFERENCES `goods` (`goods_code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 ctc.reservation:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` (`member_id`, `goods_code`, `order_num`, `goods_name`, `goods_category`, `order_date`, `order_status`, `pay_status`, `pay_order_time`, `goods_saleprice`, `card_com_name`, `card_pay_month`, `refund_price`, `total_charge_price`, `use_mileage`, `plus_mileage`, `license_id`, `license_date`, `reser_start_date`, `reser_end_date`, `reser_period`, `reser_headcount`) VALUES
	('hong0001', 'HT0002', 32, '탐라스테이호텔제주', '숙박', '2023-04-19 02:47:35', 1, 1, '2023-04-19 02:47:35', 73140, '삼성카드', '4개월', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 1);
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;

-- 테이블 ctc.review 구조 내보내기
CREATE TABLE IF NOT EXISTS `review` (
  `member_id` varchar(10) NOT NULL,
  `review_num` int(11) NOT NULL AUTO_INCREMENT,
  `parent_num` int(11) DEFAULT NULL,
  `goods_code` varchar(12) DEFAULT NULL,
  `review_title` varchar(50) NOT NULL,
  `review_content` varchar(500) NOT NULL DEFAULT '0',
  `review_write_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `imageFileName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`review_num`),
  KEY `FK_review_member` (`member_id`),
  KEY `FK_review_goods` (`goods_code`),
  CONSTRAINT `FK_review_goods` FOREIGN KEY (`goods_code`) REFERENCES `goods` (`goods_code`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_review_member` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 ctc.review:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
/*!40000 ALTER TABLE `review` ENABLE KEYS */;

-- 테이블 ctc.sales 구조 내보내기
CREATE TABLE IF NOT EXISTS `sales` (
  `com_id` varchar(10) NOT NULL,
  `member_id` varchar(10) NOT NULL,
  `flight_code` varchar(10) NOT NULL,
  `hotel_code` varchar(10) NOT NULL,
  `package_code` varchar(10) NOT NULL,
  `rent_code` varchar(10) NOT NULL,
  KEY `FK_sales_company` (`com_id`),
  KEY `FK_sales_member` (`member_id`),
  KEY `FK_sales_flight` (`flight_code`),
  KEY `FK_sales_hotel` (`hotel_code`),
  KEY `FK_sales_package` (`package_code`),
  KEY `FK_sales_rent` (`rent_code`),
  CONSTRAINT `FK_sales_company` FOREIGN KEY (`com_id`) REFERENCES `company` (`com_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_sales_flight` FOREIGN KEY (`flight_code`) REFERENCES `flight` (`flight_code`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_sales_hotel` FOREIGN KEY (`hotel_code`) REFERENCES `hotel` (`hotel_code`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_sales_member` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_sales_package` FOREIGN KEY (`package_code`) REFERENCES `package` (`package_code`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_sales_rent` FOREIGN KEY (`rent_code`) REFERENCES `rent` (`rent_code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 ctc.sales:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
