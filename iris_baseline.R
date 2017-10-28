library(kernlab)
library(SamSPECTRAL)
library(kknn)
library(dbscan)
library(cluster)

#use iris dataset. Convert into a matrix to run through specc
iris.train <- as.matrix(iris[,1:4])

#use spectral clustering
iris.model <- specc(iris.train, centers = 3)
(iris_con_mat.specc <- table(iris.model[1:150], iris$Species))
clusplot(iris, iris.model[1:150], color=T, shade=T, labels=0, lines=0)

#use kmeans clustering
iris.model.km <- kmeans(iris[,1:4], 3, nstart=20)
(iris.con_mat.km <- table(iris.model.km$cluster, iris$Species))
clusplot(iris, iris.model.km$cluster, color=T, shade=T, labels=0, lines=0)

#use SamSPECTRAL clustering
iris.model.sam <- SamSPECTRAL(iris.train, dimensions=c(1,2,3), normal.sigma = 3, separation.factor = 1.2)
(iris.con_mat.sam <- table(iris.model.sam, iris$Species))
clusplot(iris, iris.model.sam, color=T, shade=T, labels=0, lines=0)

#use bdscan clustering
#kNNdistplot(iris.train, 4) #get the eps for the dbscan model. Need the y value at the elbow on the plot
iris.model.db <- dbscan(iris.train, eps=.5, minPts = 4)
(iris.con_mat.db <- table(iris.model.db$cluster, iris$Species))
clusplot(iris, iris.model.db$cluster, color=T, shade=T, labels=0, lines=0)

#use kknn a nearest neighbors algorithm
library(kknn)
iris.model.kknn <- specClust(iris.train, centers=3)
(iris.con_mat.kknn <- table(iris.model.kknn$cluster, iris$Species))
clusplot(iris, iris.model.kknn$cluster, color=T, shade=T, labels=0, lines=0)
