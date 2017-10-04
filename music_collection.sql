DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS artists;

CREATE TABLE albums (
  id SERIAL8 PRIMARY KEY,
  title VARCHAR(255),
  genre VARCHAR(255),
  artist_id INT8 REFERENCES artists(id)
  );

  CREATE TABLE artists (
    id SERIAL8 PRIMARY KEY,
    name VARCHAR(255)
    );
