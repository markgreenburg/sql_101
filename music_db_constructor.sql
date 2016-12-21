/*
Defaults for MySQL:
charset=utf8
engine=InnoDB
*/

#Create DB 
# WARNING: CURRENT DATABASE WILL BE DROPPED!
DROP DATABASE IF EXISTS music_db;
CREATE DATABASE music_db;

#Create primary data tables
CREATE TABLE albums (
  `id` int(11) AUTO_INCREMENT NOT NULL,
  `full_name` varchar(50) DEFAULT NULL,
  `release_date` DATE DEFAULT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE songs (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(50) DEFAULT NULL,
  `duration` TIME,
  PRIMARY KEY (`id`)
);

CREATE TABLE artists (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE songwriters (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE instruments (
`id` int(11) NOT NULL AUTO_INCREMENT,
`full_name` varchar(50) DEFAULT NULL,
PRIMARY KEY (`id`)
);

/*
Create linking tables
*/

#contains track position metadata
CREATE TABLE albums_songs (
  `id` int(11) UNIQUE NOT NULL AUTO_INCREMENT,
  `album_id` int(11) NOT NULL,
  `song_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  FOREIGN KEY (`album_id`)
    REFERENCES albums(`id`),
  FOREIGN KEY (`song_id`)
    REFERENCES songs(`id`),
  PRIMARY KEY (`album_id`, `song_id`)
);

#contains metadata about whether an artist is the lead artist on song_artist
CREATE TABLE songs_artists (
  `id` int(11) UNIQUE NOT NULL AUTO_INCREMENT,
  `song_id` int(11) NOT NULL,
  `artist_id` int(11) NOT NULL,
  `is_lead` tinyint(1) NOT NULL,
  FOREIGN KEY (`song_id`)
    REFERENCES songs(`id`),
  FOREIGN KEY (`artist_id`)
    REFERENCES artists(`id`),
  PRIMARY KEY (`song_id`, `artist_id`)
);

CREATE TABLE songs_songwriters (
  `id` int(11) UNIQUE NOT NULL AUTO_INCREMENT,
  `song_id` int(11) NOT NULL,
  `songwriter_id` int(11) NOT NULL,
  FOREIGN KEY (`song_id`)
    REFERENCES songs(`id`),
  FOREIGN KEY (`songwriter_id`)
    REFERENCES songwriters(`id`),
  PRIMARY KEY (`song_id`, `songwriter_id`)
);

CREATE TABLE artists_instruments (
  `id` int(11) UNIQUE NOT NULL AUTO_INCREMENT,
  `artist_id` int(11) NOT NULL,
  `instrument_id` int(11) NOT NULL,
  FOREIGN KEY (`artist_id`)
    REFERENCES artists(`id`),
  FOREIGN KEY (`instrument_id`)
    REFERENCES instruments(`id`),
  PRIMARY KEY (`artist_id`, `instrument_id`)
);
