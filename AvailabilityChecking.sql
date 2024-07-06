create database minor_project;
use minor_project;
CREATE TABLE movie_show (
    show_id SMALLINT PRIMARY KEY,
    name VARCHAR(45),
    movie_id SMALLINT,
    show_date DATE,
    show_time TIME,
    theater_id SMALLINT,
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
    FOREIGN KEY (theater_id) REFERENCES theater(theater_id)
);
CREATE TABLE theater (
    theater_id SMALLINT PRIMARY KEY,
    name VARCHAR(45),
    address TEXT,
    contact_no VARCHAR(50),
    capacity SMALLINT
);
CREATE TABLE movies (
    movie_id SMALLINT PRIMARY KEY,
    name VARCHAR(100),
    language ENUM ('English', 'Spanish', 'French', 'German', 'Chinese', 'Japanese', 'Korean', 'Hindi', 'Other'),
    duration TIME,
    released_year YEAR
);
select * from movie_show;
select * from movies;
select * from theater;
INSERT INTO movies (movie_id, name, language, duration, released_year) VALUES
(1, 'Kalki', 'English', '02:28:00', 2010),
(2, 'Interstellar', 'English', '02:49:00', 2014),
(3, 'Star', 'English', '02:12:00', 2019);

INSERT INTO theater (theater_id, name, address, contact_no, capacity) VALUES
(1, 'Hall 1 Cinema', 'benny street, UserLocation', '6304607558', 300),
(2, 'City Center Theater', 'Shollinganallur, UserLocation', '961874559', 200);

INSERT INTO movie_show (show_id, name, movie_id, show_date, show_time, theater_id) VALUES  
(1, 'kalki 1', 1, '2024-07-02', '18:00:00', 1),
(2, 'Interstellar Show 1', 2, '2024-07-02', '21:00:00', 1),
(3, 'star Show 1', 3, '2024-07-02', '20:00:00', 2);
SELECT name FROM movies WHERE released_year BETWEEN 2010 AND 2020;     
SELECT m.name 
FROM movies m
JOIN movie_show ms ON m.movie_id = ms.movie_id
JOIN theater t ON ms.theater_id = t.theater_id
WHERE t.address LIKE '%UserLocation%'
ORDER BY m.released_year DESC LIMIT 1;

SELECT name,address
FROM theater 
WHERE capacity > 280 AND address LIKE 'benny%';

SELECT t.name, COUNT(m.movie_id) AS movie_count
FROM theater t
JOIN movie_show ms ON t.theater_id = ms.theater_id
JOIN movies m ON ms.movie_id = m.movie_id
WHERE m.released_year = 2019 GROUP BY t.name;

SELECT name 
FROM movies 
ORDER BY released_year DESC 
LIMIT 1;



