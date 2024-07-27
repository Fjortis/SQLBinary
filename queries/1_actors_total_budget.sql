SELECT 
    p.ID,
    p.FirstName,
    p.LastName,
    SUM(m.Budget) AS TotalMoviesBudget
FROM 
    Person p
JOIN 
    Character c ON p.ID = c.PersonID
JOIN 
    Movie m ON c.MovieID = m.ID
GROUP BY 
    p.ID, p.FirstName, p.LastName;
