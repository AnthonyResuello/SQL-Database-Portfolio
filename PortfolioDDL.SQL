-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 13, 2023 at 06:28 PM
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
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `client_id` int(10) UNSIGNED NOT NULL,
  `organisation_name` varchar(50) NOT NULL,
  `contact_first_name` varchar(20) DEFAULT NULL,
  `contact_last_name` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `preferred_contact_method` enum('post','email') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`client_id`, `organisation_name`, `contact_first_name`, `contact_last_name`, `email`, `address`, `preferred_contact_method`) VALUES
(1, 'Apple', 'Simon', 'Cooper', 'simoncooper@apple.com', '96 Station Road, Lancaster, UK', 'email'),
(2, 'Google', 'Sally', 'Hope', 'sallyhope@gmail.com', '456 Broadway, London, UK', 'post'),
(3, 'Microsoft', 'David', 'Mallon', 'davidmallon@gmail.com', '96 Station Road, Lancaster, UK', 'email'),
(4, 'Amazon', 'Jayne', 'Gillman', 'jaynegillman@gmail.com', '79 The Grove,Colchester, UK', 'post'),
(5, 'Facebook', 'Peter', 'Castell', 'petercastell@gmail.com', '7 The Green, Guildford, UK', 'email');

-- --------------------------------------------------------

--
-- Table structure for table `pool_members`
--

CREATE TABLE `pool_members` (
  `pool_member_id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `work_address` varchar(50) DEFAULT NULL,
  `home_address` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pool_members`
--

INSERT INTO `pool_members` (`pool_member_id`, `first_name`, `last_name`, `email`, `phone_number`, `work_address`, `home_address`) VALUES
(1, 'Lloyd', 'Hardy', 'lloyd@email.com', '0113-245-4863', 'Wantage Rd,Newbury, UK', '95 Church Rd, Crystal Palace, UK'),
(2, 'Olivia', 'Barton', 'olivia@email.com', '0800-093-5478', '12-18 Cambridge St, Sheffield, UK', 'Rawcliffe Rd, Goole, UK'),
(3, 'Carla', 'Johnson', 'carla@gmail.com', '01227-462520', '18 Bridgnorth Rd, Wolverhampton, UK', '11 Briggate, Leeds, UK'),
(4, 'David', 'Johnson', 'davidj@gmail.com', '07777777777', '123 Main St, London, UK', '456 Broadwalk, London, UK'),
(5, 'Emma', 'Wilson', 'emmaw@gmail.com', '0800-777-8888', '100 Business Ave, Manchester, UK', '1 Park Ave, Manchester, UK');

-- --------------------------------------------------------

--
-- Table structure for table `pool_member_skills`
--

CREATE TABLE `pool_member_skills` (
  `pool_member_id` int(10) UNSIGNED NOT NULL,
  `skill_id` int(10) UNSIGNED NOT NULL,
  `experience_level` enum('Expert','Intermediate','Junior') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pool_member_skills`
--

INSERT INTO `pool_member_skills` (`pool_member_id`, `skill_id`, `experience_level`) VALUES
(1, 1, 'Expert'),
(1, 3, 'Intermediate'),
(1, 5, 'Expert'),
(2, 3, 'Expert'),
(2, 4, 'Intermediate'),
(3, 1, 'Junior'),
(3, 2, 'Intermediate'),
(3, 5, 'Expert'),
(4, 8, 'Intermediate'),
(4, 9, 'Expert'),
(5, 7, 'Junior'),
(5, 10, 'Intermediate');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `project_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(50) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `budget` decimal(10,2) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `phase_id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`project_id`, `title`, `start_date`, `end_date`, `budget`, `description`, `phase_id`, `client_id`) VALUES
(1, 'Project 1', '2022-01-01', '2022-06-30', '4720.50', 'Website Design', 1, 1),
(2, 'Project 2', '2022-07-01', '2022-12-31', '3670.80', 'Mobile App', 2, 2),
(3, 'Project 3', '2023-01-01', '2023-06-30', '5580.20', 'Software', 3, 1),
(4, 'Project 4', '2023-07-01', '2023-12-31', '2520.80', 'Web App Development', 4, 3),
(5, 'Project 5', '2023-03-01', '2023-08-31', '4270.40', 'Mobile Game Development', 2, 4),
(6, 'Project 6', '2022-11-01', '2023-06-30', '6320.20', 'Database Management', 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `project_phases`
--

CREATE TABLE `project_phases` (
  `phase_id` int(10) UNSIGNED NOT NULL,
  `phase_name` enum('Design','Planning','Development','Testing','Complete','Maintenance','Deployment','Security') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `project_phases`
--

INSERT INTO `project_phases` (`phase_id`, `phase_name`) VALUES
(1, 'Design'),
(2, 'Planning'),
(3, 'Testing'),
(4, 'Development'),
(5, 'Complete'),
(6, 'Maintenance'),
(7, 'Deployment'),
(8, 'Security');

-- --------------------------------------------------------

--
-- Table structure for table `project_pool_members`
--

CREATE TABLE `project_pool_members` (
  `project_id` int(10) UNSIGNED NOT NULL,
  `pool_member_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `project_pool_members`
--

INSERT INTO `project_pool_members` (`project_id`, `pool_member_id`) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 1),
(3, 2),
(4, 4),
(4, 5),
(5, 1),
(5, 4),
(6, 2),
(6, 5);

-- --------------------------------------------------------

--
-- Table structure for table `project_skills`
--

CREATE TABLE `project_skills` (
  `project_id` int(10) UNSIGNED NOT NULL,
  `skill_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `project_skills`
--

INSERT INTO `project_skills` (`project_id`, `skill_id`) VALUES
(1, 1),
(1, 3),
(2, 2),
(2, 4),
(3, 1),
(3, 5),
(4, 4),
(4, 8),
(5, 7),
(5, 10),
(6, 6),
(6, 9);

-- --------------------------------------------------------

--
-- Table structure for table `skills`
--

CREATE TABLE `skills` (
  `skill_id` int(10) UNSIGNED NOT NULL,
  `skill_name` enum('Java','JUnit','JavaScript','React','SQL','React Native','Node.js','HTML','CSS','Python') NOT NULL,
  `skill_type` enum('Backend','Testing','Frontend','Database') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `skills`
--

INSERT INTO `skills` (`skill_id`, `skill_name`, `skill_type`) VALUES
(1, 'Java', 'Backend'),
(2, 'JUnit', 'Testing'),
(3, 'JavaScript', 'Frontend'),
(4, 'React', 'Frontend'),
(5, 'SQL', 'Database'),
(6, 'Python', 'Backend'),
(7, 'React Native', 'Frontend'),
(8, 'Node.js', 'Backend'),
(9, 'HTML', 'Frontend'),
(10, 'CSS', 'Frontend');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`client_id`);

--
-- Indexes for table `pool_members`
--
ALTER TABLE `pool_members`
  ADD PRIMARY KEY (`pool_member_id`);

--
-- Indexes for table `pool_member_skills`
--
ALTER TABLE `pool_member_skills`
  ADD PRIMARY KEY (`pool_member_id`,`skill_id`),
  ADD KEY `skill_id` (`skill_id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`project_id`),
  ADD KEY `phase_id` (`phase_id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `project_phases`
--
ALTER TABLE `project_phases`
  ADD PRIMARY KEY (`phase_id`);

--
-- Indexes for table `project_pool_members`
--
ALTER TABLE `project_pool_members`
  ADD PRIMARY KEY (`project_id`,`pool_member_id`),
  ADD KEY `pool_member_id` (`pool_member_id`);

--
-- Indexes for table `project_skills`
--
ALTER TABLE `project_skills`
  ADD PRIMARY KEY (`project_id`,`skill_id`),
  ADD KEY `skill_id` (`skill_id`);

--
-- Indexes for table `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`skill_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pool_member_skills`
--
ALTER TABLE `pool_member_skills`
  ADD CONSTRAINT `pool_member_skills_ibfk_1` FOREIGN KEY (`pool_member_id`) REFERENCES `pool_members` (`pool_member_id`),
  ADD CONSTRAINT `pool_member_skills_ibfk_2` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`skill_id`);

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`phase_id`) REFERENCES `project_phases` (`phase_id`),
  ADD CONSTRAINT `projects_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `clients` (`client_id`);

--
-- Constraints for table `project_pool_members`
--
ALTER TABLE `project_pool_members`
  ADD CONSTRAINT `project_pool_members_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`),
  ADD CONSTRAINT `project_pool_members_ibfk_2` FOREIGN KEY (`pool_member_id`) REFERENCES `pool_members` (`pool_member_id`);

--
-- Constraints for table `project_skills`
--
ALTER TABLE `project_skills`
  ADD CONSTRAINT `project_skills_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`),
  ADD CONSTRAINT `project_skills_ibfk_2` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`skill_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
