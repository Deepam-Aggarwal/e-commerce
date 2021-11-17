-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 30, 2021 at 10:28 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mobile_store_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(30) NOT NULL,
  `name` varchar(250) NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `description`, `status`, `date_created`) VALUES
(1, 'Apple', 'Apple Company', 1, '2021-08-30 10:33:53'),
(2, 'Huaweii', 'Huaweii Company', 1, '2021-08-30 10:34:12'),
(3, 'Samsung', 'Samsung Company', 1, '2021-08-30 10:34:22'),
(4, 'Vivo', 'Vivo Company', 1, '2021-08-30 10:34:38'),
(5, 'Nokia', 'Nokia Company', 1, '2021-08-30 10:35:00'),
(6, 'Xiaomi', 'Xiaomi Company', 1, '2021-08-30 10:35:26'),
(7, 'MyPhone', 'MyPhone Company', 1, '2021-08-30 10:35:43');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `inventory_id` int(30) NOT NULL,
  `price` double NOT NULL,
  `quantity` int(30) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(30) NOT NULL,
  `category` varchar(250) NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`, `description`, `status`, `date_created`) VALUES
(1, 'Smart Phone', 'Smart Phone Products', 1, '2021-08-30 10:52:25'),
(2, 'Accessories', 'Phone Accessories', 1, '2021-08-30 10:52:49'),
(3, 'Mobile Hardware', 'Mobile Hardware products', 1, '2021-08-30 10:53:31'),
(4, 'External Storage', 'External Storage Products', 1, '2021-08-30 10:54:34');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(30) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` text NOT NULL,
  `default_delivery_address` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `firstname`, `lastname`, `gender`, `contact`, `email`, `password`, `default_delivery_address`, `date_created`) VALUES
(1, 'Claire', 'Blake', 'Female', '09123456789', 'cblake@gmail.com', 'cd74fae0a3adf459f73bbf187607ccea', 'Sample Address', '2021-08-30 15:32:20');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` double NOT NULL,
  `price` float NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `product_id`, `quantity`, `price`, `date_created`, `date_updated`) VALUES
(1, 1, 15, 74990, '2021-08-30 13:24:01', NULL),
(2, 2, 20, 69990, '2021-08-30 13:27:26', NULL),
(3, 3, 25, 350, '2021-08-30 15:42:20', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `delivery_address` text NOT NULL,
  `payment_method` varchar(100) NOT NULL,
  `order_type` tinyint(1) NOT NULL COMMENT '1= pickup,2= deliver',
  `amount` double NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT 0,
  `paid` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `client_id`, `delivery_address`, `payment_method`, `order_type`, `amount`, `status`, `paid`, `date_created`, `date_updated`) VALUES
(1, 1, 'Sample Address', 'Online Payment', 1, 75340, 1, 1, '2021-08-30 15:57:01', '2021-08-30 16:06:19');

-- --------------------------------------------------------

--
-- Table structure for table `order_list`
--

CREATE TABLE `order_list` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` int(30) NOT NULL,
  `price` double NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_list`
--

INSERT INTO `order_list` (`id`, `order_id`, `product_id`, `quantity`, `price`, `total`) VALUES
(1, 1, 1, 1, 74990, 74990),
(2, 1, 3, 1, 350, 350);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(30) NOT NULL,
  `brand_id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `sub_category_id` int(30) NOT NULL,
  `name` varchar(250) NOT NULL,
  `specs` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `brand_id`, `category_id`, `sub_category_id`, `name`, `specs`, `status`, `date_created`) VALUES
(1, 1, 1, 0, 'iPhone Pro Max 12', '<ul class=\\\"techspecs-list\\\" role=\\\"list\\\" style=\\\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; list-style: none;\\\"><li role=\\\"listitem\\\" style=\\\"margin: 0px; padding: 0px;\\\">Super Retina XDR display</li><li role=\\\"listitem\\\" style=\\\"margin: 0.4em 0px 0px; padding: 0px;\\\">6.7‑inch (diagonal) all‑screen OLED display</li><li role=\\\"listitem\\\" style=\\\"margin: 0.4em 0px 0px; padding: 0px;\\\">2778‑by‑1284-pixel resolution at 458 ppi</li></ul><p class=\\\"typography-caption model-caption\\\" style=\\\"margin: 0.8em 0px 0px; padding: 0px; line-height: 1.33337;\\\">The iPhone 12 Pro Max display has rounded corners that follow a beautiful curved design, and these corners are within a standard rectangle. When measured as a standard rectangular shape, the screen is 6.68 inches diagonally (actual viewable area is less).</p><p style=\\\"margin: 0.8em 0px 0px; padding: 0px; line-height: 1.33337;\\\"><br></p><ul class=\\\"techspecs-list\\\" role=\\\"list\\\" style=\\\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; list-style: none;\\\"><li role=\\\"listitem\\\" style=\\\"margin: 0px; padding: 0px;\\\">HDR display</li><li role=\\\"listitem\\\" style=\\\"margin: 0.4em 0px 0px; padding: 0px;\\\">True Tone</li><li role=\\\"listitem\\\" style=\\\"margin: 0.4em 0px 0px; padding: 0px;\\\">Wide color (P3)</li><li role=\\\"listitem\\\" style=\\\"margin: 0.4em 0px 0px; padding: 0px;\\\">Haptic Touch</li><li role=\\\"listitem\\\" style=\\\"margin: 0.4em 0px 0px; padding: 0px;\\\">2,000,000:1 contrast ratio (typical)</li><li role=\\\"listitem\\\" style=\\\"margin: 0.4em 0px 0px; padding: 0px;\\\">800 nits max brightness (typical); 1,200 nits max brightness (HDR)</li><li role=\\\"listitem\\\" style=\\\"margin: 0.4em 0px 0px; padding: 0px;\\\">Fingerprint-resistant oleophobic coating</li><li role=\\\"listitem\\\" style=\\\"margin: 0.4em 0px 0px; padding: 0px;\\\">Support for display of multiple languages and characters simultaneously</li></ul>', 1, '2021-08-30 12:19:22'),
(2, 3, 1, 0, 'Samsung Galaxy S21 Ultra 5G', '<p><p></p><p style=\\\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; vertical-align: top; line-height: 1.25; text-align: center;\\\"><span class=\\\"c_model_unit-type1\\\" style=\\\"text-align: left; margin: 0px; padding: 0px; vertical-align: top; display: block; line-height: 1.3;\\\">6.8\\\"</span></p><p style=\\\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; vertical-align: top; line-height: 1.25;\\\">Edge Quad HD+</p><dl style=\\\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; vertical-align: top; line-height: 1.25; text-align: center;\\\"><dt class=\\\"c_model_unit-type3\\\" style=\\\"text-align: left; margin: 40px 0px 0px; padding: 0px; vertical-align: top; line-height: 1.25;\\\">Dimensions:</dt><dd style=\\\"text-align: left; margin-top: 10px; margin-right: 0px; margin-bottom: 0px; padding: 0px; vertical-align: top;\\\">75.6x165.1x8.9mm</dd><dt class=\\\"c_model_unit-type3\\\" style=\\\"text-align: left; margin: 40px 0px 0px; padding: 0px; vertical-align: top; line-height: 1.25;\\\">Weight:</dt><dd style=\\\"text-align: left; margin-top: 10px; margin-right: 0px; margin-bottom: 0px; padding: 0px; vertical-align: top;\\\">229g(mmW), 227g(sub6)</dd><dt class=\\\"c_model_unit-type3\\\" style=\\\"text-align: left; margin: 40px 0px 0px; padding: 0px; vertical-align: top; line-height: 1.25;\\\">Biometric Authentication:</dt></dl><p></p><p></p><dl style=\\\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; vertical-align: top; line-height: 1.25; text-align: center;\\\"><dt class=\\\"c_model_unit-type3\\\" style=\\\"text-align: left; margin: 40px 0px 0px; padding: 0px; vertical-align: top; line-height: 1.25;\\\">Ultrasonic Fingerprint Face recognition</dt></dl></p><h3 class=\\\"c_model_title-type1\\\" style=\\\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; vertical-align: top;\\\">Super Smooth 120Hz Display</h3><p><p></p></p><dl style=\\\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; vertical-align: top; line-height: 1.25; text-align: center;\\\"><dt class=\\\"c_model_unit-type3\\\" style=\\\"text-align: left; margin: 40px 0px 0px; padding: 0px; vertical-align: top; line-height: 1.25;\\\"><p class=\\\"c_model_desc-type1\\\" style=\\\"margin: 8px 0px 0px; padding: 0px; vertical-align: top;\\\">Our smoothest scrolling screen keeps up with all your feeds.</p><h3 class=\\\"c_model_title-type1\\\" style=\\\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; vertical-align: top;\\\">Durability</h3><p class=\\\"c_model_desc-type1\\\" style=\\\"margin: 8px 0px 0px; padding: 0px; vertical-align: top;\\\">Protected by the toughest Gorilla Glass yet and water and dust resistance.<span style=\\\"line-height: 1.2; position: relative; top: 0px; margin: 0px; padding: 0px; vertical-align: top;\\\"><a href=\\\"https://www.samsung.com/ph/smartphones/galaxy-s21-ultra-5g/models/?cid=ph_paid_ppc_google_s-series_always-on_none_text_none_none_AG~Warm%20-%20S21%20Ultra%20-%20Specs_MK~ph_AT~ta_MD~w_AI~&amp;sem-palette-warm#desc-section\\\" class=\\\"click_sup\\\" title=\\\"See disclaimer\\\" style=\\\"outline-offset: 0px; vertical-align: top;\\\">2</a>,&nbsp;<a href=\\\"https://www.samsung.com/ph/smartphones/galaxy-s21-ultra-5g/models/?cid=ph_paid_ppc_google_s-series_always-on_none_text_none_none_AG~Warm%20-%20S21%20Ultra%20-%20Specs_MK~ph_AT~ta_MD~w_AI~&amp;sem-palette-warm#desc-section\\\" class=\\\"click_sup\\\" title=\\\"See disclaimer\\\" style=\\\"outline-offset: 0px; vertical-align: top;\\\">3</a></span></p></dt></dl>', 1, '2021-08-30 13:15:11'),
(3, 1, 2, 2, 'iPhone Pro Max 12 Case Cover', '<p style=\\\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\\\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur rhoncus posuere accumsan. Maecenas eget aliquam odio, ac vehicula leo. Praesent magna erat, consectetur elementum leo nec, ornare congue dolor. Sed tristique magna non lorem tristique, vitae dictum velit posuere. Aliquam in tempor dui, nec scelerisque mi. Interdum et malesuada fames ac ante ipsum primis in faucibus. Curabitur venenatis urna justo, eu dapibus diam venenatis vel. Proin tincidunt leo a elit mollis, in sollicitudin est iaculis. In metus urna, cursus non ullamcorper sed, cursus id velit. Nullam dui justo, gravida sit amet sollicitudin vel, tempor ac diam. Phasellus egestas quis metus in condimentum. Pellentesque non dapibus eros, eu facilisis ipsum. Cras suscipit metus iaculis, varius est eu, blandit metus. Mauris sed diam eros. Curabitur gravida pulvinar metus a euismod. Cras consequat metus eros, id tincidunt massa aliquam ut.</p><p style=\\\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\\\">Sed sit amet eleifend nisl. Aliquam ullamcorper nisl sed eros commodo cursus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin leo metus, malesuada ac viverra quis, placerat in magna. Morbi suscipit justo vitae tincidunt venenatis. Aliquam ex odio, sagittis quis tincidunt id, semper ut orci. Cras consequat dui vel vestibulum volutpat. Maecenas dapibus purus quis magna consectetur placerat. Donec porttitor massa eu lacus aliquet bibendum.</p><p style=\\\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\\\">Sed ut ex sed elit blandit ultrices. Curabitur non suscipit purus, eu facilisis felis. Proin ac nisl commodo, efficitur tortor mattis, elementum velit. Duis vel mattis justo. Pellentesque sodales, enim vel blandit vulputate, nunc nunc pretium dolor, vitae cursus massa erat consectetur ex. Donec varius tristique dui vitae semper. Quisque dictum volutpat vulputate. Morbi dui enim, auctor vel velit vel, sollicitudin scelerisque metus. Duis in turpis a elit luctus vestibulum.</p>', 1, '2021-08-30 15:42:08');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `total_amount` double NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `order_id`, `total_amount`, `date_created`) VALUES
(1, 1, 75340, '2021-08-30 15:57:01');

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` int(30) NOT NULL,
  `parent_id` int(30) NOT NULL,
  `sub_category` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `parent_id`, `sub_category`, `description`, `status`, `date_created`) VALUES
(1, 3, 'Batteries', 'Mobile Batteries', 1, '2021-08-30 11:28:40'),
(2, 2, 'Phone Case Cover', 'Mobile Phones Cases', 1, '2021-08-30 11:29:15'),
(3, 4, 'Micro SD Card', 'Micro SD Cards', 1, '2021-08-30 11:29:40');

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'E-Store Admin Page'),
(6, 'short_name', 'E-Store'),
(11, 'logo', 'uploads/1630289100_mobile.jpg'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/1630289280_wallpaper.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/1624240500_avatar.png', NULL, 1, '2021-01-20 14:02:37', '2021-06-21 09:55:07');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
