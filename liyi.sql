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
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `OrderID` varchar(10) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `StudentID` varchar(30) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Gender` char(1) NOT NULL,
  `PhoneNumber` varchar(20) NOT NULL,
  `PriceAmount` int(2) NOT NULL,
  `Event` varchar(30) NOT NULL,
  `Quantity` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`OrderID`, `Name`, `StudentID`, `Email`, `Gender`, `PhoneNumber`, `PriceAmount`, `Event`, `Quantity`) VALUES
('o1', 'Alvin Leow Chun Chao', '21PMD10277', 'alvinicc-pm21@student.tarc.edu.my', 'M', '0188867943', 5, 'Running', 1),
('o10', 'Teoh Ming Hui', '22PBD07345', 'teohmh-pb22@student.tarc.edu.my', 'F', '0166688912', 5, 'Gym', 1),
('o2', 'Lim Sze Mei', ' 21PBD07332', 'limsm-pb21@sludenl.tarc.edu.my', 'F', '0125678947', 10, 'Basketball', 1),
('o3', 'Chan Zhi Khang', '21PBD07683', 'chanzk-pb21@sludent.tarc.edu.my', 'M', '01118943864', 10, 'Bowling', 1),
('o4', 'Kwek Rou Yu', '21PBD09064', 'kwekry-pb21@sludent.tarc.edu.my', 'F', '0168899988', 5, 'Running', 1),
('o5', 'Joey Low Lee Joe', ' 21PBD09789', 'joeyllj-pb21@student.tarc.edu.my', 'F', '0162345292', 5, 'Gym', 1),
('o6', 'Yeoh Zhi Chuin', '21PMD09348', 'yeohzc-pm21@student.tarc.edu.my', 'F', '0124568612', 10, 'Basketball', 1),
('o7', 'Ng Kai Wen', '22PMD07894', 'ngkw-pm22@student.tarc.edu.my', 'F', '0162469252', 5, 'Running', 1),
('o8', 'Ng Hong Ze', '22PMD07994', 'nghz-pm22@student.tarc.edu.my', 'M', '0168889898', 10, 'Gym', 1),
('o9', 'Tan Yee Thern', '22PMD09586', 'tanyt-pm22@student.tarc.edu.my', 'F', '016789456', 5, 'Gym', 1);

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

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `ReviewID` varchar(30) NOT NULL,
  `StudentID` varchar(30) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Event` varchar(20) NOT NULL,
  `Categories` varchar(60) NOT NULL,
  `StarRate` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`ReviewID`, `StudentID`, `Name`, `Event`, `Categories`, `StarRate`) VALUES
('1', '21PBD07332', 'Lim Sze Mei', '🤸Gym', 'Worker Attitude(Customer Service)', 4),
('3', '22PMD09999', 'CHUNG LI YI', '🎳Bowling', 'Worker Attitude(Customer Service)', 5),
('4', '21PBD07332', 'Lim Sze Mei', '🎳Bowling', 'Worker Responsive(Customer Service)', 5),
('5', '21PBD07332', 'Lim Sze Mei', '🏃️Running', 'Overall Experience', 3);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staffID` varchar(30) NOT NULL,
  `staffName` varchar(40) NOT NULL,
  `staffEmail` varchar(70) NOT NULL,
  `staffPH` varchar(13) NOT NULL,
  `staffGender` varchar(6) NOT NULL,
  `staffPass` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staffID`, `staffName`, `staffEmail`, `staffPH`, `staffGender`, `staffPass`) VALUES
('1', 'CHUNG LI YI', 'abc123@gmail.com', '01262511111', 'F', 'password1'),
('2', 'CHUNG LI JING', 'abc123@gmail.com', '0123456', 'F', 'password2'),
('3', 'CHUNG LI LING', 'abc123@gmail.com', '0123456', 'F', 'password3');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `Name` varchar(30) NOT NULL,
  `Course` char(2) NOT NULL,
  `StudentID` varchar(10) NOT NULL,
  `Gender` char(1) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `PhoneNumber` varchar(20) NOT NULL,
  `Event` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`Name`, `Course`, `StudentID`, `Gender`, `Email`, `PhoneNumber`, `Event`) VALUES
('Wong Junyi', 'AC', '22PMD00007', 'M', 'junyi@gmail.com', '0194430012', 'BL'),
('Wong Yunqi', 'IS', '22PMD01311', 'F', 'qiqiwong@gmail.com', '01234567', 'RN');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`orderid`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`studentid`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`OrderID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`paymentid`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`ReviewID`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staffID`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`StudentID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
