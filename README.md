# Movie Application Database

## Project Description

This project involves designing a simplified database for a movie application. The database structure includes tables for users, movies, characters, genres, and more.

## Database Schema

### ER Diagram

```mermaid
erDiagram
    USER {
        int id
        string username
        string first_name
        string last_name
        string email
        string password
        int avatar_id
        timestamp created_at
        timestamp updated_at
    }

    FILE {
        int id
        string file_name
        string mime_type
        string file_key
        string url
        timestamp created_at
        timestamp updated_at
    }

    MOVIE {
        int id
        string title
        string description
        decimal budget
        date release_date
        int duration
        int director_id
        int country_id
        int poster_id
        timestamp created_at
        timestamp updated_at
    }

    CHARACTER {
        int id
        string name
        string description
        string role
        int movie_id
        int person_id
        timestamp created_at
        timestamp updated_at
    }

    PERSON {
        int id
        string first_name
        string last_name
        string biography
        date date_of_birth
        string gender
        int country_id
        int primary_photo_id
        timestamp created_at
        timestamp updated_at
    }

    GENRE {
        int id
        string name
        timestamp created_at
        timestamp updated_at
    }

    COUNTRY {
        int id
        string name
        timestamp created_at
        timestamp updated_at
    }

    FAVORITES {
        int user_id
        int movie_id
        timestamp created_at
    }

    MOVIE_GENRE {
        int movie_id
        int genre_id
    }

    USER ||--o{ FAVORITES : "marks"
    MOVIE ||--o{ FAVORITES : "is in"
    USER }o--o{ FILE : "has"
    PERSON }o--o{ FILE : "has"
    MOVIE }o--o{ FILE : "has"
    MOVIE ||--o{ GENRE : "is of"
    MOVIE ||--o{ CHARACTER : "has"
    PERSON ||--o{ CHARACTER : "plays"
    MOVIE }o--|| COUNTRY : "is produced in"
    PERSON }o--|| COUNTRY : "is from"
    MOVIE }o--|| PERSON : "directed by"
```
