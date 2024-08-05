## importar libreria

library(readr)
library(readxl)
library(openxlsx)

## importar archivos

enero <- read_excel("C:/Users/miche/OneDrive/Escritorio/DATA_WRANGLING/LABS/01_lab1/Lab1/01-2023.xlsx")
febrero <- read_excel("C:/Users/miche/OneDrive/Escritorio/DATA_WRANGLING/LABS/01_lab1/Lab1/02-2023.xlsx")
marzo <- read_excel("C:/Users/miche/OneDrive/Escritorio/DATA_WRANGLING/LABS/01_lab1/Lab1/03-2023.xlsx")
abril <- read_excel("C:/Users/miche/OneDrive/Escritorio/DATA_WRANGLING/LABS/01_lab1/Lab1/04-2023.xlsx")
mayo <- read_excel("C:/Users/miche/OneDrive/Escritorio/DATA_WRANGLING/LABS/01_lab1/Lab1/05-2023.xlsx")
junio <- read_excel("C:/Users/miche/OneDrive/Escritorio/DATA_WRANGLING/LABS/01_lab1/Lab1/06-2023.xlsx")
julio <- read_excel("C:/Users/miche/OneDrive/Escritorio/DATA_WRANGLING/LABS/01_lab1/Lab1/07-2023.xlsx")
agosto <- read_excel("C:/Users/miche/OneDrive/Escritorio/DATA_WRANGLING/LABS/01_lab1/Lab1/08-2023.xlsx")
septiembre <- read_excel("C:/Users/miche/OneDrive/Escritorio/DATA_WRANGLING/LABS/01_lab1/Lab1/09-2023.xlsx")
octubre <- read_excel("C:/Users/miche/OneDrive/Escritorio/DATA_WRANGLING/LABS/01_lab1/Lab1/10-2023.xlsx")
noviembre <- read_excel("C:/Users/miche/OneDrive/Escritorio/DATA_WRANGLING/LABS/01_lab1/Lab1/11-2023.xlsx")

##head(enero)

total <- data.frame(
  enero,
  febrero,
  marzo,
  abril,
  mayo,
  junio,
  julio,
  agosto,
  septiembre,
  octubre,
  noviembre
)

