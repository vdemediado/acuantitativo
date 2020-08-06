## Bases de datos 
## 1. Electoral (tiny.cc/electoral)
## 2. democdos.csv (tiny.cc/democdos)

## La variable polyarchy proviene del proyeto V-Dem
## https://www.v-dem.net/es/

## Paquetes
library("car")
library("gmodels")
library("ggplot2")
library("ggmosaic")
library("tadaatoolbox")

load("Electoral.Rdata")

## Tablas de contingencia

table(Electoral$voto.solo3)
table(Electoral$identifica)

## Se recodifica la variable de identificación partidista para visualizar
##  mejor las tablas
library("car")
Electoral$identifica <- recode(Electoral$identifica, '"Ninguno" = "Ninguno"; 
                               "Juntos Haremos Historia" = "JHH";
                               "Por México al Frente" = "PMF";
                               "Todos por México" = "TPM" ',
                               levels = c("PMF", "TPM", "JHH", "Ninguno"))


table(Electoral$identifica)

## Tabla con función table()
table(Voto = Electoral$voto.solo3, PID = Electoral$identifica)

tabla1 <- table(Voto = Electoral$voto.solo3, PID = Electoral$identifica)

tabla1

addmargins(tabla1) # añadir distribución marginal

prop.table(tabla1) # epresar frecuencias en proporciones con respecto al totaL

round(prop.table(tabla1), digits = 3) # redondear

## Tabla con función CrossTable()
library("gmodels")
CrossTable(Electoral$voto.solo3, Electoral$identifica, prop.chisq=FALSE)

CrossTable(Electoral$voto.solo3, Electoral$identifica, prop.chisq=FALSE, #Proporciones por columna
           prop.r= FALSE, prop.t= FALSE)

## Visualización

## Transformar variable ideología
table(Electoral$d08)

Electoral$ideologia <- recode(Electoral$d08, ' "Ninguna / independiente / No sabe" = NA;
                              "Extrema izquierda" = "EI"; "Izquierda" = "CI"; "Centro izquierda" = "CI";
                              "Centro" = "C"; "Centro derecha" = "CD"; "Derecha" = "CD";
                              "Extrema derecha" = "ED" ',
                              levels = c("EI", "CI", "C","CD", "ED"))

table(Electoral$ideologia)

library("gmodels")
CrossTable(Electoral$voto.solo3, Electoral$identifica, prop.chisq=FALSE, prop.r= FALSE, prop.t= FALSE)

## Diagrama de barra segmentada
library("ggplot2")
ggplot(data = Electoral) +
  geom_bar(aes(fill = voto.solo3, x = identifica))

is.na(Electoral$voto.solo3)

!is.na(Electoral$voto.solo3)

Electoral.sub <- subset(Electoral, !is.na(voto.solo3) & !is.na(identifica))

ggplot(data = Electoral.sub) +
  geom_bar(aes(fill = voto.solo3, x = identifica)) 

## Diagrama de mosaico
library("ggplot2")
library("ggmosaic")
plot.vp <- ggplot(data = Electoral) + 
  geom_mosaic(aes(fill=voto.solo3, x = product(identifica)), na.rm=TRUE)
plot.vp

CrossTable(Electoral$calificaepn, Electoral$ideologia, prop.chisq=FALSE, prop.r= FALSE, prop.t= FALSE)

plot.ci <- ggplot(data = Electoral) + 
  geom_mosaic(aes(fill=calificaepn, x = product(ideologia)), na.rm=TRUE)
plot.ci

table(Electoral$cambio.meade)

CrossTable(Electoral$cambio.meade, Electoral$calificaepn, prop.chisq=FALSE, prop.r= FALSE, prop.t= FALSE)

plot.mc <- ggplot(data = Electoral) + 
  geom_mosaic(aes(fill=cambio.meade, x = product(calificaepn)), na.rm=TRUE)
plot.mc

## Estadísticos de asociación

## tau-b (nXn)
CrossTable(Electoral$calificaepn, Electoral$ideologia,
           prop.chisq=FALSE, prop.r= FALSE, prop.t= FALSE)
ord_tau(Electoral$calificaepn, Electoral$ideologia)

## tau-c (nXm)
CrossTable(Electoral$cambio.meade, Electoral$calificaepn,
           prop.chisq=FALSE,prop.r= FALSE, prop.t= FALSE)

ord_tau(Electoral$cambio.meade, Electoral$calificaepn, tau = "c")

## lambda
nom_lambda(Electoral$voto.solo3, Electoral$identifica)

nom_lambda(Electoral$calificaepn, Electoral$identifica) # Cuando una de las variables es nominal

## Asociación entre una variable cuantitativa  y una indicadora
Base <- read.csv("democdos.csv")

table(Base$democracy) # Dicotómica codificada como indicadora
summary(Base$polyarchy) # Cuantitativa
hist(Base$polyarchy)

## Es válido usar el coeficiente de correlación
cor(Base$democracy, Base$polyarchy)

