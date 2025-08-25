#POLYNOMIAL REGRESSION:

#data: https://online.stat.psu.edu/stat501/lesson/9/9.8

#read data
yd <- read.csv("yield.csv")
View(yd)

#plot data(scatter plot)
plot(yd$temp,yd$yield,xlab="Temperature",ylab="Yield",col="red",pch=1,cex=2)

#clearly a quadratic function will fit here

#method1: fit quadratic model => yield = a+b1*temp +b2*temp^2
#use lm() function
#specify higher order terms using I()
md1 <- lm(yield~temp + I(temp^2),data=yd)
summary(md1)
#observe all 3 coefficients are statistically significant

#method2: suppose we have a lengthy polynomial(say upto 8th degree)
md2 <- lm(yield~poly(temp,2,raw=TRUE),data=yd)
#here 2 => highest order we want in the polynomial
#raw = TRUE => not create orthogonal polynomial but simple polynomial upto 2nd order
summary(md2)

#plot the fitted curve: create data(x & y vectors) as per the fitted model
xv= seq(50,100,0.1)
yv = predict(md2, data.frame(temp=xv),type="response")
#md2 => model to be used
#data.frame(temp=xv) => input data

#draw the line
lines(xv,yv,col="blue",lwd=2)

#NON LINEAR LEAST SQUARE
#experiment- growth of plant(in terms of mass) vs time

#read data
plant <- read.csv("plant2.csv")
View(plant)

#plot data
plot(plant$week,plant$mass,xlab="Weeks",ylab="Mass",col="red",pch=1,cex=2)

#perform non linear least square fit
#use the nlsLM() function of R package minpack.lm
#it uses Levenburg-Marquardt algorithm
#install the package & load it before using

library(minpack.lm)

#our non linear model: mass= a*(1-exp(-b*week))
exp.mod <- nlsLM(mass~a*(1-exp(-b*week)),data=plant,start=list(a=25,b=9))
#here we are guessing a suitable starting value for unknown parameter a & b and use those values as arguments for nlsLM()

#result of data fitting
summary(exp.mod)

#plot the fitted model
x2v <- seq(1,16,0.1)
y2v <- predict(exp.mod,data.frame(week=x2v))
lines(x2v,y2v,col="blue",lwd=2)
