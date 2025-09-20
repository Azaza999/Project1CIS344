
DROP DATABASE IF EXISTS `bstore`;
CREATE DATABASE `bstore`;
USE `bstore`;

--
-- Table structure for table `Author`
--
CREATE TABLE `Author` (
  `AuthorID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(45) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  `BirthYear` int NOT NULL,
  `DeathYear` int NOT NULL,
  `Nationality` varchar(45) NOT NULL,
  PRIMARY KEY (`AuthorID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Data for table `Author`
--
Select * from Author;
INSERT INTO `Author` (`AuthorID`, `FirstName`, `LastName`, `BirthYear`, `DeathYear`, `Nationality`) VALUES
(1, 'Jane', 'Austen', 1775, 1817, 'British'),
(10, 'Harper', 'Lee', 1926, 2016, 'American'),
(11, 'Fyodor', 'Dostoevsky', 1821, 1881, 'Russian'),
(12, 'George', 'Orwell', 1903, 1950, 'British'),
(13, 'Virginia', 'Woolf', 1882, 1941, 'British'),
(14, 'Gabriel', 'García Márquez', 1927, 2014, 'Colombian'),
(15, 'J.D', 'Salinger', 1919, 2010, 'American'),
(16, 'Leo', 'Tolstoy', 1828, 1910, 'Russian'),
(17, 'Mary', 'Shelley', 1797, 1851, 'British'),
(18, 'Herman', 'Melville', 1819, 1891, 'American');


--
-- Table structure for table `Publisher`
--
CREATE TABLE `Publisher` (
  `PublisherID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `FoundingYear` int NOT NULL,
  `City` varchar(45) NOT NULL,
  `Country` varchar(45) NOT NULL,
  `Status` varchar(45) NOT NULL COMMENT 'Active, Defunct',
  PRIMARY KEY (`PublisherID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Data for table `Publisher`
--
Select * from Publisher;
INSERT INTO `Publisher` (`PublisherID`, `Name`, `FoundingYear`, `City`, `Country`, `Status`) VALUES
(1, 'Penguin Books', 1935, 'London', 'UK', 'Active'),
(2, 'Simon & Schuster', 1924, 'New York', 'USA', 'Active'),
(3, 'Dover Publications', 1941, 'Mineola', 'USA', 'Active'),
(4, 'Hogarth Press', 1917, 'Richmond', 'UK', 'Inactive'),
(5, 'Harper & Row', 1817, 'New York', 'USA', 'Active'),
(6, 'Bantam Books', 1945, 'New York', 'USA', 'Active'),
(7, 'Charles Scribner\'s Sons', 1846, 'New York', 'USA', 'Inactive'),
(8, 'Oxford University', 1478, 'Oxford', 'UK', 'Active'),
(9, 'Vintage Books', 1954, 'New York', 'USA', 'Active'),
(10, 'Little,Brown and Company', 1837, 'Boston', 'USA', 'Active');

--
-- Table structure for table `Book`
--
CREATE TABLE `Book` (
  `BookID` int NOT NULL AUTO_INCREMENT COMMENT '1-5 for Rarity',
  `Title` varchar(45) NOT NULL,
  `ISBN` varchar(45) NOT NULL,
  `PublisherID` int NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `Cost` decimal(10,2) NOT NULL,
  `Status` varchar(45) NOT NULL,
  `Edition` int NOT NULL,
  `Condition` varchar(45) NOT NULL,
  `Language` varchar(45) NOT NULL,
  `YearPublished` int NOT NULL,
  `AcquisitionDate` date NOT NULL,
  `PageCount` int NOT NULL,
  `CoverType` varchar(45) NOT NULL,
  `Rarity` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`BookID`),
  KEY `PublisherID_idx` (`PublisherID`),
  CONSTRAINT `PublisherID` FOREIGN KEY (`PublisherID`) REFERENCES `Publisher` (`PublisherID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='PublisherID is a foreign key.';

--
-- Data for table `Book`
--
Select * from Book;
INSERT INTO `Book` (`BookID`, `Title`, `ISBN`, `PublisherID`, `Price`, `Cost`, `Status`, `Edition`, `Condition`, `Language`, `YearPublished`, `AcquisitionDate`, `PageCount`, `CoverType`, `Rarity`) VALUES
(1, 'Pride and Prejudice', '978-0141439518', 1, 25.00, 15.00, 'Available', 1, 'Excellent', 'English', 1813, '2024-01-15', 432, 'Paperback', 1),
(2, 'To Kill a Mockingbird', '978-0446310789', 2, 30.00, 20.00, 'Sold', 2, 'Good', 'English', 1960, '2024-02-20', 324, 'Hardcover', 3),
(3, 'Crime and Punishment', '978-0486415871', 3, 20.00, 10.00, 'Available', 3, 'Fair', 'English', 1866, '2024-03-10', 544, 'Paperback', 2),
(4, 'The Old man and the Sea', '978-0684801223', 2, 35.00, 25.00, 'Available', 1, 'Excellent', 'English', 1952, '2024-03-10', 127, 'Hardcover', 4),
(5, 'Mrs Dalloway', '978-0156628709', 4, 45.00, 25.00, 'Available', 1, 'Good', 'English', 1925, '2024-04-05', 288, 'Hardcover', 4),
(6, '100 Years of Solitude', '978-0060883287', 5, 28.00, 18.00, 'Available', 1, 'Good', 'Spanish', 1967, '2024-05-01', 417, 'Paperback', 1),
(7, 'The Catcher in the Rye', '978-0316769174', 2, 40.00, 30.00, 'Sold', 1, 'Fair', 'English', 1951, '2024-06-12', 277, 'Hardcover', 4),
(8, 'War and Peace', '978-1400079988', 6, 55.00, 45.00, 'Available', 1, 'Excellent', 'Russian', 1869, '2024-08-19', 1225, 'Hardcover', 2),
(9, 'Frankenstein', '978-0486282110', 3, 22.00, 12.00, 'Available', 1, 'Good', 'English', 1818, '2025-09-15', 280, 'Paperback', 1),
(10, 'Moby Dick', '978-0142437247', 1, 38.00, 28.00, 'Available', 1, 'Fair', 'English', 1851, '2025-09-15', 624, 'Hardcover', 1);

--
-- Table structure for table `BookAuthors`
--
CREATE TABLE `BookAuthors` (
  `BookID` int NOT NULL,
  `AuthorID` int NOT NULL,
  `ContributionType` varchar(45) NOT NULL,
  PRIMARY KEY (`BookID`,`AuthorID`),
  KEY `AuthorID_idx` (`AuthorID`),
  CONSTRAINT `AuthorID` FOREIGN KEY (`AuthorID`) REFERENCES `Author` (`AuthorID`),
  CONSTRAINT `BookID` FOREIGN KEY (`BookID`) REFERENCES `Book` (`BookID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Data for table `BookAuthors`
--
Select * from BookAuthors;
INSERT INTO `BookAuthors` (`BookID`, `AuthorID`, `ContributionType`) VALUES
(1, 1, 'Primary'),
(2, 10, 'Primary'),
(3, 11, 'Primary'),
(4, 12, 'Primary'),
(5, 13, 'Primary'),
(6, 14, 'Primary'),
(7, 15, 'Primary'),
(8, 16, 'Primary'),
(9, 17, 'Primary'),
(10, 18, 'Primary');

--
-- Table structure for table `Categories`
--
CREATE TABLE `Categories` (
  `CategoryID` int NOT NULL AUTO_INCREMENT,
  `Type` varchar(45) NOT NULL,
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Data for table `Categories`
--
Select * from Categories;
INSERT INTO `Categories` (`CategoryID`, `Type`) VALUES
(1, 'Classic Literature'),
(2, 'Fiction'),
(3, 'Modern Fiction'),
(4, 'Science Fiction'),
(5, 'Non-Fiction'),
(6, 'Fantasy'),
(7, 'Mystery'),
(8, 'Thriller'),
(9, 'Biography'),
(10, 'Historical Fiction');

--
-- Table structure for table `BookCategories`
--
CREATE TABLE `BookCategories` (
  `CategoryID` int NOT NULL,
  `BookID` int NOT NULL,
  PRIMARY KEY (`CategoryID`,`BookID`),
  CONSTRAINT `CategoryID` FOREIGN KEY (`CategoryID`) REFERENCES `Categories` (`CategoryID`),
  CONSTRAINT `BookID_Category` FOREIGN KEY (`BookID`) REFERENCES `Book` (`BookID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Data for table `BookCategories`
--
Select * from BookCategories;
INSERT INTO `BookCategories` (`CategoryID`, `BookID`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(2, 1),
(2, 6),
(2, 7),
(2, 9),
(3, 2);

--
-- Table structure for table `Supplier`
--
CREATE TABLE `Supplier` (
  `SupplierID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `ContactPerson` varchar(45) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Phone` varchar(45) NOT NULL,
  `SupplierType` varchar(45) NOT NULL COMMENT 'Individual, Bookstore, Estate, Auction House',
  PRIMARY KEY (`SupplierID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Data for table `Supplier`
--
Select * from Supplier;
INSERT INTO `Supplier` (`SupplierID`, `Name`, `ContactPerson`, `Email`, `Phone`, `SupplierType`) VALUES
(1, 'Rare Books Inc', 'Alice Johnson', 'a.j@rarebooks.com', '555-111-2222', 'Dealer'),
(2, 'Vintage Collectibles', 'Bob Miller', 'b.m@vintagecol.com', '555-333-4444', 'Collector'),
(3, 'John\'s Book Haul', 'John Williams', 'j.w@bookhaul.com', '555-444-5555', 'Private Seller'),
(4, 'The Old Book Nook', 'Emily White', 'e.white@oldbooknook.com', '555-777-6666', 'Dealer'),
(5, 'Global Book Exchange', 'Sara Chen', 's.c@globalbook.com', '555-999-8888', 'Wholesaler'),
(6, 'Bibliophile\'s Paradise', 'David Lee', 'd.lee@bibliophile.com', '555-222-1111', 'Private Seller'),
(7, 'Classic Finds', 'Laura Green', 'l.g@classicfinds.com', '555-333-2222', 'Dealer'),
(8, 'Antique Texts', 'Paul Wilson', 'p.w@antiquetexts.com', '555-444-3333', 'Collector'),
(9, 'Booksmiths Guild', 'Anna Brown', 'a.b@booksmiths.com', '555-555-4444', 'Wholesaler'),
(10, 'The Paperback Palace', 'Mark Davis', 'm.d@paperbackpalace.com', '555-666-5555', 'Dealer');

--
-- Table structure for table `Acquisition`
--
CREATE TABLE `Acquisition` (
  `AcquisitionID` int NOT NULL AUTO_INCREMENT,
  `SupplierID` int NOT NULL,
  `Date` date NOT NULL,
  `TotalCost` decimal(10,2) NOT NULL,
  `PaymentType` varchar(45) NOT NULL,
  PRIMARY KEY (`AcquisitionID`),
  KEY `SupplierID_idx` (`SupplierID`),
  CONSTRAINT `SupplierID` FOREIGN KEY (`SupplierID`) REFERENCES `Supplier` (`SupplierID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Foreign key is SupplierID\n';

--
-- Data for table `Acquisition`
--
Select * from Acquisition;
INSERT INTO `Acquisition` (`AcquisitionID`, `SupplierID`, `Date`, `TotalCost`, `PaymentType`) VALUES
(1, 1, '2024-01-15', 150.00, 'Credit Card'),
(2, 2, '2024-02-20', 250.00, 'Bank Transfer'),
(3, 3, '2024-03-10', 120.00, 'PayPal'),
(4, 4, '2024-03-10', 95.00, 'Credit Card'),
(5, 5, '2024-04-05', 350.75, 'Cheque'),
(6, 1, '2024-05-01', 80.00, 'Cash'),
(7, 2, '2024-06-12', 500.00, 'Bank Transfer'),
(8, 3, '2024-08-19', 210.00, 'Cash'),
(9, 4, '2025-09-15', 75.25, 'PayPal'),
(10, 5, '2025-09-15', 185.00, 'Credit Card');

--
-- Table structure for table `AcquisitionItems`
--
CREATE TABLE `AcquisitionItems` (
  `AcquisitionID` int NOT NULL,
  `BookID` int NOT NULL,
  `Cost` decimal(10,2) NOT NULL,
  PRIMARY KEY (`AcquisitionID`,`BookID`),
  KEY `BookID_idx` (`BookID`),
  CONSTRAINT `AcquisitionID` FOREIGN KEY (`AcquisitionID`) REFERENCES `Acquisition` (`AcquisitionID`),
  CONSTRAINT `BookID_Acquisition` FOREIGN KEY (`BookID`) REFERENCES `Book` (`BookID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Data for table `AcquisitionItems`
--
Select * from AcquisitionItems;
INSERT INTO `AcquisitionItems` (`AcquisitionID`, `BookID`, `Cost`) VALUES
(1, 1, 15.00),
(2, 2, 20.00),
(3, 3, 10.00),
(4, 5, 25.00),
(5, 6, 18.00),
(6, 7, 30.00),
(7, 8, 45.00),
(8, 9, 12.00),
(9, 10, 28.00),
(10, 4, 20.00);

--
-- Table structure for table `Customer`
--
CREATE TABLE `Customer` (
  `CustomerID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(45) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Phone` varchar(45) NOT NULL,
  `JoinDate` date NOT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Data for table `Customer`
--
Select * from Customer;
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `Phone`, `JoinDate`) VALUES
(1, 'John', 'Evans', 'john.evans@email.com', '555-123-4567', '2023-11-20'),
(10, 'Jany', 'Smith', 'jany.smith@email.com', '555-987-6543', '2024-01-05'),
(11, 'Peter', 'Jones', 'p.jones@email.com', '555-555-1234', '2024-02-10'),
(12, 'David', 'Chen', 'david.c@email.com', '555-888-9999', '2024-03-25'),
(13, 'Mary', 'Davis', 'mardavis@email.com', '555-222-3333', '2024-04-18'),
(14, 'Robert', 'Johnson', 'rojohnson@email..com', '555-444-5555', '2024-05-02'),
(15, 'Lisa', 'Brown', 'l.brown@email.com', '555-666-7777', '2024-06-09'),
(16, 'Chris', 'Wilson', 'chris.wilson@email.com', '555-111-2222', '2024-07-21'),
(17, 'Sarah', 'Miller', 'millersarah@email.com', '555-333-4444', '2024-08-14'),
(18, 'James', 'Taylor', 'j.tay@email.com', '555-555-6666', '2024-09-01');

--
-- Table structure for table `Sale`
--
CREATE TABLE `Sale` (
  `SaleID` int NOT NULL AUTO_INCREMENT,
  `CustomerID` int NOT NULL,
  `Date` date NOT NULL,
  `Time` varchar(45) NOT NULL,
  `TotalAmount` decimal(10,2) NOT NULL,
  `PaymentMethod` varchar(45) NOT NULL,
  `SaleType` varchar(45) NOT NULL COMMENT 'In-store, Online',
  PRIMARY KEY (`SaleID`),
  KEY `CustomerID_idx` (`CustomerID`),
  CONSTRAINT `CustomerID` FOREIGN KEY (`CustomerID`) REFERENCES `Customer` (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='CustomerID is Foreign Key\n';

--
-- Data for table `Sale`
--
Select * from Sale;
INSERT INTO `Sale` (`SaleID`, `CustomerID`, `Date`, `Time`, `TotalAmount`, `PaymentMethod`, `SaleType`) VALUES
(1, 10, '2024-03-01', '14:30:00', 30.00, 'Credit Card', 'Retail'),
(2, 11, '2024-03-15', '10:00:00', 25.00, 'Cash', 'Retail'),
(3, 12, '2024-04-10', '12:15:00', 45.00, 'Credit Card', 'Online'),
(4, 13, '2024-05-05', '11:30:00', 28.00, 'Credit Card', 'Online'),
(5, 14, '2024-06-15', '16:00:00', 40.00, 'Credit Card', 'Online'),
(6, 15, '2024-08-20', '09:45:00', 55.00, 'Cash', 'Retail'),
(7, 16, '2024-09-10', '13:00:00', 22.00, 'Cash', 'Retail'),
(8, 17, '2024-10-18', '15:30:00', 38.00, 'Credit Card', 'Online'),
(9, 18, '2024-12-21', '17:00:00', 40.00, 'Cash', 'Retail'),
(10, 1, '2024-12-30', '10:00:00', 25.00, 'Credit Card', 'Retail');

--
-- Table structure for table `SaleItems`
--
CREATE TABLE `SaleItems` (
  `SaleID` int NOT NULL,
  `BookID` int NOT NULL,
  `SalePrice` decimal(10,2) NOT NULL,
  PRIMARY KEY (`SaleID`,`BookID`),
  KEY `BookID_idx` (`BookID`),
  CONSTRAINT `SaleID` FOREIGN KEY (`SaleID`) REFERENCES `Sale` (`SaleID`),
  CONSTRAINT `BookID_Sale` FOREIGN KEY (`BookID`) REFERENCES `Book` (`BookID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Data for table `SaleItems`
--
Select * from SaleItems;
INSERT INTO `SaleItems` (`SaleID`, `BookID`, `SalePrice`) VALUES
(1, 2, 30.00),
(2, 4, 25.00),
(3, 5, 45.00),
(4, 6, 28.00),
(5, 7, 40.00),
(6, 8, 55.00),
(7, 9, 22.00),
(8, 10, 38.00),
(9, 4, 40.00),
(10, 3, 25.00);