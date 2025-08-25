#read data
data <- read.csv("kmeans.csv")
View(data)

#plot to look for clusters
plot(data,pch=1,cex=2)

#perform k-means clustering :
km2 <- kmeans(data,2,nstart=50)
#here 2 is argument for no of clusters
View(km2)

#observe output
# cluster => store info of which data point in which cluster
#centers => coordinates of centers of the clusters
#tot.withinss => total WCSS
#betweenss => between WCSS

#list of cluster assignment
km2$cluster

#plot clustering result
plot(data,col=km2$cluster,pch=20,cex=3)
#in R,by default , 1-> black; 2 -> red
#pch=20 -> field circle symbol

#add cluster centers to the plot
points(km2$centers,col=3,pch=15,cex=3)

#clustering with k=3
km3 <- kmeans(data,3,nstart=50)
plot(data,col=km3$cluster,pch=20,cex=3)

#with k=4
km4 <- kmeans(data,4,nstart=50)
plot(data,col=km4$cluster,pch=20,cex=3)

#performing clustering with few more k values
km5 <- kmeans(data,5,nstart=50)
km6 <- kmeans(data,6,nstart=50)
km7 <- kmeans(data,7,nstart=50)

#within cluster sum of squares(extract out WCSS)
w2 <- km2$tot.withinss
w3 <- km3$tot.withinss
w4 <- km4$tot.withinss
w5 <- km5$tot.withinss
w6 <- km6$tot.withinss
w7 <- km7$tot.withinss

barplot(c(w2,w3,w4,w5,w6,w7),names=seq(2,7),xlab="K",ylab="WCSS",ylim=c(0,4))

#hence we may choose k=5 for clustering

#Between cluster sum of squares: 
#this is dispersion between the clusters,which should be high
b2 <- km2$betweenss
b3 <- km3$betweenss
b4 <- km4$betweenss
b5 <- km5$betweenss
b6 <- km6$betweenss
b7 <- km7$betweenss

barplot(c(b2,b3,b4,b5,b6,b7),names=seq(2,7),xlab="K",ylab="BCSS",ylim=c(0,15))
#again we get k=5 as justified no of clusters

#plot the result for selected k
plot(data,col=km5$cluster,pch=20,cex=3)

#extract data of a particular cluster
#get index of data that are in cluster 1 & then extract
c1 <- which(km5$cluster == 1)
cluster.1 <- data[c1,]
View(cluster.1)
