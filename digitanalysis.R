library(kernlab)
library(SamSPECTRAL)
library(kknn)
library(dbscan)
library(cluster)
setwd("~/Learning/Lipscomb MSDS/Data Mining/Final _Project")

#Read in data. Convert into a matrix to run through specc
digits.full <- read.csv('MNIST/train.csv')
digits.small <- digits.full[1:100,] #make the dataset smaller in order to run it on your laptop
digits.train <- as.matrix(digits.small[,2:785]) #remove the labels from the small dataset for model training


#use spectral clustering
digits.model.specc <- specc(digits.train, centers = 10)
(digits.con_mat.specc <- table(digits.small$label, digits.model.specc[1:100]))
(digits.bays.specc <- prop.table(digits.con_mat.specc, 1))


#use kmeans clustering
digits.model.km <- kmeans(digits.small[,2:785], 10, nstart=20)
(digits.con_mat.km <- table(digits.small$label, digits.model.km$cluster))
(digits.bays.km <- prop.table(digits.con_mat.km, 1))


#use bdscan clustering
kNNdistplot(digits.train, 10) #get the eps for the dbscan model. Need the y value at the elbow on the plot
digits.model.db <- dbscan(digits.train, eps=1700, minPts = 4)
(digits.con_mat.db <- table(digits.small$label, digits.model.db$cluster))
(digits.bays.db <- prop.table(digits.con_mat.db, 1))


#use SamSPECTRAL clustering - not working
digits.model.sam <- SamSPECTRAL(digits.train[1:100, ], dimensions=c(1,2,3, 4, 5, 6, 7, 8, 9, 10), normal.sigma = 5, separation.factor = 0.7)
(digits.con_mat.sam <- table(digits.small$label, digits.model.sam))
(digits.bays.sam <- prop.table(digits.con_mat.sam, 1))


#use kknn a nearest neighbors algorithm - not working
digits.model.kknn <- specClust(digits.small[,2:785], centers=10)
(digits.con_mat.kknn <- table(digits.small$label, digits.model.kknn$cluster))
(digits.bays.kknn <- prop.table(digits.con_mat.kknn, 1))


digits.con_mat.specc
digits.bays.specc

digits.con_mat.km
digits.bays.km

digits.con_mat.db
digits.bays.db