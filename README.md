# Movie Application Database

## Project Description

This project involves designing a simplified database for a movie application. The database structure includes tables for users, movies, characters, genres, and more.

## Database Schema

# ER Diagram

```mermaid
erDiagram
    USER {
        int ID
        string username
        string first_name
        string last_name
        string email
        string password
        string avatar_file_id
        datetime created_at
        datetime updated_at
    }
    FILE {
        int ID
        string file_name
        string mime_type
        string file_key
        string file_url
        datetime created_at
        datetime updated_at
    }
    MOVIE {
        int ID
        string title
        text description
        decimal budget
        date release_date
        int duration
        int director_id
        int country_id
        string poster_file_id
        datetime created_at
        datetime updated_at
    }
    CHARACTER {
        int ID
        string name
        text description
        enum role
        int movie_id
        int actor_id
        datetime created_at
        datetime updated_at
    }
    PERSON {
        int ID
        string first_name
        string last_name
        text biography
        date date_of_birth
        enum gender
        int country_id
        string primary_photo_file_id
        datetime created_at
        datetime updated_at
    }
    FAVORITE_MOVIE {
        int user_id
        int movie_id
    }
    GENRE {
        int ID
        string name
        datetime created_at
        datetime updated_at
    }
    MOVIE_GENRE {
        int movie_id
        int genre_id
    }

    USER ||--o{ FILE : has
    USER ||--o{ FAVORITE_MOVIE : adds
    FAVORITE_MOVIE }o--|| MOVIE : favorite
    MOVIE ||--o{ FILE : has
    MOVIE ||--o{ CHARACTER : features
    MOVIE ||--o{ MOVIE_GENRE : categorized
    MOVIE_GENRE }o--|| GENRE : includes
    CHARACTER ||--o| PERSON : portrayed
    PERSON ||--o{ FILE : has
    PERSON ||--|{ COUNTRY : from
    MOVIE ||--|{ COUNTRY : from
```
