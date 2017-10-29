library(dplyr)
library(plyr)
library(reshape2)
vector <- c(1, 41, 33, 2, 49, 18, 1, 8, 4, 16)

probability <- function(x) {
  for (i in x) {
    i <- i / sum(x)
    return(i)
  }
}

iris.con_mat.km
iris.con_mat.km[,1] #column
iris.con_mat.km[1,] #row
iris.con_mat.km[2,]

iris.con_mat.km[,1] / sum(iris.con_mat.km[,1])

iris.con_mat.km[1,] / sum(iris.con_mat.km[1,])

pro1 <- function(x) {
  x[i,] <- x[i,] / sum(x[i,])
}

error <- pro1(iris.con_mat.km)
error

error <- for (i in iris.con_mat.km) {
  i <- i / sum(i)
  return(i)
}

Xcond<-ddply(X, .(A),
             .fun=function(curdfr){
               curdfr$CPROB<-curdfr$PROB/sum(curdfr$PROB);curdfr})

sum(vector)
probability2(vector)

probability2 <- function(x) {
  divisor <- sum(x)
  for (i in x) {
    i <- i / divisor
    return(i)
  }
}
lapply(vector, probability2)

cond_prob <- function(x) {
  vapply(seq_along(x), function(i) x[i] / sum(x[-i]), numeric(1))
}
cond_prob(vector)
cond_prob(iris.con_mat.km)

lapply(iris.con_mat.km, pro1)
sapply(iris.con_mat.km, pro1)
apply(iris.con_mat.km, pro1)

iris.con_mat.km[1,] / sum(iris.con_mat.km[1,])
iris.con_mat.km[2,] / sum(iris.con_mat.km[2,])
iris.con_mat.km[3,] / sum(iris.con_mat.km[3,])

prob2 <- function(x, i) {
  x[i,] <- x[i,] / sum(x[i,])
}

pro2 <- function(x){
  for (i in 1:nrow(as.vector(x))) {
    row.val <- (x[i,] / sum(x))
  }
}
get.Func <- pro2(iris.con_mat.km)
