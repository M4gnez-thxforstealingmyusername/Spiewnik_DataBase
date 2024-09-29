SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


CREATE TABLE `chord` (
  `id` int(11) NOT NULL,
  `lyricsId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `uploadDate` datetime DEFAULT current_timestamp(),
  `editUserId` int(11) DEFAULT NULL,
  `editDate` datetime DEFAULT NULL,
  `chords` varchar(10000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `verified` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `chordupdaterequest` (
  `id` int(11) NOT NULL,
  `chordId` int(11) NOT NULL,
  `editUserId` int(11) NOT NULL,
  `editDate` datetime DEFAULT current_timestamp(),
  `chords` varchar(10000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `reason` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `adminId` int(11) NOT NULL,
  `accepted` tinyint(1) DEFAULT NULL,
  `rejectionMessage` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `city` (
  `id` int(11) NOT NULL,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `customtext` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `uploadDate` datetime DEFAULT current_timestamp(),
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` varchar(1000) DEFAULT NULL,
  `remain` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `favoritesongs` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `songId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `upladDate` datetime DEFAULT current_timestamp(),
  `type` enum('bug','suggestion','other') DEFAULT NULL,
  `message` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `lyrics` (
  `id` int(11) NOT NULL,
  `songId` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `uploadDate` datetime DEFAULT current_timestamp(),
  `editUserId` int(11) DEFAULT NULL,
  `editDate` datetime DEFAULT NULL,
  `alternativeTitle` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` varchar(10000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `verified` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `lyricsupdaterequest` (
  `id` int(11) NOT NULL,
  `lyricsId` int(11) NOT NULL,
  `editUser` int(11) NOT NULL,
  `editDate` datetime DEFAULT current_timestamp(),
  `alternativeTitle` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` varchar(10000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `reason` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `adminId` int(11) NOT NULL,
  `accepted` tinyint(1) DEFAULT NULL,
  `rejectionMessage` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `presentation` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `uploadDate` datetime DEFAULT current_timestamp(),
  `occasion` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(800) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `remembertoken` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `token` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `settings` (
  `userId` int(11) NOT NULL,
  `nextSlide` varchar(5) DEFAULT 'left',
  `reset` varchar(20) DEFAULT 'r'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `song` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `uploadDate` datetime DEFAULT current_timestamp(),
  `editUserId` int(11) DEFAULT NULL,
  `editDate` datetime DEFAULT NULL,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `shortTitle` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `tagList` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `defaultLyricsId` int(11) DEFAULT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `songupdaterequest` (
  `id` int(11) NOT NULL,
  `songId` int(11) NOT NULL,
  `editUser` int(11) NOT NULL,
  `editDate` datetime NOT NULL DEFAULT current_timestamp(),
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `shortTitle` varchar(16) DEFAULT NULL,
  `tagList` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `defaultLyricsId` int(11) DEFAULT NULL,
  `deleteRequest` tinyint(1) NOT NULL DEFAULT 0,
  `reason` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `adminId` int(11) NOT NULL,
  `accepted` tinyint(1) DEFAULT NULL,
  `rejectionMessage` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `cityId` int(11) DEFAULT NULL,
  `joinDate` date DEFAULT current_timestamp(),
  `username` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `displayName` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `authorizationLevel` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
DELIMITER $$
CREATE TRIGGER `generateSettings` AFTER INSERT ON `user` FOR EACH ROW BEGIN
    INSERT INTO settings VALUES(NEW.id, DEFAULT, DEFAULT);
END
$$
DELIMITER ;


ALTER TABLE `chord`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `chordupdaterequest`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `city`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `customtext`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `favoritesongs`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `lyrics`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `lyricsupdaterequest`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `presentation`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `remembertoken`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `settings`
  ADD PRIMARY KEY (`userId`);

ALTER TABLE `song`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `songupdaterequest`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);


ALTER TABLE `chord`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `chordupdaterequest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `city`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `customtext`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `favoritesongs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `lyrics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `lyricsupdaterequest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `presentation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `remembertoken`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `song`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `songupdaterequest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
