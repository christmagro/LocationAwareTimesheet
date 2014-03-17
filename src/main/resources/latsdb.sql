-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 17, 2014 at 11:31 AM
-- Server version: 5.1.44
-- PHP Version: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `latsdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE IF NOT EXISTS `client` (
  `CLIENT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CLIENT_NAME` varchar(45) NOT NULL,
  `CLIENT_VAT` varchar(45) DEFAULT NULL,
  `CLIENT_CREATION` datetime NOT NULL,
  `CLIENT_ONHOLD` bit(1) NOT NULL,
  `CLIENT_WEBSITE` varchar(45) DEFAULT NULL,
  `CLIENT_PHONE` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`CLIENT_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=53 ;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`CLIENT_ID`, `CLIENT_NAME`, `CLIENT_VAT`, `CLIENT_CREATION`, `CLIENT_ONHOLD`, `CLIENT_WEBSITE`, `CLIENT_PHONE`) VALUES
(50, 'Go', 'MT789754641', '2014-02-25 22:14:07', '\0', 'www.go.com.mt', '+3562145678'),
(51, 'Carmelo Caruana', 'MT46487987654', '2014-02-27 10:24:57', '\0', 'www.carmelocaruana.com', '+356 25687214'),
(52, 'Image System', 'MT7897987614', '2014-02-27 10:54:51', '\0', 'www.xerxox.com', '+356 2145678');

-- --------------------------------------------------------

--
-- Table structure for table `client_details`
--

CREATE TABLE IF NOT EXISTS `client_details` (
  `CLIENT_DETAILS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CLIENT_DETAILS_ADDRESS_1` varchar(45) NOT NULL,
  `CLIENT_DETAILS_ADDRESS_2` varchar(45) NOT NULL,
  `CLIENT_ID` int(11) NOT NULL,
  `LOCALITY_ID` int(11) NOT NULL,
  `CLIENT_DETAILS_CONTACT_NAME` varchar(45) NOT NULL,
  `CLIENT_DETAILS_CONTACT_SURNAME` varchar(45) NOT NULL,
  `CLIENT_DETAILS_CONTACT_PHONE` varchar(45) DEFAULT NULL,
  `CLIENT_DETAILS_CONTACT_EMAIL` varchar(45) DEFAULT NULL,
  `CLIENT_DETAILS_CONTACT_DESCRIPTION` varchar(45) DEFAULT NULL,
  `CLIENT_DETAILS_STARTDATE` datetime NOT NULL,
  `CLIENT_DETAILS_ENDDATE` datetime DEFAULT NULL,
  PRIMARY KEY (`CLIENT_DETAILS_ID`),
  KEY `CLIENT_DETAILS_LOCALITY_ID_idx` (`LOCALITY_ID`),
  KEY `CLIENT_DETAILS_CLIENT_ID_idx` (`CLIENT_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=48 ;

--
-- Dumping data for table `client_details`
--

INSERT INTO `client_details` (`CLIENT_DETAILS_ID`, `CLIENT_DETAILS_ADDRESS_1`, `CLIENT_DETAILS_ADDRESS_2`, `CLIENT_ID`, `LOCALITY_ID`, `CLIENT_DETAILS_CONTACT_NAME`, `CLIENT_DETAILS_CONTACT_SURNAME`, `CLIENT_DETAILS_CONTACT_PHONE`, `CLIENT_DETAILS_CONTACT_EMAIL`, `CLIENT_DETAILS_CONTACT_DESCRIPTION`, `CLIENT_DETAILS_STARTDATE`, `CLIENT_DETAILS_ENDDATE`) VALUES
(43, 'Go Building', 'Menqa Road', 50, 18, 'Jimmy', 'Scerri', '25945820', 'john.scerri@go.com.mt', NULL, '2014-02-14 00:00:00', NULL),
(44, '1923', 'Valletta Road', 51, 18, 'Brady', 'stivala', '+356 25681175', 'bstivala@carmelocaruana.com', 'cfxzxczx', '2014-02-14 00:00:00', NULL),
(45, 'Image House', 'Triq Il Qantarf ', 52, 18, 'Kathleen', 'Saliba', '+3566889798', 'ksaliba@imagesystems.com', 'Saliba', '2014-02-14 00:00:00', '2014-02-27 18:05:48'),
(46, '123', 'Mrsa square', 52, 18, 'Mario', 'Mizzi', '+3566889798', 'mmizzi@imagesystems.com.mt', 'Tech person', '2014-02-14 00:00:00', '2014-02-27 18:05:48'),
(47, 'Xerox House', 'Marsa Square', 52, 18, 'Kathleen', 'Aquilina', '+3566889798', 'ksaliba@imagesystems.com', 'Sales Person', '2014-03-05 22:03:52', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE IF NOT EXISTS `departments` (
  `DEPARTMENT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `DEPARTMENT_NAME` varchar(45) NOT NULL,
  PRIMARY KEY (`DEPARTMENT_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`DEPARTMENT_ID`, `DEPARTMENT_NAME`) VALUES
(1, 'IT'),
(2, 'Finance'),
(3, 'Support'),
(4, 'Human Resources'),
(5, 'Operations');

-- --------------------------------------------------------

--
-- Table structure for table `department_job`
--

CREATE TABLE IF NOT EXISTS `department_job` (
  `DEPARTMENT_JOB_ID` int(11) NOT NULL AUTO_INCREMENT,
  `DEPARTMENT_ID` int(11) NOT NULL,
  `JOB_ID` int(11) NOT NULL,
  PRIMARY KEY (`DEPARTMENT_JOB_ID`),
  KEY `DEPARTMENT_JOB_JOB_ID_idx` (`JOB_ID`),
  KEY `DEPARTMENT_JOB_DEPARTMENT_ID_idx` (`DEPARTMENT_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `department_job`
--

INSERT INTO `department_job` (`DEPARTMENT_JOB_ID`, `DEPARTMENT_ID`, `JOB_ID`) VALUES
(2, 2, 6),
(3, 2, 7),
(4, 2, 8),
(5, 2, 9),
(6, 2, 10),
(7, 1, 11),
(8, 2, 12),
(9, 2, 13),
(10, 2, 14),
(11, 3, 15),
(12, 2, 16),
(13, 2, 17),
(14, 2, 18),
(15, 2, 19);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE IF NOT EXISTS `employee` (
  `EMPLOYEE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `EMPLOYEE_NAME` varchar(45) NOT NULL,
  `EMPLOYEE_SURNAME` varchar(45) NOT NULL,
  `EMPLOYEE_DOB` date NOT NULL,
  `EMPLOYEE_GENDER` enum('M','F') NOT NULL,
  `EMPLOYEE_PHONE` varchar(45) DEFAULT NULL,
  `EMPLOYEE_START_DATE` date NOT NULL,
  `EMPLOYEE_END_DATE` date DEFAULT NULL,
  `EMPLOYEE_USERNAME` varchar(45) NOT NULL,
  `EMPLOYEE_PASSWORD` varchar(45) NOT NULL,
  `EMPLOYEE_EMAIL` varchar(45) NOT NULL,
  PRIMARY KEY (`EMPLOYEE_ID`),
  UNIQUE KEY `EMPLOYEE_ID_UNIQUE` (`EMPLOYEE_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=118 ;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`EMPLOYEE_ID`, `EMPLOYEE_NAME`, `EMPLOYEE_SURNAME`, `EMPLOYEE_DOB`, `EMPLOYEE_GENDER`, `EMPLOYEE_PHONE`, `EMPLOYEE_START_DATE`, `EMPLOYEE_END_DATE`, `EMPLOYEE_USERNAME`, `EMPLOYEE_PASSWORD`, `EMPLOYEE_EMAIL`) VALUES
(65, 'Chris', 'Magro', '2014-02-19', 'M', '123123123', '2014-02-12', NULL, 'cmagro', '1a1dc91c907325c69271ddf0c944bc72', ''),
(66, 'Steph', 'Borg Bonaci', '2014-02-12', 'M', '2154769879', '2014-02-12', NULL, '', '', 'sborgbonaci@gmail.com'),
(67, 'Cikku', 'bahhu', '2014-02-12', 'F', '12221', '2014-02-12', NULL, '', '', ''),
(68, 'Pippo', 'taly', '2014-02-15', 'M', '+44 2312312', '2014-02-15', NULL, '', '', ''),
(104, 'Joe', 'Pace', '2014-02-10', 'M', '2312321', '2014-02-21', NULL, 'jpace', '231231231', 'jpace@yahoo.co.uk'),
(116, 'Clive', 'Cassar', '2014-02-21', 'M', '+35679412741', '2014-02-21', NULL, 'ccassar', '1234', 'ccassar@gmail.com'),
(117, 'Karl', 'Magro', '2014-03-22', 'M', '35625681159', '2014-03-05', NULL, 'kmagro', '827ccb0eea8a706c4c34a16891f84e7b', 'kmagro@carmelocaruana.com');

-- --------------------------------------------------------

--
-- Table structure for table `employee_department`
--

CREATE TABLE IF NOT EXISTS `employee_department` (
  `EMPLOYEE_DEPARTMENT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `EMPLOYEE_ID` int(11) NOT NULL,
  `DEPARTMENT_ID` int(11) NOT NULL,
  `EMPLOYEE_DEPARTMENT_START_DATE` date NOT NULL,
  `EMPLOYEE_DEPARTMENT_END_DATE` date DEFAULT NULL,
  PRIMARY KEY (`EMPLOYEE_DEPARTMENT_ID`),
  KEY `EMPLOYEE_DEPARTMENT_EMPLOYEE_ID_idx` (`DEPARTMENT_ID`),
  KEY `EMPLOYEE_DEPARTMENT_EMPLOYEE_ID_idx1` (`EMPLOYEE_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=41 ;

--
-- Dumping data for table `employee_department`
--

INSERT INTO `employee_department` (`EMPLOYEE_DEPARTMENT_ID`, `EMPLOYEE_ID`, `DEPARTMENT_ID`, `EMPLOYEE_DEPARTMENT_START_DATE`, `EMPLOYEE_DEPARTMENT_END_DATE`) VALUES
(14, 65, 1, '2014-02-12', '2014-02-12'),
(15, 66, 1, '2014-02-12', '2014-02-12'),
(16, 67, 3, '2014-02-12', '2014-02-12'),
(17, 65, 5, '2014-02-12', '2014-02-12'),
(18, 66, 1, '2014-02-12', '2014-02-22'),
(19, 67, 4, '2014-02-12', NULL),
(20, 65, 1, '2014-02-12', '2014-02-12'),
(21, 65, 5, '2014-02-12', '2014-02-18'),
(22, 68, 5, '2014-02-15', NULL),
(23, 65, 5, '2014-02-18', '2014-03-05'),
(27, 104, 2, '2014-02-21', '2014-02-21'),
(29, 116, 2, '2014-02-21', '2014-02-21'),
(30, 104, 3, '2014-02-21', '2014-02-21'),
(31, 104, 2, '2014-02-21', '2014-02-21'),
(32, 116, 1, '2014-02-21', '2014-02-21'),
(33, 116, 2, '2014-02-21', '2014-02-22'),
(34, 104, 3, '2014-02-21', NULL),
(35, 66, 4, '2014-02-22', '2014-02-22'),
(36, 66, 2, '2014-02-22', NULL),
(37, 116, 3, '2014-02-22', NULL),
(38, 65, 1, '2014-03-05', '2014-03-05'),
(39, 65, 2, '2014-03-05', NULL),
(40, 117, 1, '2014-03-05', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employee_device`
--

CREATE TABLE IF NOT EXISTS `employee_device` (
  `EMPLOYEE_DEVICE_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'This table is used to identify users as soon as they access the android app',
  `EMPLOYEE_DEVICE_IMEI` varchar(45) NOT NULL,
  `EMPLOYEE_DEVICE_MODEL` varchar(45) NOT NULL,
  `EMPLOYEE_DEVICE_START_DATE` date NOT NULL,
  `EMPLOYEE_DEVICE_END_DATE` date DEFAULT NULL,
  `EMPLOYEE_ID` int(11) NOT NULL,
  PRIMARY KEY (`EMPLOYEE_DEVICE_ID`),
  KEY `EMPLOYEE_DEVICE_EMPLOYEE_ID_idx` (`EMPLOYEE_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `employee_device`
--

INSERT INTO `employee_device` (`EMPLOYEE_DEVICE_ID`, `EMPLOYEE_DEVICE_IMEI`, `EMPLOYEE_DEVICE_MODEL`, `EMPLOYEE_DEVICE_START_DATE`, `EMPLOYEE_DEVICE_END_DATE`, `EMPLOYEE_ID`) VALUES
(2, '7895421321A12FE32', 'Nexus 4', '2014-02-20', '2014-02-20', 65),
(3, '7895421321A12FE3da2', 'Blackberry Curve', '2014-02-20', '2014-02-20', 65),
(5, 'fdsqdsf32143244', 'dfasdfasdfsd', '2014-02-20', '2014-02-20', 66),
(6, 'dfadsfadsxzczx', 'dfsafasdfasdxzc', '2014-02-20', '2014-02-20', 68),
(7, 'fdsqdsf32143244z', 'dfasdfasdfsd', '2014-02-20', '2014-02-20', 66),
(8, 'dsadsqwe4wqeq3421', 'sdad ss adas ', '2014-02-20', '2014-02-20', 67),
(9, 'dsadsa34242', 'asdsad ', '2014-02-20', '2014-02-21', 66),
(10, 'dsadsqwe4wqeq3421czx', 'sdad ss adas ', '2014-02-20', '2014-02-24', 67),
(13, 'weqwe', '2312312', '2014-02-21', NULL, 68),
(14, 'dsadsa342424', 'asdsad ', '2014-02-21', '2014-03-05', 66),
(15, '1234', 'asdsad ', '2014-03-05', '2014-03-12', 66),
(16, '12345', 'asdsad ', '2014-03-12', '2014-03-12', 66),
(17, '1234', 'asdsad ', '2014-03-12', '2014-03-16', 66),
(18, '355136050806085', 'Nexus', '2014-03-16', '2014-03-17', 65),
(19, '355832050999959', 'Samsung Galaxy Mini', '2014-03-16', NULL, 66),
(21, '356489057426186', 'Nexus', '2014-03-17', NULL, 65);

-- --------------------------------------------------------

--
-- Table structure for table `employee_manager`
--

CREATE TABLE IF NOT EXISTS `employee_manager` (
  `EMPLOYEE_MANAGER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `EMPLOYEE_ID` int(11) NOT NULL,
  `DEPARTMENT_ID` int(11) NOT NULL,
  `EMPLOYEE_MANAGER_START_DATE` date NOT NULL,
  `EMPLOYEE_MANAGER_END_DATE` date DEFAULT NULL,
  PRIMARY KEY (`EMPLOYEE_MANAGER_ID`),
  KEY `EMPLOYEE_MANAGER_EMPLOYEE_ID_idx` (`EMPLOYEE_ID`),
  KEY `EMPLOYEE_MANAGER_DEPARTMENT_ID_idx` (`DEPARTMENT_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=79 ;

--
-- Dumping data for table `employee_manager`
--

INSERT INTO `employee_manager` (`EMPLOYEE_MANAGER_ID`, `EMPLOYEE_ID`, `DEPARTMENT_ID`, `EMPLOYEE_MANAGER_START_DATE`, `EMPLOYEE_MANAGER_END_DATE`) VALUES
(42, 65, 1, '2014-02-18', '2014-02-18'),
(43, 66, 2, '2014-02-18', '2014-02-18'),
(46, 67, 1, '2014-02-18', '2014-02-18'),
(47, 65, 1, '2014-02-18', '2014-02-18'),
(48, 68, 1, '2014-02-18', '2014-02-18'),
(50, 65, 1, '2014-02-18', '2014-02-18'),
(51, 67, 1, '2014-02-18', '2014-02-18'),
(52, 65, 4, '2014-02-18', '2014-02-18'),
(53, 65, 1, '2014-02-18', '2014-02-18'),
(54, 66, 2, '2014-02-18', '2014-02-18'),
(55, 66, 1, '2014-02-18', '2014-03-05'),
(56, 65, 3, '2014-02-18', '2014-02-18'),
(57, 67, 2, '2014-02-18', '2014-02-18'),
(58, 68, 4, '2014-02-18', '2014-02-18'),
(59, 67, 3, '2014-02-18', '2014-02-21'),
(60, 68, 5, '2014-02-18', '2014-02-18'),
(61, 65, 5, '2014-02-18', '2014-02-18'),
(62, 68, 5, '2014-02-18', '2014-02-18'),
(63, 65, 5, '2014-02-18', '2014-02-18'),
(64, 68, 5, '2014-02-18', '2014-02-18'),
(65, 65, 5, '2014-02-18', '2014-03-05'),
(70, 116, 3, '2014-02-21', '2014-02-21'),
(71, 116, 2, '2014-02-21', '2014-02-21'),
(72, 104, 2, '2014-02-21', '2014-02-21'),
(73, 116, 2, '2014-02-21', '2014-02-21'),
(74, 67, 4, '2014-02-21', NULL),
(75, 104, 3, '2014-02-21', '2014-02-21'),
(76, 116, 3, '2014-02-21', NULL),
(77, 65, 2, '2014-03-05', NULL),
(78, 117, 1, '2014-03-05', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employee_permission`
--

CREATE TABLE IF NOT EXISTS `employee_permission` (
  `USERPERMISSION_ID` int(11) NOT NULL AUTO_INCREMENT,
  `EMPLOYEE_ID` int(11) NOT NULL,
  `PERMISSION_ID` int(11) NOT NULL,
  PRIMARY KEY (`USERPERMISSION_ID`),
  UNIQUE KEY `USERPERMISSION_ID_UNIQUE` (`USERPERMISSION_ID`),
  KEY `PERMISSION_ID_idx` (`PERMISSION_ID`),
  KEY `USERPERMISSOIN_EMPLOYEE_ID_idx` (`EMPLOYEE_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `employee_permission`
--

INSERT INTO `employee_permission` (`USERPERMISSION_ID`, `EMPLOYEE_ID`, `PERMISSION_ID`) VALUES
(1, 65, 9),
(2, 65, 10),
(3, 66, 9),
(4, 117, 9);

-- --------------------------------------------------------

--
-- Table structure for table `emp_address`
--

CREATE TABLE IF NOT EXISTS `emp_address` (
  `EMP_ADDRESS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `EMP_ADDRESS_1` varchar(45) NOT NULL,
  `EMP_ADDRESS_2` varchar(45) NOT NULL,
  `EMPLOYEE_ID` int(11) NOT NULL,
  `LOCALITY_ID` int(11) NOT NULL,
  PRIMARY KEY (`EMP_ADDRESS_ID`),
  KEY `EMPLOYEE_ID_idx` (`EMPLOYEE_ID`),
  KEY `LOCALITY_ID_idx` (`LOCALITY_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=47 ;

--
-- Dumping data for table `emp_address`
--

INSERT INTO `emp_address` (`EMP_ADDRESS_ID`, `EMP_ADDRESS_1`, `EMP_ADDRESS_2`, `EMPLOYEE_ID`, `LOCALITY_ID`) VALUES
(26, '231', 'wewqewq', 66, 18),
(27, 'tte', 'dasdnakdjs', 67, 17),
(28, 'TEL', 'winston road', 68, 17),
(37, 'wqeqw324', 'sad d asdsa a', 67, 17),
(39, 'cxzc', 'czxcz', 65, 19),
(43, 'dsada', 'dasd', 104, 17),
(45, '2321', '34244', 116, 18),
(46, '1923', 'Valletta Road', 117, 17);

-- --------------------------------------------------------

--
-- Table structure for table `job`
--

CREATE TABLE IF NOT EXISTS `job` (
  `JOB_ID` int(11) NOT NULL AUTO_INCREMENT,
  `JOB_CREATION_TIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `JOB_APPOINTMENT_DATETIME` datetime NOT NULL,
  `JOB_CLIENT_DETAILS` int(11) NOT NULL,
  `JOB_DESCRIPTION` varchar(200) NOT NULL,
  `JOB_REMARKS` varchar(45) DEFAULT NULL,
  `JOB_TEAM` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`JOB_ID`),
  KEY `JOB_CLIENT_DETAILS_ID_idx` (`JOB_CLIENT_DETAILS`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `job`
--

INSERT INTO `job` (`JOB_ID`, `JOB_CREATION_TIMESTAMP`, `JOB_APPOINTMENT_DATETIME`, `JOB_CLIENT_DETAILS`, `JOB_DESCRIPTION`, `JOB_REMARKS`, `JOB_TEAM`) VALUES
(6, '2014-02-28 15:26:12', '2014-02-28 01:30:00', 44, 'adsasd', '123', '\0'),
(7, '2014-03-03 21:10:40', '2014-03-06 14:00:00', 44, 'ds gkdaghkldhklsdkdjh dkljah lsdjkahsl dkh ldhaldkj ahsldkjdhlaksdh ldjahlsdh', '213123', '\0'),
(8, '2014-03-03 21:50:02', '2014-03-03 21:50:00', 43, 'ok', 'n/a', '\0'),
(9, '2014-03-03 21:51:50', '2014-03-03 21:51:00', 43, 'New Server setup', 'Meet IT person', '\0'),
(10, '2014-03-05 20:34:51', '2014-03-05 20:37:00', 43, 'adsasd', '432423423 dsf', '\0'),
(11, '2014-03-05 22:03:52', '2014-03-05 22:07:00', 47, 'xczxczxcx` c`z c', 'zx cxzc`', '\0'),
(12, '2014-03-11 23:00:10', '2014-03-11 23:36:00', 44, '123', '213123', '\0'),
(13, '2014-03-11 23:00:10', '2014-03-19 08:30:00', 43, 'test', 'wahoo', '\0'),
(14, '2014-03-11 23:00:10', '2014-03-12 00:08:00', 43, 'adsasd', 'test', '\0'),
(15, '2014-03-11 23:00:10', '2014-03-12 00:08:00', 47, 'adsasd', 'test', '\0'),
(16, '2014-03-11 23:00:10', '2014-03-12 00:09:00', 47, 'xzcxc', 'xzc`z', '\0'),
(17, '2014-03-12 19:35:42', '2014-03-19 13:00:00', 43, 'Audit Accounts Dept', 'Usually all ok', '\0'),
(18, '2014-03-17 08:49:07', '2014-03-17 09:19:00', 47, 'Fix Network', 'Client is very demanding', '\0'),
(19, '2014-03-17 08:49:07', '2014-03-17 12:13:00', 47, 'Testing of new system', 'Testing', '\0');

-- --------------------------------------------------------

--
-- Table structure for table `job_allocation`
--

CREATE TABLE IF NOT EXISTS `job_allocation` (
  `JOB_ALLOCATION_ID` int(11) NOT NULL AUTO_INCREMENT,
  `JOB_ID` int(11) NOT NULL,
  `EMPLOYEE_ID` int(11) NOT NULL,
  `CREATOR_EMPLOYEE_ID` int(11) NOT NULL,
  PRIMARY KEY (`JOB_ALLOCATION_ID`),
  KEY `JOB_ALLOCATION_JOB_ID_idx` (`JOB_ID`),
  KEY `JOB_ALLOCATION_EMPLOYEE_ID_idx` (`EMPLOYEE_ID`),
  KEY `JOB_ALLOCATION_CREATOR_ID_idx` (`CREATOR_EMPLOYEE_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `job_allocation`
--

INSERT INTO `job_allocation` (`JOB_ALLOCATION_ID`, `JOB_ID`, `EMPLOYEE_ID`, `CREATOR_EMPLOYEE_ID`) VALUES
(8, 6, 66, 65),
(9, 7, 66, 65),
(10, 9, 65, 65),
(11, 10, 65, 65),
(12, 12, 66, 65),
(13, 13, 66, 65),
(14, 14, 66, 65),
(15, 16, 66, 65),
(16, 17, 66, 65),
(17, 18, 65, 65),
(18, 19, 65, 65);

-- --------------------------------------------------------

--
-- Table structure for table `job_coordinates`
--

CREATE TABLE IF NOT EXISTS `job_coordinates` (
  `JOB_COORDINATES_ID` int(11) NOT NULL AUTO_INCREMENT,
  `JOB_COORDINATES_LONGITUDE` float DEFAULT NULL,
  `JOB_COORDINATES_LATITUDE` float DEFAULT NULL,
  `JOB_COORDINATES_TIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `JOB_COORDINATES_REMARKS` varchar(45) DEFAULT NULL,
  `JOB_ALLOCATION_ID` int(11) NOT NULL,
  `JOB_COORDINATES_IMEI` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`JOB_COORDINATES_ID`),
  KEY `JOB_COORDINATES_JOB_ALLOCATION_ID_idx` (`JOB_ALLOCATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `job_coordinates`
--


-- --------------------------------------------------------

--
-- Table structure for table `job_status`
--

CREATE TABLE IF NOT EXISTS `job_status` (
  `JOB_STATUS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `JOB_STATUS_NAME` varchar(45) NOT NULL,
  `JOB_STATUS_DESCRIPTION` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`JOB_STATUS_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `job_status`
--

INSERT INTO `job_status` (`JOB_STATUS_ID`, `JOB_STATUS_NAME`, `JOB_STATUS_DESCRIPTION`) VALUES
(3, 'New', 'job Created'),
(4, 'Allocated', 'Job Allocated to an Employee'),
(5, 'Pending', 'Job started but still not ready'),
(6, 'Completed', 'Job completed'),
(7, 'Cancelled', 'Job cancelled');

-- --------------------------------------------------------

--
-- Table structure for table `job_update`
--

CREATE TABLE IF NOT EXISTS `job_update` (
  `JOB_UPDATE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `JOB_ID` int(11) NOT NULL,
  `JOB_UPDATE_START` datetime NOT NULL,
  `JOB_UPDATE_END` datetime DEFAULT NULL,
  `EMPLOYEE_ID` int(11) NOT NULL,
  `JOB_STATUS_ID` int(11) NOT NULL,
  PRIMARY KEY (`JOB_UPDATE_ID`),
  KEY `JOB_UPDATE_JOB_ID_idx` (`JOB_ID`),
  KEY `JOB_UPDATE_EMPLOYEE_ID_idx` (`EMPLOYEE_ID`),
  KEY `JOB_UPDATE_JOB_STATUS_ID_idx` (`JOB_STATUS_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=36 ;

--
-- Dumping data for table `job_update`
--

INSERT INTO `job_update` (`JOB_UPDATE_ID`, `JOB_ID`, `JOB_UPDATE_START`, `JOB_UPDATE_END`, `EMPLOYEE_ID`, `JOB_STATUS_ID`) VALUES
(2, 6, '2014-02-28 15:26:12', '2014-03-05 23:49:35', 65, 3),
(3, 7, '2014-03-03 21:10:40', '2014-03-05 23:49:35', 65, 3),
(4, 8, '2014-03-03 21:50:02', NULL, 65, 6),
(5, 9, '2014-03-03 21:51:50', '2014-03-05 23:49:35', 65, 3),
(6, 10, '2014-03-05 20:34:51', '2014-03-11 23:00:10', 65, 3),
(7, 11, '2014-03-05 22:03:52', NULL, 117, 3),
(15, 6, '2014-03-05 23:49:35', NULL, 65, 4),
(16, 7, '2014-03-05 23:49:35', '2014-03-05 23:49:35', 65, 4),
(17, 9, '2014-03-05 23:49:35', '2014-03-05 23:49:35', 65, 4),
(18, 9, '2014-03-05 23:49:35', NULL, 66, 5),
(19, 7, '2014-03-05 23:49:35', NULL, 65, 5),
(20, 10, '2014-03-11 23:00:10', NULL, 65, 4),
(21, 12, '2014-03-11 23:00:10', '2014-03-11 23:00:10', 65, 3),
(22, 12, '2014-03-11 23:00:10', NULL, 65, 4),
(23, 13, '2014-03-11 23:00:10', '2014-03-11 23:00:10', 65, 3),
(24, 13, '2014-03-11 23:00:10', NULL, 65, 4),
(25, 14, '2014-03-11 23:00:10', '2014-03-11 23:00:10', 65, 3),
(26, 15, '2014-03-11 23:00:10', NULL, 65, 3),
(27, 14, '2014-03-11 23:00:10', NULL, 65, 4),
(28, 16, '2014-03-11 23:00:10', '2014-03-11 23:00:10', 65, 3),
(29, 16, '2014-03-11 23:00:10', NULL, 65, 4),
(30, 17, '2014-03-12 19:35:42', '2014-03-12 19:35:42', 65, 3),
(31, 17, '2014-03-12 19:35:42', NULL, 65, 4),
(32, 18, '2014-03-17 08:49:07', '2014-03-17 08:49:07', 65, 3),
(33, 18, '2014-03-17 08:49:07', NULL, 65, 4),
(34, 19, '2014-03-17 08:49:07', '2014-03-17 08:49:07', 65, 3),
(35, 19, '2014-03-17 08:49:07', NULL, 65, 4);

-- --------------------------------------------------------

--
-- Table structure for table `locality`
--

CREATE TABLE IF NOT EXISTS `locality` (
  `LOCALITY_ID` int(11) NOT NULL AUTO_INCREMENT,
  `LOCALITY_NAME` varchar(45) NOT NULL,
  PRIMARY KEY (`LOCALITY_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `locality`
--

INSERT INTO `locality` (`LOCALITY_ID`, `LOCALITY_NAME`) VALUES
(17, 'San Gwann'),
(18, 'Mosta'),
(19, 'Rabat');

-- --------------------------------------------------------

--
-- Table structure for table `permission`
--

CREATE TABLE IF NOT EXISTS `permission` (
  `PERMISSION_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PERMISSION_NAME` varchar(45) NOT NULL,
  `PERMISSION_ENABLE` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`PERMISSION_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `permission`
--

INSERT INTO `permission` (`PERMISSION_ID`, `PERMISSION_NAME`, `PERMISSION_ENABLE`) VALUES
(9, 'Admin', ''),
(10, 'Employee', ''),
(11, 'Manager', ''),
(12, 'test', '');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `client_details`
--
ALTER TABLE `client_details`
  ADD CONSTRAINT `CLIENT_DETAILS_CLIENT_ID` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`CLIENT_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `CLIENT_DETAILS_LOCALITY_ID` FOREIGN KEY (`LOCALITY_ID`) REFERENCES `locality` (`LOCALITY_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `department_job`
--
ALTER TABLE `department_job`
  ADD CONSTRAINT `DEPARTMENT_JOB_DEPARTMENT_ID` FOREIGN KEY (`DEPARTMENT_ID`) REFERENCES `departments` (`DEPARTMENT_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `DEPARTMENT_JOB_JOB_ID` FOREIGN KEY (`JOB_ID`) REFERENCES `job` (`JOB_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `employee_department`
--
ALTER TABLE `employee_department`
  ADD CONSTRAINT `EMPLOYEE_DEPARTMENT_DEPARTMENT_ID` FOREIGN KEY (`DEPARTMENT_ID`) REFERENCES `departments` (`DEPARTMENT_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `EMPLOYEE_DEPARTMENT_EMPLOYEE_ID` FOREIGN KEY (`EMPLOYEE_ID`) REFERENCES `employee` (`EMPLOYEE_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `employee_device`
--
ALTER TABLE `employee_device`
  ADD CONSTRAINT `EMPLOYEE_DEVICE_EMPLOYEE_ID` FOREIGN KEY (`EMPLOYEE_ID`) REFERENCES `employee` (`EMPLOYEE_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `employee_manager`
--
ALTER TABLE `employee_manager`
  ADD CONSTRAINT `EMPLOYEE_MANAGER_DEPARTMENT_ID` FOREIGN KEY (`DEPARTMENT_ID`) REFERENCES `departments` (`DEPARTMENT_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `EMPLOYEE_MANAGER_EMPLOYEE_ID` FOREIGN KEY (`EMPLOYEE_ID`) REFERENCES `employee` (`EMPLOYEE_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `employee_permission`
--
ALTER TABLE `employee_permission`
  ADD CONSTRAINT `USERPERMISSION_PERMISSION_ID` FOREIGN KEY (`PERMISSION_ID`) REFERENCES `permission` (`PERMISSION_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `USERPERMISSOIN_EMPLOYEE_ID` FOREIGN KEY (`EMPLOYEE_ID`) REFERENCES `employee` (`EMPLOYEE_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `emp_address`
--
ALTER TABLE `emp_address`
  ADD CONSTRAINT `EMP_ADDRESS_EMPLOYEE_ID` FOREIGN KEY (`EMPLOYEE_ID`) REFERENCES `employee` (`EMPLOYEE_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `EMP_ADDRESS_LOCALITY_ID` FOREIGN KEY (`LOCALITY_ID`) REFERENCES `locality` (`LOCALITY_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `job`
--
ALTER TABLE `job`
  ADD CONSTRAINT `JOB_CLIENT_DETAILS_ID` FOREIGN KEY (`JOB_CLIENT_DETAILS`) REFERENCES `client_details` (`CLIENT_DETAILS_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `job_allocation`
--
ALTER TABLE `job_allocation`
  ADD CONSTRAINT `JOB_ALLOCATION_CREATOR_ID` FOREIGN KEY (`CREATOR_EMPLOYEE_ID`) REFERENCES `employee` (`EMPLOYEE_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `JOB_ALLOCATION_EMPLOYEE_ID` FOREIGN KEY (`EMPLOYEE_ID`) REFERENCES `employee` (`EMPLOYEE_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `JOB_ALLOCATION_JOB_ID` FOREIGN KEY (`JOB_ID`) REFERENCES `job` (`JOB_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `job_coordinates`
--
ALTER TABLE `job_coordinates`
  ADD CONSTRAINT `JOB_COORDINATES_JOB_ALLOCATION_ID` FOREIGN KEY (`JOB_ALLOCATION_ID`) REFERENCES `job_allocation` (`JOB_ALLOCATION_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `job_update`
--
ALTER TABLE `job_update`
  ADD CONSTRAINT `JOB_UPDATE_EMPLOYEE_ID` FOREIGN KEY (`EMPLOYEE_ID`) REFERENCES `employee` (`EMPLOYEE_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `JOB_UPDATE_JOB_ID` FOREIGN KEY (`JOB_ID`) REFERENCES `job` (`JOB_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `JOB_UPDATE_JOB_STATUS_ID` FOREIGN KEY (`JOB_STATUS_ID`) REFERENCES `job_status` (`JOB_STATUS_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;
