-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 07, 2023 at 05:56 PM
-- Server version: 10.3.38-MariaDB-0ubuntu0.20.04.1
-- PHP Version: 7.4.3-4ubuntu2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vivchand_2_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `Crop_Diseases`
--

CREATE TABLE `Crop_Diseases` (
  `Disease_ID` int(11) NOT NULL,
  `Disease_Name` varchar(50) DEFAULT NULL,
  `Symptoms` varchar(255) DEFAULT NULL,
  `Treatment_Method` varchar(255) DEFAULT NULL,
  `Severity` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Crop_Diseases`
--

INSERT INTO `Crop_Diseases` (`Disease_ID`, `Disease_Name`, `Symptoms`, `Treatment_Method`, `Severity`) VALUES
(1, 'Rust', 'Yellowing leaves', 'Fungicide spray', 'Low'),
(2, 'Blight', 'Wilting plants', 'Copper treatment', 'Moderate'),
(3, 'Rot', 'Brown spots', 'Fungicide spray', 'High'),
(4, 'Smut', 'Black growths', 'Isolation', 'Low'),
(5, 'Mildew', 'White powdery spots', 'Pruning and spray', 'Moderate'),
(6, 'Aphids', 'Curling leaves', 'Insecticidal soap', 'Low'),
(7, 'Caterpillars', 'Holes in leaves', 'Manual removal', 'Moderate'),
(8, 'Whitefly', 'Sticky residue', 'Neem oil spray', 'Low');

-- --------------------------------------------------------

--
-- Table structure for table `Crop_Disease_Association`
--

CREATE TABLE `Crop_Disease_Association` (
  `Crop_ID` int(11) NOT NULL,
  `Disease_ID` int(11) NOT NULL,
  `Infection_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Crop_Disease_Association`
--

INSERT INTO `Crop_Disease_Association` (`Crop_ID`, `Disease_ID`, `Infection_Date`) VALUES
(1, 1, '2023-03-04'),
(1, 3, '2023-03-01'),
(2, 2, '2023-06-03'),
(4, 4, '2023-06-24'),
(5, 5, '2023-07-20'),
(6, 2, '2023-08-11'),
(7, 7, '2023-04-28'),
(8, 8, '2023-07-26');

-- --------------------------------------------------------

--
-- Table structure for table `Crop_Planting`
--

CREATE TABLE `Crop_Planting` (
  `Planting_ID` int(11) NOT NULL,
  `Crop_ID` int(11) DEFAULT NULL,
  `Field_ID` int(11) DEFAULT NULL,
  `Planting_Date` date DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Planting_Method` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Crop_Planting`
--

INSERT INTO `Crop_Planting` (`Planting_ID`, `Crop_ID`, `Field_ID`, `Planting_Date`, `Quantity`, `Planting_Method`) VALUES
(1, 1, 1, '2023-01-20', 200, 'Drill Seeding'),
(2, 2, 2, '2023-03-15', 300, 'Row Planting'),
(3, 3, 3, '2023-04-25', 250, 'Direct Seeding'),
(4, 4, 4, '2023-02-10', 180, 'Row Planting'),
(5, 5, 5, '2023-03-30', 220, 'Drill Seeding'),
(6, 6, 6, '2023-05-18', 150, 'Precision Planting'),
(7, 7, 7, '2023-02-22', 190, 'Trench Planting'),
(8, 8, 8, '2023-01-15', 350, 'Sett Propagation');

-- --------------------------------------------------------

--
-- Table structure for table `Crop_Production`
--

CREATE TABLE `Crop_Production` (
  `Crop_ID` int(11) NOT NULL,
  `Crop_Name` varchar(50) DEFAULT NULL,
  `Crop_Variety` varchar(50) DEFAULT NULL,
  `Yield` int(11) DEFAULT NULL,
  `Date_Planted` date DEFAULT NULL,
  `Date_Harvested` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Crop_Production`
--

INSERT INTO `Crop_Production` (`Crop_ID`, `Crop_Name`, `Crop_Variety`, `Yield`, `Date_Planted`, `Date_Harvested`) VALUES
(1, 'Wheat', 'Durum', 500, '2023-01-15', '2023-05-20'),
(2, 'Corn', 'Yellow', 700, '2023-03-10', '2023-08-15'),
(3, 'Rice', 'Basmati', 600, '2023-04-22', '2023-09-30'),
(4, 'Soybean', 'Altona', 450, '2023-02-05', '2023-07-12'),
(5, 'Barley', 'Haybet', 520, '2023-03-28', '2023-08-30'),
(6, 'Cotton', 'Pima', 350, '2023-05-14', '2023-10-18'),
(7, 'Potato', 'Russet', 480, '2023-02-18', '2023-07-25'),
(8, 'Sugarcane', 'Tropical Cane', 90, '2023-04-20', '2023-09-30');

-- --------------------------------------------------------

--
-- Table structure for table `Crop_Rotation_History`
--

CREATE TABLE `Crop_Rotation_History` (
  `Rotation_ID` int(11) NOT NULL,
  `Field_ID` int(11) DEFAULT NULL,
  `Previous_Crop` varchar(50) DEFAULT NULL,
  `Current_Crop` varchar(50) DEFAULT NULL,
  `Rotation_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Crop_Rotation_History`
--

INSERT INTO `Crop_Rotation_History` (`Rotation_ID`, `Field_ID`, `Previous_Crop`, `Current_Crop`, `Rotation_Date`) VALUES
(1, 1, 'Soybean', 'Wheat', '2023-09-20'),
(2, 2, 'Barley', 'Corn', '2024-01-15'),
(3, 3, 'Wheat', 'Rice', '2024-01-26'),
(4, 4, 'Corn', 'Soybean', '2024-01-10'),
(5, 5, 'Rice', 'Barley', '2023-12-30'),
(6, 6, 'Wheat', 'Cotton', '2024-02-18'),
(7, 7, 'Sugarcane', 'Potato', '2023-12-28'),
(8, 8, 'Potato', 'Sugarcane', '2024-02-22');

-- --------------------------------------------------------

--
-- Table structure for table `Crop_Storage`
--

CREATE TABLE `Crop_Storage` (
  `Storage_ID` int(11) NOT NULL,
  `Storage_Location` varchar(50) DEFAULT NULL,
  `Capacity` int(11) DEFAULT NULL,
  `Storage_Conditions` varchar(50) DEFAULT NULL,
  `Crop_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Crop_Storage`
--

INSERT INTO `Crop_Storage` (`Storage_ID`, `Storage_Location`, `Capacity`, `Storage_Conditions`, `Crop_ID`) VALUES
(1, 'Vertical Cold Storage', 1000, 'Dry and Cool', 1),
(2, 'The Container Store', 800, 'Controlled Humidity', 2),
(3, 'Storage of America', 1200, 'Cool and Dark', 3),
(4, 'SecurCare Self Storage', 900, 'Ventilated', 4),
(5, 'Storage Express', 1100, 'Dry and Cool', 5),
(6, 'Morris Street Self Storage', 750, 'Controlled Humidity', 6),
(7, 'CubeSmart Self Storage', 1300, 'Cool and Dark', 7),
(8, 'Extra Space Storage', 950, 'Ventilated', 8);

-- --------------------------------------------------------

--
-- Table structure for table `Farm_Labour`
--

CREATE TABLE `Farm_Labour` (
  `Labour_ID` int(11) NOT NULL,
  `Labour_Name` varchar(50) DEFAULT NULL,
  `Labour_Role` varchar(50) DEFAULT NULL,
  `Date_Hired` date DEFAULT NULL,
  `Date_Terminated` date DEFAULT NULL,
  `Field_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Farm_Labour`
--

INSERT INTO `Farm_Labour` (`Labour_ID`, `Labour_Name`, `Labour_Role`, `Date_Hired`, `Date_Terminated`, `Field_ID`) VALUES
(1, 'John Doe', 'Harvester', '2023-01-05', '2023-06-15', 1),
(2, 'Jane Smith', 'Planter', '2023-02-20', '2023-09-10', 2),
(3, 'Mark Johnson', 'Irrigator', '2023-04-10', '2023-08-30', 3),
(4, 'Emily White', 'Scout', '2023-03-01', '2023-07-20', 4),
(5, 'Mike Brown', 'Harvester', '2023-05-15', '2023-10-05', 5),
(6, 'Sarah Jones', 'Planter', '2023-02-28', '2023-09-30', 6),
(7, 'Chris Davis', 'Irrigator', '2023-03-15', '2023-08-15', 7),
(8, 'Olivia Green', 'Scout', '2023-01-20', '2023-07-25', 8);

-- --------------------------------------------------------

--
-- Table structure for table `Field_Information`
--

CREATE TABLE `Field_Information` (
  `Field_ID` int(11) NOT NULL,
  `Field_Name` varchar(50) DEFAULT NULL,
  `Location` varchar(100) DEFAULT NULL,
  `Area` int(11) DEFAULT NULL,
  `Crop_ID` int(11) DEFAULT NULL,
  `Soil_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Field_Information`
--

INSERT INTO `Field_Information` (`Field_ID`, `Field_Name`, `Location`, `Area`, `Crop_ID`, `Soil_ID`) VALUES
(1, 'Indiana farms', '640 Eskenazi Ave, IN', 50, 1, 1),
(2, 'New age Farms', '415 E 10th St, IN', 40, 2, 2),
(3, 'Happy Farms', '3415 E 10th St, IN', 60, 3, 3),
(4, 'Kael Urban Farms', '5400 Guion Rd, IN', 45, 4, 4),
(5, 'Growing Places', '727 N Oriental St, IN', 55, 5, 5),
(6, 'Roka Farms', '6845 Massachusetts Ave, IN', 70, 6, 6),
(7, 'Armstrong Golden Harvest Farm', '7815 S Sherman Dr, IN', 30, 7, 7),
(8, 'Mud Creek Farm', '9375 E 86th St, IN', 80, 8, 8);

-- --------------------------------------------------------

--
-- Table structure for table `Irrigation_Methods`
--

CREATE TABLE `Irrigation_Methods` (
  `Irrigation_ID` int(11) NOT NULL,
  `Irrigation_Type` varchar(50) DEFAULT NULL,
  `Water_Source` varchar(50) DEFAULT NULL,
  `Field_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Irrigation_Methods`
--

INSERT INTO `Irrigation_Methods` (`Irrigation_ID`, `Irrigation_Type`, `Water_Source`, `Field_ID`) VALUES
(1, 'Drip Irrigation', 'Well Water', 1),
(2, 'Sprinkler System', 'River Water', 2),
(3, 'Flood Irrigation', 'Pond Water', 3),
(4, 'Pivot Irrigation', 'Well Water', 4),
(5, 'Drip Irrigation', 'River Water', 5),
(6, 'Sprinkler System', 'Pond Water', 6),
(7, 'Flood Irrigation', 'Well Water', 7),
(8, 'Pivot Irrigation', 'River Water', 8);

-- --------------------------------------------------------

--
-- Table structure for table `Market_Prices`
--

CREATE TABLE `Market_Prices` (
  `Price_ID` int(11) NOT NULL,
  `Crop_ID` int(11) DEFAULT NULL,
  `Market_Name` varchar(50) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Price` decimal(4,1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Market_Prices`
--

INSERT INTO `Market_Prices` (`Price_ID`, `Crop_ID`, `Market_Name`, `Date`, `Price`) VALUES
(1, 1, 'Indianapolis Winter Farmers Market', '2023-06-05', '5.0'),
(2, 2, 'Original Farmers Market', '2023-08-25', '4.5'),
(3, 3, 'Farmers Market at Wishard', '2023-10-08', '6.2'),
(4, 4, 'Southport Farmers Market', '2023-08-22', '7.1'),
(5, 5, 'Market on Morris', '2023-09-15', '4.8'),
(6, 1, 'Riverside Farmers Market', '2023-08-10', '5.3'),
(7, 7, 'Speedway Farmers Market', '2023-09-13', '6.7'),
(8, 8, 'Pike Farmers Market', '2023-10-06', '7.5');

-- --------------------------------------------------------

--
-- Table structure for table `Pesticide_Usage`
--

CREATE TABLE `Pesticide_Usage` (
  `Pesticide_ID` int(11) NOT NULL,
  `Pesticide_Name` varchar(50) DEFAULT NULL,
  `Applied_Date` date DEFAULT NULL,
  `Total_Quantity_Applied` decimal(5,1) DEFAULT NULL,
  `Crop_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Pesticide_Usage`
--

INSERT INTO `Pesticide_Usage` (`Pesticide_ID`, `Pesticide_Name`, `Applied_Date`, `Total_Quantity_Applied`, `Crop_ID`) VALUES
(1, 'propiconazole', '2023-03-10', '5.0', 1),
(2, 'azoxystrobin', '2023-06-07', '3.5', 2),
(3, 'Carbendazim', '2023-08-02', '4.0', 3),
(4, 'Carbaryl', '2023-06-28', '2.5', 4),
(5, 'Patch Pro', '2023-07-24', '4.0', 5),
(6, 'Acephate', '2023-08-15', '3.0', 6),
(7, 'Spinosad', '2023-05-01', '3.5', 7),
(8, 'imidacloprid', '2023-07-30', '6.0', 8);

-- --------------------------------------------------------

--
-- Table structure for table `Soil_Characteristics`
--

CREATE TABLE `Soil_Characteristics` (
  `Soil_ID` int(11) NOT NULL,
  `Soil_Type` varchar(50) DEFAULT NULL,
  `pH_Level` decimal(3,1) DEFAULT NULL,
  `Nutrient_Content` varchar(50) DEFAULT NULL,
  `Moisture_Level` varchar(50) DEFAULT NULL,
  `Field_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Soil_Characteristics`
--

INSERT INTO `Soil_Characteristics` (`Soil_ID`, `Soil_Type`, `pH_Level`, `Nutrient_Content`, `Moisture_Level`, `Field_ID`) VALUES
(1, 'Loam', '6.5', 'High', 'Medium', 1),
(2, 'Sandy', '7.2', 'Medium', 'Low', 2),
(3, 'Clay', '6.8', 'High', 'High', 3),
(4, 'Silt', '7.0', 'Low', 'Medium', 4),
(5, 'Peat', '5.8', 'Medium', 'High', 5),
(6, 'Chalk', '7.5', 'Low', 'Low', 6),
(7, 'Loamy', '6.6', 'High', 'Medium', 7),
(8, 'Silty', '7.1', 'Medium', 'High', 8);

-- --------------------------------------------------------

--
-- Table structure for table `Weather_Data`
--

CREATE TABLE `Weather_Data` (
  `Weather_ID` int(11) NOT NULL,
  `Date` date DEFAULT NULL,
  `Temperature` decimal(4,1) DEFAULT NULL,
  `Humidity` int(11) DEFAULT NULL,
  `Precipitation` decimal(3,1) DEFAULT NULL,
  `Field_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Weather_Data`
--

INSERT INTO `Weather_Data` (`Weather_ID`, `Date`, `Temperature`, `Humidity`, `Precipitation`, `Field_ID`) VALUES
(1, '2023-01-20', '25.5', 60, '0.5', 1),
(2, '2023-02-15', '28.0', 55, '0.3', 2),
(3, '2023-03-30', '22.5', 70, '1.0', 3),
(4, '2023-01-15', '20.0', 75, '0.8', 4),
(5, '2023-04-10', '30.5', 50, '0.2', 5),
(6, '2023-05-25', '26.0', 65, '0.6', 6),
(7, '2023-02-28', '24.5', 68, '0.4', 7),
(8, '2023-01-10', '18.0', 80, '1.5', 8);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Crop_Diseases`
--
ALTER TABLE `Crop_Diseases`
  ADD PRIMARY KEY (`Disease_ID`);

--
-- Indexes for table `Crop_Disease_Association`
--
ALTER TABLE `Crop_Disease_Association`
  ADD PRIMARY KEY (`Crop_ID`,`Disease_ID`),
  ADD KEY `Disease_ID` (`Disease_ID`);

--
-- Indexes for table `Crop_Planting`
--
ALTER TABLE `Crop_Planting`
  ADD PRIMARY KEY (`Planting_ID`),
  ADD KEY `Crop_ID` (`Crop_ID`),
  ADD KEY `Field_ID` (`Field_ID`);

--
-- Indexes for table `Crop_Production`
--
ALTER TABLE `Crop_Production`
  ADD PRIMARY KEY (`Crop_ID`);

--
-- Indexes for table `Crop_Rotation_History`
--
ALTER TABLE `Crop_Rotation_History`
  ADD PRIMARY KEY (`Rotation_ID`),
  ADD KEY `Field_ID` (`Field_ID`);

--
-- Indexes for table `Crop_Storage`
--
ALTER TABLE `Crop_Storage`
  ADD PRIMARY KEY (`Storage_ID`),
  ADD KEY `Crop_ID` (`Crop_ID`);

--
-- Indexes for table `Farm_Labour`
--
ALTER TABLE `Farm_Labour`
  ADD PRIMARY KEY (`Labour_ID`),
  ADD KEY `Field_ID` (`Field_ID`);

--
-- Indexes for table `Field_Information`
--
ALTER TABLE `Field_Information`
  ADD PRIMARY KEY (`Field_ID`),
  ADD KEY `fk_crop_reference` (`Crop_ID`),
  ADD KEY `fk_soil_reference` (`Soil_ID`);

--
-- Indexes for table `Irrigation_Methods`
--
ALTER TABLE `Irrigation_Methods`
  ADD PRIMARY KEY (`Irrigation_ID`),
  ADD KEY `Field_ID` (`Field_ID`);

--
-- Indexes for table `Market_Prices`
--
ALTER TABLE `Market_Prices`
  ADD PRIMARY KEY (`Price_ID`),
  ADD KEY `Crop_ID` (`Crop_ID`);

--
-- Indexes for table `Pesticide_Usage`
--
ALTER TABLE `Pesticide_Usage`
  ADD PRIMARY KEY (`Pesticide_ID`),
  ADD KEY `Crop_ID` (`Crop_ID`);

--
-- Indexes for table `Soil_Characteristics`
--
ALTER TABLE `Soil_Characteristics`
  ADD PRIMARY KEY (`Soil_ID`),
  ADD KEY `Field_ID` (`Field_ID`);

--
-- Indexes for table `Weather_Data`
--
ALTER TABLE `Weather_Data`
  ADD PRIMARY KEY (`Weather_ID`),
  ADD KEY `Field_ID` (`Field_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Crop_Disease_Association`
--
ALTER TABLE `Crop_Disease_Association`
  ADD CONSTRAINT `Crop_Disease_Association_ibfk_1` FOREIGN KEY (`Crop_ID`) REFERENCES `Crop_Production` (`Crop_ID`),
  ADD CONSTRAINT `Crop_Disease_Association_ibfk_2` FOREIGN KEY (`Disease_ID`) REFERENCES `Crop_Diseases` (`Disease_ID`);

--
-- Constraints for table `Crop_Planting`
--
ALTER TABLE `Crop_Planting`
  ADD CONSTRAINT `Crop_Planting_ibfk_1` FOREIGN KEY (`Crop_ID`) REFERENCES `Crop_Production` (`Crop_ID`),
  ADD CONSTRAINT `Crop_Planting_ibfk_2` FOREIGN KEY (`Field_ID`) REFERENCES `Field_Information` (`Field_ID`);

--
-- Constraints for table `Crop_Rotation_History`
--
ALTER TABLE `Crop_Rotation_History`
  ADD CONSTRAINT `Crop_Rotation_History_ibfk_1` FOREIGN KEY (`Field_ID`) REFERENCES `Field_Information` (`Field_ID`);

--
-- Constraints for table `Crop_Storage`
--
ALTER TABLE `Crop_Storage`
  ADD CONSTRAINT `Crop_Storage_ibfk_1` FOREIGN KEY (`Crop_ID`) REFERENCES `Crop_Production` (`Crop_ID`);

--
-- Constraints for table `Farm_Labour`
--
ALTER TABLE `Farm_Labour`
  ADD CONSTRAINT `Farm_Labour_ibfk_1` FOREIGN KEY (`Field_ID`) REFERENCES `Field_Information` (`Field_ID`);

--
-- Constraints for table `Field_Information`
--
ALTER TABLE `Field_Information`
  ADD CONSTRAINT `fk_crop_reference` FOREIGN KEY (`Crop_ID`) REFERENCES `Crop_Production` (`Crop_ID`),
  ADD CONSTRAINT `fk_soil_reference` FOREIGN KEY (`Soil_ID`) REFERENCES `Soil_Characteristics` (`Soil_ID`);

--
-- Constraints for table `Irrigation_Methods`
--
ALTER TABLE `Irrigation_Methods`
  ADD CONSTRAINT `Irrigation_Methods_ibfk_1` FOREIGN KEY (`Field_ID`) REFERENCES `Field_Information` (`Field_ID`);

--
-- Constraints for table `Market_Prices`
--
ALTER TABLE `Market_Prices`
  ADD CONSTRAINT `Market_Prices_ibfk_1` FOREIGN KEY (`Crop_ID`) REFERENCES `Crop_Production` (`Crop_ID`);

--
-- Constraints for table `Pesticide_Usage`
--
ALTER TABLE `Pesticide_Usage`
  ADD CONSTRAINT `Pesticide_Usage_ibfk_1` FOREIGN KEY (`Crop_ID`) REFERENCES `Crop_Production` (`Crop_ID`);

--
-- Constraints for table `Soil_Characteristics`
--
ALTER TABLE `Soil_Characteristics`
  ADD CONSTRAINT `Soil_Characteristics_ibfk_1` FOREIGN KEY (`Field_ID`) REFERENCES `Field_Information` (`Field_ID`);

--
-- Constraints for table `Weather_Data`
--
ALTER TABLE `Weather_Data`
  ADD CONSTRAINT `Weather_Data_ibfk_1` FOREIGN KEY (`Field_ID`) REFERENCES `Field_Information` (`Field_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
