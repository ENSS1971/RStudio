##Coletando dados
##Conjunto de Dados Sobre Restaurantes em Beltimore

if(!file.exists(".data/")){dir.create("./data")}
fileUrl <- "https://gist.github.com/slowteetoe/528c78213fcd80f05419#file-restaurants-csv"
download.file(fileUrl,destfile="./data/restaurants.csv", method="curl")
restData <- read.csv("./data/restaurants.csv")

#Visualizando o cabeçalho do quadro de dados
head(restData, n=3)
head(restData)

View(restData)

tail(restData, n=3)

##Resumo geral do quadro de dados
summary(restData)

##Salvando o resumo em um arquivo CSV
write.csv(summary(restData), "regression_summary.csv")

##Visualizando as classes do quadro de dados
str(restData)

##Quantiles of quantitayive variables
quantile(restData$councilDistrict, na.rm=TRUE)
quantile(restData$councilDistrict, probs = c(0.5, 0.75, 0.9))

#Criando tabelas
table(restData$zipCode, useNA = "ifany")

table_zip <- table(restData$zipCode, useNA = "ifany")
View (table_zip)

table(restData$councilDistrict, restData$zipCode)

##Verificando valores na
sum(is.na(restData$councilDistrict))

any(is.na(restData$councilDistrict))

all(restData$zipCode >0)

all(restData$zipCode < 0)

#Values with specific characteristics
table(restData$zipCode %in% c("21212"))

table(restData$zipCode %in% c("21212", "21213"))

table(restData$zipCode %in% c("21213"))

#Values with specific characteristics
restData[restData$zipCode %in% c("21212", "21213"),]

##Cross tabs
data("UCBAdmissions")
DF <- as.data.frame(UCBAdmissions)
summary(DF)

xt <- xtabs(Freq ~ Gender + Admit, data = DF)
xt

#Flat tables
warpbreaks$replicate <- rep(1:9, len=54)
xt = xtabs(breaks ~., data=warpbreaks)
xt

ftable(xt)

#Size of a data set
fakeData <- rnorm(1e5)
object.size(fakeData)

print(object.size(fakeData), units="Mb")

colnames(restData)
