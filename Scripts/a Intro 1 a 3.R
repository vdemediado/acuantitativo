## Introducción a R

5 + 3
4 * 7
10^2 # Esto es 10 al cuadrado

result <- 5 + 3
result

rodrigo <- "the big kahuna"
rodrigo

Result <- "8"
Result

8 / 4

result / 4

Result / 4

class(result)

class(Result)

class(rodrigo)

class(sqrt)

sqrt(100)

objects()
ls()

remove(rodrigo, result)

rm(list = ls())

class(setwd)

world.pop <- c(2525779, 3026003, 3691173, 4449049, 5320817, 6127700, 6916183)
world.pop

world.pop[2]

world.pop[c(2, 4)]

world.pop[c(4, 2)]

world.pop[-3]

pop.first <- c(2525779, 3026003, 3691173)

pop.second <- c(4449049, 5320817, 6127700, 6916183)

pop.all <- c(pop.first, pop.second)
pop.all

pop.all[1]

x <- c(pop.all[1], pop.all[4], pop.all[5])
x

class(pop.all)

alfabeto <- c("a", "e", "b", "c", "d")
alfabeto

alfabeto[c(3, 4, 5)] <- c("i", "o", "u")

alfabeto <- c(NA, "e", "b", "c", "d")

alfabeto[1] <- NA
alfabeto

