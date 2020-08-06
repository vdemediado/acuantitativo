setwd("~/Dropbox/Clases/acuantitativo/acuantitativo_R/s2020")

## Bases de datos 
## Electoral (tiny.cc/electoral)

## Paquetes
library("car")
library("epiDisplay")

load("Electoral.Rdata")

## Variable nominal
levels(Electoral$voto1)
summary(Electoral$voto1)
table(Electoral$voto1)

## Enviar no respuesta a valores perdidos
library("car")
Electoral$voto1 <- recode(Electoral$voto1, "'Inv/NR' = NA")

table(Electoral$voto1)
voto <-table(Electoral$voto1) # Crear objeto con frecuencias de voto
sum(voto) #Suma sin datos perdidos
prop.table(voto) # Expresar en proporciones (con respecto respuesta válida)

round(prop.table(voto), digits = 3) # Redondear a tres decimales

## Gráfica de pay
pie(voto)

slices <- c(40, 60)
lbls <- c("Gráficas de pay \n que apestan",
          "Gráficas de pay \nque apestan aún más")
pie(slices, labels = lbls,
    main="Distribución de gráficas de pay")

## Gráfica de barras
prop.voto <- prop.table(voto) # Objeto con las proporciones

barplot(prop.voto) # Gráfica de barra

barplot(prop.voto, # Gráfica con más elementos
        main = "Intención de voto",
        sub = "Sin considerar no respuesta y voto nulo",
        xlab = "Candidato", ylab = "Proporción",
        ylim = c(0, 0.5))

