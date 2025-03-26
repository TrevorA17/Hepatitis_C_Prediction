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

# Correlation matrix
cor_matrix <- cor(hepatitis_data[, sapply(hepatitis_data, is.numeric)])
cor_matrix


# Perform ANOVA for 'Category' against numerical variables
anova_results <- lapply(hepatitis_data[, sapply(hepatitis_data, is.numeric)], 
                        function(x) {
                          aov_out <- aov(x ~ Category, data = hepatitis_data)
                          return(summary(aov_out))
                        })

# Display ANOVA results
names(anova_results) <- colnames(hepatitis_data)[sapply(hepatitis_data, is.numeric)]
anova_results

library(ggplot2)
library(GGally)

# Histogram for Age
ggplot(hepatitis_data, aes(x = Age)) +
  geom_histogram(binwidth = 5, fill = "skyblue", color = "black") +
  labs(title = "Histogram of Age", x = "Age", y = "Frequency")

# Boxplot for Age by Category
ggplot(hepatitis_data, aes(x = Category, y = Age, fill = Category)) +
  geom_boxplot() +
  labs(title = "Boxplot of Age by Category", x = "Category", y = "Age")

# Density plot for AST
ggplot(hepatitis_data, aes(x = AST)) +
  geom_density(fill = "skyblue", color = "black") +
  labs(title = "Density Plot of AST", x = "AST", y = "Density")

# Pairwise scatterplot matrix for numerical variables
pairs(hepatitis_data[, sapply(hepatitis_data, is.numeric)])

# Scatterplot of Age vs. AST colored by Category
ggplot(hepatitis_data, aes(x = Age, y = AST, color = Category)) +
  geom_point() +
  labs(title = "Scatterplot of Age vs. AST", x = "Age", y = "AST")

# Scatterplot matrix for numerical variables, colored by Category
ggpairs(hepatitis_data, columns = c("Age", "AST", "ALT", "BIL", "CREA"),
        aes(color = Category))

# Boxplot for Age
boxplot(hepatitis_data$Age)

# Histogram for Age
hist(hepatitis_data$Age)

# Scatterplot matrix for numerical variables
pairs(hepatitis_data[, sapply(hepatitis_data, is.numeric)])
