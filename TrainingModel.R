library(caret)

# Set seed for reproducibility
set.seed(123)

# Create indices for train-test split (80% train, 20% test)
train_indices <- createDataPartition(hepatitis_data_clean$Category, p = 0.8, list = FALSE)

# Split the data into training and testing sets
train_data <- hepatitis_data_clean[train_indices, ]
test_data <- hepatitis_data_clean[-train_indices, ]

dim(train_data)
dim(test_data)