# Creating various type of data objects and check that

cVec1 <- c("Football", "Cricket", "Basketball", "Rugby")
class(cVec1)

cVec2 <- c(
  Game1 = "Football", 
  Game2 = "Cricket", 
  Game3 = "Basketball", 
  Game4 = "Rugby"
  )
cVec2

nVec1 <- c(1,2,seq(3,15,3),rep(6,3),17,18)
nVec1

Lvec1 <- c(TRUE,FALSE,FALSE,TRUE)
class(Lvec1)
Lvec2 <- c(0,1,1,1,0,0,1,0)
library(dplyr)
Lvec2 <- Lvec2 %>%
  as.logical(Lvec2)
Lvec2

cVec3 <- sample(
  x = c(1:100),
  size = 10,
  replace = F
)
cVec3
help("sample")

Lvec3 <- nVec1>=11
Lvec3

mixVec <- c(1,3,cVec2,4)
mixVec
class(mixVec)

# Creating a matrix with generated random number(normal)
set.seed(4122)
nVec2 <- round(
  runif(
    n=9, 
    min=10, 
    max=20
  ),
  0
)
nVec2
# help("runif")

set.seed(4122)
nVec3 <- round(
  rnorm(
    n = 9, 
    mean = 7, 
    sd = 14), 
  0
  )
nVec3
xmat <- matrix(nVec3, nrow = 3, ncol = 3, byrow = TRUE)
xmat
dim(xmat)

ymat <- matrix(nVec2, nrow = 3, ncol = 3, byrow = T)
ymat

# Matrix operations
# Addition & Substruction
amat <- xmat+ymat
amat
smat <- xmat-ymat
smat
# Multiplication
mmat <- xmat %*% ymat
mmat
zmat <- matrix(data = c(12,9,10,18,7,13), nrow = 3, byrow = T)
zmat
mmat2 <- xmat %*% zmat
mmat2   # 3x3 * 3x2 = 3x2 & 3x3 * 2x3 is not possible

# Creating array with R command
arrayA <- array(1:16, dim = c(2,2,6), dimnames = list(c("a", "b"), c("x", "y"), c("A", "B", "C", "D","E","F")))
arrayA
# help("array")
is.array(arrayA)

# Creating data frame
gn <- c("Football", "Card", "Chess", "Cricket", "Basketball", "Table Tennis")
n_p <- c(86, 12, 23, 155, 17, 39)
g_t <- c("Outdoor", "Indoor", "Indoor", "Outdoor", "Outdoor", "Indoor")
df1 <- data.frame(Game_Name = gn, Players = n_p, Game_Type = g_t)
df1
# help("data.frame")

# Creating a null data frame
# created vector with 5 characters
columns= c("serial","names","address","phone","voter_id") 

# pass this vector length to ncol parameter 
# and nrow with 1
myData = data.frame(matrix(nrow=1, ncol = length(columns)))

# assign column names
colnames(myData) = columns

# display
print(myData)


# Creating a list
listB <- list(
  Vector1 = cVec2,
  Vector2 = nVec1,
  Vector3 = Lvec2,
  matdata = xmat,
  arraydata = arrayA,
  framedata = df1
)
listB
