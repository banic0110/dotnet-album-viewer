
CREATE TABLE `Albums` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `ArtistId` int DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `Year` int NOT NULL,
  `ImageUrl` varchar(255) DEFAULT NULL,
  `AmazonUrl` varchar(255) DEFAULT NULL,
  `SpotifyUrl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
);

CREATE TABLE `Artists` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `ArtistName` varchar(128) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `ImageUrl` varchar(256) DEFAULT NULL,
  `AmazonUrl` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`Id`)
);

CREATE TABLE `Tracks` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `AlbumId` int DEFAULT NULL,
  `SongName` varchar(128) DEFAULT NULL,
  `Length` varchar(10) DEFAULT NULL,
  `Bytes` int NOT NULL,
  `UnitPrice` decimal(18,2) NOT NULL,
  PRIMARY KEY (`Id`)
);

CREATE TABLE `Users` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Fullname` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`Id`)
);


INSERT INTO `Artists` (`ArtistName`, `Description`, `ImageUrl`, `AmazonUrl`) VALUES
('The Beatles', 'Legendary British band', 'https://example.com/beatles.jpg', 'https://amazon.com/beatles'),
('Pink Floyd', 'Progressive rock band', 'https://example.com/pinkfloyd.jpg', 'https://amazon.com/pinkfloyd');

INSERT INTO `Albums` (`ArtistId`, `Title`, `Description`, `Year`, `ImageUrl`, `AmazonUrl`, `SpotifyUrl`) VALUES
(1, 'Abbey Road', 'Classic album by The Beatles', 1969, 'https://example.com/abbeyroad.jpg', 'https://amazon.com/abbeyroad', 'https://spotify.com/abbeyroad'),
(2, 'The Dark Side of the Moon', 'Iconic album by Pink Floyd', 1973, 'https://example.com/darkside.jpg', 'https://amazon.com/darkside', 'https://spotify.com/darkside');

INSERT INTO `Tracks` (`AlbumId`, `SongName`, `Length`, `Bytes`, `UnitPrice`) VALUES
(1, 'Come Together', '4:20', 5000000, 1.29),
(1, 'Something', '3:03', 4000000, 1.29),
(2, 'Time', '6:53', 7000000, 1.29),
(2, 'Money', '6:22', 6500000, 1.29);

INSERT INTO `Users` (`Username`, `Password`, `Fullname`) VALUES
('admin', 'admin123', 'Administrator'),
('jdoe', 'password', 'John Doe');

ALTER TABLE `Albums`
  ADD CONSTRAINT `fk_albums_artistid` FOREIGN KEY (`ArtistId`) REFERENCES `Artists` (`Id`);

ALTER TABLE `Tracks`
  ADD CONSTRAINT `fk_tracks_albumid` FOREIGN KEY (`AlbumId`) REFERENCES `Albums` (`Id`);

