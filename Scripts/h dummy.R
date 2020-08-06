## Bases de datos 
## bmr.csv (tiny.cc/bmr)

BMR <- read.csv("bmr.csv")

## Datos básicos de distribución
table(BMR$democracy)
prop.table(table(BMR$democracy))
nrow(BMR)

## Mostrar primeras 20 observaciones
head(BMR$democracy, n = 20)
