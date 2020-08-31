--1. Query all of the entries in the Genre table
--SELECT Label FROM Genre;

--2. Query all the entries in the Artist table and order by the artist's name. HINT: use the ORDER BY keywords
/*
SELECT *
FROM Artist
ORDER BY ArtistName;
*/

--3. Write a SELECT query that lists all the songs in the Song table and include the Artist name
/*
SELECT
    s.Title,
    a.ArtistName
FROM Song s
    LEFT JOIN Artist a ON s.ArtistId = a.Id;
*/

--4. Write a SELECT query that lists all the Artists that have a Pop Album
/*
SELECT a.ArtistName
FROM Album al
    LEFT JOIN Artist a ON al.ArtistId = a.Id
    LEFT JOIN Genre g ON al.GenreId = g.Id
WHERE g.Label = 'Pop';
*/

--5. Write a SELECT query that lists all the Artists that have a Jazz or Rock Album
/*
SELECT
    a.ArtistName,
    g.Label
FROM Album al
    LEFT JOIN Artist a ON al.ArtistId = a.Id
    LEFT JOIN Genre g ON al.GenreId = g.Id
WHERE g.Label IN ('Jazz', 'Rock');
*/

--6. Write a SELECT statement that lists the Albums with no songs
/*
SELECT
    al.Title,
    s.Title
FROM Album al
    LEFT JOIN Song s ON al.id = s.AlbumId
WHERE s.Title IS NULL;
*/

--7. Using the INSERT statement, add one of your favorite artists to the Artist table.
--INSERT INTO Artist (ArtistName, YearEstablished) VALUES ('Chris', 1990);

--8. Using the INSERT statement, add one, or more, albums by your artist to the Album table.
--INSERT INTO Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId) VALUES ('Happy Birthday', '11/26/1990', 2268, 'Clear Skin', 28, 7);

--9. Using the INSERT statement, add some songs that are on that album to the Song table.
/*
INSERT INTO Song
    (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
VALUES
    ('Please Hire Me', 61, '11/26/1990', 7, 28, 23);
INSERT INTO Song
    (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
VALUES
    ('Software Developer', 69, '11/26/1990', 7, 28, 23);
*/

--10. Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.
/*
SELECT
    s.Title,
    al.Title,
    a.ArtistName
FROM Song s
    LEFT JOIN Album al ON s.AlbumId = al.Id
    LEFT JOIN Artist a ON s.ArtistId = a.Id
WHERE a.ArtistName = 'Chris';
*/

--11. Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
/*
SELECT
    al.Title,
    COUNT(AlbumId)
FROM Song s
    LEFT JOIN Album al ON s.AlbumId = al.Id
GROUP BY al.Title;
*/

--12. Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
/*
SELECT
    a.ArtistName,
    COUNT(ArtistId)
FROM Song s
    LEFT JOIN Artist a ON s.ArtistId = a.Id
GROUP BY a.ArtistName;
*/

--13. Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
/*
SELECT
    g.Label,
    COUNT(GenreId)
FROM Song s
    LEFT JOIN Genre g ON s.GenreId = g.Id
GROUP BY g.Label;
*/

--14. Write a SELECT query that lists the Artists that have put out records on more than one record label. Hint: When using GROUP BY instead of using a WHERE clause, use the HAVING keyword
/*
SELECT
    a.ArtistName,
    COUNT(DISTINCT Label)
FROM Album al
    LEFT JOIN Artist a ON al.ArtistId = a.Id
GROUP BY a.ArtistName
HAVING COUNT(DISTINCT Label) > 1;
*/

--15. Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.
/*
SELECT
    Title,
    AlbumLength
FROM Album
WHERE AlbumLength = (SELECT MAX(AlbumLength)
FROM Album);
*/

--16. Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.
--17. Modify the previous query to also display the title of the album.
/*
SELECT
    s.Title AS SongTitle,
    SongLength AS SongLength,
    al.Title AS AlbumTitle
FROM Song s
    LEFT JOIN Album al ON s.AlbumId = al.Id
WHERE SongLength = (SELECT MAX(SongLength)
FROM Song);
*/