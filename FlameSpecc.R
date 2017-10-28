library(ggplot2)
library(readr)
library(kernlab)

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

