SELECT 
    m.ID,
    m.Title,
    COUNT(c.ID) AS ActorsCount
FROM 
    Movie m
JOIN 
    Character c ON m.ID = c.MovieID
WHERE 
    m.ReleaseDate >= CURRENT_DATE - INTERVAL '5 years'
GROUP BY 
    m.ID, m.Title;
