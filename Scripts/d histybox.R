## Bases de datos 
## 1. QoG2004.csv (tiny.cc/qog)
## 2. Enlace.dta (tiny.cc/bdenlace)
## 3. Electoral (tiny.cc/electoral)

Enlace <- read.dta("Enlace.dta")
load("Electoral.Rdata")
load("QG.Rdata")

dim(Electoral) # Dimensiones del marco de datos
names(Electoral) # Variables en la base de datos

## Años cumplidos: variable de razón, discreta
class(Electoral$d01)
summary(Electoral$d01)
sd(Electoral$d01) # Diferencia típica con respecto a la media

## Histograma
hist(Electoral$d01)  # Histograma de edad: de 5 eb 5

summary(Enlace$calesp)
hist(Enlace$calesp) # Histograma de calificiación en español
hist(Enlace$calesp, breaks = "FD") # Histograma de calificiación en español
hist(Enlace$calesp, breaks = "FD", freq = FALSE) # Densidad en vez de frecuencia
## Densidad: prporción de casos entre ancho del intervalo
plot(density(Enlace$calesp)) # Sólo función Kernel

with(Enlace, { # Superponer función Kernel
  hist(calesp, col = "gray", breaks = "FD", freq = FALSE,
       xlab = "Calificación", ylab = "Densidad",
       main = "Desempeño de escuelas en prueba Enlace",
       sub = "Prueba de Español",
       ylim = c(0, 0.008))
  lines(density(calesp), lwd=1.5)
  rug(calesp)
  box()
})

## Boxplot

boxplot(Electoral$d01)
boxplot(Electoral$d01, horizontal = TRUE)
summary(Electoral$d01)

boxplot(QG$largestp)

boxplot(QG$largestp ~ QG$polpris)



