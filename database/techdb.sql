-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 24, 2024 at 02:13 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `techdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Laptops', 'High-performance laptops for gaming, business, and everyday use.', '2024-11-22 23:38:40', '2024-11-22 23:38:40'),
(2, 'Desktops/PC', 'Powerful desktop computers for gaming and professional tasks.', '2024-11-22 23:38:40', '2024-11-23 01:18:11'),
(3, 'Smartphones', 'Latest smartphones with cutting-edge technology.', '2024-11-22 23:38:40', '2024-11-22 23:38:40'),
(4, 'Tablets', 'Portable tablets for work and entertainment.', '2024-11-22 23:38:40', '2024-11-22 23:38:40'),
(5, 'Accessories', 'Various accessories including cases, chargers, and peripherals.', '2024-11-22 23:38:40', '2024-11-22 23:38:40'),
(6, 'Wearables', 'Smartwatches and fitness trackers to keep you connected.', '2024-11-22 23:38:40', '2024-11-22 23:38:40'),
(7, 'Networking', 'Routers, switches, and networking equipment for home and office.', '2024-11-22 23:38:40', '2024-11-22 23:38:40'),
(8, 'Gaming', 'Gaming consoles, games, and accessories for gamers.', '2024-11-22 23:38:40', '2024-11-22 23:38:40'),
(9, 'Home Appliances', 'Smart home devices and appliances for modern living.', '2024-11-22 23:38:40', '2024-11-22 23:38:40'),
(10, 'Software', 'Essential software solutions for productivity and creativity.', '2024-11-22 23:38:40', '2024-11-22 23:38:40');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int(11) NOT NULL,
  `code` varchar(20) DEFAULT NULL,
  `discount_percentage` int(11) DEFAULT NULL CHECK (`discount_percentage` between 0 and 100),
  `expiration_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `discount_percentage`, `expiration_date`) VALUES
(1, 'TECHPLUS', 10, '2024-11-07'),
(2, 'BLACKFRD', 12, '2024-11-30');

-- --------------------------------------------------------

--
-- Table structure for table `customer_metrics`
--

CREATE TABLE `customer_metrics` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total_score` decimal(5,2) NOT NULL,
  `recency` int(11) NOT NULL,
  `frequency` int(11) NOT NULL,
  `monetary` decimal(10,2) NOT NULL,
  `is_high_value` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer_metrics`
--

INSERT INTO `customer_metrics` (`id`, `user_id`, `total_score`, `recency`, `frequency`, `monetary`, `is_high_value`) VALUES
(2, 4, 72.00, 10, 5, 1200.00, 0);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `shipping_address` text DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('Processing','Shipped','Delivered','Canceled') DEFAULT 'Processing',
  `coupon_id` int(11) DEFAULT NULL,
  `original_amount` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `total_amount`, `shipping_address`, `payment_method`, `order_date`, `status`, `coupon_id`, `original_amount`) VALUES
(17, 4, 450.00, 'prishtine', 'Credit Card', '2024-11-22 23:05:10', 'Delivered', NULL, NULL),
(18, 4, 2464.00, 'Prizren', 'Credit Card', '2024-11-22 23:11:07', 'Delivered', 2, 2800.00),
(19, 4, 52.80, 'Ferizaj', 'Bank Transfer', '2024-11-22 23:11:45', 'Processing', 2, 60.00),
(20, 4, 1284.80, 'Prishtine', 'Credit Card', '2024-11-23 01:42:07', 'Shipped', 2, 1460.00),
(21, 4, 1400.00, 'ferizaj', 'Cash', '2024-11-23 02:26:08', 'Processing', NULL, 1400.00),
(22, 4, 1400.00, 'Shkup', 'PayPal', '2024-11-23 02:27:55', 'Processing', NULL, 1400.00),
(44, 4, 450.00, 'prishtine', 'Cash', '2024-11-23 19:23:56', 'Delivered', NULL, 450.00),
(45, 4, 1400.00, 'Prishtine', 'Cash', '2024-11-23 23:04:21', 'Processing', NULL, 1400.00),
(46, 4, 792.00, 'Ferizaj', 'Cash', '2024-11-23 23:06:13', 'Processing', 2, 900.00),
(47, 4, 1232.00, 'Prizren', 'Cash', '2024-11-23 23:24:55', 'Processing', 2, 1400.00),
(48, 4, 1400.00, 'Prizren', 'Cash', '2024-11-23 23:30:32', 'Processing', NULL, 1400.00),
(49, 4, 60.00, 'Prizren', 'Cash', '2024-11-23 23:34:41', 'Delivered', NULL, 60.00),
(50, 4, 510.00, 'Prishtine', 'Cash', '2024-11-24 00:02:21', 'Delivered', NULL, 510.00),
(51, 4, 120.00, 'Ferizaj', 'Cash', '2024-11-24 00:04:14', 'Delivered', NULL, 120.00),
(52, 4, 450.00, 'Ferizaj', 'Cash', '2024-11-24 00:05:36', 'Delivered', NULL, 450.00),
(53, 4, 99.99, 'Ferizaj', 'Cash', '2024-11-24 00:24:18', 'Shipped', NULL, 99.99),
(59, 4, 450.00, 'Ferizaj', 'Bank Transfer', '2024-11-24 10:52:55', 'Shipped', NULL, 450.00),
(60, 6, 450.00, 'Tirane', 'Cash', '2024-11-24 11:18:43', 'Delivered', NULL, 450.00),
(61, 6, 1199.99, 'Tirane', 'Cash', '2024-11-24 11:19:31', 'Shipped', NULL, 1199.99),
(62, 7, 7392.00, 'Tirane', 'Cash', '2024-11-24 11:22:31', 'Delivered', 2, 8400.00),
(63, 8, 3250.00, 'Prishtine', 'Cash', '2024-11-24 11:24:22', 'Delivered', NULL, 3250.00),
(64, 8, 909.94, 'Prishtine', 'Cash', '2024-11-24 11:24:55', 'Shipped', NULL, 909.94),
(65, 4, 500.00, NULL, NULL, '2024-11-17 23:00:00', 'Delivered', NULL, NULL),
(66, 4, 150.00, NULL, NULL, '2024-11-18 23:00:00', 'Delivered', NULL, NULL),
(67, 4, 300.00, NULL, NULL, '2024-11-19 23:00:00', 'Delivered', NULL, NULL),
(68, 4, 450.00, NULL, NULL, '2024-11-20 23:00:00', 'Delivered', NULL, NULL),
(69, 4, 600.00, NULL, NULL, '2024-11-21 23:00:00', 'Delivered', NULL, NULL),
(70, 4, 200.00, NULL, NULL, '2024-11-22 23:00:00', 'Delivered', NULL, NULL),
(71, 4, 350.00, NULL, NULL, '2024-11-23 23:00:00', 'Delivered', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price_at_time` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`, `price_at_time`) VALUES
(14, 17, 2, 1, NULL),
(15, 18, 1, 2, 1400.00),
(16, 19, 3, 1, 60.00),
(17, 20, 1, 1, 1400.00),
(18, 20, 3, 1, 60.00),
(19, 21, 1, 1, 1400.00),
(20, 22, 1, 1, 1400.00),
(21, 44, 2, 1, 450.00),
(22, 45, 1, 1, 1400.00),
(23, 46, 2, 2, 450.00),
(24, 47, 1, 1, 1400.00),
(25, 48, 1, 1, 1400.00),
(26, 49, 3, 1, 60.00),
(27, 50, 2, 1, 450.00),
(28, 50, 3, 1, 60.00),
(29, 51, 3, 2, 60.00),
(30, 52, 2, 1, 450.00),
(31, 53, 3, 1, 60.00),
(32, 53, 5, 1, 39.99),
(39, 59, 2, 1, 450.00),
(40, 60, 2, 1, 450.00),
(41, 61, 2, 1, 450.00),
(42, 61, 3, 1, 60.00),
(43, 61, 4, 1, 650.00),
(44, 61, 5, 1, 39.99),
(45, 62, 1, 6, 1400.00),
(46, 63, 4, 5, 650.00),
(47, 64, 5, 6, 39.99),
(48, 64, 7, 1, 670.00);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `stock` int(10) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `image`, `description`, `category_id`, `stock`) VALUES
(1, 'LENOVO GAMING PC', 1400.00, 'img/1.3.png', 'Lenovo 2023 IdeaCentre Gaming 5 Desktop', 2, 1),
(2, 'LAPTOP HP', 450.00, 'img/2.png', 'HP Elitebook 650 G10 15.6 FHD Business Laptop Computer', 1, 2),
(3, 'GAMING HEADSET', 60.00, 'img/3.png', 'EKSA E900 Pro USB Gaming Headset for PC', 8, 4),
(4, 'IPHONE 14 PRO MAX', 650.00, 'img/4.png', 'The iPhone 14 Pro Max with 128GB storage', 3, 4),
(5, 'MOUSE GAMING', 39.99, 'img/5.png', 'ASUS ROG Spatha X Wireless Gaming Mouse', 8, 2),
(7, 'Benq', 670.00, 'img/6.png', 'Benq PC, programming ', 2, 2),
(8, 'Smartwatch', 320.00, 'img/8.png', 'Smartwatch, gold, new and trendy', 5, 3),
(9, 'Headphones', 230.00, 'img/7.png', 'Headphones, white, bluetooth', 6, 5),
(10, 'MSI Laptop', 998.00, 'img/9.png', 'MSI laptop, gaming, black', 1, 6),
(11, 'SOOMFON Camera', 340.00, 'img/10.png', 'Camera, HD, best quality', 5, 34),
(12, 'Rogstrix Gaming', 78.00, 'img/11.png', 'Rogstrix Gaming, Nividia', 5, 12),
(13, 'Apple Tablet', 340.00, 'img/12.png', 'Apple, Tablet, Black', 4, 12),
(14, 'Playstation', 390.00, 'img/13.png', 'Playstation, gaming', 8, 3),
(15, 'Apple Ipods', 390.00, 'img/14.png', 'Apple, Ipods, white, best sound', 5, 10),
(16, 'AR/VR Glasses', 980.00, 'img/15.png', 'AR/VR virtuality, smartglasses', 6, 20),
(17, 'Gaming Desk', 320.00, 'img/17.png', 'Gaming desk, gaming', 9, 23);

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL CHECK (`rating` between 1 and 5),
  `comment` varchar(255) NOT NULL,
  `review_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `user_id`, `product_id`, `rating`, `comment`, `review_date`) VALUES
(1, 4, 1, 5, '', '2024-11-06 00:33:36'),
(2, 4, 2, 5, '', '2024-11-10 22:13:44'),
(3, 4, 1, 4, '', '2024-11-24 12:51:10'),
(4, 4, 1, 5, '', '2024-11-24 12:51:17'),
(5, 4, 1, 2, '', '2024-11-24 12:51:19'),
(6, 4, 1, 2, '', '2024-11-24 12:52:20'),
(7, 4, 7, 4, '', '2024-11-24 12:58:24');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('user','admin') DEFAULT 'user',
  `loyalty_points` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `customer_badge` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `role`, `loyalty_points`, `created_at`, `customer_badge`) VALUES
(4, 'test', 'test1@gmail.com', '1234', 'user', 180, '2024-11-10 22:40:46', 'Bronze Member'),
(5, 'admin', 'admin@example.com', '1234', 'admin', 0, '2024-11-10 22:40:46', NULL),
(6, 'tech', 'tech@gmail.com', 'tech123@', 'user', 164, '2024-11-10 22:59:32', 'Bronze Member'),
(7, 'test3', 'test3@test.com', 'shkolla123@', 'user', 739, '2024-11-12 20:23:12', 'Gold Member'),
(8, 'techai', 'techai@gmail.com', 'techai123@', 'user', 415, '2024-11-24 11:23:41', 'Silver Member');

-- --------------------------------------------------------

--
-- Table structure for table `user_recommendations`
--

CREATE TABLE `user_recommendations` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `score` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_recommendations`
--

INSERT INTO `user_recommendations` (`id`, `user_id`, `product_id`, `score`) VALUES
(3, 4, 1, 88.00);

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `user_id`, `product_id`) VALUES
(44, 4, 2),
(46, 4, 3),
(50, 7, 2),
(51, 7, 1),
(52, 7, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `customer_metrics`
--
ALTER TABLE `customer_metrics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `fk_orders_coupon` (`coupon_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_category_id` (`category_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_recommendations`
--
ALTER TABLE `user_recommendations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `wishlist_ibfk_1` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customer_metrics`
--
ALTER TABLE `customer_metrics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user_recommendations`
--
ALTER TABLE `user_recommendations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer_metrics`
--
ALTER TABLE `customer_metrics`
  ADD CONSTRAINT `customer_metrics_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_orders_coupon` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`),
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_products_categories` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `user_recommendations`
--
ALTER TABLE `user_recommendations`
  ADD CONSTRAINT `user_recommendations_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_recommendations_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlist_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
