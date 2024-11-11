# Libraries

library(readr)
library(lubridate)
library(dplyr)
library(ggplot2)

c1 <- read_csv("c1.csv")
data <- c1
View(data)

# Limpieza de Datos

# Convertir la columna 'Fecha' al formato de fecha correcto
data$Fecha <- as.Date(data$Fecha, format = "%d-%m-%y")
# head(data$Fecha)

# Camion 

data$Camion_5 <- gsub("Q-", "", data$Camion_5)
data$Camion_5 <- gsub("Q", "", data$Camion_5)
data$Camion_5[data$Camion_5 == ""] <- NA  
data$Camion_5 <- as.numeric(data$Camion_5)
class(data$Camion_5)
colnames(data)[colnames(data) == "Camion_5"] <- "Camion"

head(data$Camion)
# numeric


# Pickup

data$Pickup <- gsub("Q-", "", data$Pickup)
data$Pickup <- gsub("Q", "", data$Pickup)
data$Pickup[data$Pickup == ""] <- NA  
data$Pickup <- as.numeric(data$Pickup)

# numeric
head(data$Pickup)


# Moto

data$Moto <- gsub("Q-", "", data$Moto)
data$Moto <- gsub("Q", "", data$Moto)
data$Moto[data$Moto == ""] <- NA  
data$Moto <- as.numeric(data$Moto)
class(data$Moto)

#Numeric

# Factura

data$factura <- gsub("Q-", "", data$factura)
data$factura <- gsub("Q", "", data$factura)
data$factura[data$factura == ""] <- NA  # 
data$factura <- as.numeric(data$factura)
class(data$factura)

# directoCamion_5

data$directoCamion_5 <- gsub("Q-", "", data$directoCamion_5)
data$directoCamion_5 <- gsub("Q", "", data$directoCamion_5)
data$directoCamion_5[data$directoCamion_5 == ""] <- NA  # Asigna NA a valores vacíos
data$directoCamion_5 <- as.numeric(data$directoCamion_5)
class(data$directoCamion_5)
colnames(data)[colnames(data) == "directoCamion_5"] <- "directoCamion"

# directoPickup

data$directoPickup <- gsub("Q-", "", data$directoPickup)
data$directoPickup <- gsub("Q", "", data$directoPickup)
data$directoPickup[data$directoPickup == ""] <- NA  # Asigna NA a valores vacíos
data$directoPickup <- as.numeric(data$directoPickup)
class(data$directoPickup)

# directoMoto

data$directoMoto<- gsub("Q-", "", data$directoMoto)
data$directoMoto <- gsub("Q", "", data$directoMoto)
data$directoMoto[data$directoMoto == ""] <- NA  # Asigna NA a valores vacíos
data$directoMoto <- as.numeric(data$directoMoto)
class(data$directoMoto)

# fijoCamion_5

data$fijoCamion_5 <- gsub("Q-", "", data$fijoCamion_5)
data$fijoCamion_5 <- gsub("Q", "", data$fijoCamion_5)
data$fijoCamion_5[data$fijoCamion_5 == ""] <- NA  # Asigna NA a valores vacíos
data$fijoCamion_5 <- as.numeric(data$fijoCamion_5)
class(data$fijoCamion_5)
colnames(data)[colnames(data) == "fijoCamion_5"] <- "fijoCamion"

# fijoPickup

data$fijoPickup<- gsub("Q-", "", data$fijoPickup)
data$fijoPickup <- gsub("Q", "", data$fijoPickup)
data$fijoPickup[data$fijoPickup == ""] <- NA  # Asigna NA a valores vacíos
data$fijoPickup <- as.numeric(data$fijoPickup)
class(data$fijoPickup)

# fijoMoto

data$fijoMoto<- gsub("Q-", "", data$fijoMoto)
data$fijoMoto <- gsub("Q", "", data$fijoMoto)
data$fijoMoto[data$fijoMoto == ""] <- NA  # Asigna NA a valores vacíos
data$fijoMoto <- as.numeric(data$fijoMoto)
class(data$fijoMoto)

# Conversión de X a Booleanos

# 5-30 minutos LOGICAL

data$`5-30` <- gsub("x", "TRUE", data$`5-30`)
data$`5-30`[is.na(data$`5-30`) | data$`5-30` == ""] <- "FALSE"
data$`5-30` <- as.logical(data$`5-30`)
head(data$`5-30`)
class(data$`5-30`)

# 30 - 45 minutos LOGICAL

data$`30-45` <- gsub("x", "TRUE", data$`30-45`)
data$`30-45`[is.na(data$`30-45`) | data$`30-45` == ""] <- "FALSE"
data$`30-45` <- as.logical(data$`30-45`)
head(data$`30-45`)
class(data$`30-45`)

# 45 - 75 minutos

data$`45-75` <- gsub("x", "TRUE", data$`45-75`)
data$`45-75`[is.na(data$`45-75`) | data$`45-75` == ""] <- "FALSE"
data$`45-75` <- as.logical(data$`45-75`)
head(data$`45-75`)
class(data$`45-75`)

# 75 - 120 minutos

data$`75-120` <- gsub("x", "TRUE", data$`75-120`)
data$`75-120`[is.na(data$`75-120`) | data$`75-120` == ""] <- "FALSE"
data$`75-120` <- as.logical(data$`75-120`)
head(data$`75-120`)
class(data$`75-120`)

# Más de 120 minutos

data$`120+` <- gsub("x", "TRUE", data$`120+`)
data$`120+`[is.na(data$`120+`) | data$`120+` == ""] <- "FALSE"
data$`120+` <- as.logical(data$`120+`)
head(data$`120+`)
class(data$`120+`)


data <- data[, !names(data) %in% c(data$...23, data$...24,data$...25, data$...26,data$...27, data$...28)]

facturacion_por_mes <- data %>%
  mutate(mes = format(data$Fecha, "%Y-%m")) %>%  
  group_by(mes) %>%                          
  summarise(suma_factura = sum(factura, na.rm = TRUE))

print(facturacion_por_mes)

facturacion_por_mes <- facturacion_por_mes %>%
  mutate(
    nombre_mes = format(as.Date(paste0(mes, "-01")), "%B") 
  )

media_factura <- mean(facturacion_por_mes$suma_factura, na.rm = TRUE)


#LABELS

media_label <- media_factura/1000000

print(media_label)

label_sumafact <- facturacion_por_mes$suma_factura/1000000
print(label_sumafact)



# costos totales

costos_camion <- sum(data$Camion, na.rm = TRUE)
print(costos_camion)

costos_pickup <- sum(data$Pickup,na.rm = TRUE)
print(costos_pickup)

costos_moto <- sum(data$Moto, na.rm = TRUE)
print(costos_moto)

total_costos = sum(costos_camion + costos_moto + costos_pickup)
print(total_costos)


  data <- data %>%
    mutate(
      Camion = as.numeric(Camion),
      Pickup = as.numeric(Pickup),
      Moto = as.numeric(Moto)
    )

  costos_por_mes <- data %>%
    mutate(mes = format(as.Date(Fecha, format = "%d-%m-%y"), "%Y-%m")) %>%
    group_by(mes) %>%
    summarise(
      total_costos = sum(Camion, na.rm = TRUE) + 
        sum(Pickup, na.rm = TRUE) + 
        sum(Moto, na.rm = TRUE)
    )
  
  # Ver el resultado
  print(costos_por_mes)
  
  costos_por_mes <- costos_por_mes %>%
    mutate(label_costos = total_costos / 1000000) 
  
  
  label_costos <- costos_por_mes$total_costos / 1000000
  print(label_costos)


ggplot(facturacion_por_mes, aes(x = mes, y = label_sumafact, group = 1)) +
  geom_line(color = "blue", size = 1) +
  geom_point(color = "red", size = 2) +
  geom_text(aes(label = nombre_mes), vjust = -0.5, size = 4) +
  geom_hline(yintercept = media_label, linetype = "dashed", color = "darkgreen")+
  annotate("text", x = 1, y = media_label, label = paste(round(media_label, 2)), 
           vjust = -1, color = "darkgreen", size = 4) +  
  labs(x = "Mes", y = "Total facturado en millones", title = "Tendencia de Facturación Mensual") +
  theme_minimal() +
  theme(axis.text.x = element_blank())



ggplot(facturacion_por_mes, aes(x = mes, y = label_sumafact, group = 1)) +
  geom_line(color = "blue", size = 1) +
  geom_point(color = "red", size = 2) +
  geom_text(aes(label = nombre_mes), vjust = -0.5, size = 4) +
  geom_hline(yintercept = media_label, linetype = "dashed", color = "darkgreen") +
  annotate("text", x = 1, y = media_label, label = paste(round(media_label, 2)), 
           vjust = -1, color = "darkgreen", size = 4) +  
  
  # Agregar la línea de tendencia de costos por mes
  geom_line(data = costos_por_mes, aes(x = mes, y = label_costos, group = 1), 
            color = "purple", linetype = "dotted", size = 1) +
  geom_point(data = costos_por_mes, aes(x = mes, y = label_costos), 
             color = "purple", size = 2) +
  
  labs(x = "Mes", y = "Total en millones", title = "Tendencia de Facturación y Costos Mensuales") +
  theme_minimal() +
  theme(axis.text.x = element_blank())


# por transporte


library(dplyr)
library(ggplot2)

# Supongamos que `data` tiene las columnas de costos para las subcategorías de cada tipo
# Paso 1: Sumar las columnas para cada subcategoría
total_costos <- data %>%
  summarise(
    camion_directo = sum(directoCamion, na.rm = TRUE),
    camion_fijo = sum(fijoCamion, na.rm = TRUE),
    pickup_directo = sum(directoPickup, na.rm = TRUE),
    pickup_fijo = sum(fijoPickup, na.rm = TRUE),
    moto_directo = sum(directoMoto, na.rm = TRUE),
    moto_fijo = sum(fijoMoto, na.rm = TRUE)
  )

relacion_costos <- total_costos %>%
  mutate(
    relacion_camion = camion_fijo / camion_directo,
    relacion_pickup = pickup_fijo / pickup_directo,
    relacion_moto = moto_fijo / moto_directo
  )

# Ver el resultado
print(relacion_costos)

install.packages("tidyr")

# Carga el paquete tidyr
library(tidyr)

# Paso 2: Convertir el data frame a formato largo para ggplot2
total_costos_largo <- total_costos %>%
  pivot_longer(cols = everything(), names_to = "categoria", values_to = "costo") %>%
  mutate(
    tipo = case_when(
      grepl("camion", categoria) ~ "Camion",
      grepl("pickup", categoria) ~ "Pickup",
      grepl("moto", categoria) ~ "Moto"
    ),
    subcategoria = case_when(
      grepl("directo", categoria) ~ "Directo",
      grepl("fijo", categoria) ~ "Fijo"
    ),
    costo_millones = costo / 1000000  # Convertir a millones
  )

# Paso 3: Crear el gráfico de barras apiladas con el eje y en millones
ggplot(total_costos_largo, aes(x = tipo, y = costo_millones, fill = subcategoria)) +
  geom_bar(stat = "identity", position = "stack") +
  labs(x = "Tipo de Vehículo", y = "Costos Totales en Millones", title = "Distribución de Costos por Tipo y Subcategoría") +
  theme_minimal()


ggplot(total_costos_largo, aes(x = tipo, y = costo_millones, fill = subcategoria)) +
  geom_bar(stat = "identity", position = "stack") +
  scale_fill_manual(values = c("Directo" = "orange", "Fijo" = "red")) +  # Colores específicos para cada subcategoría
  labs(x = "Tipo de Vehículo", y = "Costos Totales en Millones", title = "Distribución de Costos por Tipo y Subcategoría") +
  theme_minimal()+
  theme(
    plot.title = element_text(size = 18, face = "bold"),     # Tamaño del título principal
    axis.title.x = element_text(size = 14),                   # Tamaño del título del eje x
    axis.title.y = element_text(size = 14),                   # Tamaño del título del eje y
    axis.text.x = element_text(size = 12),                    # Tamaño del texto de etiquetas en el eje x
    axis.text.y = element_text(size = 12),                    # Tamaño del texto de etiquetas en el eje y
    legend.title = element_text(size = 14),                   # Tamaño del título de la leyenda
    legend.text = element_text(size = 12)  
  )

# facturacion

library(dplyr)
library(ggplot2)
library(tidyr)

# Asegurarte de que las columnas de costos sean numéricas
data <- data %>%
  mutate(
    Camion = as.numeric(Camion),
    Pickup = as.numeric(Pickup),
    Moto = as.numeric(Moto),
    directoCamion = as.numeric(directoCamion),
    fijoCamion = as.numeric(fijoCamion),
    directoPickup = as.numeric(directoPickup),
    fijoPickup = as.numeric(fijoPickup),
    directoMoto = as.numeric(directoMoto),
    fijoMoto = as.numeric(fijoMoto),
    factura = as.numeric(factura)
  )

# Crear la columna tipo_vehiculo
data <- data %>%
  mutate(tipo_vehiculo = case_when(
    !is.na(Camion) & Camion > 0 ~ "Camion",
    !is.na(Pickup) & Pickup > 0 ~ "Pickup",
    !is.na(Moto) & Moto > 0 ~ "Moto",
    TRUE ~ "Desconocido"
  ))

# Calcular la facturación total por tipo de vehículo
facturacion_por_tipo <- data %>%
  group_by(tipo_vehiculo) %>%
  summarise(facturacion_total = sum(factura, na.rm = TRUE))

# Calcular costos por tipo de vehículo
costos_por_tipo <- data %>%
  group_by(tipo_vehiculo) %>%
  summarise(
    costos_directos = sum(
      ifelse(tipo_vehiculo == "Camion", directoCamion,
             ifelse(tipo_vehiculo == "Pickup", directoPickup,
                    ifelse(tipo_vehiculo == "Moto", directoMoto, 0))), na.rm = TRUE),
    costos_fijos = sum(
      ifelse(tipo_vehiculo == "Camion", fijoCamion,
             ifelse(tipo_vehiculo == "Pickup", fijoPickup,
                    ifelse(tipo_vehiculo == "Moto", fijoMoto, 0))), na.rm = TRUE)
  )

# Combinar facturación y costos
totales_por_tipo <- facturacion_por_tipo %>%
  left_join(costos_por_tipo, by = "tipo_vehiculo")

# Transformar los datos para el gráfico
totales_largo <- totales_por_tipo %>%
  pivot_longer(
    cols = c("facturacion_total", "costos_directos", "costos_fijos"),
    names_to = "categoria",
    values_to = "valor"
  ) %>%
  mutate(
    categoria = case_when(
      categoria == "facturacion_total" ~ "Facturación",
      categoria == "costos_directos" ~ "Costos Directos",
      categoria == "costos_fijos" ~ "Costos Fijos"
    ),
    valor_millones = valor / 1e6
  )

# Crear el gráfico de barras agrupadas
ggplot(totales_largo, aes(x = tipo_vehiculo, y = valor_millones, fill = categoria)) +
  geom_bar(stat = "identity", position = position_dodge()) +
  labs(
    x = "Tipo de Vehículo",
    y = "Monto en Millones",
    title = "Costos y Facturación por Tipo de Vehículo"
  ) +
  theme(plot.title = element_text(size = 18, face = "bold"),     # Tamaño del título principal
        axis.title.x = element_text(size = 14),                   # Tamaño del título del eje x
        axis.title.y = element_text(size = 14),                   # Tamaño del título del eje y
        axis.text.x = element_text(size = 12),                    # Tamaño del texto de etiquetas en el eje x
        axis.text.y = element_text(size = 12),                    # Tamaño del texto de etiquetas en el eje y
        legend.title = element_text(size = 14),                   # Tamaño del título de la leyenda
        legend.text = element_text(size = 12)        )



# Paso 3: Calcular los costos agregados por tipo de vehículo
costos_por_tipo <- data %>%
  group_by(tipo_vehiculo) %>%
  summarise(
    total_costos = sum(
      ifelse(tipo_vehiculo == "Camion", directoCamion + fijoCamion,
             ifelse(tipo_vehiculo == "Pickup", directoPickup + fijoPickup,
                    ifelse(tipo_vehiculo == "Moto", directoMoto + fijoMoto, 0))), na.rm = TRUE)
  )

# Paso 4: Combinar facturación y costos en un solo data frame
totales_por_tipo <- facturacion_por_tipo %>%
  left_join(costos_por_tipo, by = "tipo_vehiculo")

# Paso 5: Convertir el data frame a formato largo para el gráfico
totales_largo <- totales_por_tipo %>%
  pivot_longer(
    cols = c("facturacion_total", "total_costos"),
    names_to = "categoria",
    values_to = "valor"
  ) %>%
  mutate(
    categoria = case_when(
      categoria == "facturacion_total" ~ "Facturación",
      categoria == "total_costos" ~ "Costos"
    ),
    valor_millones = valor / 1e6  # Convertir a millones
  )

# Paso 6: Crear el gráfico de barras agrupadas (dos barras: Costos y Facturación)
ggplot(totales_largo, aes(x = tipo_vehiculo, y = valor_millones, fill = categoria)) +
  geom_bar(stat = "identity", position = position_dodge()) +
  labs(
    x = "Tipo de Vehículo",
    y = "Monto en Millones",
    title = "Costos y Facturación por Tipo de Vehículo"
  ) +
  theme_minimal()



ggplot(totales_largo, aes(x = tipo_vehiculo, y = valor_millones, fill = categoria)) +
  geom_bar(stat = "identity", position = position_dodge()) +
  labs(
    x = "Tipo de Vehículo",
    y = "Monto en Millones",
    title = "Costos y Facturación por Tipo de Vehículo"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 18, face = "bold"),     # Tamaño del título principal
    axis.title.x = element_text(size = 14),                   # Tamaño del título del eje x
    axis.title.y = element_text(size = 14),                   # Tamaño del título del eje y
    axis.text.x = element_text(size = 12),                    # Tamaño del texto de etiquetas en el eje x
    axis.text.y = element_text(size = 12),                    # Tamaño del texto de etiquetas en el eje y
    legend.title = element_text(size = 14),                   # Tamaño del título de la leyenda
    legend.text = element_text(size = 12)                     # Tamaño del texto en la leyenda
  )



total_facturado <- sum(data$factura, na.rm = TRUE)
print(total_facturado)



total_costos <- sum(data$directoCamion, na.rm = TRUE) + 
  sum(data$fijoCamion, na.rm = TRUE) +
  sum(data$directoPickup, na.rm = TRUE) + 
  sum(data$fijoPickup, na.rm = TRUE) +
  sum(data$directoMoto, na.rm = TRUE) + 
  sum(data$fijoMoto, na.rm = TRUE)

print(total_costos)

# Calcular el total de viajes como la suma de todos los ID
total_viajes <- sum(data$ID, na.rm = TRUE)
print(total_viajes)

#FEBRERO
data$Fecha <- as.Date(data$Fecha, format = "%d-%m-%Y")

# Filtrar los datos para febrero de 2017 y contar los viajes
viajes_febrero <- data %>%
  filter(format(Fecha, "%Y-%m") == "2017-02") %>%
  summarise(total_viajes = n())

print(viajes_febrero)

#VALORES COD
valores_distintos_cod <- unique(data$Cod)

# Ver los valores distintos
print(valores_distintos_cod)


library(tidyr)

data$Fecha <- as.Date(data$Fecha, format = "%d-%m-%Y")

# Filtrar los datos para enero y febrero de 2017 y contar los viajes por COD
viajes_enero_febrero <- data %>%
  filter(format(Fecha, "%Y-%m") %in% c("2017-01", "2017-02")) %>%
  group_by(Cod, Mes = format(Fecha, "%Y-%m")) %>%
  summarise(total_viajes = n()) %>%
  pivot_wider(names_from = Mes, values_from = total_viajes, values_fill = 0)

# Ver la comparación de viajes entre enero y febrero por COD
print(viajes_enero_febrero)



facturas_por_cod <- data %>%
  group_by(Cod) %>%
  summarise(suma_facturas = sum(factura, na.rm = TRUE)) %>%
  arrange(desc(suma_facturas))

# Ver el listado
print(facturas_por_cod)





ggplot(facturas_por_cod, aes(x = reorder(Cod, -suma_facturas), y = suma_facturas)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(x = "Tipo de Trabajo", y = "Suma de Facturas", title = "") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))







facturas_por_cod <- data %>%
  group_by(Cod) %>%
  summarise(suma_facturas = sum(factura, na.rm = TRUE) / 1000000) %>%
  arrange(desc(suma_facturas))

# Crear el gráfico de barras en orden descendente
ggplot(facturas_por_cod, aes(x = reorder(Cod, -suma_facturas), y = suma_facturas)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(x = "Tipo de Trabajo", y = "Suma de Facturas en Millones", title = "") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1,size = 12, face = "bold"))


# Calcular la media cobrada por factura agrupada por Cod y ordenar en orden descendente
media_factura_por_cod <- data %>%
  group_by(Cod) %>%
  summarise(media_factura = mean(factura, na.rm = TRUE)) %>%
  arrange(desc(media_factura))

# Crear el gráfico de barras en orden descendente
ggplot(media_factura_por_cod, aes(x = reorder(Cod, -media_factura), y = media_factura)) +
  geom_bar(stat = "identity", fill = "lightblue") +
  labs(x = "Cod", y = "Media de Factura", title = "Monto factura según tipo de trabajo") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

ggplot(media_factura_por_cod, aes(x = reorder(Cod, -media_factura), y = media_factura)) +
  geom_bar(stat = "identity", fill = "lightblue") +
  labs(x = "Cod", y = "Media de Factura", title = "Monto factura según tipo de trabajo") +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1, size = 12, face = "bold")  # Tamaño y grosor de las etiquetas
  )

unique(data$Cod)

monto_revision <- data %>%
  filter(Cod == "REVISION") %>%
  summarise(media_factura_revision = mean(factura, na.rm = TRUE))

# Ver el resultado
print(monto_revision)