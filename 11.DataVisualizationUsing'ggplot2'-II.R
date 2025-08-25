#USE OF STATISTICS LAYER IN GGPLOT2

#load the package
library(ggplot2)

#example1: calling statistics within a geom

facs <- read.csv("flow.csv")
View(facs)

#create histogram using geom_histogram()
#geom_histogram uses a statistical function for data binning.The binned data is plotted.

facs.plot1 <- ggplot(facs,aes(x=FL2.H))+ geom_histogram()
facs.plot1

#use smaller bin width
facs.plot2 <- ggplot(facs,aes(x=FL2.H))+ geom_histogram(binwidth = 5)
facs.plot2

#final histogram
facs.plot3 <- ggplot(facs,aes(x=FL2.H))+ geom_histogram(binwidth=5)+ labs(x="FL2-H",y="Count")+ ylim(0,400)+ theme_classic() + theme(axis.text= element_text(size=12,family = "sans"),axis.title = element_text(size=12,family="sans"))
facs.plot3

#example2: calling statistics within a geom
#reading the InsectSprays default data set in R & create a box plot to show effects of different insectisides
d<- InsectSprays
View(d)

#create box plot
box_plot <- ggplot(d,aes(x=spray,y=count,color=spray))+ geom_boxplot(outlier.color ="red",outlier.shape=16,outlier.size=3,show.legend = FALSE)+ labs(x="Type of Spray",y="Insect Count")+ ylim(0,30)+ theme_classic()+ theme(axis.text=element_text(size=12,family="sans"),axis.title= element_text(size=12,family="sans"))
box_plot                   
#outlier.shape=16 -- solid circle
#show.legend=FALSE => here separate legend is unnecessary

#example3: calling statistics independently
#creating a bar plot showing variation in petal length of different flowers

#read data
bar.data <- iris
View(bar.data)

#create a bar plot showing mean values , use stat_summary to get statistics like mean & std. error
bar.plot1 <- ggplot(bar.data,aes(x=Species,y=Petal.Length))+ stat_summary(fun.data = mean_se, geom="bar")
bar.plot1
#fun.data = mean_se => we want to calculate mean & se
#notice how geom is inside now

#add error bar
bar.plot2 <-  bar.plot1 + stat_summary(fun.data= mean_sdl,fun.args=list(mult=1),geom="errorbar",width=0.5)
bar.plot2
#if fun.args=list(mult=1) not given, R will calculate mean & multiply std. deviation by 2,hence mentioned to multiply by 1

#final bar plot
bar.plot3 <- ggplot(bar.data,aes(x=Species,y=Petal.Length))+ stat_summary(fun.data = mean_sdl,fun.args = list(mult=1),geom = "errorbar",width=0.5)+stat_summary(fun.data= mean_se,geom="bar")+ labs(x="Species",y="Petal Length")+ylim(0,8) +theme_classic()+theme(axis.text=element_text(size=14,family="sans"),axis.title=element_text(size=14,family = "sans"))
bar.plot3

