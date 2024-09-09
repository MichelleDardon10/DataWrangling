# Load the libraries
library(readr)
library(dplyr)

actors <- read_csv("actors.csv")
#View(actors)
roles <- read_csv("roles.csv")
#View(roles)
movies <- read_csv("movies.csv")
#View(movies)
movies_genres <- read_csv("movies_genres.csv")
#View(movies_genres)
movies_directors <- read_csv("movies_directors.csv")
#View(movies_directors)
directors <- read_csv("directors.csv")
#View(directors)
directors_genres <- read_csv("directors_genres.csv")
#View(directors_genres)


# Numero de peliculas
total_movies <- movies %>%
  summarise(count = n_distinct(id))

print(total_movies)

#Numero de directores
total_directores <- directors %>% 
  summarise(count = n_distinct(id))

print(total_directores)

# Promedio de generos por directores
average_genres_per_director <- directors_genres %>%
  group_by(director_id) %>%                 # Group por director
  summarise(genre_count = n_distinct(genre)) %>%  # Count the number of unique genres per director
  summarise(average_genres = mean(genre_count))  # Calculate the average number of genres

print(average_genres_per_director)

# Nuevo reporte de roles
role_report <- roles %>%
  
  
  left_join(actors, by = c("actor_id" = "id")) %>%
  
  
  left_join(movies, by = c("movie_id" = "id")) %>%
  
  
  left_join(movies_directors, by = "movie_id") %>%
  
  # Agrupar por roles
  group_by(role) %>%
  
  # Suma de los campos
  summarise(
    num_movies = n_distinct(movie_id),                      
    num_actors = sum(gender == "M", na.rm = TRUE),       
    num_actresses = sum(gender == "F", na.rm = TRUE),  
    num_directors = n_distinct(director_id)                 
  )

print(role_report)

# Reporte de directores
director_report <- directors %>%
  
  
  left_join(movies_directors, by = c("id" = "director_id"), relationship = "many-to-many") %>%
  
  
  left_join(roles, by = "movie_id", relationship = "many-to-many") %>%
  left_join(actors, by = c("actor_id" = "id")) %>%
  
  
  left_join(movies_genres, by = "movie_id", relationship = "many-to-many") %>%
  
  # Agrupar por ID
  group_by(id) %>%
  
  
  summarise(
    num_movies = n_distinct(movie_id),                          
    num_actors = n_distinct(actor_id),                          
    common_genre = if (any(!is.na(genre))) {                    
      names(which.max(table(genre)))                            
    } else {
      NA_character_                                             
    }
  )

print(director_report)


role_distribution <- roles %>%
  
  left_join(movies, by = c("movie_id" = "id"), relationship = "many-to-many") %>%
  
  
  left_join(movies_directors, by = "movie_id", relationship = "many-to-many") %>%
  
  left_join(directors, by = c("director_id" = "id"), relationship = "many-to-many") %>%
  
  group_by(name, first_name, last_name) %>%
  
  summarise(
    num_roles = n(),                        
    num_unique_roles = n_distinct(roles)    
  ) %>%
  
  
  arrange(desc(num_roles))


# POR COMPLICACIONES DEL TAMAÑO DE LA TABLA HICE SLICE
roles_sample <- roles %>% slice(1:100)


role_distribution_sample <- roles_sample %>%
  left_join(movies, by = c("movie_id" = "id"), relationship = "many-to-many") %>%
  left_join(movies_directors, by = "movie_id", relationship = "many-to-many") %>%
  left_join(directors, by = c("director_id" = "id"), relationship = "many-to-many") %>%
  group_by(name, first_name, last_name) %>%
  summarise(
    num_roles = n(),
    num_unique_roles = n_distinct(roles)
  ) %>%
  arrange(desc(num_roles))

# Check the result
print(role_distribution_sample)

