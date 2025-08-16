#ASSIGNING MULTIPLE VALUES TO A VARIABLE 

# creating a list using : operator

x<- 2:10
print(x)

#creating a list using seq(initial no,terminal no,increment) function

y<-seq(1.23,6.9,0.5)
print(y)

#creating a list using c() function [helpful for characters too, not just functions]
# put characters within " "

ages<- c(18,19,22,21,20,29,20,19)
names<-c("AB", "ab", "Cc")
ages
names

#READING A DATA FILE:

#in excel, always add a header line in table
#csv - comma seperated value file
#save excel fie as csv(comma delimited)


#importing a data file
iris.data<- read.csv("iris.csv", header= TRUE)

#ERROR- might be using wrong directory
# solution- go to sessions-set working directory-choose directory-choose the folder where csv file is stored

#viewing data file
View(iris.data)

#check part of data
head(iris.data)
tail(iris.data)

#check names of the variables
names(iris.data)

#check dimension of data,no of rows, no of columns
dim(iris.data)
nrow(iris.data)
ncol(iris.data)

#check structure of a data using str() function :gives details of data
str(iris.data)

#EXTRACT DATA

#extract data using variable name and $ operator
sw<- iris.data$SepalWidthCm

#extracting using row no/ column no
# vector[element no]
#matrix[ row number, column number]

sw[3]
#extracting whole second column for all rows
d2<- iris.data[,2]
#extracting second & third column
d23<- iris.data[,2:3]

#extracting part of data using subset() function
d.var<-subset(iris.data,Species=="Iris-setosa")
d.var.pl<- subset(d.var,PetalLengthCm > 1.5)

#WRITING A DATA FILE

#write a data file using write.csv() function
write1 <- write.csv(d.var.pl, file = "subset1.csv", row.names = FALSE) 
print(write1)
#NULL means file created
#file= name of new file
#without row.names argument, row number will be according to original file
write2<- write.csv(d.var.pl,file="subset2.csv")
print(write2)

#reading data using full path information
new.data<- read.csv("D://R datasets/Iris.csv")

#reading data from web using url() function
online.data<- read.csv(url("https://gist.githubusercontent.com/curran/a08a1080b88344b0c8a7/raw/0e7a9b0a5d22642a06d3d5b9bcbad9890c8ee534/iris.csv"))

#reading tab-delimited data using read.table()
tab.data <- read.table("iristab.txt", header= TRUE,sep="\t")
#sep- separator argument; in csv its already comma separated, now we have to mention data is tab seperated.

#DEFAULT DATASETS IN R

#to see all the available default data sets, use data()
data()
bod.data <- BOD

#how to add/column names
print(colnames(bod.data))
colnames(bod.data) <- c("Var1", "Var2")
View(bod.data)
