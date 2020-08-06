## Bases de datos 
## 1. QoG2004.csv (tiny.cc/qog)
## 2. Enlace.dta (tiny.cc/bdenlace)
## 3. Electoral (tiny.cc/electoral)


## Crear vectores
ccodealp <- c("ALB", "ALG", "AGO", "ATG", "AZE")
iaep_es <- c("mixto", "rp", "rp", NA, "mayoría")
pmayor <- c(0.52, 1, 0.59, 0.82, 0.6)

## Tipo de vector
class(pmayor)
class(iaep_es)

## Crear data frame con vectores (base de datos)
Data <- data.frame(ccodealp, iaep_es, pmayor)
class(Data)

## Transformar de csv a data frame
QG <- read.csv("QoG2004.csv")
class(QG)

## Transformar de stata a data frame
install.packages("foreign") # Instalar desde consola
library("foreign") # Cargar paquete con la función read.dta()
Enlace <- read.dta("Enlace.dta")

## Si fuera de SPSS
read.spss("Datos.sav", to.data.frame = TRUE)

## Cargar un archivo de datos de R
load("Electoral.Rdata")


