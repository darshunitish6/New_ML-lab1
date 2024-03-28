# Load necessary libraries
library(caret)
library(dplyr)

# Read data from the Github link
file_path <- "C:/Users/MSI/OneDrive/Desktop/ML/oulad-students.csv"
data <- read.csv(file_path)

# Assuming 'data' is your data frame
subset_data <- data[, c("id_student", "date_registration", "module_presentation_length", "studied_credits", "num_of_prev_attempts", "final_result")]

# Describe the variables
summary(subset_data)

# View the first few rows of the data
head(subset_data)

# Remove rows with missing values
subset_data <- na.omit(subset_data)

# Convert categorical variables to factors
subset_data$final_result <- as.factor(subset_data$final_result)
# Ensure other categorical variables are already factors
# If not, convert them to factors as needed

# Split the data into training and testing sets (80% training, 20% testing)
set.seed(120) # For reproducibility
train_index <- createDataPartition(subset_data$final_result, p = 0.8, list = FALSE)
train_data <- subset_data[train_index, ]
test_data <- subset_data[-train_index, ]

# Train the classification model (logistic regression)
model <- glm(final_result ~ ., data = train_data, family = binomial)

# Make predictions on the test data
predictions <- predict(model, newdata = test_data, type = "response")
# Ensure predicted classes have the same levels as test data
predicted_classes <- factor(predicted_classes, levels = levels(test_data$final_result))

# Convert predicted classes to factor with the same levels as test_data$final_result
predicted_classes <- factor(predicted_classes, levels = levels(test_data$final_result))

# Evaluate the model
confusionMatrix(predicted_classes, test_data$final_result)
# Adjust the threshold as needed

# Evaluate the model
confusionMatrix(predicted_classes, test_data$final_result)



