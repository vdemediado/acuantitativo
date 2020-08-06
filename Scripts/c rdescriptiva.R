## Bases de datos 
## QoG2004.csv (tiny.cc/qog)

QG <- read.csv("QoG2004.csv")
View(QG) # ver base de datos
summary(QG) # Estadística descriptiva básica de todas las variables
class(QG$largestp) # Data$X = variable "X" en marco de datos "Data"
summary(QG$largestp) # Descriptiva de una variable

## Orden ascendente
QG[order(QG$largestp),] 
QG[order(QG$largestp), 5] # Mostrar sólo columna 5

# Transformar 0 en valores perdidos
library("car")
QG$largestp <- recode(QG$largestp, "0=NA")
summary(QG$largestp)
var(QG$largestp)
var(QG$largestp, na.rm = TRUE)
sd(QG$largestp, na.rm = TRUE)
mean(QG$largestp, na.rm = TRUE)
median(QG$largestp, na.rm = TRUE)

## Crear objeto con descriptivo
varlp <- var(QG$largestp, na.rm = TRUE)
varlp

## Lo usamos en operaciones
varlp^(1/2)
sqrt(varlp)

## Variable polris
summary(QG$polpris)
## Ver el vector
QG$polpris
class(QG$polpris)

QG$polpris <- factor(QG$polpris,
                     levels = c(0,1,2),
                     labels = c("Ninguno", "Algunos", "Muchos"))

class(QG$polpris)
levels(QG$polpris) # Notar que es ordinal
summary(QG$polpris) 

QG$electoral.system
class(QG$electoral.system)

summary(QG$electoral.system)

QG$electoral.system # Es nominal. Ya están las etiquetas

QG$electoral.system <- factor(QG$electoral.system)

class(QG$electoral.system)

summary(QG$electoral.system)

## Guardar como archivo de datos de R
save(QG, file = "QG.Rdata")

load("QG.RData")
