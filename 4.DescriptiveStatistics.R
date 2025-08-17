#PREPARE THE DATA

ages <- c(23,34,35,41,26,25,36,40,27,30)
sys <- c(122,120,118,120,121,122,119,118,120,121)
dia <-c(83,79,82,75,77,81,80,82,78,79)

#NO OF SAMPLES
length(sys)

#MIN & MAX VALUES:
min(sys)
max(sys)

#MEDIAN, MEAN , VARIANCE & STD DEVIATION

median(sys)
mean(sys)
var(sys)
sd(sys)

#CREATE A TABLE & GET COMPREHENSIVE STATISTICS:
#create table using data.frame() function
# in matrix, only one kind of numerical characters
#in data frame, all kinds of characters accommodated in table-like frame
bp.data <- data.frame(ages,sys,dia)

#GET STATISTICS USING SUMMARY()
summary(bp.data)

#___________________________________________________________________

#read iris data
iris.data <- read.csv("iris.csv", header = TRUE)

#get the statistical summary
summary(iris.data)

#calculate mean petal width of Iris-versicolor
versi <- subset(iris.data,Species == "Iris-versicolor")
meanpw <- mean(versi$PetalWidthCm)
print(meanpw)

#create a frequency histogram using hist()
hist(iris.data$PetalWidthCm)
hist(versi$PetalWidthCm)
