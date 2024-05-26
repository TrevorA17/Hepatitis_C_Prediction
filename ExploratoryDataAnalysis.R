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
