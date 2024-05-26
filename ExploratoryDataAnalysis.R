# Load dataset
hepatitis_data <- read.csv("data/HepatitisCdata.csv", colClasses = c(
  Category = "factor",
  Age = "numeric",
  Sex = "factor",
  ALB = "numeric",
  ALP = "numeric",
  ALT = "numeric",
  AST = "numeric",
  BIL = "numeric",
  CHE = "numeric",
  CHOL = "numeric",
  CREA = "numeric",
  GGT = "numeric",
  PROT = "numeric"
))

# Display the structure of the dataset
str(hepatitis_data)

# View the first few rows of the dataset
head(hepatitis_data)

# View the dataset in a separate viewer window
View(hepatitis_data)

# Frequency of each category
table(hepatitis_data$Category)

# Frequency of each sex
table(hepatitis_data$Sex)

# Mean, median, and mode of ALB
mean_ALB <- mean(hepatitis_data$ALB)
median_ALB <- median(hepatitis_data$ALB)
mode_ALB <- names(sort(-table(hepatitis_data$ALB)))[1]

# Display results
cat("Mean ALB:", mean_ALB, "\n")
cat("Median ALB:", median_ALB, "\n")
cat("Mode ALB:", mode_ALB, "\n")

# Mean of other numerical variables
col_means <- colMeans(hepatitis_data[, sapply(hepatitis_data, is.numeric)])
col_means

# Summary statistics for numerical variables
summary(hepatitis_data[, sapply(hepatitis_data, is.numeric)])

# Boxplot for Age
boxplot(hepatitis_data$Age)

# Histogram for Age
hist(hepatitis_data$Age)

# Correlation matrix
cor_matrix <- cor(hepatitis_data[, sapply(hepatitis_data, is.numeric)])
cor_matrix

# Scatterplot matrix for numerical variables
pairs(hepatitis_data[, sapply(hepatitis_data, is.numeric)])

