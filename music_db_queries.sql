# What are tracks for a given album?
# tables: albums, songs, albums_songs
SELECT
  songs.full_name
FROM music_db.songs songs
INNER JOIN
  music_db.albums_songs albums_songs
  ON songs.id = albums_songs.song_id
INNER JOIN
  music_db.albums albums
  ON albums.id = albums_songs.album_id
#WHERE
#  albums.full_name = 'For You'
ORDER BY albums.full_name ASC
;

# What instruments does each artist play?
# tables: artists, instruments, artists_instruments
SELECT
  artists.full_name,
  instruments.full_name
FROM music_db.artists artists
INNER JOIN
  music_db.artists_instruments artists_instruments
  ON artists.id = artists_instruments.artist_id
INNER JOIN
  music_db.instruments instruments
  ON instruments.id = artists_instruments.instrument_id
#WHERE
#  artists.full_name = 'Prince'
ORDER BY artists.full_name ASC
;

# What is the track with the longest duration?
SELECT
  songs.full_name,
  songs.duration
FROM music_db.songs
ORDER BY duration DESC
LIMIT 1
;

# What are the albums released in the 60s? 70s? 80s? 90s?
SELECT
  albums.full_name,
  albums.release_date
FROM music_db.albums
WHERE
  albums.release_date > '1990'
  AND albums.release_date < '2000'
;

# How many albums did a given artist produce in the 90s?
SELECT
	get_ids.full_name artist_name,
	count(get_ids.album_id) album_count
FROM (
  SELECT
    artists.full_name,
    album_id
  FROM music_db.artists artists
  INNER JOIN (
    SELECT
      *
      FROM music_db.songs_artists songs_artists
      WHERE
        is_lead = 1
  ) songs_artists
  ON artists.id = songs_artists.artist_id
  INNER JOIN albums_songs albums_songs
  ON songs_artists.song_id = albums_songs.song_id
  INNER JOIN (
    SELECT
      *
    FROM albums albums
    WHERE
	    albums.release_date > '1990'
	    AND albums.release_date < '2000'
  ) albums
  ON albums_songs.album_id = albums.id
  GROUP BY 1, 2
) get_ids
#WHERE
# artist_name = 'Some Artist'
GROUP BY full_name
;

# What is the total run time of each album (based on the duration of its
#  tracks)?
SELECT
  albums.full_name,
  sum(songs.duration) AS duration
FROM music_db.albums albums
INNER JOIN music_db.albums_songs albums_songs
ON albums.id = albums_songs.album_id
INNER JOIN music_db.songs songs
ON albums_songs.song_id = songs.id
GROUP BY albums.full_name
;

# What are all the tracks a given artist has recorded?
SELECT
  artists.full_name,
  songs.full_name
FROM music_db.artists artists
INNER JOIN music_db.songs_artists songs_artists
ON artists.id = songs_artists.artist_id
INNER JOIN music_db.songs songs
ON songs_artists.song_id = songs.id
;

# What are the albums recorded by only one solo artist?
SELECT
	full_name
FROM (
	SELECT
	  albums.full_name,
	  songs_artists.artist_id
	FROM music_db.albums albums
	INNER JOIN music_db.albums_songs albums_songs
	ON albums.id = albums_songs.album_id
	INNER JOIN music_db.songs_artists songs_artists
	ON albums_songs.song_id = songs_artists.song_id
	GROUP BY 1, 2
) a_list
GROUP BY 1
HAVING
	COUNT(full_name) = 1
;

# What are the albums produced by a given artist as the lead artist?
SELECT
  albums.full_name
FROM music_db.albums albums
INNER JOIN music_db.albums_songs albums_songs
ON albums.id = albums_songs.album_id
INNER JOIN (
  SELECT
    song_id,
    artist_id
  FROM music_db.songs_artists
  WHERE
    is_lead = 1
) songs_artists
