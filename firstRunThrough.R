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
table()