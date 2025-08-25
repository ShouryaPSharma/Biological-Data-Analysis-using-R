#VECTORS:

#create a vector using c()
u <- c(1,3,5,7,9)
print(u)

#create a vector using seq()
v<- seq(12,46,8)
print(v)

#vector indexing: vector_name[element_no]
print(u[3])

#addition of vector to scalar
p <- u+2
print(p)

#addition of 2 vectors
q <- u+v
print(q)

#multiply vectors
a <- 2*v
print(a)

#dot product

#use dot() of the 'geometry' library
#install geometry library & load it before using dot()
#tools--install packages-- geometry in packages-- install

library(geometry)
b <- dot(u,v)
print(b)

#magnitude of a vector : norm()
#have to specify which type of norm
#magnitude -- 2nd type
x <- norm(u,type="2")
print(x)

#unit vector
i <- u/norm(u,type="2")
print(i)

#angle between two vectors
# theta= cos inverse(dot product of two vectors/product of magnitude of the two vectors)
#acos() -- calculates cos inverse
theta <- acos(dot(u,v)/(norm(u,type="2")*norm(v,type="2")))
print(theta)

#------------------------------------------------------------------------------

#MATRIX

#create a matrix using matrix()

d <-c(1:10)
print(d)
m1<-matrix(d,nrow=2,ncol=5,byrow=FALSE)
print(m1)
#nrow- no of rows
#ncol- no of columns
#byrow= FALSE --- this means column wise arrangement
m2 <- matrix(d,nrow=2,ncol=5,byrow= TRUE)
print(m2)

#to check if matrix or not
class(m1)

#create a matrix using cbind()
print(d)
e <- c(21:30)
print(e)
m3 <- cbind(d,e)
print(m3)
class(m3)

#create a matrix using rbind()
m4 <- rbind(d,e)
print(m4)
class(m4)

#convert data frame to matrix
data1 <- BOD
class(data1)
m5 <- data.matrix(data1)
print(m5)
class(m5)

#remove column names
colnames(m5) <- NULL
print(m5)

#matrix indexing: matrix_name[row_no,column_no]
print(m5[3,2])
print(m5[,1])
#prints out entire first column

#transpose of a matrix using t()
m5t <-t(m5)
print(m5t)

#matrix addition 
m <- matrix(c(1:4),nrow=2,ncol=2,byrow=TRUE)
n <- matrix(c(11:14),nrow=2,ncol=2,byrow= FALSE)
print(m)
print(n)
sum.mn <- m+n
print(sum.mn)

#matrix multiplication:

#scalar multiplication
sm <- 2*m
print(sm)

#for matrix-matrix multiplication, use %*%
#if only * is used, it will perform element by element multiplication only
mn <- m%*%n
print(mn)

#determinant of a matrix using det()
print(det(m))

#eigenvalues & eigenvectors

#eigen() -- returns both eigenvalues and eigenvectors
ev<- eigen(m)
print(ev)
#to extract eigenvalues
values <- ev$values
print(values)
#to extract eigenvectors
vectors <- ev$vectors
print(vectors)

#solve a homogeneous system of linear equations:

#eg -  x+y=6
#     -3x+y=2
# A= coefficient matrix
# B= c(6,2)
# X= [x y]
# AX= B => x= A^-1B
#solve() function performs this work in R
#it takes A & B as arguments
A<- rbind(c(1,1),c(-3,1))
print(A)
B <- c(6,2)
print(B)
class(B)
sol <- solve(A,B)
print(sol)

#inversion of a matrix

#solve() needs two arguments
#if second argument not given, it is considered identity matrix by default
# AX= B => x= A(^-1) B
#if B identity => X= A(^-1) I = A(^-1)
print(solve(A))
# this gives A inverse
