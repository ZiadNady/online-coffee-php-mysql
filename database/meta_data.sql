-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 20, 2021 at 02:33 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+03:00";



/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `coffee_shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `id` int(11) UNSIGNED NOT NULL,
  `Address` varchar(150) DEFAULT NULL,
  `ProvinceId` int(11) DEFAULT NULL,
  `AmphureId` int(11) DEFAULT NULL,
  `DistrictId` int(11) DEFAULT NULL,
  `PostalCode` varchar(5) DEFAULT NULL,
  `Username` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`id`, `Address`, `ProvinceId`, `AmphureId`, `DistrictId`, `PostalCode`, `Username`) VALUES
(1, '555/43', 19, 215, 300113, '30000', 'taeyeon_ss'),
(2, '533/34', 19, 215, 300113, '30000', 'yammy'),
(3, '555/32', 19, 215, 300113, '30000', 'B6019938');

-- --------------------------------------------------------

--
-- Table structure for table `amphures`
--

CREATE TABLE `amphures` (
  `id` int(5) NOT NULL,
  `code` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `name_ar` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `name_en` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `province_id` int(5) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `amphures`
--

INSERT INTO `amphures` (`id`, `code`, `name_ar`, `name_en`, `province_id`) VALUES
(1, '0101', 'القاهرة', 'Cairo', 1),
(2, '0102', 'الجيزة', 'Giza', 1),
(3, '0103', 'الإسكندرية', 'Alexandria', 2),
(4, '0201', 'الإسماعيلية', 'Ismailia', 3),
(5, '0202', 'بورسعيد', 'Port Said', 3),
(6, '0203', 'السويس', 'Suez', 3),
(7, '0204', 'المنصورة', 'Mansoura', 3),
(8, '0301', 'الإسكندرية', 'Alexandria', 2),
(9, '0302', 'المنوفية', 'El Menoufia', 4),
(10, '0303', 'البحيرة', 'El Beheira', 5),
(11, '0304', 'كفر الشيخ', 'Kafr El Sheikh', 6),
(12, '0401', 'طنطا', 'Tanta', 7),
(13, '0402', 'المحلة الكبرى', 'Al Mahalla Al Kubra', 7),
(14, '0403', 'دمنهور', 'Damanhur', 5),
(15, '0501', 'أسيوط', 'Assiut', 8),
(16, '0502', 'المنيا', 'Minya', 9),
(17, '0503', 'بني سويف', 'Beni Suef', 10),
(18, '0601', 'سوهاج', 'Sohag', 11),
(19, '0602', 'قنا', 'Qena', 12),
(20, '0603', 'الأقصر', 'Luxor', 13),
(21, '0701', 'أسوان', 'Aswan', 14),
(22, '0702', 'الغردقة', 'Hurghada', 15),
(23, '0703', 'مرسى علم', 'Marsa Alam', 15),
(24, '0801', 'شرم الشيخ', 'Sharm El Sheikh', 16),
(25, '0802', 'دهب', 'Dahab', 16),
(26, '0803', 'نويبع', 'Nuweiba', 16);

-- --------------------------------------------------------

--
-- Table structure for table `bevbanner`
--

CREATE TABLE `bevbanner` (
  `id` int(11) UNSIGNED NOT NULL,
  `Images` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bevbanner`
--

INSERT INTO `bevbanner` (`id`, `Images`) VALUES
(1, 'Untitled-4.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `breadbanner`
--

CREATE TABLE `breadbanner` (
  `id` int(11) UNSIGNED NOT NULL,
  `Images` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `breadbanner`
--

INSERT INTO `breadbanner` (`id`, `Images`) VALUES
(1, 'Untitled-4 ccc.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) UNSIGNED NOT NULL,
  `ProductCode` varchar(100) DEFAULT NULL,
  `ProductName` varchar(100) DEFAULT NULL,
  `ProductImage` varchar(100) DEFAULT NULL,
  `ProductPrice` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `TotalPrice` varchar(100) DEFAULT NULL,
  `Username` varchar(100) DEFAULT NULL,
  `Status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `ProductCode`, `ProductName`, `ProductImage`, `ProductPrice`, `Quantity`, `TotalPrice`, `Username`, `Status`) VALUES
(3, 'BK00000111', 'Soft Chocolate Chip Cookie', 'Screen Shot 2564-04-26 at 14.32.00.png', 65, 1, '', 'yammy', 3),
(5, 'BH678900', 'Chocolate Frappuccino', 'Choc-Frappe.png', 145, 1, '', 'B6019938', 2);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) UNSIGNED NOT NULL,
  `Category` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `Category`) VALUES
(1, 'Cake'),
(2, 'Beverage'),
(3, 'Bakery'),
(4, 'Dessert and Ice Cream');

-- --------------------------------------------------------

--
-- Table structure for table `cforder`
--

CREATE TABLE `cforder` (
  `id` int(11) UNSIGNED NOT NULL,
  `OrderId` varchar(100) DEFAULT NULL,
  `ProductTotalPrice` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `CustomerName` varchar(100) DEFAULT NULL,
  `CustomerTel` varchar(100) DEFAULT NULL,
  `Status` int(1) DEFAULT NULL,
  `CustomerUname` varchar(100) DEFAULT NULL,
  `DeliveryType` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cforder`
--

INSERT INTO `cforder` (`id`, `OrderId`, `ProductTotalPrice`, `Quantity`, `CustomerName`, `CustomerTel`, `Status`, `CustomerUname`, `DeliveryType`) VALUES
(1, '1', 130, 2, 'Taeyeon Kim', '0918347871', 1, 'taeyeon_ss', 'Pick up'),
(2, '1', 290, 2, 'Taeyeon Kim', '0918347871', 1, 'taeyeon_ss', 'Pick up'),
(3, '2', 65, 1, 'Methawee Atthawan', '0918347826', 1, 'yammy', 'Pick up'),
(4, '3', 130, 2, 'Methawee Atthawan', '0918347871', 1, 'B6019938', 'Pick up'),
(5, '3', 145, 1, 'Methawee Atthawan', '0918347871', 1, 'B6019938', 'Delivery');

-- --------------------------------------------------------

--
-- Table structure for table `checkout`
--

CREATE TABLE `checkout` (
  `id` int(11) UNSIGNED NOT NULL,
  `CustomerName` varchar(100) DEFAULT NULL,
  `CustomerLname` varchar(100) DEFAULT NULL,
  `CustomerTel` varchar(10) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Total` int(11) DEFAULT NULL,
  `Username` varchar(100) DEFAULT NULL,
  `Status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `checkout`
--

INSERT INTO `checkout` (`id`, `CustomerName`, `CustomerLname`, `CustomerTel`, `Quantity`, `Total`, `Username`, `Status`) VALUES
(1, 'Taeyeon', 'Kim', '0918347871', 2, 290, 'taeyeon_ss', 0),
(2, 'Methawee', 'Atthawan', '0918347826', 1, 65, 'yammy', 0),
(3, 'Methawee', 'Atthawan', '0918347871', 1, 145, 'B6019938', 0);

-- --------------------------------------------------------

--
-- Table structure for table `credit`
--

CREATE TABLE `credit` (
  `id` int(11) NOT NULL,
  `CardNumber` varchar(16) DEFAULT NULL,
  `Expiration` varchar(10) DEFAULT NULL,
  `CVV` varchar(10) DEFAULT NULL,
  `FirstName` varchar(100) DEFAULT NULL,
  `LastName` varchar(100) DEFAULT NULL,
  `Username` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `credit`
--

INSERT INTO `credit` (`id`, `CardNumber`, `Expiration`, `CVV`, `FirstName`, `LastName`, `Username`) VALUES
(1, '4328342874367635', '23/07', '123', 'Taeyeon', 'Kim', 'taeyeon_ss'),
(2, '1234123413445556', '23/08', '123', 'Methawee', 'Atthawan', 'yammy'),
(3, '4541273427125436', '23/09', '123', 'Metawee', 'Atthawan', 'B6019938');

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE `districts` (
  `id` varchar(6) COLLATE utf8_bin NOT NULL,
  `zip_code` varchar(11) COLLATE utf8_bin NOT NULL,
  `name_ar` varchar(150) COLLATE utf8_bin NOT NULL,
  `name_en` varchar(150) COLLATE utf8_bin NOT NULL,
  `amphure_id` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='InnoDB free: 8192 kB';

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`id`, `zip_code`, `name_ar`, `name_en`, `amphure_id`) VALUES
  ('010101', '11111', 'حي الزمالك', 'Zamalek District', 1),
  ('010102', '11112', 'حي الدقي', 'Dokki District', 1),
  ('010103', '11113', 'حي المهندسين', 'Mohandeseen District', 1),
  ('010104', '11114', 'حي الهرم', 'Haram District', 1),
  ('010201', '22221', 'حي 6 أكتوبر', '6th of October District', 2),
  ('010202', '22222', 'حي الشيخ زايد', 'Sheikh Zayed District', 2),
  ('010203', '22223', 'حي حدائق الأهرام', 'Hadayek Al Ahram District', 2),
  ('010204', '22224', 'حي الصف', 'Saf District', 2),
  ('070301', '77771', 'حي الجيزة', 'Giza District', 7),
  ('070302', '77772', 'حي الحوامدية', 'Hawamdiyah District', 7),
  ('070303', '77773', 'حي العياط', 'Ayat District', 7),
  ('070304', '77774', 'حي البدرشين', 'Badrshein District', 7),
  ('080401', '88881', 'حي الشيخ زايد', 'Sheikh Zayed District', 8),
  ('080402', '88882', 'حي العبور', 'Obour District', 8),
  ('080403', '88883', 'حي بدر', 'Badr District', 8),
  ('080404', '88884', 'حي مدينتي', 'Madinet Nasr District', 8),
  ('020401', '44444', 'حي الرملة', 'Ramlah District', 4),
  ('020402', '44445', 'حي العطارين', 'Attarin District', 4),
  ('020403', '44446', 'حي المنشية', 'Mansheya District', 4),
  ('030401', '55554', 'حي دمياط الجديدة', 'New Damietta District', 5),
  ('030402', '55555', 'حي دمياط القديمة', 'Old Damietta District', 5),
  ('030403', '55556', 'حي فارسكور', 'Farskor District', 5),
  ('040501', '66661', 'حي بني سويف الجديدة', 'New Beni Suef District', 6),
  ('040502', '66662', 'حي بني سويف القديمة', 'Old Beni Suef District', 6),
  ('040503', '66663', 'حي الواسطى', 'Al-Wasat District', 6),
  ('050601', '77781', 'حي الفيوم الجديدة', 'New Fayoum District', 7),
  ('050602', '77782', 'حي الفيوم القديمة', 'Old Fayoum District', 7),
  ('050603', '77783', 'حي طامية', 'Tameya District', 7),
  ('060701', '88891', 'حي بورسعيد الجديدة', 'New Port Said District', 8),
  ('060702', '88892', 'حي بورسعيد القديمة', 'Old Port Said District', 8),
  ('060703', '88893', 'حي المناخ', 'Minaakh District', 8),
  ('181801', '222221', 'حي شرم الشيخ الجديدة', 'New Sharm El-Sheikh District', 18),
  ('181802', '222222', 'حي شرم الشيخ القديمة', 'Old Sharm El-Sheikh District', 18),
  ('181803', '222223', 'حي رأس سدر', 'Ras Sedr District', 18),
  ('181804', '222224', 'حي نويبع', 'Nuweiba District', 18),
  ('181805', '222225', 'حي طابا', 'Taba District', 18),
  ('191901', '333331', 'حي القاهرة الجديدة', 'New Cairo District', 19),
  ('191902', '333332', 'حي التجمع الخامس', 'Fifth Settlement District', 19),
  ('191903', '333333', 'حي المعادي', 'Maadi District', 19),
  ('191904', '333334', 'حي المقطم', 'Mokattam District', 19),
  ('202001', '55551', 'حي الإسكندرية الجديدة', 'New Alexandria District', 20),
  ('202002', '55552', 'حي المنتزه', 'Montaza District', 20),
  ('202003', '55553', 'حي العصافرة', 'Asafra District', 20),
  ('212101', '66661', 'حي البحيرة', 'Buhayrah District', 21),
  ('212102', '66662', 'حي دمنهور', 'Damanhur District', 21),
  ('212103', '66663', 'حي كفر الدوار', 'Kafr El Dawwar District', 21),
  ('222201', '77771', 'حي طنطا الجديدة', 'New Tanta District', 22),
  ('222202', '77772', 'حي طنطا القديمة', 'Old Tanta District', 22),
  ('222203', '77773', 'حي المحلة الكبرى', 'Al-Mahalla Al-Kubra District', 22),
  ('232301', '88881', 'حي الزقازيق الجديدة', 'New Zagazig District', 23),
  ('232302', '88882', 'حي الزقازيق القديمة', 'Old Zagazig District', 23),
  ('232303', '88883', 'حي المنصورة', 'Al-Mansura District', 23),
  ('242401', '99991', 'حي بلبيس', 'Belbeis District', 24),
  ('242402', '99992', 'حي العاشر من رمضان', '10th of Ramadan District', 24),
  ('242403', '99993', 'حي الشروق', 'Shorouk District', 24),
  ('252501', '101011', 'حي أسيوط الجديدة', 'New Assiut District', 25),
  ('252502', '101012', 'حي أسيوط القديمة', 'Old Assiut District', 25),
  ('252503', '101013', 'حي الخالدية', 'Al-Khalidiya District', 25),
  ('262601', '112111', 'حي سوهاج الجديدة', 'New Sohag District', 26),
  ('363601', '222311', 'حي الجيزة الجديدة', 'New Giza District', 36),
  ('363602', '222312', 'حي الجيزة القديمة', 'Old Giza District', 36),
  ('363603', '222313', 'حي العجوزة', 'Al-Agouza District', 36),
  ('373701', '233411', 'حي الهرم الجديدة', 'New Haram District', 37),
  ('373702', '233412', 'حي الهرم القديمة', 'Old Haram District', 37),
  ('373703', '233413', 'حي فيصل', 'Faisal District', 37),
  ('383801', '244511', 'حي العياط', 'Al Ayat District', 38),
  ('383802', '244512', 'حي مركز البدرشين', 'Badrshein Center District', 38),
  ('383803', '244513', 'حي الصف', 'Saf District', 38),
  ('393901', '255611', 'حي بنها الجديدة', 'New Banha District', 39),
  ('393902', '255612', 'حي بنها القديمة', 'Old Banha District', 39),
  ('393903', '255613', 'حي القليوبية', 'Qalyubia District', 39),
  ('404001', '266711', 'حي المنصورة', 'Al-Mansura District', 40),
  ('404002', '266712', 'حي المنزلة', 'Al-Mansla District', 40),
  ('404003', '266713', 'حي بلقاس', 'Belqas District', 40),
  ('414101', '277811', 'حي طنطا الجديدة', 'New Tanta District', 41),
  ('414102', '277812', 'حي طنطا القديمة', 'Old Tanta District', 41),
  ('414103', '277813', 'حي المحلة الكبرى', 'Al-Mahalla Al-Kubra District', 41),
  ('424201', '288911', 'حي الزقازيق الجديدة', 'New Zagazig District', 42),
  ('424202', '288912', 'حي الزقازيق القديمة', 'Old Zagazig District', 42),
  ('424203', '288913', 'حي أبو حماد', 'Abu Hammad District', 42),
  ('434301', '299011', 'حي دمياط الجديدة', 'New Damietta District', 43),
  ('434302', '299012', 'حي دمياط القديمة', 'Old Damietta District', 43),
  ('434303', '299013', 'حي رأس البر', 'Ras El Bar District', 43),
  ('444401', '300111', 'حي بورسعيد الجديدة', 'New Port Said District', 44),
  ('444402', '300112', 'حي بورسعيد القديمة', 'Old Port Said District', 44),
  ('444403', '300113', 'حي المناخ', 'El Manakh District', 44),
  ('454501', '311211', 'حي الشرقية', 'Sharqia District', 45),
  ('454502', '311212', 'حي المحلة الجديدة', 'New Mahalla District', 45),
  ('454503', '311213', 'حي منوف', 'Menouf District', 45),
  ('464601', '322311', 'حي الفيوم', 'Fayoum District', 46),
  ('464602', '322312', 'حي طامية', 'Tamiya District', 46),
  ('464603', '322313', 'حي إطسا', 'Itsa District', 46),
  ('474701', '333411', 'حي المنيا', 'Minya District', 47),
  ('474702', '333412', 'حي المدينة الفكرية', 'Al-Madina Al-Fekriya District', 47),
  ('474703', '333413', 'حي ملوي', 'Mallawi District', 47),
  ('484801', '344511', 'حي أسيوط الجديدة', 'New Asyut District', 48),
  ('484802', '344512', 'حي أسيوط القديمة', 'Old Asyut District', 48),
  ('484803', '344513', 'حي طهطا', 'Tahata District', 48),
  ('494901', '355611', 'حي الخارجة', 'El Kharga District', 49),
  ('494902', '355612', 'حي باريس', 'Paris District', 49),
  ('494903', '355613', 'حي الفرافرة', 'Farafra District', 49),
  ('505001', '366711', 'حي البحر الأحمر', 'Red Sea District', 50),
  ('505002', '366712', 'حي الغردقة', 'Hurghada District', 50),
  ('505003', '366713', 'حي شلاتين', 'Shalatin District', 50),
  ('515101', '377811', 'حي مطروح', 'Marsa Matrouh District', 51),
  ('515102', '377812', 'حي السلوم', 'Al-Saloum District', 51),
  ('515103', '377813', 'حي سيوة', 'Siwa District', 51),
  ('525201', '388911', 'حي الأقصر الجديدة', 'New Luxor District', 52),
  ('525202', '388912', 'حي الأقصر القديمة', 'Old Luxor District', 52),
  ('525203', '388913', 'حي الأقصر الغربية', 'West Luxor District', 52),
  ('535301', '399011', 'حي أسوان الجديدة', 'New Aswan District', 53),
  ('535302', '399012', 'حي أسوان القديمة', 'Old Aswan District', 53),
  ('535303', '399013', 'حي كوم أمبو', 'Kom Ombo District', 53),
  ('545401', '400111', 'حي الغربية', 'Gharbia District', 54),
  ('545402', '400112', 'حي السنطة الجديدة', 'New Santa District', 54),
  ('545403', '400113', 'حي زفتى', 'Zefta District', 54),
  ('555501', '411211', 'حي الإسماعيلية', 'Ismailia District', 55),
  ('555502', '411212', 'حي القنطرة', 'Al Qantara District', 55),
  ('555503', '411213', 'حي فايد', 'Fayed District', 55),
  ('565601', '422311', 'حي السويس', 'Suez District', 56),
  ('565602', '422312', 'حي العرب', 'Arab District', 56),
  ('565603', '422313', 'حي الأربعين', 'Al-Arbaeen District', 56),
  ('575701', '433411', 'حي البحيرة', 'Buhayra District', 57),
  ('575702', '433412', 'حي دمنهور', 'Damnhour District', 57),
  ('575703', '433413', 'حي كفر الدوار', 'Kafr El Dawar District', 57),
  ('585801', '444511', 'حي مرسى مطروح', 'Mersa Matruh District', 58),
  ('585802', '444512', 'حي الحمام', 'El Hammam District', 58),
  ('585803', '444513', 'حي العلمين', 'Alamein District', 58),
  ('595901', '455611', 'حي شمال سيناء', 'North Sinai District', 59),
  ('595902', '455612', 'حي العريش', 'Arish District', 59),
  ('595903', '455613', 'حي رفح', 'Rafah District', 59),
  ('606001', '466711', 'حي جنوب سيناء', 'South Sinai District', 60),
  ('606002', '466712', 'حي شرم الشيخ', 'Sharm El-Sheikh District', 60),
  ('606003', '466713', 'حي نويبع', 'Nuweiba District', 60);


-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(11) UNSIGNED NOT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `LastName` varchar(150) DEFAULT NULL,
  `AdminEmail` varchar(255) DEFAULT NULL,
  `MobileNumber` varchar(10) DEFAULT NULL,
  `UserName` varchar(255) DEFAULT NULL,
  `Password` varchar(150) DEFAULT NULL,
  `Status` int(1) DEFAULT NULL,
  `updationDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `FirstName`, `LastName`, `AdminEmail`, `MobileNumber`, `UserName`, `Password`, `Status`, `updationDate`) VALUES
(3, 'Jennie', 'Kimmie', 'jenniekimkim@gmail.com', '0876572769', 'admin_shop', '827ccb0eea8a706c4c34a16891f84e7b', 1, '2021-04-09 19:22:04'),
(4, 'Kim', 'Jennie', 'jenniekim1@gmail.com', '0876572769', 'admin444', '81dc9bdb52d04dc20036dbd8313ed055', 1, '2021-04-10 13:28:38');

-- --------------------------------------------------------

--
-- Table structure for table `foodbanner`
--

CREATE TABLE `foodbanner` (
  `id` int(11) UNSIGNED NOT NULL,
  `Images` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `foodbanner`
--

INSERT INTO `foodbanner` (`id`, `Images`) VALUES
(1, 'Untitled-4 cc.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `geographies`
--

CREATE TABLE `geographies` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='InnoDB free: 8192 kB';

--
-- Dumping data for table `geographies`
--

INSERT INTO `geographies` (`id`, `name`) VALUES
(1, 'North'),
(2, 'Center'),
(3, 'East'),
(4, 'West'),
(5, 'South');

-- --------------------------------------------------------

--
-- Table structure for table `guest`
--

CREATE TABLE `guest` (
  `id` int(11) UNSIGNED NOT NULL,
  `FirstName` varchar(100) DEFAULT NULL,
  `LastName` varchar(150) DEFAULT NULL,
  `EmailGuest` varchar(150) DEFAULT NULL,
  `MobileNumber` varchar(10) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `guest`
--

INSERT INTO `guest` (`id`, `FirstName`, `LastName`, `EmailGuest`, `MobileNumber`, `Comment`) VALUES
(1, 'Steve', 'Roger', 'rogerkung@gmail.com', '0765432465', 'Good!'),
(2, 'Steve', 'Roger', 'rogerkung@gmail.com', '0765432465', 'Good!'),
(3, 'Kim', 'Jennie', 'jenniekim@gmail.com', '0876572769', 'Good job!'),
(4, 'Kim', 'Jennie', 'jenniekim@gmail.com', '0876572769', 'It\'s a very good Toast! I love TOAST!!!'),
(5, 'Kim', 'Jennie', 'jenniekim@gmail.com', '0876572769', 'It\'s a very good Toast! I love TOAST!!!'),
(6, 'Kim', 'Jennie', 'jenniekim@gmail.com', '0876572769', 'It\'s a very good Toast! I love TOAST!!!'),
(11, 'Steve', 'Roger', 'rogerkung@gmail.com', '0765432465', 'Wow, delicious!');

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `id` int(11) UNSIGNED NOT NULL,
  `ProductCode` varchar(100) DEFAULT NULL,
  `ProductName` varchar(100) DEFAULT NULL,
  `ProductImage` varchar(100) DEFAULT NULL,
  `ProductPrice` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `TotalPrice` varchar(100) DEFAULT NULL,
  `Username` varchar(100) DEFAULT NULL,
  `Status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`id`, `ProductCode`, `ProductName`, `ProductImage`, `ProductPrice`, `Quantity`, `TotalPrice`, `Username`, `Status`) VALUES
(6, 'HT99998778', 'Espresso Choc Chip Brownie', 'Screen Shot 2564-04-23 at 22.02.58.png', 175, 1, '', 'jennierubyjane', 2),
(7, 'GF456781', 'GRANDMA’S BREAD PUDDING', 'Bread-Pudding-10s-new.jpg', 125, 1, '', 'jennierubyjane', 2),
(8, 'BH678900', 'Chocolate Frappuccino', 'Choc-Frappe.png', 145, 1, '', 'jennierubyjane', 2),
(9, 'GH456780', 'Cinnamon Coffee Cake', 'cinnamon.png', 60, 2, '', 'jennierubyjane', 2),
(10, 'HT99998778', 'Espresso Choc Chip Brownie', 'Screen Shot 2564-04-23 at 22.02.58.png', 175, 1, '', 'taeyeon_ss', 2),
(11, 'BK00056456', 'Jumbo Sausage Bite', 'Screen Shot 2564-04-26 at 14.36.15.png', 85, 1, '', 'taeyeon_ss', 2),
(12, 'BK00000111', 'Soft Chocolate Chip Cookie', 'Screen Shot 2564-04-26 at 14.32.00.png', 65, 3, '', 'natasha_', 2),
(13, 'BK00000111', 'Soft Chocolate Chip Cookie', 'Screen Shot 2564-04-26 at 14.32.00.png', 65, 3, '', 'natasha_', 2),
(14, 'GH456780', 'Cinnamon Coffee Cake', 'cinnamon.png', 60, 1, '', 'B6019938', 2),
(15, 'BDF82630', 'Chocolate Frappuccino', 'Choc-Frappe.png', 115, 1, '', 'B6019938', 2),
(16, 'GH456780', 'Cinnamon Coffee Cake', 'cinnamon.png', 60, 1, '', 'B6019938', 2),
(17, 'BK00056456', 'Jumbo Sausage Bite', 'Screen Shot 2564-04-26 at 14.36.15.png', 85, 1, '', 'B6019938', 2),
(18, 'BK00056456', 'Jumbo Sausage Bite', 'Screen Shot 2564-04-26 at 14.36.15.png', 85, 1, '', 'winter', 1),
(19, 'BK00000111', 'Soft Chocolate Chip Cookie', 'Screen Shot 2564-04-26 at 14.32.00.png', 65, 2, '', 'taeyeon_ss', 2),
(20, 'ADF82637', 'Choco-choco Nutty Frappuccino', 'Chocochoco-Nutty-Frappuccino.png', 145, 2, '', 'taeyeon_ss', 2),
(21, 'BK00000111', 'Soft Chocolate Chip Cookie', 'Screen Shot 2564-04-26 at 14.32.00.png', 65, 2, '', 'yammy', 2),
(22, 'BK00000111', 'Soft Chocolate Chip Cookie', 'Screen Shot 2564-04-26 at 14.32.00.png', 65, 1, '', 'B6019938', 2),
(23, 'BH678900', 'Chocolate Frappuccino', 'Choc-Frappe.png', 145, 1, '', 'B6019938', 2);

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `id` int(11) NOT NULL,
  `Username` varchar(100) DEFAULT NULL,
  `FirstName` varchar(100) DEFAULT NULL,
  `LastName` varchar(100) DEFAULT NULL,
  `EmailId` varchar(150) DEFAULT NULL,
  `MobileNumber` varchar(10) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `Status` int(1) DEFAULT NULL,
  `PaymentStatus` int(1) DEFAULT NULL,
  `AddressStatus` int(1) DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`id`, `Username`, `FirstName`, `LastName`, `EmailId`, `MobileNumber`, `Password`, `Status`, `PaymentStatus`, `AddressStatus`, `RegDate`, `UpdationDate`) VALUES
(1, 'taeyeon_ss', 'Taeyeon', 'Kim', 'taeyeon@gmail.com', '0918347871', '25d55ad283aa400af464c76d713c07ad', 1, 2, 2, '2021-07-04 07:52:08', '2021-07-04 07:53:00'),
(2, 'yammy', 'Methawee', 'Atthawan', 'yam@gmail.com', '0918347821', '25d55ad283aa400af464c76d713c07ad', 0, 2, 2, '2021-07-09 03:07:17', '2021-07-09 07:43:51'),
(3, 'B6019938', 'Methawee', 'Atthawan', 'B6019938@gmail.com', '0918347871', '25f9e794323b453885f5181f1b624d0b', 1, 2, 2, '2021-07-09 07:33:21', '2021-07-09 07:36:24');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` int(11) UNSIGNED NOT NULL,
  `MenuName` varchar(150) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Price` int(30) DEFAULT NULL,
  `Image1` varchar(150) DEFAULT NULL,
  `CategoryId` int(30) DEFAULT NULL,
  `SubCategoryId` int(30) DEFAULT NULL,
  `SizeId` int(30) DEFAULT NULL,
  `TypeId` int(30) DEFAULT NULL,
  `ProductCode` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `MenuName`, `Description`, `Price`, `Image1`, `CategoryId`, `SubCategoryId`, `SizeId`, `TypeId`, `ProductCode`) VALUES
(1, 'Cinnamon Coffee Cake', 'Our ever-popular coffee cake—with its swirled cinnamon-sugar blend and finished with a crunchy streusel topping—pairs well with your favorite beverage and a few quiet moments. We\'re big fans!', 60, 'cinnamon.png', 1, 6, 0, 0, 'GH456780'),
(2, 'Chocolate Frappuccino', 'Nutrition information is calculated based on our standard recipes. Only changing drink size will update this information. Other customizations will not. Yahoo!', 115, 'Choc-Frappe.png', 2, 2, 2, 1, 'BDF82631'),
(3, 'Chocolate Frappuccino', 'Nutrition information is calculated based on our standard recipes. Only changing drink size will update this information. Other customizations will not.', 145, 'Choc-Frappe.png', 2, 2, 3, 1, 'BH678900'),
(4, 'Honey Toast !', 'One of the latest dessert crazes in Taipei right now would be for an item called honey toast.  It comes in different flavors and from my understanding, is made popular by Dazzling Cafe.  ', 120, 'honey-toast.jpg', 4, 7, 0, 0, 'GF456788'),
(5, 'GRANDMA’S BREAD PUDDING', 'This bread pudding recipe is easy to make with just a few simple ingredients. This is one of our family’s favorite recipes and is perfect served with a big scoop of ice cream!', 125, 'Bread-Pudding-10s-new.jpg', 4, 7, 0, 0, 'GF456781'),
(6, 'Bread Pudding II', 'My family LOVES bread pudding, and this recipe is one that I have fine tuned to their taste. I have to double this recipe, and bake it in a 9x13 inch pan for my family! It\'s great for breakfast or dessert and is delicious with milk poured on top! Enjoy!', 95, '20HIT_BREADPUDD-articleLarge.jpg', 3, 8, 0, 0, 'DF456788'),
(7, 'Mocha Frappuccino', 'Starbucks usually adds some kind of milk to their Frappuccinos and in my recipe, I chose to use almond butter and water instead. Combining these two ingredients is like adding homemade almond milk to your coffee!', 125, 'Healthy-Paleo-Starbucks-Mocha-Frappuccino-Recipe-dairyfree-glutenfree-sugarfree2.jpg', 2, 1, 2, 1, 'BH678903'),
(8, 'Dalgona Coffee', 'Dalgona Coffee Recipe or Whipped Coffee is a frothy 3 ingredient coffee prepared using instant coffee powder.', 90, 'Dalgona-Coffee-Recipe-V1.jpg', 2, 1, 3, 2, 'BH678905'),
(9, 'Dalgona Coffee', 'Dalgona Coffee Recipe or Whipped Coffee is a frothy 3 ingredient coffee prepared using instant coffee powder.', 90, 'Dalgona-Coffee-Recipe-V1.jpg', 2, 1, 3, 2, 'BH678906'),
(10, 'ICED MATCHA LATTE', 'Make this easy Iced Matcha Latte just like your favorite coffee shop. Matcha is mixed together with cold milk, served over ice.', 45, 'IcedMatchaLatte-7.jpg', 2, 2, 2, 2, 'BH678909'),
(11, 'ICED MATCHA LATTE', 'Make this easy Iced Matcha Latte just like your favorite coffee shop. Matcha is mixed together with cold milk, served over ice.', 45, 'IcedMatchaLatte-7.jpg', 2, 2, 2, 2, 'BH678908'),
(12, 'ICED MATCHA LATTE', 'Make this easy Iced Matcha Latte just like your favorite coffee shop. Matcha is mixed together with cold milk, served over ice.', 45, 'IcedMatchaLatte-7.jpg', 2, 2, 2, 2, 'BH678955'),
(13, 'ICED MATCHA LATTE', 'Make this easy Iced Matcha Latte just like your favorite coffee shop. Matcha is mixed together with cold milk, served over ice.', 45, 'IcedMatchaLatte-7.jpg', 2, 2, 2, 2, 'BH678906'),
(14, 'ICED MATCHA LATTE', 'Make this easy Iced Matcha Latte just like your favorite coffee shop. Matcha is mixed together with cold milk, served over ice.', 45, 'IcedMatchaLatte-7.jpg', 2, 2, 2, 2, 'BH678953'),
(15, 'Choco-choco Nutty Frappuccino', 'Roast and rich chocolatey hazelnut sauce, topped with mocha whipped cream and a generous heap of almond crunch for a satisfying finish.', 145, 'Chocochoco-Nutty-Frappuccino.png', 2, 2, 3, 1, 'ADF82637'),
(16, 'Choco-choco Nutty Frappuccino', 'Roast and rich chocolatey hazelnut sauce, topped with mocha whipped cream and a generous heap of almond crunch for a satisfying finish.', 145, 'Chocochoco-Nutty-Frappuccino.png', 2, 2, 3, 1, 'ADF82637'),
(17, 'Better No-Knead Bread', 'You can modify this recipe easily to bake loaves of any size. The important thing to note is the ratio of ingredients: 100 parts flour, 1.5 parts salt, 1 part instant yeast, and 70 parts water.', 50, '20200419-no-knead-bread-vicky-wasik2.jpg', 3, 8, 0, 0, 'DC34567899'),
(18, 'Jumbo Sausage Bite', 'Puff pastry with jumbo pork sausage.', 85, 'Screen Shot 2564-04-26 at 14.36.15.png', 3, 9, 0, 0, 'BK00056456'),
(19, 'Espresso Choc Chip Brownie', 'Espresso brownie serve with ice cream.', 175, 'Screen Shot 2564-04-23 at 22.02.58.png', 4, 7, 0, 0, 'HT99998778'),
(20, 'Soft Chocolate Chip Cookie', 'A chewy cookie loaded with semisweet chocolate chunks.', 65, 'Screen Shot 2564-04-26 at 14.32.00.png', 3, 12, 0, 0, 'BK00000111');

-- --------------------------------------------------------

--
-- Table structure for table `process`
--

CREATE TABLE `process` (
  `id` int(11) NOT NULL,
  `ProductCode` varchar(10) DEFAULT NULL,
  `ProductName` varchar(100) DEFAULT NULL,
  `ProductPrice` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Status` int(1) DEFAULT NULL,
  `Username` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `provinces`
--

CREATE TABLE `provinces` (
  `id` int(5) NOT NULL,
  `code` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `name_ar` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `name_en` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `geography_id` int(5) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `provinces`
--

INSERT INTO `provinces` (`id`, `code`, `name_ar`, `name_en`, `geography_id`) VALUES
  (1, '01', 'القاهرة', 'Cairo', 0),
  (2, '02', 'الإسكندرية', 'Alexandria', 0),
  (3, '03', 'الجيزة', 'Giza', 0),
  (4, '04', 'اسوان', 'Aswan', 0),
  (5, '05', 'البحر الأحمر', 'Red Sea', 0),
  (6, '06', 'الإسماعيلية', 'Ismailia', 0),
  (7, '07', 'اسبوط', 'Asyut', 0),
  (8, '08', 'البحيرة', 'Beheira', 0),
  (9, '09', 'بني سويف', 'Beni Suef', 0),
  (10, '10', 'بورسعيد', 'Port Said', 0),
  (11, '11', 'دمياط', 'Damietta', 0),
  (12, '12', 'الشرقية', 'Sharqia', 0),
  (13, '13', 'جنوب سيناء', 'South Sinai', 0),
  (14, '14', 'الغربية', 'Gharbia', 0),
  (15, '15', 'الفيوم', 'Faiyum', 0),
  (16, '16', 'القليوبية', 'Qalyubia', 0),
  (17, '17', 'قنا', 'Qena', 0),
  (18, '18', 'كفر الشيخ', 'Kafr El Sheikh', 0),
  (19, '19', 'مطروح', 'Matrouh', 0),
  (20, '20', 'المنوفية', 'Monufia', 0),
  (21, '21', 'المنيا', 'Minya', 0),
  (22, '22', 'الوادي الجديد', 'New Valley', 0),
  (23, '23', 'شمال سيناء', 'North Sinai', 0),
  (24, '24', 'السويس', 'Suez', 0),
  (25, '25', 'سوهاج', 'Sohag', 0),
  (26, '26', 'الأقصر', 'Luxor', 0),
  (27, '27', 'اسوان', 'Aswan', 0);

-- --------------------------------------------------------

--
-- Table structure for table `shop`
--

CREATE TABLE `shop` (
  `id` int(11) UNSIGNED NOT NULL,
  `ShopName` varchar(100) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `MobileNumber` varchar(10) NOT NULL,
  `ShopEmail` varchar(100) NOT NULL,
  `Logo` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shop`
--

INSERT INTO `shop` (`id`, `ShopName`, `Address`, `MobileNumber`, `ShopEmail`, `Logo`) VALUES
(1, 'Coffee Shop and Coffee Store', 'Open Air Mall, Second New Cairo, 4770203', '0299000001', 'coffeeshop@gmail.com', 'starbucks_PNG11.png');

-- --------------------------------------------------------

--
-- Table structure for table `shopthumbnail`
--

CREATE TABLE `shopthumbnail` (
  `id` int(11) UNSIGNED NOT NULL,
  `ThumbnailId` int(11) DEFAULT NULL,
  `PositionId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `size`
--

CREATE TABLE `size` (
  `id` int(11) UNSIGNED NOT NULL,
  `SizeName` varchar(150) DEFAULT NULL,
  `Ounce` int(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `size`
--

INSERT INTO `size` (`id`, `SizeName`, `Ounce`) VALUES
(1, 'Short', 8),
(2, 'Tall', 12),
(3, 'Grande', 16),
(4, 'Venti', 20);

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE `subcategory` (
  `id` int(11) UNSIGNED NOT NULL,
  `SubCategory` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`id`, `SubCategory`) VALUES
(1, 'Coffee'),
(2, 'Milk'),
(3, 'Appetizer'),
(4, 'Snack'),
(5, 'Soda'),
(6, 'Cake'),
(7, 'Honey toast'),
(9, 'Bread'),
(12, 'Cookie');

-- --------------------------------------------------------

--
-- Table structure for table `thumbnail`
--

CREATE TABLE `thumbnail` (
  `id` int(11) UNSIGNED NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Images` varchar(150) DEFAULT NULL,
  `PositionId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `thumbnail`
--

INSERT INTO `thumbnail` (`id`, `Name`, `Images`, `PositionId`) VALUES
(1, 'Beverage-Thumbnail', 'Thumbnail-Spring-LTO-1.jpg', 1),
(2, 'Cake-Thumbnail', 'Food_Summer2021_Web_thumnail.png', 2),
(3, 'Baverage-Thumbnail', 'Chocochoco-Nutty-Frappuccino.png', 3),
(4, 'Bakery-Thumbnail', 'Food_Spring21_Web1080x1080.jpg', 4),
(5, 'Dessert-Thumbnail', 'Screen Shot 2564-04-23 at 22.02.58.png', 5);

-- --------------------------------------------------------

--
-- Table structure for table `thumbnailpos`
--

CREATE TABLE `thumbnailpos` (
  `id` int(11) UNSIGNED NOT NULL,
  `Position` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `thumbnailpos`
--

INSERT INTO `thumbnailpos` (`id`, `Position`) VALUES
(1, 'Large'),
(2, 'Small1'),
(3, 'Small2'),
(4, 'Small3'),
(5, 'Small4');

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE `type` (
  `id` int(11) UNSIGNED NOT NULL,
  `TypeName` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `type`
--

INSERT INTO `type` (`id`, `TypeName`) VALUES
(1, 'Frappe/Smoothies'),
(2, 'Cold'),
(3, 'Hot');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `amphures`
--
ALTER TABLE `amphures`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bevbanner`
--
ALTER TABLE `bevbanner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `breadbanner`
--
ALTER TABLE `breadbanner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cforder`
--
ALTER TABLE `cforder`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `checkout`
--
ALTER TABLE `checkout`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `credit`
--
ALTER TABLE `credit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Username` (`UserName`) USING HASH;

--
-- Indexes for table `foodbanner`
--
ALTER TABLE `foodbanner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `geographies`
--
ALTER TABLE `geographies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `guest`
--
ALTER TABLE `guest`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Username` (`Username`) USING BTREE;

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `process`
--
ALTER TABLE `process`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `provinces`
--
ALTER TABLE `provinces`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop`
--
ALTER TABLE `shop`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shopthumbnail`
--
ALTER TABLE `shopthumbnail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `size`
--
ALTER TABLE `size`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `thumbnail`
--
ALTER TABLE `thumbnail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `thumbnailpos`
--
ALTER TABLE `thumbnailpos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `amphures`
--
ALTER TABLE `amphures`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1010;

--
-- AUTO_INCREMENT for table `bevbanner`
--
ALTER TABLE `bevbanner`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `breadbanner`
--
ALTER TABLE `breadbanner`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `cforder`
--
ALTER TABLE `cforder`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `checkout`
--
ALTER TABLE `checkout`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `credit`
--
ALTER TABLE `credit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `foodbanner`
--
ALTER TABLE `foodbanner`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `geographies`
--
ALTER TABLE `geographies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `guest`
--
ALTER TABLE `guest`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `process`
--
ALTER TABLE `process`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `provinces`
--
ALTER TABLE `provinces`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `shop`
--
ALTER TABLE `shop`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shopthumbnail`
--
ALTER TABLE `shopthumbnail`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `size`
--
ALTER TABLE `size`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `thumbnail`
--
ALTER TABLE `thumbnail`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `thumbnailpos`
--
ALTER TABLE `thumbnailpos`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `type`
--
ALTER TABLE `type`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
