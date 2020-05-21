-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 21, 2020 at 03:39 PM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nodejs_login`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `name` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`name`, `password`) VALUES
('Deasysoft ', 'Deasysoft');

-- --------------------------------------------------------

--
-- Table structure for table `days`
--

DROP TABLE IF EXISTS `days`;
CREATE TABLE IF NOT EXISTS `days` (
  `date` date NOT NULL,
  `day` varchar(20) NOT NULL,
  `week` varchar(20) NOT NULL,
  `sub_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `enquiry`
--

DROP TABLE IF EXISTS `enquiry`;
CREATE TABLE IF NOT EXISTS `enquiry` (
  `name` varchar(25) DEFAULT NULL,
  `email` varchar(25) DEFAULT NULL,
  `user_date` date DEFAULT NULL,
  `f_name` varchar(23) DEFAULT NULL,
  `m_name` varchar(25) DEFAULT NULL,
  `f_occ` varchar(28) DEFAULT NULL,
  `m_occ` varchar(25) DEFAULT NULL,
  `user_radd` varchar(50) DEFAULT NULL,
  `user_oadd` varchar(50) DEFAULT NULL,
  `user_phr` varchar(20) DEFAULT NULL,
  `user_pho` varchar(20) DEFAULT NULL,
  `user_lca` varchar(20) DEFAULT NULL,
  `user_lcn` varchar(20) DEFAULT NULL,
  `user_rel` varchar(23) DEFAULT NULL,
  `user_na` varchar(30) DEFAULT NULL,
  `class` int(10) DEFAULT NULL,
  `total_amt` varchar(40) DEFAULT NULL,
  `payment` varchar(30) DEFAULT NULL,
  `myfile` varchar(50) DEFAULT NULL,
  `pv_class` varchar(20) DEFAULT NULL,
  `user_adate` date DEFAULT NULL,
  `enquiry_id` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `enquiry`
--

INSERT INTO `enquiry` (`name`, `email`, `user_date`, `f_name`, `m_name`, `f_occ`, `m_occ`, `user_radd`, `user_oadd`, `user_phr`, `user_pho`, `user_lca`, `user_lcn`, `user_rel`, `user_na`, `class`, `total_amt`, `payment`, `myfile`, `pv_class`, `user_adate`, `enquiry_id`) VALUES
('sreashi', 'sreashisaha1996@gmail.com', '2020-05-09', 'sreashi', 'ry6u', 'cggnfgj', 'dtgjdtju', 'saradapally', 'trfjhgh', '8906553824', '7878933294', 'ghghjghk', 'fgfjgfj', 'fhjgfhkg', 'dfdhfdfgh', 6, '', '', '', '', '0000-00-00', ''),
('sreashi', 'sreashisaha@gmail.com', '2020-05-15', 'sreashi', 'ry6u', 'fhjghkgk', 'bn bn ,b', 'saradapally', 'gfvjfj', '89065534221', '34365454869', 'dffgdh', 'dsgfgdhj', 'cngfgjf', 'drdehr', 6, '', '', '', '', '0000-00-00', ''),
('sreashi', 'sreasha@gmail.com', '2020-05-15', 'rr5ftrf56', 'gtygt6g', 'fhjghkgk', 'bn bn ,b', 'edre5de4', 'gfvjfj', '89065534221', '34365454869', 'dffgdh', 'dsgfgdhj', 'dygyfdy', 'drdehr', 6, '', '', '', '', '0000-00-00', ''),
('sreash', 'yttit@123.com', '2020-05-09', 'youiyu', 'yhouiyhoiu', 'giygiy', 'iygiytgiy', 'uhjhujo', 'uuyuyu', '08906553824', '56587690900', 'tyg7uiy87o9i', 'ytgiytgio', 'gyhgugoi', 'uyouyhou', 6, '', '', '', '', '0000-00-00', '18ef6446-910d-11ea-bff7-3863bbc88d60'),
('gghgj', 'rtrty@wee.com', '2020-05-23', 'fgfghgh', 'fggfgh', 'bvbvb', 'mvbmbvmb', 'fggfjgghhkghjk', 'vmbhvmn', '5676769899', '5665657676', 'bvbvbnvghjgj', 'jhjhkljkj;', 'bgvghg', 'fggjh', 6, NULL, NULL, NULL, NULL, NULL, '9d8b7f8d-914b-11ea-b87b-3863bbc88d60'),
(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '89890', 'Phone-pay/G-pay', '12017007015006_SreashiSaha.pdf', '9', '2020-05-14', NULL),
(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '89890', 'Phone-pay/G-pay', '12017007015006_SreashiSaha.pdf', '9', '2020-05-14', NULL),
(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '67788', 'Cash', '12017007015006_SreashiSaha.pdf', '6', '2020-05-17', NULL),
('srea', 'aha1996@gmail.com', '2020-05-21', 'cvv', 'hrfkjh', 'vs', 'gfg', 'vv', 'vxnh', '8890490849', '78793987897', 'fsfff', 'hjhfljhflsa', 'fff', 'fsf', 4, NULL, NULL, NULL, NULL, NULL, 'cd5d404f-91d5-11ea-b87b-3863bbc88d60'),
('gffg', 'a1996@gmail.com', '2020-05-13', 'eth', 'fghfgh', 'fyju', 'tuytiiy', 'yyty', 'rtr', '7697808900', '45546758568', 'trytyhr', 'trtyr', 'dffgdfrh', 'trthr', 6, NULL, NULL, NULL, NULL, NULL, 'cc5a5afe-91d6-11ea-b87b-3863bbc88d60'),
('gffg', '996@gmail.com', '2020-05-13', 'yoooo', 'gyhjgjy', 'fyju', 'tuytiiy', 'Sukhobristi', 'rtr', '08906553824', '45546758568', 'trytyhr', 'trtyr', '2ewrr', 'trthr', 6, NULL, NULL, NULL, NULL, NULL, 'fd9570f1-91d6-11ea-b87b-3863bbc88d60'),
('srea', 'sonai@12yahooo.com', '2020-05-16', 'fgjghg', 'ghgkh', 'jn ,m', 'hngb,h', 'vhjhg', 'vhvbhkg', '08906553824', '08906553824', 'saradapally', 'xdtresxtuje', '12gyhu', 'dtyhrf5tu6', 3, NULL, NULL, NULL, NULL, NULL, '95ee1a53-9729-4733'),
('srea', 'sreashi96@gmail.com', '2020-05-02', 'tyjgtjgt', 'fghghjfgj', 'fjfjytyyti', 'tuytiiy', 'saradapally', 'ghghk', '7899089093', '5678900653', 'ttfrtujr', 'rytrdftfr', 'tftftur', 'rytfyr', 2, NULL, NULL, NULL, NULL, NULL, '3f631962-3992-4406'),
(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '50000', 'Phone-pay/G-pay', 'Student Invigilator Mapping 08.05.2020.pdf', '8', '2020-05-09', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
CREATE TABLE IF NOT EXISTS `subject` (
  `sub_id` int(11) NOT NULL AUTO_INCREMENT,
  `subject_name` varchar(20) NOT NULL,
  `subject_code` varchar(10) NOT NULL,
  `class` int(10) NOT NULL,
  `teacher_name` varchar(20) NOT NULL,
  `period` varchar(20) NOT NULL,
  `sec` varchar(10) NOT NULL,
  `date` date NOT NULL,
  `pdf` blob NOT NULL,
  PRIMARY KEY (`sub_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`sub_id`, `subject_name`, `subject_code`, `class`, `teacher_name`, `period`, `sec`, `date`, `pdf`) VALUES
(2, 'English', 'Eng_1', 1, 'S.Das', '3', 'A', '2019-05-06', ''),
(4, 'Math', 'Math_1', 1, 'P.Saha', '', '', '0000-00-00', ''),
(5, 'Science', 'Sci_4', 4, 'S.Roy', '4', 'B', '2020-05-20', 0x537265617368692053616861200d0a446174652d31332e30342e32300d0a4c6f67696e2d392e303020412e4d0d0a4c6f676f75742d362e303020502e4d0d0a212e54727920746f20536f6c766520616a6178206572726f7220200d0a322e20736f6c76652064617461627365206572726f72730d0a332e54727920746f20736f6c76652073716c206572726f72730d0a0d0a0d0a0d0a200d0a);

-- --------------------------------------------------------

--
-- Table structure for table `time_table`
--

DROP TABLE IF EXISTS `time_table`;
CREATE TABLE IF NOT EXISTS `time_table` (
  `period` varchar(10) NOT NULL,
  `Duration` time NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class` int(10) NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `class`, `password`) VALUES
(2, 'sreashi', 'sreashisaha1996@gmail.com', 0, '$2b$12$KN.RvoYsbObrFrTpm1cTAeEObEMrwgwRK1SK/eGx9rsdfrTyPh9jW'),
(3, 'sreashi', 'sreashi1996@gmail.com', 0, '$2b$12$QqrsB4imkalHdaOIBq99BOmmg1WVoqOChK8LmtLEeKKZXrG9YtfcO'),
(4, 'sonai', 'sonai23@gmail.com', 0, '$2b$12$N2clan5KJOnYcVzHpjRCdO9a9SbK0vsFZF73im75oiL5mFozDKOTG'),
(5, 'Anurup', 'anu12@gmail.com', 0, '$2b$12$kHsCLIRZ/MpRpzwZxAtkO.Q7obDAlSHGXUqI8G3KhlxLaVHoxVbNS'),
(6, 'sonai', 'so123@gmail.com', 0, '$2b$12$KxwKr9Aa3x7olXmGi.xWROTmNxtkXVph9.gF7bqAEa/TKbJyrhL/6'),
(7, 'sreashi', 'sreashisaha96@gmail.com', 2, '$2b$12$eAJHOWY2co6vUUCfWlyAXO.dAtnTGJHk73C84jWQo6FkthappR8RK'),
(8, 'sreashi', 'sreashisaha6@gmail.com', 2, '$2b$12$5YlaxO31349CgqaBi62B/O2Kz/Zk7PaEoTZ7VgX0oJDYxKpCNd4jm'),
(9, 'sonai', 'sreashi@gmail.com', 2, '$2b$12$ekzEVoZ4XIrVrws9Pi/akOVn9zlywmb59DXPqU7/ylmFIYnvgBO5K'),
(10, 'sonai', 'sonai@gmail.com', 3, '$2b$12$42rhVDlgDLTT0F3vXu2OWu60PPKfaSi2BcAWgwmxi3q.odYCKnOIq'),
(11, 'sonai', 'sreashisa@gmail.com', 2, '$2b$12$5dseA6zQ6ZIFj9AJcKrwbezezqc4fouREdVQIWS75OX82ynTXrPxy'),
(12, 'sonai', 'sonai1223@gmail.com', 1, '$2b$12$p4nBL1NLa9G5KV7/hWK9JOuEgaxR9dEIj9bv2y7zNy/.OPNkk/92q'),
(13, 'som', 'sonaai2@yahoo.com', 4, '$2b$12$cNZJyeXuSXl46AE9zE578uqGXk/vnQhgGlkkKaJaA2NCCuxZXztVa'),
(14, 'sreashi', 'srea1996@gmail.com', 3, '$2b$12$2/8fVBcOLCCAg5xP6aHgzO9l.DHM7VAI5xfiqqyi5.EvKDNKZFwwy'),
(15, 'sonai', 'sre1996@gmail.com', 1, '$2b$12$uVUk.mRk2hoUnzUxpkFde.C.CW4PhG6yxTw2CS7FFGG7Z3exzW5p6'),
(16, 'som', 'so1996@gmail.com', 1, '$2b$12$5wIfXd6gbEOFkUidpEwW9uMKCM7GXIBg1ocEWj/tpS1fiooBvtr7y'),
(17, 'sonai', 'so11996@gmail.com', 3, '$2b$12$RT5tq3omFFptDBrTjPgDluoKuAPj4S/pIxqDSpOMRA//OUYLa7CIG'),
(18, 'sreashi', 's1996@gmail.com', 3, '$2b$12$Ka7dS9okJ.wqq1SBEc6Kxu8EcMc7FTpiw5fsRVnbSSSjYN.PDIHy.'),
(19, 'som', 'saha1996@gmail.com', 2, '$2b$12$qigBeKAz3yjPZouLdSnJ6Ow6FvK1QTwJOeDe8pea3b/Rcj5SfhFX.'),
(20, 'sreashi', 'hsaha1996@gmail.com', 2, '$2b$12$ydFrQ03BzF3f9XJfcVARJu2xVGL7z5qvbtmdYkZ6wpD5lR7/FZcYq'),
(21, 'Anu', 'anu123@gmail.com', 4, '$2b$12$ei.X3XJCUzPE0Q2RqktcTu0jBKJ5RRGPUjDUkhRpeq/XsfNofvhwe'),
(22, 'srk', 'soo1996@gmail.com', 1, '$2b$12$Ly.xM7iC0pg.9jZphfvuGOee96jOiK318Q0wLhv/R.M6DbpzO9ET.'),
(23, 'srea', 'sreashisaha1@gmail.com', 1, '$2b$12$X0VR5NHQj6OucYfmtPxcFe1MxkeY1mFYT1z0ijGfXRUMbafLzwrhu'),
(24, 'sreashi', 'on1996@gmail.com', 3, '$2b$12$DnoQhCLmDQSdEaEmKawC0OsSpjiBJxtCovKPL9T.WjHdCsWaRVZla'),
(25, 'shi', 'sre96@gmail.com', 3, '$2b$12$N80SaUZ5f9dGY6YMaYrBD.GQ34L0diYWGLgGTjBsiOJqXbzZ9Tfme'),
(26, 'sonai', 'yo123@yahoo.com', 3, '$2b$12$uu/xG1qpTr/jIXWVCn//Fu0o2HipH9O8iJD/0WhbSjAher3n0jenu'),
(27, 'Anurup Mondal', 'anurup@gmail.com', 12, '$2b$12$9No0sEHd2YBeZpc0lrb0QucDXrwMhvUwaGAbOzP7/Hw7q66/o5EhK'),
(28, 'sreashi', 'sooop1996@gmail.com', 2, '$2b$12$BI0ikDDQj6MXqQOilOGrruYah7NlfcbGUReEP2Sz7/dWgMBHaiJyG'),
(29, 'som', 'sa1996@gmail.com', 4, '$2b$12$2mlTwRcwXpInRgO1EDN5/epW94dPHpJdDPvxkR7IPuAkLSpEao62O'),
(30, 'sonai', 'srea96@gmail.com', 2, '$2b$12$IcB/ese1JpO5MLdVy8pydu/iDtweWWshDUUhjygI.4TEuGXRBJyqm'),
(31, 'sre', 'sai@1333uii.com', 5, '$2b$12$FLREAwMstJLFGW8E411zROY1tGK3tNoOk6/4Upg.JS5uaXZjod4my'),
(32, 'sdgf', 'saha196@gmail.com', 6, '$2b$12$XvMa3Vd/AzU2RuOZoOo3eeqGPXRAMu86tlSMqwfN9HaH87.aiJy1e'),
(33, 'srk', 'sys1996@gmail.com', 5, '$2b$12$WUsGcVCfLihp8ran6lzbcuFyh/4LB.Fk5blNjOTP4eNZFc0DFG0IW'),
(34, 'son', 'huuuu@ryy.com', 3, '$2b$12$qxthoZiUQqIqGvELke2Sy.GR1w48gjmh8UywlC/gxbbb08bqyQSsq'),
(35, 'soma', 'som223@gmail.com', 1, '$2b$12$k3OMOBOgQNJb4MEBhBtbGuaZX4zIEb8RK1pm7i98erLJ0wlUvurA.'),
(36, 'sreashi', 'sonai223@gmail.com', 2, '$2b$12$JztlDGBSe1jikX9jMnY9TOfBRBDfs0ZKynCzvZUjkYzm8DI4GSIrq'),
(37, 'sreashi', 'ha1996@gmail.com', 4, '$2b$12$LJBNbj0BPTROSQdDDUlcfOXT/G4Q6OWkC9gArMGEpRTYagme9utaK'),
(38, 'sonai', 'sonai@1111gmail.com', 3, '$2b$12$UvFqwOw8jf35uHbIXyClO.FywqWug714TImyONk3J4hrPQH6UJgNi'),
(39, 'sonai', 'aaa1996@gmail.com', 1, '$2b$12$eWoSpNboU6nVItmOHoFZJOAcMy15duUPfpA5IlESfwTsQOzmZQ94W');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
