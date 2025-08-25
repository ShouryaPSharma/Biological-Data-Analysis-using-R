#classify tumor samples as malignant or benign
#biopsy sample of cells having breast cancer
#image of cells - features extracted(morphology,radius etc)
#csv label- 1=> sample is malignant
#           0=> sample is benign, based on mean area of cell in image & mean radius of nucleus in cell in image

#read data
train <- read.csv("train_cancer.csv")
View(train)

#plot malignancy vs area data
plot(train$area,train$mal,xlab="Area",ylab="Probability of being malignant",col="red",pch=1,cex=2)

#logistic regression to classify using area measure
#use generalized Linear Model function glm()
#in logistic regression Probability = p = 1/(1+exp(-1(a+b*x)))
# => a+b*x = ln[p/(1-p)]
#we are calculating a & b from the data
logit.area <- glm(mal~area,data=train,family="binomial")
summary(logit.area)
#here intercept is a & area coefficient is b
#observe AIC= 331.31

#plot the regression line
#create a vector for area and probability,use logistic regression equation
av <- seq(0,0.4,0.01)
a <- coef(logit.area)[["(Intercept)"]]
b <- coef(logit.area)[["area"]]
pv <- 1/(1+exp(-(a+b*av)))

#plot av vs pv
lines(av,pv,col="blue",lwd=2)

#calculate the cut-off/threshold
#considering p= 0.5 as cut-off value
#p>0.5 will be considered malignant
# using p = 1/(1+exp(-1(a+b*x))) to calculate value of x for which p=0.5
thresh.area <- -a/b
print(thresh.area)

#add a vertical line at threshold
abline(v=thresh.area,lty=2,col="grey",lwd=2)
#lty => dotted line

#evaluate the logistic model
#predict the probability for each observation in training data
p1 <- predict(logit.area,train,type="response")
#classify based on probability
c1 <- ifelse(p1>0.5,1,0)

#create confusion matrix
tab1 <- table(Predicted=c1,Actual = train$mal)
print(tab1)

#specificity/ selectivity/ true negative rate:= TN/(TN+FP)
sp1 <- tab1[1,1]/sum(tab1[,1])
print(sp1)

#sensitivity/recall/hit rate/true positive rate:= TP/(TP+FN)
sn1 <- tab1[2,2]/sum(tab1[,2])
print(sn1)

#---------------------------------------

#LOGISTIC REGRESSION WITH TWO PREDICTORS

#in logistic regression with multiple predictors: p= 1/(1+exp(-1(a+b1*x1+b2*x2+...)))
#   => a+b1*x1 +b2*x2+....= ln[p/(1-p)]
#we are calculating a,b1,b2,...
logit2 <- glm(mal~area+rad,data=train,family="binomial")
summary(logit2)
#AIC is a criteria used to compare between two models of different parameters.
#LOWER THE AIC VALUE, BETTER THE MODEL
#here AIC= 191.39

#evaluate the logistic model
p2 <- predict(logit2,train,type="response")
c2 <-ifelse(p2>0.5,1,0)

#create confusion matrix
tab2 <- table(Predicted= c2,Actual=train$mal)
print(tab2)

#specificity & sensitivity
sp2 <- tab2[1,1]/sum(tab2[,1])
sn2 <- tab2[2,2]/sum(tab2[,2])
print(sp2)
print(sn2)

#evaluate model on test data
test <- read.csv("test_cancer.csv")
View(test)

#predict probabilities for test data
p.test <- predict(logit2,test,type="response")

#classify based on probability
c.test <- ifelse(p.test>0.5,1,0)

#create confusion matrix
tab.test <- table(Predicted= c.test, Actual= test$mal)
print(tab.test)

#specificity/ true negative rate
sp.test <- tab.test[1,1]/sum(tab.test[,1])
print(sp.test)

#sensitivity
sn.test <- tab.test[2,2]/sum(tab.test[,2])
print(sn.test)
