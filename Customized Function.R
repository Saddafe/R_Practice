# step-1: name of the function
# step-2: inputs
# step-3: processing
# step-4: output

# Write a function to calculate coefficient of variation for a given numeric input
fcv <- function(nvec){
  avg <- mean(nvec)
  std <- sd(nvec)
  cv <- std/avg
  return(cv)
}
# Create an example vector "x" and compute cv using the above function
x <- c(2:5, rep(7,3), seq(7,15,2))
fcv(nvec = x)

# Create a new numeric vector "y" with one missing value
# compute cv using the function that has been written, can comment on the output
y <- c(2:5, rep(7,3), seq(7,15,2), NA)

fcv(nvec = y)
# Answer1: Usually we got the output NA because statistical operation  by default in R can't be executed if there is a missing value in the vector. But if we use na.rm = TRUE (that means remove missing value) in the command of mean & sd than we may get the required result.
fcv <- function(nvec){
  avg <- mean(nvec, na.rm = TRUE)
  std <- sd(nvec, na.rm = TRUE)
  cv <- std/avg
  return(cv)
}
fcv(nvec = y)

# Now we will modify the return part of the function and see how it is behave with same vector x
fcv <- function(nvec){
  avg <- mean(nvec)
  std <- sd(nvec)
  cv <- std/avg
  return(avg)
}
fcv(nvec = x)
# Answer2: That means we will get the mean value of the vector x. This implies that the command we use in return() in a function we will get the required result of this exact variable.However there may be other command in the function.

# Modify return statement further to take three output as a vector
fcv <- function(nvec1){
  avg <- mean(nvec)
  std <- sd(nvec)
  cv <- std/avg
  return(c(avg, std, cv))
}
fcv(nvec = x)
# Answers3: I think there is not a big problem in the output. For combined output it's work like a vector. And we know that a vector only contains one type of data. So there is no chance of being a mixed data type.

# Return the output as a named vector
fcv <- function(nvec){
  avg <- mean(nvec)
  std <- sd(nvec)
  cv <- std/avg
  return(c(mean = avg, sd = std, cv = cv))
}
fcv(nvec = x)

# Return the output as a data frame
fcv <- function(nvec){
  avg <- mean(nvec)
  std <- sd(nvec)
  cv <- std/avg
  return(data.frame(mean = avg, sd = std, cv = cv))
}

df1 <- fcv(nvec = x)
df1

#Return the output as a list
fcv <- function(nvec){
  avg <- mean(nvec)
  std <- sd(nvec)
  cv <- std/avg
  return(list(mean = avg, sd = std, cv = cv))
}

listA <- fcv(nvec = x)
listA

# Adding more rows in the data frame
fcv <- function(nvec1, nvec2, nvec3){
  avg1 <- mean(nvec1)
  std1 <- sd(nvec1)
  cv1 <- std1/avg1
  avg2 <- mean(nvec2)
  std2 <- sd(nvec2)
  cv2 <- std2/avg2
  avg3 <- mean(nvec3)
  std3 <- sd(nvec3)
  cv3 <- std3/avg3
  return(data.frame(mean = c(avg1,avg2,avg3), sd = c(std1,std2,std3), cv = c(cv1,cv2,cv3)))
}

x <- c(2:5, rep(7,3), seq(7,15,2))
y <- c(2,3,4,5)
z <- c(30,32,44)
df1 <- fcv(nvec1 = x, nvec2 = y, nvec3 = z)
df1
