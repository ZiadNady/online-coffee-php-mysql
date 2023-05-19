SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+03:00";

CREATE TABLE `address` (
  `id` int(11) UNSIGNED NOT NULL,
  `Address` varchar(150) DEFAULT NULL,
  `ProvinceId` int(11) DEFAULT NULL,
  `AmphureId` int(11) DEFAULT NULL,
  `DistrictId` int(11) DEFAULT NULL,
  `PostalCode` varchar(5) DEFAULT NULL,
  `Username` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `amphures` (
  `id` int(5) NOT NULL,
  `code` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `name_ar` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `name_en` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `province_id` int(5) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `bevbanner` (
  `id` int(11) UNSIGNED NOT NULL,
  `Images` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `breadbanner` (
  `id` int(11) UNSIGNED NOT NULL,
  `Images` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

  CREATE TABLE `category` (
    `id` int(11) UNSIGNED NOT NULL,
    `Category` varchar(150) DEFAULT NULL
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

CREATE TABLE `credit` (
  `id` int(11) NOT NULL,
  `CardNumber` varchar(16) DEFAULT NULL,
  `Expiration` varchar(10) DEFAULT NULL,
  `CVV` varchar(10) DEFAULT NULL,
  `FirstName` varchar(100) DEFAULT NULL,
  `LastName` varchar(100) DEFAULT NULL,
  `Username` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `districts` (
  `id` varchar(6) COLLATE utf8_bin NOT NULL,
  `zip_code` varchar(11) COLLATE utf8_bin NOT NULL,
  `name_ar` varchar(150) COLLATE utf8_bin NOT NULL,
  `name_en` varchar(150) COLLATE utf8_bin NOT NULL,
  `amphure_id` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='InnoDB free: 8192 kB';

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

CREATE TABLE `foodbanner` (
  `id` int(11) UNSIGNED NOT NULL,
  `Images` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `geographies` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='InnoDB free: 8192 kB';

CREATE TABLE `guest` (
  `id` int(11) UNSIGNED NOT NULL,
  `FirstName` varchar(100) DEFAULT NULL,
  `LastName` varchar(150) DEFAULT NULL,
  `EmailGuest` varchar(150) DEFAULT NULL,
  `MobileNumber` varchar(10) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

CREATE TABLE `process` (
  `id` int(11) NOT NULL,
  `ProductCode` varchar(10) DEFAULT NULL,
  `ProductName` varchar(100) DEFAULT NULL,
  `ProductPrice` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Status` int(1) DEFAULT NULL,
  `Username` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `provinces` (
  `id` int(5) NOT NULL,
  `code` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `name_ar` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `name_en` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `geography_id` int(5) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `shop` (
  `id` int(11) UNSIGNED NOT NULL,
  `ShopName` varchar(100) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `MobileNumber` varchar(10) NOT NULL,
  `ShopEmail` varchar(100) NOT NULL,
  `Logo` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `shopthumbnail` (
  `id` int(11) UNSIGNED NOT NULL,
  `ThumbnailId` int(11) DEFAULT NULL,
  `PositionId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `size` (
  `id` int(11) UNSIGNED NOT NULL,
  `SizeName` varchar(150) DEFAULT NULL,
  `Ounce` int(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `subcategory` (
  `id` int(11) UNSIGNED NOT NULL,
  `SubCategory` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `thumbnail` (
  `id` int(11) UNSIGNED NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Images` varchar(150) DEFAULT NULL,
  `PositionId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `thumbnailpos` (
  `id` int(11) UNSIGNED NOT NULL,
  `Position` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `type` (
  `id` int(11) UNSIGNED NOT NULL,
  `TypeName` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `address`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `amphures`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `bevbanner`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `breadbanner`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `cforder`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `checkout`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `credit`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `districts`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Username` (`UserName`) USING HASH;

ALTER TABLE `foodbanner`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `geographies`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `guest`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `history`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `member`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Username` (`Username`) USING BTREE;

ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `process`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `provinces`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `shop`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `shopthumbnail`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `size`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `thumbnail`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `thumbnailpos`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `type`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `address`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `amphures`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1010;

ALTER TABLE `bevbanner`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

ALTER TABLE `breadbanner`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `cart`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE `category`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

ALTER TABLE `cforder`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE `checkout`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `credit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `employee`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

ALTER TABLE `foodbanner`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `geographies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

ALTER TABLE `guest`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

ALTER TABLE `history`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

ALTER TABLE `member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `menu`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

ALTER TABLE `process`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `provinces`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

ALTER TABLE `shop`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `shopthumbnail`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `size`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

ALTER TABLE `subcategory`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

ALTER TABLE `thumbnail`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

ALTER TABLE `thumbnailpos`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE `type`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;
