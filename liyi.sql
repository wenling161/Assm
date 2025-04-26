-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 19, 2024 at 11:33 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `liyi`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `orderid` varchar(255) NOT NULL,
  `studentid` varchar(255) NOT NULL,
  `product_id` varchar(6) NOT NULL,
  `price` double NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `studentid` varchar(20) NOT NULL,
  `fullname` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `phonenumber` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`studentid`, `fullname`, `email`, `gender`, `phonenumber`, `password`) VALUES
('21PBD07332', 'Lim Sze Mei', 'limsm-pb21@student.tarc.edu.my', 'F', '012-1234567', 'dsa'),
('21PBD07683', 'Chan Zhi Khang', 'chanzk-pb21@student.tarc.edu.my', 'M', '01118943864', 'chanzk584C'),
('21PBD09064', 'Kwek Rou Yu', 'kwekry-pb21@student.tarc.edu.my', 'F', '0168899988', 'kwekry6K'),
('21PBD09789', 'Joey Low Lee Joe', 'joeyllj-pb21@student.tarc.edu.my', 'F', '0162345292', 'joeyllj7BTS'),
('21PMD09348', 'Yeoh Zhi Chuin', 'yeohzc-pm21@student.tarc.edu.my', 'F', '0124568612', 'yeohzc7B'),
('21PMD10277', 'Alvin Leow Chun Chao', 'alvinlcc-pm21@student.tarc.edu.my', 'M', '0188867943', 'alvinlcc1M'),
('22PBD07345', 'Teoh Ming Hui', 'teohmh-pb22@student.tarc.edu.my', 'F', '0166688912', 'teohmh8C'),
('22PMD07111', 'Them Li Zhen', 'lz@gmail.com', 'F', '0123457493', 'Abcdefg123'),
('22PMD07800', 'Ng Kai Wen', 'abc123@gmail.com', 'F', '0123456444', '016UMlumyk'),
('22PMD07894', 'Ng Kai Wen', 'ngkw-pm22@student.tarc.edu.my', 'F', '0162469252', 'Abc12345'),
('22PMD09999', 'CHUNG LI YI', 'chungly-pm22@student.tarc.edu.my', 'F', '016457894', '9Mingsugab');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `paymentid` varchar(20) NOT NULL,
  `studentid` varchar(20) NOT NULL,
  `productid` varchar(6) NOT NULL,
  `totalamount` double NOT NULL,
  `productqty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`paymentid`, `studentid`, `productid`, `totalamount`, `productqty`) VALUES
('P000001', '21PBD07332', 'PR0003', 2.5, 1),
('P000002', '21PBD07332', 'PR0002', 4.5, 1),
('P000003', '21PBD07332', 'PR0000', 2.3, 1),
('P000004', '21PBD07332', 'PR0010', 70, 1),
('P000005', '21PBD07332', 'PR0000', 2.3, 1),
('P000006', '21PBD07332', 'PR0006', 8, 1),
('P000007', '21PBD07332', 'PR0003', 2.5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` varchar(6) NOT NULL,
  `product_name` varchar(500) NOT NULL,
  `product_description` varchar(500) NOT NULL,
  `product_stock` int(11) NOT NULL,
  `product_price` double NOT NULL,
  `product_picture` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `product_description`, `product_stock`, `product_price`, `product_picture`) VALUES
('PR0000', 'Graduation Season Keychain Pendant Dome Gift Metal Keychain', 'Commemorate the graduation season with our elegant keychain pendant! Crafted from durable metal and encased in a dome, this keychain is a timeless keepsake of your academic achievement. Perfect for attaching to keys or bags, it serves as a daily reminder of your hard work and dedication. Order now and cherish the memories of graduation season forever! 🎓', 100, 2.3, 'Keychain1.png'),
('PR0002', 'Titanium Steel Keychains Graduation', 'Mark this milestone with our sleek and durable titanium steel keychains! Let these keychains symbolize your achievements and memories for years to come. Order now and cherish the Class of 2024 forever! 🎓', 100, 4.5, 'Keychain2.png'),
('PR0003', 'Fashion Graduation Gown Metal Keychains Beautiful Car Keyholder Accessories', 'Crafted with meticulous detail, these keychains are more than just accessories—they are symbols of your academic success and journey. Perfect for adorning your car keys or bag, they add a touch of sophistication to any ensemble. Whether as a graduation gift or personal keepsake, these keychains are sure to be cherished for years to come. Order now and celebrate your accomplishments in style! 🎓', 100, 2.5, 'Keychain3.png'),
('PR0004', 'Student Stationery Soft-Headed Pastel Light Color Marker Highlighter Pen (6Pcs Per Box)', 'Make your important points stand out with our vibrant highlighter pen! Featuring a precise chisel tip and quick-drying ink, it is perfect for studying or organizing notes. Add a pop of color to your work today!', 100, 5, 'Highlighter.png'),
('PR0005', '100 Sheets Gradify Color Sticky Note Memo Pad', 'Ace your exams and stay organized with our colorful sticky notes! Perfect for marking pages, jotting down key points, and creating study aids. Grab yours today and make studying a breeze!', 100, 3, 'StickyNote.png'),
('PR0006', '200 Page Notebook / A4 Cute Book', 'Elevate your note-taking game with our sleek, durable notebook. Perfect for jotting down ideas, sketching, or journaling on the go. Get yours today!', 100, 8, 'Notebook.png'),
('PR0007', 'Handmade 35cm Crochet Graduation Doll', 'Celebrate the big day with our adorable crochet doll! Dressed in a graduation cap and gown, this 35cm handmade keepsake is the perfect gift or decoration. Order now and cherish the memories!', 100, 18, 'doll.png'),
('PR0008', 'Cute Graduation Convocation Bear Plush Teddy Bear', 'Dressed in a graduation cap and gown, our plush teddy bear is the perfect keepsake for the big day. Order now and add a touch of joy to the celebration!', 100, 18, 'TeddyBear.png'),
('PR0009', 'Graduation Handmade Wool Sunflower', 'Brighten up graduation day with our charming handmade wool sunflower! Perfect as a decoration or gift, it adds a touch of warmth and beauty to the celebration. Order now and make the occasion unforgettable!', 100, 19, 'WoolFlower.png'),
('PR0010', 'Graduation Soap Flower Bouquet', '🔥Celebrate achievement with our beautiful soap flower bouquet! Handcrafted to perfection, it is a thoughtful way to mark this special milestone. Order now and add a touch of charm to the celebration!', 100, 70, 'SoapFlower.png'),
('PR0011', 'Graduation Real Flower Bear Bouquet', 'Make graduation day extra special with our delightful real flower bear bouquet! Each adorable bear is crafted from fresh, fragrant flowers, adding a touch of charm to the celebration. Whether as a centerpiece or a heartfelt gift for the graduate, this unique bouquet is sure to bring smiles and joy!', 100, 53, 'RealFlower.png'),
('PR0012', 'Graduation wool flower bear bouquet/ Ins Sunflower Bouquet Artificial Hand Woven Flowers Ornament Graduation Gifts Home Decor', 'Celebrate achievement with our adorable graduation wool flower bear bouquet! Each bear, crafted from soft wool and adorned with vibrant flowers, adds a whimsical charm to the occasion. Whether as a centerpiece or a heartfelt gift for the graduate, this unique bouquet captures the spirit of the day.', 100, 40, 'WoolBouquet.png'),
('PR0013', '4D Daisy Flower Korean Style Balloon Graduation Colourful Decoration Gift', 'Daisy Flower is very trendy and cute. It is made from good quality aluminum foil and suitable for graduation. It will make everything looks pretty and great for photography.', 100, 2, 'Balloon1.png'),
('PR0014', '260cm Long Graduation Flower Bouquet Balloon', 'Stretching 260cm long, it is a stunning centerpiece for any celebration. Adorned with vibrant flowers, this balloon adds a touch of whimsy and elegance to the occasion. Perfect for photo backdrops or as a decorative accent, it is sure to wow guests and honor the graduate in style. Order now and let the magic of this balloon bouquet elevate your festivities! 🎓', 100, 20, 'Balloon2.png'),
('PR0015', '6pcs per set We Did it Bachelors Cap Balloon Graduation Decorations Class Of 2024 Graduation Party Decor', 'Make your 2024 graduation party unforgettable with our vibrant balloon decorations! This set includes 6 piece of cute balloon that perfect for celebrating your achievement in style. Let the class of 2024 shine with these fun and memorable decorations. Order now and get ready to celebrate in grand style! 🎓', 100, 7.45, 'Balloon3.png');

-- --------------------------------------------------------

-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`orderid`);

--
CREATE INDEX idx_studentid ON member(studentid);
--
ALTER TABLE `cart`
  ADD CONSTRAINT `fk_student_cart`
  FOREIGN KEY (`studentid`)
  REFERENCES `member`(`studentid`);
--
CREATE INDEX idx_product_id ON product(product_id);
--
ALTER TABLE `cart` 
  ADD CONSTRAINT `fk_product_cart` 
  FOREIGN KEY (`product_id`) 
  REFERENCES `product`(`product_id`);
--

-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`studentid`);
--

-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`paymentid`);
--
--
ALTER TABLE `payment` 
  ADD CONSTRAINT `fk_student_payment` 
  FOREIGN KEY (`studentid`) 
  REFERENCES `member`(`studentid`);
--

-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
