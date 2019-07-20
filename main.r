##################################################
## Project: Iris Data Set
## Script purpose: Study
## Date: 09/01/2019
## Author: Eduardo Sant' Anna Martins
##################################################



main <- function(){
  
  dataset.test <- read.csv("dataset/iris.data", sep=",", header=F)
  
  colnames(dataset.test) <- c("sepal.length", "sepal.width", "petal.length", "petal.width", "class")
  
  folder <- "plots"
  
  for (class.name in c("Iris-versicolor", "Iris-setosa", "Iris-virginica")){
    
    dataset.iris <- dataset.test[dataset.test$class == class.name, ]
  
    x <- dataset.iris$sepal.length
  
    y <- dataset.iris$sepal.width
    
    f.name <- file.path(folder, paste("scatter-", class.name,  ".pdf", sep = "")) 
  
    myscatter.plot(x, y, file.name=f.name, m="Dispertion Graphic", x.lab="Sepal Length", y.lab="Sepal Width")
    
    f.name <- file.path(folder, paste("bell-sepal-length", class.name,  ".pdf", sep = "")) 
    
    mybell.plot(x, file.name=f.name, m="Bell curve Graphic", x.lab="Sepal Length")
    
    #f.name <- file.path(folder, paste("bell-sepal-width", class.name,  ".pdf", sep = "")) 
    
    #mybell.plot(y, file.name=f.name, m="Bell Curve Graphic", x.lab="Sepal width")
  
    
  }
  
}


myscatter.plot <- function(x, y, file.name = "plot.pdf", m = NA, x.lab = NA, y.lab = NA){
  
  #print(paste(x, y, file.name, m, x.lab, y.lab, sep = ", "))
  
  pdf(file.name)
  
  plot(x, y, main=m, xlab=x.lab, ylab=y.lab, pch=19)
  
  abline(lm(x~y), col="red")
  
  lines(lowess(x, y), col="blue")
  
  dev.off()
  
}


mybell.plot <- function(value, file.name = "plot.pdf", m = NA, x.lab = NA){
  
  #print(paste(x, y, file.name, m, x.lab, y.lab, sep = ", "))
  
  pdf(file.name)
  
  hist(value, col = "red", freq = F, xlim = 10 + c(-5, 5))
  
  #curve(dnorm(value, mean = mean(value), sd = sd(value)))#, 5, 15, add = T, col = "blue")
  
  dev.off()
  
}


print(main())

