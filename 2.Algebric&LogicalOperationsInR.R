#ARITHMETIC OPERATORS IN R

#addition
2+3
#subtraction
5-2
#multiplication
9*8
#exponential
2^3
#modulus
27%%8
# integer division
27 %/% 8

#ASSIGNING VALUES

x<-10
print(x)
y<- 13
print(y)

#SOME OTHER FUNCTIONS

#square root
sqrt(9)
#calculate natural log of argument
log(2)
#calculate log with base
log(100,10)
# by default base 10
log10(100)
log(4,2)
#exponential calculations(e^x)
exp(0.6931472)


#RELATIONAL OPERATORS

print(x)
print(y)
x>=y
# FALSE since 10 is less than 13
x==y
# FALSE since 10 is equal to 13
x<y
x!=y
# since x is not equal to 13

#LOGIC OPERATORS 

# & - element wise logical AND
# | - element wise logical OR
# ! - logical NOT

x>y & x==y
x!=y & x<y
x>y | x!=y
x>y | y==x
!(x<y)
