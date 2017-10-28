library(kernlab)
setwd("~/Learning/Lipscomb MSDS/Data Mining/Final _Project")

#read in the training and test datasets
digits.train <- read.csv('MNIST/train.csv')
digits.test <- read.csv('MNIST/test.csv')

#review the data and structure
head(digits.train)
str(digits.train)

digits.small <- digits.train[1:100,] #make the dataset smaller in order to run it on your laptop
digits.nolabelsm <- as.matrix(digits.small[,2:785]) #remove the labels from the small dataset for model training

#run the specc spectral clustering algorithm and look at the results
digits.cluster <- specc(digits.nolabelsm, centers = 10)
digits.cluster
digits.cluster[1:100] #get the cluster results - which variable was put into which cluster
size(digits.cluster) #membership per cluster
withinss(digits.cluster) #not sure what this does
kernelf(digits.cluster) #not sure what this does either

table(digits.small$label, digits.cluster[1:100]) #confusion matrix of the actual label vs the cluster it was put in
#the columns in this table are the clusters and the rows are the actual handwritten numbers
#number 0 = cluster 1
#number 1 = cluster 10
#number 2 = cluster 8
#number 3 = cluster 8
#number 4 = cluster 6
#number 5 = cluster 8
#number 6 = cluster 5
#number 7 = cluster 9
#number 8 = cluster 3
#number 9 = cluster 7, 9


#Results had 2,3, and 5 numbers in cluster 8, and number 9 in clusters 7 and 9.
#try using a larger dataset to improve your results
digits.med <- digits.train[1:1000,] #see if a larger dataset will run on your laptop
digits.nolabelmed <- as.matrix(digits.med[,2:785]) #remove the labels from the medium dataset for model training

#run the specc spectral clustering algorithm and look at the results
digits.cluster.med <- specc(digits.nolabelmed, centers = 10)