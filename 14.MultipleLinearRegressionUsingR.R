#data - length(growth) of fish at different intervals (age) & different temperature of water
#length = b1*age + b2*temperature [NOTE: no intercept term]

#read data
fish <- read.csv("fish.csv")
View(fish)

#perform regression using lm()
reg <- lm(length~age + temp +0, data=fish)

#check summary
summary(reg)
#adjusted R^2 = 0.96 => very good linear model
#F-statistic: 535 on 2&42 DF, p value < 2.2e-16 => very small; reject null hypothesis[all coefficients=0]

#confidence interval for each coefficient
confint(reg)

#another example

#read data
multi <- read.csv("multi.csv")
View(multi)
#here S is dependent variable

#perform linear regression using lm()
reg.multi <- lm(S~.,data=multi)
#S~. => this specifies S as dependent variable & considers all other variables (along with intercept) as independent

#check summary
summary(reg.multi)

#adjusted R2 =0.596
#p value very small => reject null hypothesis

#check for multicollinearity:

#using Variance Inflation Factor(VIF)
#VIF of independent variables should be less than 10
#install the "car" package: tools-install packages-car-install

#load the package
library(car)

#perform VIF analysis
vif(reg.multi)
#all less than 10 , hence no multicollinearity
