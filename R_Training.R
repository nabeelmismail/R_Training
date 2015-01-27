# Testing first command using github project 
1 + 1 

getwd()
library(ggplot2)
search() # To find all the functions in the package

find.package("ggplot2") # Find if the package is installed on your computer

find.pacakge("caret")

install.packages("KernSmooth")

library(KernSmooth)

x <- 1:20 #Entering range of values in vector
# Everything you see in R are objects 

class(x)

as.numeric(x)
class(x)
as.character(x)
class(x)

as.logical(x)

# Matrix
m <- matrix(1:6, nrow = 2, ncol = 3)

ma <- 1:10
ma
dim(ma) <- c(2,5)
#cbind and rbind for creating matrices 


#Getting SQL Server data 
install.packages("RODBC")
library(RODBC)
odbcChannel <- odbcConnect("Northwind")
Sales <- sqlFetch(odbcChannel,"Orders")
Sales [1:6,]
library(ggplot2)

plot(Sales$ShipCountry , Sales$Freight)

qplot(Freight,format(OrderDate, "%Y") , data = Sales)


qplot(Freight,format(OrderDate, "%Y") , data = Sales, color = ShipCountry)

Product <- sqlFetch(odbcChannel,"Products")

qplot(UnitPrice,CategoryID, data = Product[1:30,], color = ProductName)

adven <- odbcConnect("adventureworks")


persondem <- sqlFetch(adven,"Sales.vPersonDemographics")

qplot(Education,TotalPurchaseYTD, data = filter(persondem, TotalPurchaseYTD > 0), color = NumberCarsOwned)

library(dplyr)

qplot(YearlyIncome,TotalPurchaseYTD, data = filter(persondem, TotalPurchaseYTD > 0), geom="boxplot" )

persondems <- filter(persondem, TotalPurchaseYTD > 0)

plot(density(persondems$TotalPurchaseYTD), main="Desity Yearly Income")


plot(density(persondems$NumberCarsOwned), main="Desity Yearly Income")


library(RODBC)
odbcsmops <- odbcConnect("SMOPS")
Cust_Stewarded <- sqlFetch(odbcsmops,"vw_customer_stewarded")

Cust_to_Stewarded <- sqlFetch(odbcsmops,"vw_customer_to_steward")

library(ggplot2)


qplot(Sector, data = Cust_Stewarded, geom = "histogram")


library(rpart)

# Some Rpart predictions
View(car.test.frame)

z.auto <- rpart(Mileage ~ Weight, car.test.frame)


predict(z.auto)

View(kyphosis)
fit <- rpart(Kyphosis ~ Age + Number + Start, data=kyphosis)

predict(fit, type="prob")   # class probabilities (default)

predict(fit, type="vector") # level numbers

predict(fit, type="class")  # factor

predict(fit, type="matrix") # level number, class frequencies, probabilities

#Random Forest 
install.packages("randomForest")
library(randomForest)

fmi<-randomForest(Species~.,iris,mtry=3,ntry=500)

predict(fmi, type="prob")

data(iris)
set.seed(111)
ind <- sample(2, nrow(iris), replace = TRUE, prob=c(0.8, 0.2))
iris.rf <- randomForest(Species ~ ., data=iris[ind == 1,])
iris.pred <- predict(iris.rf, iris[ind == 2,])
table(observed = iris[ind==2, "Species"], predicted = iris.pred, type = "prob")
