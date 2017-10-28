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
#try using a medium sized dataset to improve your results
digits.med <- digits.train[1:1000,] #see if a medium dataset will run on your laptop
digits.nolabelmed <- as.matrix(digits.med[,2:785]) #remove the labels from the medium dataset for model training

#run the specc spectral clustering algorithm and look at the results
(digits.cluster.med <- specc(digits.nolabelmed, centers = 10))
table(digits.med$label, digits.cluster.med[1:1000]) #confusion matrix of the actual label vs the cluster it was put in
#first run
#number 0 = cluster 9. Also high for cluster 5
#number 1 = cluster 3
#number 2 = cluster 10
#number 3 = cluster 4. Also high for cluster 8
#number 4 = cluster 6
#number 5 = cluster 2 and 8. Also high for cluster 4
#number 6 = cluster 5
#number 7 = cluster 6
#number 8 = cluster 2
#number 9 = cluster 6

#cluster 1 = 4, with some 6, 9
#cluster 2 = 8, with 5
#cluster 3 = 1
#cluster 4 = 3, with some 5, 2, 8
#cluster 5 = 6, with 0
#cluster 6 = 7 with 9, 4
#cluster 7 = 4, with 9 - > call this the cluster for 9 because 4 has a much stronger relation to cluster 6
#cluster 8 = 3 with 5 <- call this the cluster for 5 because 3 has a stronger relation to cluster 4
#cluster 9 = 0
#cluster 10 = 2
# missing strong clusters for 5 and 9
#Algorithm has difficulty differentiating between 3 and 5, and 4 and 9
#Cluster = handwritten number,   handwritten number = cluster
# 1 = 4      0 = 9
# 2 = 8      1 = 3
# 3 = 1      2 = 10
# 4 = 3      3 = 4
# 5 = 6      4 = 1
# 6 = 7      5 = 8
# 7 = 9      6 = 5
# 8 = 5      7 = 6
# 9 = 0      8 = 2
#10 = 2      9 = 7

#second run
#Cluster = handwritten number,   handwritten number = cluster
# 1 = 7, or 9, 4            0 = 7, maybe 6
# 2 = 1                     1 = 2, maybe 9
# 3 = 8, maybe 3, 5, 2      2 = 4
# 4 = 2      3 = 8
# 5 = 5      4 = 1
# 6 = 0      5 = 3, or 6,8
# 7 = 0      6 = 10
# 8 = 3      7 = 1
# 9 = 1      8 = 3
#10 = 6      9 = 1
#need cluster for 4, 9
#had trouble differentiating between 7, 9, 4

#try using a larger sized dataset to improve your results
digits.lg <- digits.train[1:5000,] #see if a larger dataset will run on your laptop
digits.nolabellg <- as.matrix(digits.lg[,2:785]) #remove the labels from the medium dataset for model training

#run the specc spectral clustering algorithm and look at the results
(digits.cluster.lg <- specc(digits.nolabellg, centers = 10))
table(digits.lg$label, digits.cluster.lg[1:5000])