#PEARSON CORRRELATION COEFFICIENT (for linear associations)

#in R, cor() function is used
#by default Pearson method is used
d <- iris
View(d)
r <- cor(d$Sepal.Length,d$Petal.Length)
print(r)

#if we want to find pairwise correlation between all variables
d2 <- d[,1:4]
View(d2)
r2 <- cor(d2)
print(r2)
#in correlation matrix, diagonal will always be 1
#it is a square, symmetric matrix

#NON LINEAR ASSOCIATIONS 

#SPEARMAN'S RANK CORRELATION COEFFICIENT

x <- c(2,2.4,1.9,3.1)
y <- c(1,1.5,1.18,2)
tab <- data.frame(x,y)
View(tab)
rs <- cor(tab, method= "spearman")
print(rs)
rs2 <- cor(d2, method = "spearman")
print(rs2)

#KENDALL RANK CORRELATION COEFFICIENT
t <- cor(d$Sepal.Length,d$Petal.Length,method="kendall")
print(t)
t2 <- cor(d2)
print(t2)
