#HISTOGRAM AND BOX PLOT

#PLOTTING HISOGRAM:

#data: Flow Cytometry data
#read data
f <- read.csv("flow.csv")
View(f)

# 20000 cells - 8 variables(channels) like height etc

#plot histogram using hist()
hist(f$FL2.H)

#format
hist(f$FL2.H,xlim=c(0,1000),ylim=c(0,4000),xlab="FL2-H",ylab="Count",main="Histogram of FL2-H",las=1)
#main- title of histogram
#las=1 - converts y axis labels horizontal

#change no of bins: 
#No of bins decide shape of histogram
#use Freedman Diaconis Rule (if breaks=50,50 bins)
hist(f$FL2.H,xlim=c(0,1000),ylim=c(0,4000),xlab="FL2-H",ylab="Count",main="Histogram of FL2-H",las=1,breaks = "FD")

#add markers for mean & median
#abline() - adds straight line (vertica or horizontal)
abline(v=mean(f$FL2.H),lwd=2,col="red")
abline(v=median(f$FL2.H),lwd=2,col="blue")

#change frequency(or count) to density
hist(f$FL2.H,xlim=c(0,1000),ylim=c(0,0.005),xlab="FL2-H",ylab="Density",main="Histogram of FL2-H",las=1,breaks = 40,freq=FALSE)
#here R plots density data
#now area under the curve is 1

#change frequency(or count)to percentage

h <- hist(f$FL2.H,plot= FALSE)
#plot=FALSE - don't plot, just assign to object h,i.e.,store data only
View(h)
#convert density into percentage
h$density <- h$counts*100/sum(h$counts)
#density will be changed now
View(h)
plot(h,freq=FALSE,xlim=c(0,1000),ylim=c(0,20),xlab="FL2-H",ylab="Percentage of Cells",main ="Histogram of FL2-H",las=1,col="mistyrose")

#BOX PLOT
#bar plot hides distribution information
#it hides heterogeneous information - outliers & dispersion of data

#data: "InsectSprays"(default data set in R)
#read data
d <- InsectSprays
View(d)

#create boxplot using boxplot() function
boxplot(count~spray,d)
#formula- groups based in spray variable

#formatting
boxplot(count ~ spray,d,xlab="Type of Spray",ylab= "Insect Count",cex.lab= 1.5,cex.axis=1.5,ylim=c(0,30),varwidth=TRUE,outpch=19,outcol="red")

#varwidth= TRUE - sometimes many categories may not have same no of samples, hence variable(box) width is required
#outpch - outlier symbol
#outcol - outlier color

