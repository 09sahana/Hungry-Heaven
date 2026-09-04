-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Server version: 9.1.0
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hungry_heaven`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text,
  `image` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `image`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'North Indian', 'Authentic North Indian dishes, rich gravies, aromatic curries, and freshly baked breads.', 'north-indian-1748760190.jpg', 1, CURRENT_TIMESTAMP, NULL),
(2, 'South Indian', 'Traditional South Indian delicacies, crispy dosas, fluffy idlis, and coastal specialties.', 'south-indian-1748760363.jpg', 1, CURRENT_TIMESTAMP, NULL),
(3, 'Italian', 'Classic Italian pasta, creamy risotto, artisanal focaccia, and decadent desserts.', 'italian-1748782757.jpg', 1, CURRENT_TIMESTAMP, NULL),
(4, 'Japanese', 'Exquisite Japanese sushi rolls, authentic ramen noodle bowls, and savory rice dishes.', 'japanese-1748783508.jpg', 1, CURRENT_TIMESTAMP, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

DROP TABLE IF EXISTS `menu_items`;
CREATE TABLE IF NOT EXISTS `menu_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `is_veg` tinyint(1) NOT NULL DEFAULT '0',
  `is_available` tinyint(1) NOT NULL DEFAULT '1',
  `is_popular` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `category_id`, `name`, `description`, `price`, `image`, `is_veg`, `is_available`, `is_popular`, `created_at`, `updated_at`) VALUES
(1, 1, 'Hyderabadi Dum Biryani', 'Fragrant basmati rice cooked on slow dum with aromatic spices, herbs, and marinated tender meat.', 299.00, 'hyderabadi-dum-biryani-1748781731.jpg', 0, 1, 1, CURRENT_TIMESTAMP, NULL),
(2, 1, 'Chole Bhature', 'Spicy and tangy chickpea curry served with golden fried puffed sourdough breads and pickle.', 180.00, 'chole-bhature-1748781822.jpg', 1, 1, 1, CURRENT_TIMESTAMP, NULL),
(3, 1, 'Royal North Indian Thali', 'Deluxe platter featuring paneer butter masala, dal makhani, seasonal veg, jeera rice, butter rotis, and gulab jamun.', 349.00, 'north-indian-thali-1748760781.jpg', 1, 1, 1, CURRENT_TIMESTAMP, NULL),
(4, 1, 'Puri Bhaji Platter', 'Piping hot fluffy golden puris served with aromatic spiced potato masala curry.', 150.00, 'puri-1750657984.jpg', 1, 1, 0, CURRENT_TIMESTAMP, NULL),
(5, 2, 'Special Dum Biryani', 'Signature slow-cooked spicy dum biryani prepared with choice herbs, spices, and fragrant ghee rice.', 280.00, 'dum-bir.jpg', 0, 1, 1, CURRENT_TIMESTAMP, NULL),
(6, 2, 'Crispy Fried Chicken', 'Crunchy golden fried spiced chicken pieces served with special seasoned sauce.', 260.00, 'friedchickk.jpg', 0, 1, 0, CURRENT_TIMESTAMP, NULL),
(7, 3, 'Creamy Mushroom Risotto', 'Authentic Arborio rice slowly simmered with sauteed wild mushrooms, white wine, parmesan cheese, and fresh butter.', 320.00, 'risotto-1748783046.jpg', 1, 1, 1, CURRENT_TIMESTAMP, NULL),
(8, 3, 'Artisanal Rosemary Focaccia', 'Freshly baked Italian hearth bread seasoned with sea salt, aromatic rosemary, and extra virgin olive oil.', 160.00, 'focaccia-1748783109.jpg', 1, 1, 0, CURRENT_TIMESTAMP, NULL),
(9, 3, 'Classic Italian Frittata', 'Fluffy Italian omelette packed with farm-fresh vegetables, herbs, and melted parmesan cheese.', 190.00, 'frittata-1748783194.jpg', 0, 1, 0, CURRENT_TIMESTAMP, NULL),
(10, 3, 'Traditional Tiramisu', 'Classic Italian layered dessert with espresso-dipped ladyfingers, rich mascarpone cream, and cocoa dusting.', 220.00, 'tiramisu-1748783286.jpg', 1, 1, 1, CURRENT_TIMESTAMP, NULL),
(11, 4, 'Authentic Ramen Bowl', 'Savory broth served with springy wheat noodles, soft-boiled marinated egg, nori, scallions, and bamboo shoots.', 310.00, 'ramen-1748783565.jpg', 0, 1, 1, CURRENT_TIMESTAMP, NULL),
(12, 4, 'Chef Special Sushi Platter', 'Assorted handcrafted sushi rolls with sushi rice, crisp nori, fresh avocado, and wasabi dip.', 380.00, 'sushi-sushi-1748783630.jpg', 0, 1, 1, CURRENT_TIMESTAMP, NULL),
(13, 4, 'Japanese Kare Raisu', 'Hearty and comforting Japanese style curry with root vegetables served over steamed Japanese rice.', 270.00, 'kare-raisu-1748786810.jpg', 1, 1, 0, CURRENT_TIMESTAMP, NULL),
(14, 4, 'Traditional Onigiri Trio', 'Hand-formed triangular seasoned rice balls wrapped in crisp seaweed sheets with savory fillings.', 140.00, 'onigiri-1748786858.jpg', 1, 1, 0, CURRENT_TIMESTAMP, NULL),
(15, 3, 'Signature Gourmet Burger', 'Juicy grilled burger patty layered with melted cheese, crisp lettuce, ripe tomatoes, and special house sauce.', 199.00, 'SBurger.jpg', 0, 1, 1, CURRENT_TIMESTAMP, NULL),
(16, 3, 'Crispy Golden French Fries', 'Crispy deep-fried premium potato fries lightly tossed in sea salt and paprika seasoning.', 120.00, 'ffriess.jpg', 1, 1, 0, CURRENT_TIMESTAMP, NULL),
(17, 1, 'Grilled Chicken Satay Skewers', 'Marinated and chargrilled tender chicken skewers served with rich savory peanut dipping sauce.', 240.00, 'satay.jpg', 0, 1, 0, CURRENT_TIMESTAMP, NULL),
(18, 3, 'Sizzling Mexican Fajita', 'Grilled seasoned strips tossed with caramelized bell peppers and sweet onions, served with salsa.', 340.00, 'Fajita.jpg', 0, 1, 0, CURRENT_TIMESTAMP, NULL),
(19, 3, 'Street Tacos al Pastor', 'Traditional corn tortillas loaded with marinated grilled fillings, fresh cilantro, diced onions, and lime.', 230.00, 'Tacos al Pastor.jpg', 0, 1, 0, CURRENT_TIMESTAMP, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `reference_number` varchar(20) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `delivery_type` enum('pickup','delivery') NOT NULL,
  `payment_method` enum('cash','razorpay','cod') NOT NULL,
  `payment_id` varchar(100) DEFAULT NULL,
  `order_status` tinyint(1) NOT NULL DEFAULT '0',
  `address` text,
  `latitude` varchar(20) DEFAULT NULL,
  `longitude` varchar(20) DEFAULT NULL,
  `notes` text,
  `order_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `payment_order_id` varchar(255) DEFAULT NULL,
  `payment_signature` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
CREATE TABLE IF NOT EXISTS `order_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `item_id` int NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

DROP TABLE IF EXISTS `reservations`;
CREATE TABLE IF NOT EXISTS `reservations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `guests` int NOT NULL,
  `special_request` text,
  `status` enum('pending','confirmed','canceled','completed') NOT NULL DEFAULT 'pending',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
CREATE TABLE IF NOT EXISTS `reviews` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `item_id` int NOT NULL,
  `rating` int NOT NULL,
  `review` text,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `setting_key` varchar(50) NOT NULL,
  `setting_value` text NOT NULL,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `setting_key` (`setting_key`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`setting_key`, `setting_value`) VALUES
('site_name', 'Hungry Heaven'),
('site_tagline', 'Food Ordering & Dining System'),
('contact_email', 'info@hungryheaven.com'),
('contact_phone', '+91 9876543210'),
('address', '72, Vidyanagar Hubli, 580031'),
('site_logo', 'assets/images/food/HHLOGO.png'),
('min_order_amount', '100.00'),
('delivery_fee', '40.00'),
('tax_percentage', '5.00'),
('enable_cod', '1'),
('enable_razorpay', '1')
ON DUPLICATE KEY UPDATE `setting_value` = VALUES(`setting_value`);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `password` varchar(255) NOT NULL,
  `address` text,
  `role` enum('admin','customer','staff') NOT NULL DEFAULT 'customer',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `password`, `address`, `role`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@hungryheaven.com', '1234567890', '$2y$10$qPu1Zy/QFihEA3D7jKKyXes7MWTBrT5fBmwGiP8M.fckyi.kN3/P.', NULL, 'admin', '2026-09-03 19:38:16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_addresses`
--

DROP TABLE IF EXISTS `user_addresses`;
CREATE TABLE IF NOT EXISTS `user_addresses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `address` text NOT NULL,
  `latitude` varchar(20) DEFAULT NULL,
  `longitude` varchar(20) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `menu_items` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `fk_reservations_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `menu_items` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_addresses`
--
ALTER TABLE `user_addresses`
  ADD CONSTRAINT `user_addresses_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
