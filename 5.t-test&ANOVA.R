# t-TEST AND ANOVA

#Unpaired 2 sample t-test to check effect of a treatment on plant growth:

#read data
h.data <- read.csv("plant.csv", header= TRUE)
View(h.data)

#check data summary
summary(h.data)

#plot the data (box plot)
boxplot(h.data$Untreated, h.data$Treated, names= c("Untreated","Treated"), ylab="Height of plant",ylim=c(60,140),col="aquamarine")

#for a t-test, we have to check normality & equal variance

#SHAPIRO-WILK NORMALITY TEST:

shapiro.test(h.data$Untreated)
shapiro.test(h.data$Treated)
#here null hypothesis is data is normally distributed
#since p value is high- CANT REJECT null hypothesis
#thus both data are normally distributed

#test for equal variance
#null hypothesis: variance of two samples are equal
var.test(h.data$Untreated,h.data$Treated)
#this performs an F-test
#again high p value, CANT reject null hypothesis

#unpaired two sample t-test:
#H0 : mean of untreated sample = mean of treated sample
t.test(h.data$Untreated,h.data$Treated,var.equal=TRUE)
#p value very small - reject H0 - mean unequal
# Treatment has a significant effect on the height of the plant

#ANOVA:

#suppose 3 data sets- Control, Treatment1, Treatment2
#ONE WAY ANOVA
#Data- "PlantGrowth"(default data set in R)

#load the data
d <- PlantGrowth
View(d)

#summary
summary(d)

#plot the data
boxplot(weight~group,data= d,ylim=c(4,7),ylab="Dry weight of plants",xlab="Groups",col="cornsilk",varwidth= TRUE)
#varwidth=TRUE -- width of each box according to size of sample

#perform ONE WAY ANOVA

#H0: mean of control= mean of treatment1= mean of treatment2
oneway.test(weight~group, data=d,var.equal= TRUE)

#suppose cut off value is 0.05
#here p less than 0.05 -- reject H0
#difference in mean value is statistically significant


