# Author: Anani Assoutovi
library(ggplot2)
library(readr)
library(kernlab)

# rm(list=ls())
setwd("~/Desktop/DataMining/Final-_Project/")
DataSet <- read.table("FlameDataset.csv",quote ="\"",comment.char ="")
colnames(DataSet) <- c("ColOne","ColTwo","ColThree")
View(DataSet)
flame.data <- DataSet[,1:2]
head(flame.data)
plot(flame.data,col="turquoise")

data.matrix <- as.matrix(flame.data)

sc.Flame <- specc(DataSet, centers=2)
sc.Flame
centers(data.matrix)
size(sc.Flame)
withinss(sc.Flame)
plot(sc.Flame,col=sc.Flame)
class(DataSet)

# Viewing the structure str() of the flame dataset, and its summary()
str(DataSet)
summary(DataSet)

# Now, let us first set the seed of the random data
set.seed(1234)

# Next, let us split the dataset into training set and testing set
flame.Ind <- sample(2, nrow(DataSet),replace =T,prob =c(0.7,0.3))

# Now Let us declare the Training set
flame.Train <- DataSet[flame.Ind==1,]

# Now, Let us declare the Testing Set
flame.Test <- DataSet[flame.Ind==2,]

# Choosing a smaller observation of the training set
flame.smallSet <- flame.Train[1:100,]

# Let us model the training set to matrix by removing the labels
flame.nolabelsm <- as.matrix(flame.smallSet[,2:785])






