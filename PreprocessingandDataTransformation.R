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

# Check for missing values in the dataset
missing_values <- colSums(is.na(hepatitis_data))

# Print variables with missing values and their counts
print(missing_values[missing_values > 0])

# Display the total count of missing values in the dataset
total_missing <- sum(missing_values)
cat("Total missing values in the dataset:", total_missing, "\n")

# Remove rows with missing values
hepatitis_data_clean <- na.omit(hepatitis_data)

# Display the dimensions of the cleaned dataset
cat("Dimensions of the cleaned dataset:", nrow(hepatitis_data_clean), "rows and", ncol(hepatitis_data_clean), "columns.\n")

