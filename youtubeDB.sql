DROP DATABASE IF EXISTS youtubeDB;
CREATE DATABASE youtubeDB CHARACTER SET utf8mb4;
USE youtubeDB;

CREATE TABLE users (
    userId INT(5) NOT NULL AUTO_INCREMENT,
    userMail VARCHAR(15),
    userPassword VARCHAR(15),
    userName VARCHAR(15),
    userBirth DATE,
    userSex VARCHAR(10),
    userCountry VARCHAR(15),
    userZipCode VARCHAR(15),
    PRIMARY KEY(userId)
);
INSERT INTO users (userMail, userPassword, userName, userBirth, userSex, userCountry, userZipCode)
VALUES 
    ('asd@sd.es', '123456', 'pinco', '2000-05-10', 'hombre', 'España', '08001'),
    ('pd@sd.es', '123456', 'panca', '1990-07-10', 'mujer', 'España', '08001'),
    ('od@sd.es', '123456', 'ponco', '1980-01-10', 'hombre', 'España', '08001');
CREATE TABLE videos (
    videoId INT(5) NOT NULL AUTO_INCREMENT,
    userId INT(5) NOT NULL,
    videoTitle VARCHAR(30),
    videoDescription TEXT,
    videoMb INT(5),
    videoFile VARCHAR(15),
    videoTime TIME,
    videoThumbnail BLOB,
    videoReproduce INT(5),
    videoLike INT(5) DEFAULT 0,
    videoDislike INT(5) DEFAULT 0,
    videoStatus ENUM('public', 'hide', 'private'),
    PRIMARY KEY(videoId),
    FOREIGN KEY(userId) REFERENCES users(userId)
);
INSERT INTO videos (userId, videoTitle, videoDescription, videoMb, videoFile, videoTime, videoThumbnail, videoReproduce, videoStatus)
VALUES 
    (1, 'js example', 'leccion js', '110', 'leccionjs.avi', '00:30:10', LOAD_FILE('/img/img.png'), 50, 'public'),
    (1, 'node example', 'leccion node', '105', 'leccionNode.avi', '00:25:40', LOAD_FILE('/img/img.png'), 40, 'public'),
    (2, 'Mis gatos', 'jugando con gatos', '80', 'gatos.mp4', '00:15:30', LOAD_FILE('/img/img.png'), 80, 'public');


CREATE TABLE tickets (
    ticketId INT(5) NOT NULL AUTO_INCREMENT,
    videoId INT(5),
    userId INT(5),
    ticketName VARCHAR(30),
    ticketDate DATETIME,
    PRIMARY KEY(ticketId),
    FOREIGN KEY(videoId) REFERENCES videos(videoId),
    FOREIGN KEY(userId) REFERENCES users(userId)
);
INSERT INTO tickets (videoId, userId, ticketName, ticketDate)
VALUES (1, 1, 'crear video', NOW());
INSERT INTO tickets (videoId, userId, ticketName, ticketDate)
VALUES (2, 1, 'crear video', NOW());
INSERT INTO tickets (videoId, userId, ticketName, ticketDate)
VALUES (3, 2, 'crear video', NOW());
    
    
CREATE TABLE channels (
    channelId INT(5) NOT NULL AUTO_INCREMENT,
    videoId INT(5),
    userId INT(5),
    channelName VARCHAR(30),
    channelDescription TEXT,
    channelDate DATE,
    PRIMARY KEY(channelId),
    FOREIGN KEY(videoId) REFERENCES videos(videoId),
    FOREIGN KEY(userId) REFERENCES users(userId)
);
INSERT INTO channels (videoId, userId, channelName, channelDescription, channelDate)
VALUES (3, 2, 'Mis Videos', 'Mis nuevos videos', NOW());
CREATE TABLE playlists (
    playlistId INT(5) NOT NULL AUTO_INCREMENT,
    videoId INT(5),
    userId INT(5),
    playlistName VARCHAR(30),
    playlistDate DATE,
    playlistStatus ENUM('public', 'private'),
    PRIMARY KEY(playlistId),
    FOREIGN KEY(videoId) REFERENCES videos(videoId),
    FOREIGN KEY(userId) REFERENCES users(userId)
);
INSERT INTO playlists (videoId, userId, playlistName, playlistDate, playlistStatus)
VALUES (3, 3, 'Videos preferidos', NOW(), 'public');
CREATE TABLE comments (
    commentId INT(5) NOT NULL AUTO_INCREMENT,
    videoId INT(5),
    userId INT(5),
    commentText TEXT,
    commentDate DATETIME,
    commentLike ENUM('like', 'dislike'),
    PRIMARY KEY(commentId),
    FOREIGN KEY(videoId) REFERENCES videos(videoId),
    FOREIGN KEY(userId) REFERENCES users(userId)
);
INSERT INTO comments (videoId, userId, commentText, commentDate, commentLike)
VALUES (3, 3, 'Me gusta mucho', NOW(), NULL);
