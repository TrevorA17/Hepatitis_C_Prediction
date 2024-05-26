# Load necessary libraries
library(plumber)

# Load the saved LDA model
loaded_lda_model <- readRDS("./models/lda_model.rds")

#* @apiTitle Hepatitis Prediction Model API
#* @apiDescription Used to predict Hepatitis using Linear Discriminant Analysis (LDA).

#* @post /predict_hepatitis
#* @param Age Numeric: Age
#* @param Sex Factor: Sex (m/f)
#* @param ALB Numeric: ALB
#* @param ALP Numeric: ALP
#* @param ALT Numeric: ALT
#* @param AST Numeric: AST
#* @param BIL Numeric: BIL
#* @param CHE Numeric: CHE
#* @param CHOL Numeric: CHOL
#* @param CREA Numeric: CREA
#* @param GGT Numeric: GGT
#* @param PROT Numeric: PROT
#* @serializer unboxedJSON
predict_hepatitis <- function(Age, Sex, ALB, ALP, ALT, AST, BIL, CHE, CHOL, CREA, GGT, PROT) {
  # Prepare the input data
  new_data <- data.frame(
    Age = as.numeric(Age),
    Sex = as.factor(Sex),
    ALB = as.numeric(ALB),
    ALP = as.numeric(ALP),
    ALT = as.numeric(ALT),
    AST = as.numeric(AST),
    BIL = as.numeric(BIL),
    CHE = as.numeric(CHE),
    CHOL = as.numeric(CHOL),
    CREA = as.numeric(CREA),
    GGT = as.numeric(GGT),
    PROT = as.numeric(PROT)
  )
  
  # Use the loaded model to make predictions
  prediction <- predict(loaded_lda_model, newdata = new_data)
  
  # Return the prediction
  return(as.character(prediction))
}
