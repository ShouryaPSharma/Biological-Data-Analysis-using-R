#SCATTER PLOT:

#in built data set in R- DNase data set(ELISA)
# different concentration for enzymes vs absorbance
d<- DNase
View(d)
#this is pairwise data
plot(d$conc,d$density)

#formatting

plot(d$conc, d$density,xlab="Concentration(ng/ml)",ylab="Absorbance",pch= 3,col="blue",cex=2,cex.axis=1.5,cex.lab=1.5)
#xlab/ylab - labeling of axes
#pch - name of symbol
#col - color of symbol
#cex - size of symbol
#cex.axis - font size of axis markings
#cex.lab - font size of axis labels 

#we have 11 runs of 8 different concentrations and for each concentration,2 repeats/readings 
#we can calculate the mean absorbance for each concentration using aggregate()

d.avg <- aggregate(density~ conc,d,mean)
print(d.avg)

#hence we get the mean density for each specific concentration

#plot concentration vs mean absorbance
plot(d.avg$conc,d.avg$density,xlab="Concentration(ng/mL)",ylab= "Mean Absorbance",pch=19,col="red",cex=2,cex.axis=1.5,cex.lab=1.5,xlim=c(0,14),ylim=c(0,2.5))

#another scatter plot

e <- read.csv("elisa.csv")
View(e)

#we want to get means of the abosorbances for a particular concentration
#use rowMeans()
abs.means <- rowMeans(e[,2:5])
print(abs.means)

#plot concentration vs mean absorbance
plot(e$conc,abs.means,pch=19,xlab="Concentration",ylab="Mean Absorbance",col="aquamarine",cex=2,xlim=c(0,14),ylim=c(0,2))

#LINE PLOT
#plotting line plot with scatter data 

#NOTE: this is not data fitting, which is done in regression
plot(e$conc,abs.means,pch=19,col="violet",cex=2,xlab="Concentration",ylab="Mean Absorbance",xlim=c(0,14),ylim=c(0,2),type="b",lwd=2)

#type="b" means both scatter/symbol + line
#if we don't want symbols, type= "l"
#lwd - width of line
plot(e$conc,abs.means,pch=19,col="violet",cex=2,xlab="Concentration",ylab="Mean Absorbance",xlim=c(0,14),ylim=c(0,2),type="l",lwd=2)

#BAR PLOT:

#read data
f<-read.csv("facs2.csv")
View(f)
#columns represent different cell cycle phases

#bar plot for untreated sample
f.un <- f[1,2:5]
View(f.un)
class(f.un)

#create a matrix
f.unm <- data.matrix(f.un)

#plot
barplot(f.unm,ylim=c(0,80),ylab="% of cells",col="black",)

#bar plot for all 3 samples
f.val <- data.matrix(f[,2:5])
barplot(f.val,beside=TRUE,ylim=c(0,100),ylab="% of cells",legend.text=c("Untreated","Drug A","Drug B"),args.legend= list(bty="n",x="topright"))

#beside= TRUE - bars will be plotted side by side, else stacked
#bty="n" - no box around legend

#change color & font size
mycol <- c("lightpink","paleturquoise","mistyrose")
barplot(f.val,beside=TRUE,ylim=c(0,100),ylab="% of cells",legend.text=c("Untreated","Drug A","Drug B"),args.legend= list(bty="y",x="topright"),col=mycol,cex.axis = 1.25,cex.names=1.25,cex.lab=1.25)
