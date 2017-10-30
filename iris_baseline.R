library(kernlab)
library(SamSPECTRAL)
library(kknn)
library(dbscan)
library(cluster)

#use iris dataset. Convert into a matrix to run through specc
iris.train <- as.matrix(iris[,1:4])

#use spectral clustering
iris.model.specc <- specc(iris.train, centers = 3)
(iris.con_mat.specc <- table(iris.model.specc[1:150], iris$Species))
(iris.Bays.specc <- prop.table(iris.con_mat.specc, 1))
clusplot(iris, iris.model[1:150], color=T, shade=T, labels=0, lines=0)


#use kmeans clustering
iris.model.km <- kmeans(iris[,1:4], 3, nstart=20)
(iris.con_mat.km <- table(iris.model.km$cluster, iris$Species))
(iris.Bays.km <- prop.table(iris.con_mat.km, 1))
clusplot(iris, iris.model.km$cluster, color=T, shade=T, labels=0, lines=0)


#use SamSPECTRAL clustering
iris.model.sam <- SamSPECTRAL(iris.train, dimensions=c(1,2,3), normal.sigma = 3, separation.factor = 1.2)
(iris.con_mat.sam <- table(iris.model.sam, iris$Species))
(iris.Bays.sam <- prop.table(iris.con_mat.sam, 1))
clusplot(iris, iris.model.sam, color=T, shade=T, labels=0, lines=0)


#use bdscan clustering
#kNNdistplot(iris.train, 4) #get the eps for the dbscan model. Need the y value at the elbow on the plot
iris.model.db <- dbscan(iris.train, eps=.5, minPts = 4)
(iris.con_mat.db <- table(iris.model.db$cluster, iris$Species))
(iris.Bays.db <- prop.table(iris.con_mat.db, 1))
clusplot(iris, iris.model.db$cluster, color=T, shade=T, labels=0, lines=0)


#use kknn spectral algorithm
iris.model.kknn <- specClust(iris.train, centers=3)
(iris.con_mat.kknn <- table(iris.model.kknn$cluster, iris$Species))
(iris.Bays.kknn <- prop.table(iris.con_mat.kknn,1))
clusplot(iris, iris.model.kknn$cluster, color=T, shade=T, labels=0, lines=0)


iris.con_mat.specc
iris.Bays.specc

iris.con_mat.km
iris.Bays.km

iris.con_mat.sam
iris.Bays.sam

iris.con_mat.db
iris.Bays.db

iris.con_mat.kknn
iris.Bays.kknn
