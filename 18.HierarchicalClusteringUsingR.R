#data set- gene expression data of 64 different cancer cell line.
#         NCI60 data set from ISLR2 package.
#         Total no of genes= 6830

#read data:
g <- read.csv("NCI60.csv",header=TRUE)
View(g)

#prepare the data:
g.lab <- g[,1]
#all row data for first column; stores labels
g.data <- g[,-1]
#discard first column & fetch rest data

#scale the data:
#make mean of each column= 0 => centering of data
#standard deviation of each column= 1
g.sc <- scale(g.data)
#we will perform clustering on scaled data & not raw data

#calculate the distance between observations:
#using dist() function to find pairwise distance between observations
g.dist <- dist(g.sc,method="euclidean")

#perform hierarchical clustering:
#use hclust() function with average linkage method
hc <- hclust(g.dist,method="average")

#plot the dendogram:
plot(hc,labels=g.lab,hang=-1,xlab="",sub="",ylab="",main="Average Linkage")
#label should be name of the cell line
#hang = -1 => all the leaves will be in same horizontal line
#main => name of the dendogram

#with complete linkage
plot(hclust(g.dist,method="complete"),hang=-1,labels=g.lab,xlab="",sub="",ylab="",main="Complete Linkage")

#with single linkage
plot(hclust(g.dist,method="single"),hang=-1,labels=g.lab,xlab="",sub="",ylab="",main="Single Linkage")
#observe chaining problem => not a good dendogram.
