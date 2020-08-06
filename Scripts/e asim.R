## Bases de datos 
## 1. Enlace.dta (tiny.cc/bdenlace)
## 2. Pib2019.csv (tiny.cc/pib2019)

library("car")

hist(Enlace$calesp) # Histograma de calificiación en español
boxplot(Enlace$calesp)


## QQ 
qqPlot(~ calesp, data = Enlace)

View(Pib)
summary(Pib)

hist(Pib$pibpc, breaks = "FD")
hist(Pib$pibpc.cambio, breaks = "FD")

rownames(Pib) <- Pib[,1]
View(Pib)

library("car")
qqPlot(~ pibpc, data = Pib, id = list(n=5))
qqPlot(~ pibpc.cambio, data = Pib, id = list(n=4))


## Ejemplo de efecto de valores extremos en estadísticos de tendencia central
m1 <- c(18, 19, 20, 22, 23, 24, 24) # Edad de "muestra" de siete estudiantes
summary(m1)
m2 <- c(18, 19, 20, 22, 23, 24, 42) # Idéntico a m1, salvo en un valor (extremo)
summary(m2)
