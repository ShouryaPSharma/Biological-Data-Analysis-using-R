#ggplot2 cheat sheet- https://ggplot2.tidyverse.org/index.html

#GRAMMAR OF GRAPHICS USING GGPLOT2 - 

#load the packages
library(ggplot2)
library(reshape2)

#read ELISA data for scatter plot
d1 <- read.csv("elisa2.csv")
View(d1)

#create a scatter plot step by step using ggplot2:

ggplot()
#call the function, will give empty background
ggplot(d1)
#we have given data but no other info
ggplot(d1,aes(x=conc))
#horizontal line is scaled
ggplot(d1,aes(x=conc,y=treated))
#vertical line also scaled
ggplot(d1,aes(x=conc,y=treated)) + geom_point()
#scatter plot created

#assign plot to a variable
p1 <- ggplot(d1,aes(x=conc,y=treated))+ geom_point()
p1

#add line to scatter plot and create new plot
p2 <- p1 + geom_line()
#geom_line() is used for line plot
p2

#scatter plot using both treated and untreated data

#ggplot generally can't do it without recasting/reshaping
#melt() function in reshape2 package is used 

d2 <- melt(d1,id.vars="conc",measure.vars = c("treated","untreated"))
View(d2)

#change headers
colnames(d2) <- c("conc","sample","abs")
View(d2)

#create scatter plot 
p3 <- ggplot(d2,aes(x=conc,y=abs,col=sample))+geom_point()
p3

#add smooth line
p4 <- p3 + geom_smooth(se=FALSE,span=2)
p4
#in console - method 'loess'
#if se= TRUE, gray zone in plot => confidence interval
#if se= FALSE => do not visualize default confidence interval
p42 <- p3 + geom_smooth(se=TRUE,span=0.5)
p42
#lower the span, wigglier the line

#edit axes labels & legend title
p5 <- p4 +labs(x="Concentration(ng/ml)",y="Absorbance",color="samples")
p5

#fix Y axis limits
p6 <- p5 + ylim(0,4)
p6

#change themes
#till now grey background with white grid lines
p7<- p6 + theme_classic()
p7

#summarizing every element together
final.plot <- ggplot(d2,aes(x=conc,y=abs,col=sample))+geom_point(size=3)+geom_smooth(se=FALSE,span=2)+labs(x="Concentration(ng/ml)",y="Absorbance",color="Samples")+ylim(0,4)+theme_classic()
final.plot
#geom_point(size=3) => symbol size