Flame.Dataset <- read.table("C:/Users/mingj/Desktop/MSDS/Data Mining and Analysis/Assignment/Flame Dataset.csv", quote="\"", comment.char="")
View(Flame.Dataset)
Flame <-Flame.Dataset[,1:2]
plot(Flame)
