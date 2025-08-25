# HEATMAP & VOLCANO PLOT
#comprehensively visualize high dimensional data

#HEAT MAP:

#data: B-cell & T-cell Leukemia data (gene expression)
#http://www.bioconductor.org/biocLite

#read data file
exp.data <- read.csv("exp.csv",row.names = 1,header=TRUE)
View(exp.data)
#there are 47 samples - X1005, X3002 etc
#each row is a feature of microarray

#create a data matrix(heatmap argument takes matrix)
d <- data.matrix(exp.data,rownames.force = TRUE)
#rownames.force= TRUE - retains the row names
class(d)

#create spatial heatmap
heatmap(d[1:10,],Rowv = NA,Colv=NA)
#d[1:10,]- data of first 10 rows(10 features)
#RowV/ColV = NA - no hierarchical clustering(dendogram)
#faint color - low reading
#deep color - high reading

#create a cluster heatmap(add dendogram to heatmap)
heatmap(d[1:10,])

#scale the data:
# take a column(sample)
#all rows(features) scaled(centered) such that mean = 0
heatmap(d[1:10,],scale="column")

#create new heatmap with one dendogram
heatmap(d[1:10,],Colv = NA,scale="column")

#VOLCANO PLOT :
#this script uses ggplot2 package. Install it.

#load ggplot2
library(ggplot2)

#read data
v.data <- read.csv("vdata.csv")
View(v.data)

#we want to visualize which of the gene expression data is both biologically relevant & statistically significant in one data plot.

plot1 <- ggplot(data=v.data,aes(x=log2FoldChange,y=-log10(pvalue))) + geom_point()

#aes- aesthetic
#geom_point() - to create scatter plot

#show plot
plot1

#log2FoldChange > 1 => biologically relevant up regulation
#suppose cut off for p value = 0.05

#add vertical & horizontal reference lines:
#cutoffs for Log2FoldChange are -1 & +1
#cutoff for pvalue is 0.05

plot2 <- plot1 + geom_vline(xintercept = c(1,-1),col="blue")+ geom_hline(yintercept= -log10(0.05),col="red")
plot2

#add new variable for three level factors- UP, DOWN & NO
v.data$diffexpressed <- "NO"
#diffexpressed - new column
#all entries NO at first
v.data$diffexpressed[v.data$log2FoldChange>= 1 & v.data$pvalue<=0.05] <- "UP"
v.data$diffexpressed[v.data$log2FoldChange <= -1 & v.data$pvalue<=0.05] <- "DOWN"

#create the plot
plot3 <- ggplot(data= v.data,aes(x= log2FoldChange,y=-log10(pvalue),col=diffexpressed))+ geom_point()+ theme_minimal()+ scale_color_manual(values=c("red","black","green"))+geom_vline(xintercept = c(1,-1),col="blue")+ geom_hline(yintercept= -log10(0.05),col="blue")
plot3

#add gene labels to UP & DOWN regulated genes
#create new variable column; add  name of UP & DOWN regulated genes
v.data$glabel <- NA
v.data$glabel[v.data$diffexpressed != "NO"] <- v.data$gene_symbol[v.data$diffexpressed !="NO"]

#create the plot
plot4 <- ggplot(data=v.data,aes(x=log2FoldChange,y=-log10(pvalue),col=diffexpressed,label= glabel))+geom_point()+ theme_minimal() + scale_color_manual(values=c("red","black","green"))+ geom_vline(xintercept = c(-1,1), col="blue")+geom_hline(yintercept = -log10(0.05),col="blue")+geom_text()
#geom_text => for labels
plot4
