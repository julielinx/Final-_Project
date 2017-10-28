rm(list=ls())
gc()

# Read dataset
Flame.Dataset <- read.table("C:/Users/mingj/Desktop/MSDS/Data Mining and Analysis/Assignment/Flame Dataset.csv", quote="\"", comment.char="")
View(Flame.Dataset)
Flame <-Flame.Dataset[,1:2]
str(Flame)
summary(Flame)
plot(Flame)

# add noise to dataset
n <- rnorm(240,1,0.1)
m <- as.matrix(n ,1)
Flame.n <- cbind(Flame, m)
plot(Flame.n)

library(fpc)
pamk.result <- pamk(Flame.n )
# number of clusters 
pamk.result$nc

layout(matrix(c(1,2),1,2)) 
plot(pamk.result$pamobject) 
layout(matrix(1)) # change back to one graph per page



library(kernlab)
Flame_m <- as.matrix(Flame.n)
c <- specc(Flame_m,3)
plot(c)