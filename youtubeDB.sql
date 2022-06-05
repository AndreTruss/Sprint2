DROP DATABASE IF EXISTS youtubeDB;
CREATE DATABASE youtubeDB CHARACTER SET utf8mb4;
USE youtubeDB;

CREATE TABLE users (
    userId INT(5) NOT NULL AUTO_INCREMENT,
    userMail VARCHAR(15) UNIQUE,
    userPassword VARCHAR(15),
    userName VARCHAR(15) UNIQUE,
    userBirth DATE,
    userSex VARCHAR(10),
    userCountry VARCHAR(15),
    userZipCode VARCHAR(15),
    PRIMARY KEY(userId)
);

CREATE TABLE videos (
    videoId INT(5) NOT NULL AUTO_INCREMENT,
    userId INT(5) NOT NULL,
    videoTitle VARCHAR(30),
    videoDescription TEXT,
    videoMb INT(5),
    videoFile VARCHAR(15),
    videoTime TIME,
    videoThumbnail BLOB,
    videoReproduction INT(5),
    videoStatus ENUM('public', 'hide', 'private'),
    whenCreated DATETIME,
    PRIMARY KEY(videoId),
    FOREIGN KEY(userId) REFERENCES users(userId)
);

CREATE TABLE tickets (
    ticketId INT(5) NOT NULL AUTO_INCREMENT,
    videoId INT(5) NOT NULL,
    userId INT(5) NOT NULL,
    ticketName VARCHAR(30),
    PRIMARY KEY(ticketId),
    FOREIGN KEY(videoId) REFERENCES videos(videoId),
    FOREIGN KEY(userId) REFERENCES users(userId)
);  
    
CREATE TABLE channels (
    channelId INT(5) NOT NULL AUTO_INCREMENT,
    videoId INT(5) NOT NULL,
    userId INT(5) NOT NULL,
    channelName VARCHAR(30),
    channelDescription TEXT,
    channelDate DATE,
    PRIMARY KEY(channelId),
    FOREIGN KEY(videoId) REFERENCES videos(videoId),
    FOREIGN KEY(userId) REFERENCES users(userId)
);

CREATE TABLE playlists (
    playlistId INT(5) NOT NULL AUTO_INCREMENT,
    videoId INT(5) NOT NULL,
    userId INT(5) NOT NULL,
    playlistName VARCHAR(30),
    playlistDate DATE,
    playlistStatus ENUM('public', 'private'),
    PRIMARY KEY(playlistId),
    FOREIGN KEY(videoId) REFERENCES videos(videoId),
    FOREIGN KEY(userId) REFERENCES users(userId)
);

CREATE TABLE comments (
    commentId INT(5) NOT NULL AUTO_INCREMENT,
    videoId INT(5) NOT NULL,
    userId INT(5) NOT NULL,
    commentText TEXT,
    commentDate DATETIME,
    PRIMARY KEY(commentId),
    FOREIGN KEY(videoId) REFERENCES videos(videoId),
    FOREIGN KEY(userId) REFERENCES users(userId)
);

CREATE TABLE subscribeChannels (
    channelId INT(5) NOT NULL,
    userId INT(5) NOT NULL,
    FOREIGN KEY(channelId) REFERENCES channels(channelId),
    FOREIGN KEY(userId) REFERENCES users(userId),
    UNIQUE INDEX (channelId, userId)
);

CREATE TABLE likeDislikeVideos (
    videoId INT(5) NOT NULL,
    userId INT(5) NOT NULL,
    likeDislike ENUM('like', 'dislike'),
    likeDate DATETIME,
    FOREIGN KEY(videoId) REFERENCES videos(videoId),
    FOREIGN KEY(userId) REFERENCES users(userId),
    UNIQUE INDEX (videoId, userId)
);

CREATE TABLE likeDislikeComments (
    commentId INT(5) NOT NULL,
    userId INT(5) NOT NULL,
    likeDislike ENUM('like', 'dislike'),
    likeDate DATETIME,
    FOREIGN KEY(commentId) REFERENCES comments(commentId),
    FOREIGN KEY(userId) REFERENCES users(userId),
    UNIQUE INDEX (commentId, userId)
);



-- INSERT INTO

INSERT INTO users (userMail, userPassword, userName, userBirth, userSex, userCountry, userZipCode)
VALUES 
    ('asd@sd.es', '123456', 'pinco', '2000-05-10', 'hombre', 'Italia', '24128'),
    ('pd@sd.es', '123456', 'panca', '1990-07-10', 'mujer', 'España', '08001'),
    ('od@sd.es', '123456', 'ponco', '1980-01-10', 'hombre', 'Italia', '30110');


INSERT INTO videos (userId, videoTitle, videoDescription, videoMb, videoFile, videoTime, videoThumbnail, videoReproduction, videoStatus, whenCreated)
VALUES (1, 'js example', 'leccion js', '110', 'leccionjs.avi', '00:30:10', LOAD_FILE('/img/img.png'), 50, 'public', NOW());
INSERT INTO videos (userId, videoTitle, videoDescription, videoMb, videoFile, videoTime, videoThumbnail, videoReproduction, videoStatus, whenCreated)
VALUES (1, 'node example', 'leccion node', '105', 'leccionNode.avi', '00:25:40', LOAD_FILE('/img/img.png'), 40, 'public', NOW());
INSERT INTO videos (userId, videoTitle, videoDescription, videoMb, videoFile, videoTime, videoThumbnail, videoReproduction, videoStatus, whenCreated)
VALUES (2, 'Mis gatos', 'jugando con gatos', '80', 'gatos.mp4', '00:15:30', LOAD_FILE('/img/img.png'), 80, 'public', NOW());


INSERT INTO tickets (videoId, userId, ticketName)
VALUES 
    (1, 1, 'javascript'),
    (1, 1, 'js');


INSERT INTO channels (videoId, userId, channelName, channelDescription, channelDate)
VALUES (3, 2, 'Mis Videos', 'Mis nuevos videos', NOW());


INSERT INTO playlists (videoId, userId, playlistName, playlistDate, playlistStatus)
VALUES (3, 3, 'Videos preferidos', NOW(), 'public');


INSERT INTO comments (videoId, userId, commentText, commentDate)
VALUES (3, 3, 'Me gusta mucho', NOW());


INSERT INTO subscribeChannels (channelId, userId)
VALUES (1, 3);


INSERT INTO likeDislikeVideos (videoId, userId, likeDislike, likeDate)
VALUES (3, 3, 'like', NOW());


INSERT INTO likeDislikeComments (commentId, userId, likeDislike, likeDate)
VALUES (1, 2, 'like', NOW());


-- QUERY
-- Caldrà portar un registre dels usuaris que li han donat like i dislike a un determinat vídeo i en quina data/hora ho van fer.

SELECT userName, videoTitle, likeDate, likeDislike FROM likeDislikeVideos
INNER JOIN users
ON users.userId = likeDislikeVideos.userId
INNER JOIN videos
ON videos.videoId = likeDislikeVideos.videoId;

-- Caldrà portar un registre dels usuaris que han marcat un comentari com m'agrada/no m'agrada, i en quina data/hora ho van fer.

SELECT userName, commentText, commentDate, likeDislike FROM likeDislikeComments
INNER JOIN users
ON users.userId = likeDislikeComments.userId
INNER JOIN comments
ON comments.commentId = likeDislikeComments.commentId;