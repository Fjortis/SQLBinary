SELECT 
    u.ID,
    u.Username,
    ARRAY_AGG(fm.MovieID) AS FavoriteMovieIDs
FROM 
    Users u
LEFT JOIN 
    FavoriteMovies fm ON u.ID = fm.UserID
GROUP BY 
    u.ID, u.Username;
