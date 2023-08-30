##Questão 2 - Quiz

##Carregando a biblioteca para comendos SQL
library(sqldf)

##Download da base de dados "American Community Survey
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"

##Salvado o arquivo como acs.csv
download.file(fileUrl, destfile = "acs.csv")

#Criando o objeto
acs <-read.csv("acs.csv")

#Visualizando o cabeçalho
head(acs)

detach("package:RMySQL", unload=TRUE)
unloadNamespace("RMySQL")
sqldf("select pwgtp1 from acs where AGEP < 50")

sqldf("select * from acs where AGEP < 50 and pwgtp1")

sqldf("select distinct AGEP from acs")

sqldf("select AGEP where unique from acs")

##Questão 4
#Download da base de dados
htmlUrl <- url("http://biostat.jhsph.edu/~jleek/contact.html")

#Leitura da página html
htmlCode <- readLines(htmlUrl)

#Desconectar da página html
close(htmlUrl)

#Visualizando o cabeçalho
head(htmlCode)

c(nchar(htmlCode[10]), nchar(htmlCode[20]), nchar(htmlCode[30]),
  nchar(htmlCode[100]))


##Questão 5
#Download da base de dados
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
SST <- read.fwf(fileUrl, skip=4, widths=c(12, 7, 4, 9, 4, 9, 4, 9, 4))



head(SST)
sum(SST[, 4])

View(SST)
