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



