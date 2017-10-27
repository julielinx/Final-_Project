library(kernlab)
digits.train <- read.csv('MNIST/train.csv')
digits.test <- read.csv('MNIST/test.csv')
head(digits.train)
str(digits.train)
test <- digits.train[1:100,2:785]
digits.nolabelsm <- digits.train[1:100,2:785]
digits.small <- digits.train[1:100,]
str(digits.nolabelsm)
digits.cluster <- specc(digits.nolabelsm, centers = 10)
digits.cluster$centers

#
plot(dataset, col=sluter.set)

size(digits.cluster) #membership per cluster
withinss(digits.cluster)
kernelf(digits.cluster)
digits.cluster[1:784] # It clustered for the values in the columns instead of as a row = a variable

class(digits.nolabelsm)

trial2 <- specc(digits.nolabelsm, data=digits.nolabelsm, centers=10)
trial2[1:784]
