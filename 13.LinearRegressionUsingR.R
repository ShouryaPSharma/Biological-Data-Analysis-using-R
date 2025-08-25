#data used: Helmut Spaeth, Mathematical Algorithms for Linear Regression(1991)
#           D G Kleinbum & LL Kupper, Applied Regression Analysis & Other Multivariable Methods(1978)

#use linear model function lm()

#read data
d <- read.csv("bpData.csv")
View(d)

#plot the data
plot(d$age,d$sys.bp,xlab="Age",ylab="Systolic BP",col="red",pch=1,cex=2)
#pch=1 => circle symbol
#cex => thickness of the symbol

#calculate Pearson's correlation coefficient
cor(d$age,d$sys.bp,method="pearson")
#0.657 => good linear trend, we can perform linear regression

#perform linear regression
reg <- lm(sys.bp~age, data=d)

#get summary of reg
summary(reg)

#focus on 1. value of coefficients,2. R squared value, 3. t-test results

#confidence interval for estimated coefficient: use confint()
confint(reg,level = 0.95)

#overlay the regression line: abline() function
abline(reg,col="blue",lwd=2)

#-----------------------------------------------------------------------------

#estimating concentration of DNA,measuring their absorbance at 260 Nm

#read data 
dna <- read.csv("dna.csv")
View(dna)

#plot data
plot(dna$conc,dna$Abs,xlab="Concentration",ylab="Absorbance",ylim=c(0,0.35),col="red",pch=1,cex=2)

#linear regression
r1 <- lm(Abs~conc,data=dna)
summary(r1)

#observe intercept estimate is statistically insignificant(large p value)
#we have to remove intercept from default equation

#linear regression without intercept
r2 <- lm(Abs~conc+0, data = dna)
summary(r2)

#plot the regression line
abline(r2,col="blue",lwd=2)
