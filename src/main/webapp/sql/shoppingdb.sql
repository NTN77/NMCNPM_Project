create database shoppingdb;

use shoppingdb;

CREATE TABLE `account` (
  `user_mail` varchar(100) NOT NULL,
  `password` varchar(64) NOT NULL,
  `account_role` int NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_address` varchar(255) DEFAULT NULL,
  `user_phone` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`user_mail`)
);

INSERT INTO `shoppingdb`.`account`
(`user_mail`,
`password`,
`account_role`,
`user_name`,
`user_address`,
`user_phone`)
VALUES
('duongdt@fpt.com.vn','123',1,'Đinh Tùng Dương','Đại học FPT','0123456789'),
('lam@gmail.com','lam',1,'Lam Le','Bình Định','0123456789'),
('quytd@fpt.com.vn','123',1,'Thái Duy Quý','Đại học Đà Lạt','1234567');

CREATE TABLE `products` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(100) NOT NULL,
  `product_des` varchar(255) DEFAULT NULL,
  `product_price` double NOT NULL,
  `product_img_source` varchar(255) DEFAULT NULL,
  `product_type` varchar(100) DEFAULT NULL,
  `product_brand` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
);

insert into products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values('iPhone 11 Pro Max 512GB',N'Màn hình: 6.5", Super Retina XDR
HĐH: iOS 13
CPU: Apple A13 Bionic 6 nhân
RAM: 4 GB, ROM: 512 GB
Camera: 3 camera 12 MP, Selfie: 12 MP',43.990,'https://cdn.tgdd.vn/Products/Images/42/210654/iphone-11-pro-max-512gb-gold-600x600.jpg','cellphone','apple');

insert into  products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values('iPhone 11 Pro Max 256GB',N'Màn hình: 6.5", Super Retina XDR
HĐH: iOS 13
CPU: Apple A13 Bionic 6 nhân
RAM: 4 GB, ROM: 512 GB
Camera: 3 camera 12 MP, Selfie: 12 MP',37.990,'https://cdn.tgdd.vn/Products/Images/42/210653/iphone-11-pro-max-256gb-black-600x600.jpg','cellphone',
'apple');

insert into products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values('iPhone Xs Max 256GB',N'Màn hình: 6.5", Super Retina
HĐH: iOS 12
CPU: Apple A12 Bionic 6 nhân
RAM: 4 GB, ROM: 256 GB
Camera: Chính 12 MP & Phụ 12 MP, Selfie: 7 MP',32.990,'https://cdn.tgdd.vn/Products/Images/42/190322/iphone-xs-max-256gb-white-600x600.jpg','cellphone',
'apple');

insert into products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values('iPhone X 256GB',N'Màn hình: 5.8", Super Retina
HĐH: iOS 12
CPU: Apple A11 Bionic 6 nhân
RAM: 3 GB, ROM: 256 GB
Camera: Chính 12 MP & Phụ 12 MP, Selfie: 7 MP',27.990,'https://cdn.tgdd.vn/Products/Images/42/190324/iphone-xs-256gb-white-600x600.jpg','cellphone',
'apple');

insert into products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values('iPhone Xs 64GB',N'Màn hình: 5.8", Super Retina
HĐH: iOS 12
CPU: Apple A12 Bionic 6 nhân
RAM: 4 GB, ROM: 64 GB
Camera: Chính 12 MP & Phụ 12 MP, Selfie: 7 MP',24.990,'https://cdn.tgdd.vn/Products/Images/42/190321/iphone-xs-max-gold-600x600.jpg','cellphone',
'apple');

insert into products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values('iPhone Xr 128GB',N'Màn hình: 6.1", Liquid Retina
HĐH: iOS 12
CPU: Apple A12 Bionic 6 nhân
RAM: 3 GB, ROM: 128 GB
Camera: 12 MP, Selfie: 7 MP',17.990,'https://cdn.tgdd.vn/Products/Images/42/191483/iphone-xr-128gb-red-600x600.jpg','cellphone',
'apple');

insert into products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values('iPhone Xr 128GB',N'Màn hình: 6.1", Liquid Retina
HĐH: iOS 12
CPU: Apple A12 Bionic 6 nhân
RAM: 3 GB, ROM: 128 GB
Camera: 12 MP, Selfie: 7 MP',17.990,'https://cdn.tgdd.vn/Products/Images/42/191483/iphone-xr-128gb-red-600x600.jpg','cellphone',
'apple');

insert into products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values('iPhone 8 Plus 64GB',N'Màn hình: 5.5", Retina HD
HĐH: iOS 12
CPU: Apple A11 Bionic 6 nhân
RAM: 3 GB, ROM: 64 GB
Camera: Chính 12 MP & Phụ 12 MP, Selfie: 7 MP',16.590,'https://cdn.tgdd.vn/Products/Images/42/114110/iphone-8-plus-hh-600x600.jpg','cellphone',
'apple');

insert into products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values('iPhone 7 Plus 32GB',N'Màn hình: 5.5", Retina HD
HĐH: iOS 12
CPU: Apple A10 Fusion 4 nhân 64-bit
RAM: 3 GB, ROM: 32 GB
Camera: Chính 12 MP & Phụ 12 MP, Selfie: 7 MP',12.490,'https://cdn.tgdd.vn/Products/Images/42/78124/iphone-7-plus-32gb-gold-600x600.jpg','cellphone',
'apple');

insert into products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values('iPhone 7 32GB',N'Màn hình: 4.7", Retina HD
HĐH: iOS 12
CPU: Apple A10 Fusion 4 nhân 64-bit
RAM: 2 GB, ROM: 32 GB
Camera: 12 MP, Selfie: 7 MP',10.490,'https://cdn.tgdd.vn/Products/Images/42/74110/iphone-7-gold-600x600.jpg','cellphone',
'apple');

CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) DEFAULT NULL,
  `order_status` int DEFAULT NULL,
  `order_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `order_discount_code` varchar(8) DEFAULT NULL,
  `order_address` varchar(255) NOT NULL,
  PRIMARY KEY (`order_id`)
);

CREATE TABLE `orders_detail` (
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `amount_product` int DEFAULT NULL,
  `price_product` double DEFAULT NULL,
  PRIMARY KEY (`order_id`,`product_id`)
);

CREATE TABLE `discount_coupon` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(45) NOT NULL,
  `amount` double NOT NULL,
  `due_date` varchar(50) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `used` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_UNIQUE` (`code`)
);

INSERT INTO `shoppingdb`.`discount_coupon`
(`code`,
`amount`,
`due_date`,
`email`)
VALUES
('sale1',5,'2023/09/11','lam@gmail.com'),
('sale2',4,'2023/10/16','lam@gmail.com'),
('sale3',3,'2023/11/20','lam@gmail.com'),
('sale4',6,'2023/12/01','lam@gmail.com');

CREATE TABLE `email_offer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
);