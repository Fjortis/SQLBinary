SELECT 
    p.ID AS DirectorID,
    CONCAT(p.FirstName, ' ', p.LastName) AS DirectorName,
    AVG(m.Budget) AS AverageBudget
FROM 
    Person p
JOIN 
    Movie m ON p.ID = m.DirectorID
GROUP BY 
    p.ID, p.FirstName, p.LastName;
