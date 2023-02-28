# Creating function
fcv <- function(n){
  avg <- mean(n, na.rm = T)
  std <- sd(n, na.rm = T)
  cv <- std/avg
  return(c(avg, std, cv))
}
x <- c(2:5, rep(7,3), seq(7,15,2))
y <- c(2, 4, 6, "a", "b", "c")
fcv(n = x)

fcv <- function(n){
  avg <- mean(n, na.rm = T)
  med <- median(n, na.rm = T)
  std <- sd(n, na.rm = T)
  cv <- std/avg
  central <- c(mean = avg, median = med)
  return(list(central.tendency = central, std, cv))
}
fcv(n = x)
fcv(n = y)

# Applying conditionals on function
fcv <- function(n){
  if(!is.numeric(n))
    stop("Inputs should be numeric")
  avg <- mean(n, na.rm = T)
  std <- sd(n, na.rm = T)
  cv <- std/avg
  return(c(avg, std, cv))
}
fcv(n = x)
fcv(n = y)

fDescriptive_1 <- function(n, type = "classical"){
  if(!is.numeric(n))
    stop("Inputs should be numeric")
  
  type <- tolower(type)
  avg <- mean(n, na.rm = T)
  med <- median(n, na.rm = T)
  std <- sd(n, na.rm = T)
  medad <- mad(n,na.rm = T)  #mad = Mean Absolute Deviation
  out1 <- c(mean = avg, sd = std)
  out2 <- c(median = med, mad = medad)
  
  if(type == "classical")
    return(out1)
  else if(type == "robust")
    return(out2)
}
  
fDescriptive_1(n=x, type = "Classical")
fDescriptive_1(n=x, type = "ROBUST")



fDescriptive_2 <- function(n, type = ""){
  
  type <- tolower(type)
  if(type == "classical"){
    avg <- mean(n, na.rm = T)
    std <- sd(n, na.rm = T)
    out1 <- c(mean = avg, sd = std)
    return(out1)
  }
  else if(type == "robust"){
    med <- median(n, na.rm = T)
    medad <- mad(n, na.rm = T)
    out2 <- c(median = med, mad = medad)
    return(out2)
  }
}

set.seed(4122)
y <- rnorm(100)
fDescriptive_2(n = y, type = "ClaSSical")
fDescriptive_2(n = y, type = "robust")


