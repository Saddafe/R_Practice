# Locating a directory where data and code files are stored 
setwd("D:/Personal/Research/Team Beta/R Programming/Trail Part")

# Loading necessary libraries for data processing and analysis
library(readr)
library(dplyr)

# Importing a csv file into R working environment
df <- read.csv("Data-1.csv", header=TRUE)
head(df)

# Checking variable properties and first few data points
glimpse(df)

# Defining appropriate measurement scale for "sex" 
# "pain" and "marital"
df <- df %>%
  mutate(
    sexNominal = factor(
      x = sex,
      levels = c(1,2),
      labels = c('Male', "Female")
    ),
    painOrdinal = factor(
      x = pain,
      levels = c(1, 2, 3),
      labels = c("No Pain", "Mild Pain", "Severe Pain"),
      ordered = TRUE
    ),
    maritalNominal = factor(
      x = marital,
      levels = c(1,2,3,4),
      labels = c("Married", "Divorced", "Widow", "Never Married")
    )
  )

# Defining appropriate measurement scale for painYn variable
df <- df %>%
  mutate(
    painYn = as.logical(painYn)
  )

write.csv(df, file = "Data-1 Processed.csv")
head(df)

# Checking if we can perform mathematical operation on nominal and
# ordinal variables. To do so we will use mean() function
mean(df$sex)
mean(df$sexNominal)

# Creating a table of descriptive statistics

library(table1)

table1(~sex+sexNominal+age+pain+painOrdinal+painYn+maritalNominal, 
       data = df)
# Create separate column for each clusters
table1(~sex+sexNominal+age+pain+painOrdinal+painYn+maritalNominal
       | clusterID, 
       data = df)


