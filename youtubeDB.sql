DROP DATABASE IF EXISTS youtubeDB;
CREATE DATABASE youtubeDB CHARACTER SET utf8mb4;
USE youtubeDB;

CREATE TABLE users (
    userId INT(5) NOT NULL AUTO_INCREMENT,
    userMail VARCHAR(15),
    userPassword VARCHAR(15),
    userName VARCHAR(15),
    userDate DATE,
    userSex VARCHAR(10),
    userCountry VARCHAR(15),
    userZipCode VARCHAR(15),
    PRIMARY KEY(userId)
);

CREATE TABLE videos (
    videoId INT(5) NOT NULL AUTO_INCREMENT,
    userId INT(5),
    videoTitle VARCHAR(15),
    videoDescription VARCHAR(15),
    videoMb INT(5),
    videoFile VARCHAR(15),
    videoTime TIME,
    videoThumbnail BLOB,
    videoReproduce INT(5),
    videoLikes INT(5),
    videoDislike INT(5),
    videoStatus ENUM('public', 'hide', 'private'),
    PRIMARY KEY(videoId),
    FOREIGN KEY(userId) REFERENCES users.userId
);

CREATE TABLE tickets (
    ticketId INT(5) NOT NULL AUTO_INCREMENT,
    videoId INT(5),
    userId INT(5),
    ticketName VARCHAR(15),
    ticketDate DATETIME,
    PRIMARY KEY(ticketId),
    FOREIGN KEY(videoId) REFERENCES videos.videoId,
    FOREIGN KEY(userId) REFERENCES users.userId
);

CREATE TABLE channels (
    channelId INT(5) NOT NULL AUTO_INCREMENT,
    videoId INT(5),
    userId INT(5),
    channelName VARCHAR(15),
    channelDescription VARCHAR(15),
    channelDate DATE,
    PRIMARY KEY(channelId),
    FOREIGN KEY(videoId) REFERENCES videos.videoId,
    FOREIGN KEY(userId) REFERENCES users.userId
);

CREATE TABLE playlists (
    playlistId INT(5) NOT NULL AUTO_INCREMENT,
    videoId INT(5),
    userId INT(5),
    playlistName VARCHAR(15),
    playlistDate DATE,
    playlistStatus ENUM('public', 'private'),
    PRIMARY KEY(playlistId),
    FOREIGN KEY(videoId) REFERENCES videos.videoId,
    FOREIGN KEY(userId) REFERENCES users.userId
);

CREATE TABLE comments (
    commentId INT(5) NOT NULL AUTO_INCREMENT,
    videoId INT(5),
    userId INT(5),
    commentText VARCHAR(15),
    commentDate DATETIME,
    commentLikes INT(5),
    commentDislike INT(5),
    PRIMARY KEY(commentId),
    FOREIGN KEY(videoId) REFERENCES videos.videoId,
    FOREIGN KEY(userId) REFERENCES users.userId
);