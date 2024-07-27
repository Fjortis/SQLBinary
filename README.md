# Movie Application Database

## Project Description

This project involves designing a simplified database for a movie application. The database structure includes tables for users, movies, characters, genres, and more.

## Database Schema

# ER Diagram

```mermaid
erDiagram
    USER {
        int id PK
        string username
        string first_name
        string last_name
        string email
        string password
        int avatar_id FK
        timestamp created_at
        timestamp updated_at
    }

    FILE {
        int id PK
        string file_name
        string mime_type
        string file_key
        string url
        timestamp created_at
        timestamp updated_at
    }

    MOVIE {
        int id PK
        string title
        string description
        decimal budget
        date release_date
        int duration
        int director_id FK
        int country_id FK
        int poster_id FK
        timestamp created_at
        timestamp updated_at
    }

    CHARACTER {
        int id PK
        string name
        string description
        enum role
        int movie_id FK
        int person_id FK
        timestamp created_at
        timestamp updated_at
    }

    PERSON {
        int id PK
        string first_name
        string last_name
        string biography
        date date_of_birth
        enum gender
        int country_id FK
        int primary_photo_id FK
        timestamp created_at
        timestamp updated_at
    }

    GENRE {
        int id PK
        string name
        timestamp created_at
        timestamp updated_at
    }

    COUNTRY {
        int id PK
        string name
        timestamp created_at
        timestamp updated_at
    }

    FAVORITES {
        int user_id FK
        int movie_id FK
        timestamp created_at
        PRIMARY KEY (user_id, movie_id)
    }

    MOVIE_GENRE {
        int movie_id FK
        int genre_id FK
        PRIMARY KEY (movie_id, genre_id)
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
