##Start with reshaping

#Instalando pacotes
install.packages("MASS") 
install.packages("reshape2") 
install.packages("reshape")

#Carregando as bibliotecas
library(MASS) 
library(reshape2) 
library(reshape) 
library(data.table)

#Visualizando as três primeiras linhas do data frame
head(mtcars, n = 3)

#Visualizando as últimas três linhas do data frame
tail(mtcars, n=3)

#Remodelando o quadro de dados
mtcars$carname <- rownames(mtcars)
carMelt <- melt(mtcars, id = c("carname", "gear", "cyl"),
                measure.vars = c("mpg", "hp"))

#Visualizando as três primeiras linhas do data frame
head(carMelt, n = 3)

#Visualizando as últimas três linhas do data frame
tail(carMelt, n=3)

#Lançando o data frame
cylData <- dcast(carMelt, cyl ~ variable)
cylData

#Lançado o novo data fram. Visualizando as média mpg e hp
clyDataMean <- dcast(carMelt, cyl ~ variable, mean)
clyDataMean

#Averaging values
head(InsectSprays)

#Soma os valores para cada variável
tapply(InsectSprays$count, InsectSprays$spray, sum)

#Média para cada spray
spins <- split(InsectSprays$count, InsectSprays$spray)
spins


#Instalando pacotes
install.packages("dplyr")
#Carregando bibliotecas
library(dplyr)
library(plyr)


#Outro modelo de criar grupos
ddply(InsectSprays,.(spray), summarise, sum=sum(count))

#Criando uma nova variável
spraySum <- ddply(InsectSprays,.(spray), summarise,sum=ave(count, FUN=sum))
dim(spraySum)
      