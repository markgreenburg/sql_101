# Insert albums into albums table
INSERT INTO albums (id, full_name, release_date) VALUES (1, 'For You', '1978-04-07');
INSERT INTO albums (id, full_name, release_date) VALUES (2, 'Prince', '1979-10-19');
INSERT INTO albums (id, full_name, release_date) VALUES (3, 'The Slim Shady LP', '1999-02-23');
INSERT INTO albums (id, full_name, release_date) VALUES (4, 'Encore', '2004-11-12');

# Insert songs into songs table
INSERT INTO songs (id, full_name, duration) VALUES (1, 'For You', 106);
INSERT INTO songs (id, full_name, duration) VALUES (2, 'In Love', 338);
INSERT INTO songs (id, full_name, duration) VALUES (3, 'Soft and Wet', 301);
INSERT INTO songs (id, full_name, duration) VALUES (4, 'I Wanna Be Your Lover', 549);
INSERT INTO songs (id, full_name, duration) VALUES (5, 'Sexy Dancer', 418);
INSERT INTO songs (id, full_name, duration) VALUES (6, 'My Name Is', 428);
INSERT INTO songs (id, full_name, duration) VALUES (7, 'If I had', 405);
INSERT INTO songs (id, full_name, duration) VALUES (8, 'Evil Deeds', 419);
INSERT INTO songs (id, full_name, duration) VALUES (9, 'Rain Man', 513);

# Insert artists into artists table
INSERT INTO artists (id, full_name) VALUES (1, 'Prince');
INSERT INTO artists (id, full_name) VALUES (2, 'Chris Moon');
INSERT INTO artists (id, full_name) VALUES (3, 'Eminem');

# Insert instruments into instruments table
INSERT INTO instruments (id, full_name) VALUES (1, 'Vocals');
INSERT INTO instruments (id, full_name) VALUES (2, 'Ukulele');
INSERT INTO instruments (id, full_name) VALUES (3, 'Bass Guitar');
INSERT INTO instruments (id, full_name) VALUES (4, 'Drums');

# Insert songwriters into songwriters table
INSERT INTO songwriters (id, first_name, last_name) VALUES (1, 'Prince', 'Nelson');
INSERT INTO songwriters (id, first_name, last_name) VALUES (2, 'Marshall', 'Mathers');
INSERT INTO songwriters (id, first_name, last_name) VALUES (3, 'Jeff', 'Bass');
INSERT INTO songwriters (id, first_name, last_name) VALUES (4, 'Mark', 'Bass');
INSERT INTO songwriters (id, first_name, last_name) VALUES (5, 'Andre', 'Young');
INSERT INTO songwriters (id, first_name, last_name) VALUES (6, 'Mike', 'Elizondo');
INSERT INTO songwriters (id, first_name, last_name) VALUES (7, 'Mark', 'Batson');
INSERT INTO songwriters (id, first_name, last_name) VALUES (8, 'Chris', 'Pope');

# Insert albums_songs into albums_songs
INSERT INTO albums_songs (id, album_id, song_id, position) VALUES (1, 1, 1, 1);
INSERT INTO albums_songs (id, album_id, song_id, position) VALUES (2, 1, 2, 2);
INSERT INTO albums_songs (id, album_id, song_id, position) VALUES (3, 1, 3, 3);
INSERT INTO albums_songs (id, album_id, song_id, position) VALUES (4, 2, 4, 1);
INSERT INTO albums_songs (id, album_id, song_id, position) VALUES (5, 2, 5, 2);
INSERT INTO albums_songs (id, album_id, song_id, position) VALUES (6, 3, 6, 1);
INSERT INTO albums_songs (id, album_id, song_id, position) VALUES (7, 3, 7, 2);
INSERT INTO albums_songs (id, album_id, song_id, position) VALUES (8, 4, 8, 1);
INSERT INTO albums_songs (id, album_id, song_id, position) VALUES (9, 4, 9, 2);

# Insert artists_instruments into artists_instruments table
INSERT INTO artists_instruments (id, artist_id, instrument_id) VALUES (1, 1, 1);
INSERT INTO artists_instruments (id, artist_id, instrument_id) VALUES (2, 1, 2);
INSERT INTO artists_instruments (id, artist_id, instrument_id) VALUES (3, 1, 3);
INSERT INTO artists_instruments (id, artist_id, instrument_id) VALUES (4, 2, 4);
INSERT INTO artists_instruments (id, artist_id, instrument_id) VALUES (5, 3, 1);

# Insert songs_songwriters into songs_songwriters table
INSERT INTO songs_songwriters (id, song_id, songwriter_id) VALUES (1, 1, 1);
INSERT INTO songs_songwriters (id, song_id, songwriter_id) VALUES (2, 2, 1);
INSERT INTO songs_songwriters (id, song_id, songwriter_id) VALUES (3, 3, 1);
INSERT INTO songs_songwriters (id, song_id, songwriter_id) VALUES (4, 3, 1);
INSERT INTO songs_songwriters (id, song_id, songwriter_id) VALUES (5, 4, 1);
INSERT INTO songs_songwriters (id, song_id, songwriter_id) VALUES (6, 5, 1);
INSERT INTO songs_songwriters (id, song_id, songwriter_id) VALUES (7, 6, 2);
INSERT INTO songs_songwriters (id, song_id, songwriter_id) VALUES (8, 6, 3);
INSERT INTO songs_songwriters (id, song_id, songwriter_id) VALUES (9, 7, 2);
INSERT INTO songs_songwriters (id, song_id, songwriter_id) VALUES (10, 7, 3);
INSERT INTO songs_songwriters (id, song_id, songwriter_id) VALUES (11, 7, 4);
INSERT INTO songs_songwriters (id, song_id, songwriter_id) VALUES (12, 8, 2);
INSERT INTO songs_songwriters (id, song_id, songwriter_id) VALUES (13, 8, 5);
INSERT INTO songs_songwriters (id, song_id, songwriter_id) VALUES (14, 8, 6);
INSERT INTO songs_songwriters (id, song_id, songwriter_id) VALUES (15, 8, 7);
INSERT INTO songs_songwriters (id, song_id, songwriter_id) VALUES (16, 8, 8);
INSERT INTO songs_songwriters (id, song_id, songwriter_id) VALUES (17, 9, 2);
INSERT INTO songs_songwriters (id, song_id, songwriter_id) VALUES (18, 9, 5);
INSERT INTO songs_songwriters (id, song_id, songwriter_id) VALUES (19, 9, 6);
INSERT INTO songs_songwriters (id, song_id, songwriter_id) VALUES (20, 9, 7);
INSERT INTO songs_songwriters (id, song_id, songwriter_id) VALUES (21, 9, 8);

# Insert songs_artists into songs_artists table
INSERT INTO songs_artists (id, song_id, artist_id, is_lead) VALUES (1, 1, 1, 1);
INSERT INTO songs_artists (id, song_id, artist_id, is_lead) VALUES (2, 2, 1, 1);
INSERT INTO songs_artists (id, song_id, artist_id, is_lead) VALUES (3, 3, 1, 1);
INSERT INTO songs_artists (id, song_id, artist_id, is_lead) VALUES (4, 3, 2, 0);
INSERT INTO songs_artists (id, song_id, artist_id, is_lead) VALUES (5, 4, 1, 1);
INSERT INTO songs_artists (id, song_id, artist_id, is_lead) VALUES (6, 5, 1, 1);
INSERT INTO songs_artists (id, song_id, artist_id, is_lead) VALUES (7, 6, 3, 1);
INSERT INTO songs_artists (id, song_id, artist_id, is_lead) VALUES (8, 7, 3, 1);
INSERT INTO songs_artists (id, song_id, artist_id, is_lead) VALUES (9, 8, 3, 1);
INSERT INTO songs_artists (id, song_id, artist_id, is_lead) VALUES (10, 9, 3, 1);
