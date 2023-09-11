##Coletando dados
##Conjunto de Dados Sobre Restaurantes em Beltimore

###
###   NÃO FAZER DOWNLOAD LINK QUEBRADO ###
###
   
if(!file.exists(".data/")){dir.create("./data")}
fileUrl <- "https://gist.github.com/slowteetoe/528c78213fcd80f05419"
download.file(fileUrl,destfile="./data/restaurants.csv", method="curl")
restData <- read.csv("./data/restaurants.csv")

#Criando sequenciais
s1 <- seq(1,10,by=2)
s1

s2 <- seq(1,10,length=3)
s2

s3 <- c(1,3,8,25,100)
seq(along=s3)

View(restData)

#Subconjunto de variáveis
restData$nearMe <- restData$neighborhood %in% c("Roland Park", "Homeland")
table(restData$nearMe)

#Criando variáveis binárias
restData$zipWrong <- ifelse(restData$zipCode < 0, TRUE, FALSE)
table(restData$zipWrong, restData$zipCode < 0)

#Criando variáveis categóricas
restData$zipGroups <- cut(restData$zipCode, breaks = quantile(restData$zipCode))
table(restData$zipGroups)

table(restData$zipGroups, restData$zipCode)

#Cortando os dados
install.packages(Hmisc)
library(dplyr)
library(Hmisc)
restData$zipGroups <- cut2(restData$zipCode, g=4)
table(restData$zipGroups)

#Criando variáveis factor
restData$zcf <- factor(restData$zipCode)
restData$zcf[1:10]

#Níveis de variáveis fatores
yesno <- sample(c("yes", "no"), size=10, replace=TRUE)
yesnofac <- factor(yesno, levels = c("yes", "no"))
relevel(yesnofac, ref='yes')

as.numeric(yesnofac)

##Usando a função mutate()

library(dplyr)
library(Hmisc)
restData2 <- mutate(restData, zipGroups = cut2(zipCode, g = 4))
table(restData2$zipGroups)

View(restData2)
