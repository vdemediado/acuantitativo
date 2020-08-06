## Bases de datos 
## Electoral (tiny.cc/electoral)

## Paquetes
library("epiDisplay")

load("Electoral.Rdata")

## Variable ordinal
levels(Electoral$calificaepn) # Niveles del factor

table(Electoral$calificaepn) # Tabla de frecuencias
epn <-table(Electoral$calificaepn) # Objeto con frecuencias
prop.table(epn) # Proporciones

## La media no es apropiada para variables ordinales 
n <- sum(epn) # Total de respuesta

## Dos esquemas de codificación igualmente válidos para los niveles
code1 <- c(1, 2, 3, 4, 5)
code2 <- c(-1, -2, 0, 1, 2)

code1
epn

epn * code1 

sum(epn * code1) / n # Media con esquema 1

sum(epn * code2) / n # Media con esquema 2

## Tabla con porcentaje acumulado (permite ubicar la mediana)
library("epiDisplay")
tab1(Electoral$calificaepn, cum.percent = TRUE)
