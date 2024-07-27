SELECT 
    m.ID,
    m.Title,
    m.ReleaseDate,
    m.Duration,
    m.Description,
    json_build_object('FileName', f.FileName, 'MIMEType', f.MIMEType, 'Key', f.Key, 'URL', f.URL) AS Poster,
    json_build_object('ID', p.ID, 'FirstName', p.FirstName, 'LastName', p.LastName) AS Director
FROM 
    Movie m
JOIN 
    Person p ON m.DirectorID = p.ID
JOIN 
    File f ON m.PosterFileID = f.ID
WHERE 
    m.CountryID = 1
    AND m.ReleaseDate >= '2022-01-01'
    AND m.Duration > 135
    AND EXISTS (
        SELECT 1
        FROM MovieGenre mg
        JOIN Genre g ON mg.GenreID = g.ID
        WHERE mg.MovieID = m.ID
        AND g.Name IN ('Action', 'Drama')
    );
