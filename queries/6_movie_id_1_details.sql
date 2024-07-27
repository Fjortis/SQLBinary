SELECT 
    m.ID,
    m.Title,
    m.ReleaseDate,
    m.Duration,
    m.Description,
    json_build_object('FileName', f.FileName, 'MIMEType', f.MIMEType, 'Key', f.Key, 'URL', f.URL) AS Poster,
    json_build_object(
        'ID', p.ID,
        'FirstName', p.FirstName,
        'LastName', p.LastName,
        'Photo', json_build_object('FileName', pf.FileName, 'MIMEType', pf.MIMEType, 'Key', pf.Key, 'URL', pf.URL)
    ) AS Director,
    (SELECT json_agg(json_build_object('ID', per.ID, 'FirstName', per.FirstName, 'LastName', per.LastName, 'Photo', json_build_object('FileName', fp.FileName, 'MIMEType', fp.MIMEType, 'Key', fp.Key, 'URL', fp.URL)))
     FROM Character c
     JOIN Person per ON c.PersonID = per.ID
     JOIN File fp ON per.PrimaryPhotoFileID = fp.ID
     WHERE c.MovieID = m.ID) AS Actors,
    (SELECT json_agg(json_build_object('ID', g.ID, 'Name', g.Name))
     FROM MovieGenre mg
     JOIN Genre g ON mg.GenreID = g.ID
     WHERE mg.MovieID = m.ID) AS Genres
FROM 
    Movie m
JOIN 
    Person p ON m.DirectorID = p.ID
JOIN 
    File f ON m.PosterFileID = f.ID
JOIN 
    File pf ON p.PrimaryPhotoFileID = pf.ID
WHERE 
    m.ID = 1;
