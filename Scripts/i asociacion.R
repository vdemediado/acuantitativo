## Bases de datos 
## Enlace.dta (tiny.cc/bdenlace)

## Paquetes
library("foreign")

Enlace <- read.dta("Enlace.dta")

summary(Enlace$calesp)

summary(Enlace$estatus)

## Diagrama de dispersión
plot(Enlace$estatus, Enlace$calesp)

plot(Enlace$estatus, Enlace$calesp, xlab="Índice de estatus", ylab="Enlace",
     main = "Diagrama de dispersión: \nestatus y desempeño en Enlace",
     cex.main=1.5,
     frame.plot=FALSE, col="darkred")

cov(Enlace$calesp, Enlace$estatus)

cor(Enlace$calesp, Enlace$estatus)

cor(Enlace$calesp, Enlace$calmat)
