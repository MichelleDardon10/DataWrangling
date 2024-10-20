library(readr)
library(dplyr)
library(stringr)

# LLAMADA DE LOS DATOS
Health_and_Personal_Care_metadata <- read_csv("C:/Users/miche/Downloads/Archive/Health_and_Personal_Care_metadata.csv")
Health_and_Personal_Care <- read_csv("C:/Users/miche/Downloads/Archive/Health_and_Personal_Care.csv")

#1: Filtrar los reviews que contienen "love", "recommend" y "enjoy"
productos_filtrados <- Health_and_Personal_Care %>%
  filter(grepl("love", text, ignore.case = TRUE) &
           grepl("recommend", text, ignore.case = TRUE) &
           grepl("enjoy", text, ignore.case = TRUE)) %>%
  distinct(product_id, .keep_all = TRUE)  # Asegurarse de que los product_id sean únicos

#2: Imprimir la cantidad de filas con productos distintos que contienen 'love', 'recommend' y 'enjoy'
cat("Cantidad de filas con productos distintos que contienen 'love', 'recommend' y 'enjoy':", nrow(productos_filtrados), "\n")

#3: Unir con la tabla Health_and_Personal_Care_metadata para obtener las tiendas
productos_con_tiendas <- productos_filtrados %>%
  left_join(Health_and_Personal_Care_metadata, by = "parent_id")

#4: Encontrar el top 5 de tiendas que venden estos productos (antes de la limpieza)
top_5_tiendas <- productos_con_tiendas %>%
  group_by(store) %>%
  summarise(count = n()) %>%
  arrange(desc(count)) %>%
  head(5)

# Mostrar el top 5 de tiendas antes de la limpieza
cat("Top 5 de tiendas antes de la limpieza: \n")
print(top_5_tiendas)

# LIMPIEZA DE LA COLUMNA 'store' DESPUÉS DE OBTENER EL TOP 5
productos_con_tiendas_limpio <- productos_con_tiendas %>%
  mutate(store = str_trim(store)) %>%       # Eliminar espacios en blanco al inicio y final
  filter(store != "",                       # Eliminar cadenas vacías
         store != "n/a",                    # Eliminar el texto 'n/a'
         nchar(store) > 0) %>%              # Asegurar que no queden cadenas vacías
  mutate(store = tolower(store))            # Convertir a minúsculas para uniformidad

#5: Recalcular el top 5 después de limpiar la columna 'store'
top_5_tiendas_limpio <- productos_con_tiendas_limpio %>%
  group_by(store) %>%
  summarise(count = n()) %>%
  arrange(desc(count)) %>%
  head(5)

# Mostrar el top 5 de tiendas después de la limpieza
cat("Top 5 de tiendas después de la limpieza: \n")
print(top_5_tiendas_limpio)


# GENERACION DEL WORDCLOUD
library(tm)
library(wordcloud)

reviews_text <- productos_filtrados$text

# Crear un corpus de texto y eliminar stopwords
corpus <- Corpus(VectorSource(reviews_text))

# Limpieza del texto: convertir a minúsculas, eliminar puntuación y stopwords
corpus <- corpus %>%
  tm_map(content_transformer(tolower)) %>%
  tm_map(removePunctuation) %>%
  tm_map(removeNumbers) %>%
  tm_map(removeWords, stopwords("en"))  # Eliminar stopwords en inglés

# Convertir el corpus a una matriz de términos
dtm <- TermDocumentMatrix(corpus)
matrix <- as.matrix(dtm)

# Sumar las frecuencias de las palabras
word_freqs <- sort(rowSums(matrix), decreasing = TRUE)


df_words <- data.frame(word = names(word_freqs), freq = word_freqs)

set.seed(1234)  # Para reproducibilidad
wordcloud(words = df_words$word, freq = df_words$freq, min.freq = 2,
          max.words = 100, random.order = FALSE, colors = brewer.pal(8, "Dark2"))



# WORDCLOUD DE LAS TIENDAS

# Obtener los nombres de las 5 tiendas del top 5 limpio
top_5_tiendas_limpio_names <- top_5_tiendas_limpio$store

# Filtrar los reviews que pertenecen a esas tiendas
reviews_top_5_tiendas <- productos_con_tiendas_limpio %>%
  filter(store %in% top_5_tiendas_limpio_names)

# Extraer los reviews (columna 'text') de estas tiendas
reviews_text_top_5 <- reviews_top_5_tiendas$text

corpus_top_5 <- Corpus(VectorSource(reviews_text_top_5))

# Limpieza del texto: convertir a minúsculas, eliminar puntuación y stopwords
corpus_top_5 <- corpus_top_5 %>%
  tm_map(content_transformer(tolower)) %>%
  tm_map(removePunctuation) %>%
  tm_map(removeNumbers) %>%
  tm_map(removeWords, stopwords("en"))  # Eliminar stopwords en inglés

# Convertir el corpus a una matriz de términos
dtm_top_5 <- TermDocumentMatrix(corpus_top_5)
matrix_top_5 <- as.matrix(dtm_top_5)

# Sumar las frecuencias de las palabras
word_freqs_top_5 <- sort(rowSums(matrix_top_5), decreasing = TRUE)

# Crear un dataframe con las palabras y sus frecuencias
df_words_top_5 <- data.frame(word = names(word_freqs_top_5), freq = word_freqs_top_5)

# Generar el wordcloud sin stopwords para los reviews de las 5 tiendas
set.seed(1234)  # Para reproducibilidad
wordcloud(words = df_words_top_5$word, freq = df_words_top_5$freq, min.freq = 2,
          max.words = 100, random.order = FALSE, colors = brewer.pal(8, "Dark2"))




# 25 PALABRAS MAS FRECUENTES


# Extraer el texto de los reviews (columna 'text' de productos filtrados)
reviews_text <- productos_filtrados$text

# Crear un corpus de texto
corpus <- Corpus(VectorSource(reviews_text))

# Limpiar el texto: convertir a minúsculas, eliminar puntuación y stopwords
corpus <- corpus %>%
  tm_map(content_transformer(tolower)) %>%
  tm_map(removePunctuation) %>%
  tm_map(removeNumbers) %>%
  tm_map(removeWords, stopwords("en"))

dtm <- TermDocumentMatrix(corpus)
matrix <- as.matrix(dtm)

# Sumar las frecuencias de las palabras
word_freqs <- sort(rowSums(matrix), decreasing = TRUE)

# Crear un dataframe con las palabras y sus frecuencias
df_words <- data.frame(word = names(word_freqs), freq = word_freqs)

top_25_words <- head(df_words, 25)

# Mostrar las 25 palabras más frecuentes
print(top_25_words)
