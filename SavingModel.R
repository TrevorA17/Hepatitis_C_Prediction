# Create a directory named "models" if it doesn't exist
if (!file.exists("./models")) {
  dir.create("./models")
}

# Saving the LDA model
saveRDS(lda_model, file = "./models/lda_model.rds")

# Load the saved LDA model
loaded_lda_model <- readRDS("./models/lda_model.rds")

# Prepare new data for prediction
new_data <- data.frame(
  Age = 32,
  Sex = "m",
  ALB = 38.5,
  ALP = 52.5,
  ALT = 7.7,
  AST = 22.1,
  BIL = 7.5,
  CHE = 6.93,
  CHOL = 3.23,
  CREA = 106,
  GGT = 12.1,
  PROT = 69
)

# Use the loaded model to make predictions for new data
predictions_loaded_model <- predict(loaded_lda_model, newdata = new_data)

# Print predictions
print(predictions_loaded_model)
