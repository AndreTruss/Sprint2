DROP DATABASE IF EXISTS spotifyDB;
CREATE DATABASE spotifyDB CHARACTER SET utf8mb4;
USE spotifyDB;

CREATE TABLE users (
    id_user INT(5) NOT NULL AUTO_INCREMENT,
    mail_user VARCHAR(15) UNIQUE,
    password_user VARCHAR(15),
    name_user VARCHAR(15) UNIQUE,
    birth_user DATE,
    sex_user ENUM('M','H'),
    country_user VARCHAR(15),
    zipcode_user VARCHAR(15),
    type_user ENUM('free', 'premium'),
    PRIMARY KEY(id_user)
);

CREATE TABLE subscriptions (
    id_user INT(5) NOT NULL,
    date_start_subscription DATE NOT NULL,
    date_renew_subscription DATE,
    payment_subscription ENUM('credit card','paypal'),
    FOREIGN KEY(id_user) REFERENCES users(id_user)
);

CREATE TABLE creditcards (
    id_user INT(5) NOT NULL,
    number_creditcard VARCHAR(20) NOT NULL,
    caducity_creditcard DATE NOT NULL,
    code_creditcard INT(3) NOT NULL,
    FOREIGN KEY(id_user) REFERENCES users(id_user)
);

CREATE TABLE paypal (
    id_user INT(5) NOT NULL,
    username_paypal VARCHAR(25) NOT NULL,
    FOREIGN KEY(id_user) REFERENCES users(id_user)
);

CREATE TABLE payments (
    id_payment INT(5) NOT NULL AUTO_INCREMENT,
    id_user INT(5) NOT NULL,
    date_payment DATE,
    amount_payment FLOAT,
    PRIMARY KEY(id_payment),
    FOREIGN KEY(id_user) REFERENCES users(id_user)
);

CREATE TABLE playlists (
    id_playlist INT(5) NOT NULL AUTO_INCREMENT,
    id_user INT(5) NOT NULL,
    title_playlist VARCHAR(30),
    number_song_playlist INT(5),
    date_create_playlist DATE,
    status_playlist ENUM('active', 'eliminated') DEFAULT 'active',
    PRIMARY KEY(id_playlist),
    FOREIGN KEY(id_user) REFERENCES users(id_user)
);

CREATE TABLE want_eliminate_playlists (
    id_playlist INT(5) NOT NULL,
    date_eliminate DATE,
    FOREIGN KEY(id_playlist) REFERENCES playlists(id_playlist)
);

CREATE TABLE artists (
    id_artist INT(5) NOT NULL AUTO_INCREMENT,
    name_artist VARCHAR(25) NOT NULL,
    img_artist BLOB,
    PRIMARY KEY(id_artist)
);

CREATE TABLE related_artists (
    id_artist1 INT(5) NOT NULL,
    id_artist2 INT(5) NOT NULL,
    FOREIGN KEY(id_artist1) REFERENCES artists(id_artist),
	FOREIGN KEY(id_artist2) REFERENCES artists(id_artist)
);

CREATE TABLE albums (
    id_album INT(5) NOT NULL AUTO_INCREMENT,
    id_artist INT(5) NOT NULL,
    title_album VARCHAR(25) NOT NULL,
    year_pubblication YEAR,
    img_album BLOB,
    PRIMARY KEY(id_album),
    FOREIGN KEY(id_artist) REFERENCES artists(id_artist)
);

CREATE TABLE songs (
    id_song INT(5) NOT NULL AUTO_INCREMENT,
    id_album INT(5) NOT NULL,
    title_song VARCHAR(25) NOT NULL,
    duration_song TIME,
    number_reproduction_song INT(5),
    PRIMARY KEY(id_song),
    FOREIGN KEY(id_album) REFERENCES albums(id_album)
);

CREATE TABLE user_favorites (
    id_user INT(5) NOT NULL,
    id_song INT(5),
    id_album INT(5),
    id_artist INT(5),
    FOREIGN KEY(id_user) REFERENCES users(id_user),
    FOREIGN KEY(id_song) REFERENCES songs(id_song),
    FOREIGN KEY(id_album) REFERENCES albums(id_album),
    FOREIGN KEY(id_artist) REFERENCES artists(id_artist)
);

CREATE TABLE share_playlists (
    id_playlist INT(5) NOT NULL,
    id_user INT(5) NOT NULL,
    id_song INT(5) NOT NULL,
    date_share_song DATE,
    FOREIGN KEY(id_playlist) REFERENCES playlists(id_playlist),
    FOREIGN KEY(id_user) REFERENCES users(id_user),
    FOREIGN KEY(id_song) REFERENCES songs(id_song)
);


-- INSERT INTO

INSERT INTO users (mail_user, password_user, name_user, birth_user, sex_user, country_user, zipcode_user, type_user)
VALUES 
    ('asd@sd.es', '123456', 'pinco', '2000-05-10', 'H', 'Italia', '24128', 'free'),
    ('pd@sd.es', '123456', 'panca', '1990-07-10', 'M', 'España', '08001', 'premium'),
    ('od@sd.es', '123456', 'ponco', '1980-01-10', 'H', 'Italia', '30110', 'premium');


INSERT INTO subscriptions (id_user, date_start_subscription, date_renew_subscription, payment_subscription)
SELECT 2, CURRENT_DATE(), CURRENT_DATE() + INTERVAL 1 YEAR, 'credit card'
WHERE EXISTS( SELECT 1 FROM users WHERE users.type_user LIKE 'premium');

INSERT INTO subscriptions (id_user, date_start_subscription, date_renew_subscription, payment_subscription)
SELECT 3, CURRENT_DATE(), CURRENT_DATE() + INTERVAL 1 YEAR, 'paypal'
WHERE EXISTS( SELECT 1 FROM users WHERE users.type_user LIKE 'premium');


INSERT INTO creditcards (id_user, number_creditcard, caducity_creditcard, code_creditcard)
VALUES (2, '1223 3224 5433 2133', '2024-05-01', 123);


INSERT INTO paypal (id_user, username_paypal)
VALUES (3, 'od@sd.es');


INSERT INTO payments (id_user, date_payment, amount_payment)
VALUES 
	(2, '2022-04-12', 10.50),
	(3, CURRENT_DATE(), 5.50);
    

INSERT INTO playlists (id_user, title_playlist, number_song_playlist, date_create_playlist)
VALUES 
	(2, 'My music', 5, CURRENT_DATE()),
    (2, 'My new music', 10, CURRENT_DATE());
    

INSERT INTO want_eliminate_playlists ( id_playlist, date_eliminate)
VALUES (1, NOW());

UPDATE playlists SET playlists.status_playlist = 'eliminated' WHERE playlists.id_playlist = 1;


INSERT INTO artists (name_artist, img_artist)
VALUES
	('A. Mozart', LOAD_FILE('/img/img.png')),
    ('J.S. Bach', LOAD_FILE('/img/img.png')),
    ('A. Vivaldi', LOAD_FILE('/img/img.png'));


INSERT INTO related_artists (id_artist1, id_artist2)
VALUES
	(1, 2),
    (1, 3),
    (2, 3);


INSERT INTO albums (id_artist, title_album, year_pubblication, img_album)
VALUES
	(1, 'Todo Mozart', 1980, LOAD_FILE('/img/img.png')),
    (1, 'Playing Mozart', 2010, LOAD_FILE('/img/img.png')),
    (2, 'Todo Bach', 1990, LOAD_FILE('/img/img.png'));
    
    
INSERT INTO songs (id_album, title_song, duration_song, number_reproduction_song)
VALUES
	(1, 'il flauto magico', '00:05:34', 30),
    (1, 'Sinfonia n 40', '00:06:21', 25),
    (2, 'Sinfonia n 41', '00:04:50', 20),
    (3, 'La ciaccona', '00:08:45', 35),
    (3, 'Preludio e Fuga', '00:06:32', 40);
    
INSERT INTO user_favorites (id_user, id_song, id_album, id_artist)
VALUES 
	(3, 1, NULL, 1),
    (2, NULL, NULL, 2),
    (2, 1, NULL, NULL);
    
    
INSERT INTO share_playlists (id_playlist, id_user, id_song, date_share_song)
SELECT 2, 1, 3, NOW()
WHERE EXISTS( SELECT 1 FROM playlists WHERE playlists.status_playlist LIKE 'active');

UPDATE playlists SET number_song_playlist = number_song_playlist +1 WHERE id_playlist = 2;
