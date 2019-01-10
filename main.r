##################################################
## Project: Iris Data Set
## Script purpose: Study
## Date: 09/01/2019
## Author: Eduardo Sant' Anna Martins
##################################################


dataset.test <- read.csv("dataset/iris.data", sep=",", header=F)

colnames(dataset.test) <- c("sepal.length", "sepal.width", "petal.length", "petal.width", "class")

summary(dataset.test)

den <- density(dataset.test$`sepal.width`)

plot(den, main="Iris Plants Database")

polygon(den, col="red", border="blue")

#hist(dataset$`sepal length`, col = "red")

#hist(dataset$`sepal width`, col = "red")

#hist(dataset$`petal length`, col = "red")

#hist(dataset$`petal width`, col = "red")

