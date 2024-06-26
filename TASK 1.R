# KHUSHI SANWAL

# TASK - 1

# Load the dataset from the given URL

library(readxl)
data <- read_excel("C:\\Users\\ks\\Documents\\SPARKS\\student_scores - student_scores.xlsx")
View(data)

# Display the first few rows of the dataset

head(data)

# Plot the data to visualize the relationship between hours and scores

plot(data$Hours, data$Scores, main="Hours vs Percentage", xlab="Hours Studied",
     ylab="Percentage Score", pch=19, col="blue")
abline(lm(data$Scores~data$Hours,data = data),col="brown")

# Define the feature and target variables

x <- data$Hours
y <- data$Scores

# Split the data manually into training (80%) and testing sets (20%)

set.seed(123)  
sample_size <- floor(0.8 * length(x))
train_indices <- sample(seq_len(length(x)), size = sample_size)
train_x <- x[train_indices]
train_y <- y[train_indices]
test_x <- x[-train_indices]
test_y <- y[-train_indices]

# Train the linear regression model

model <- lm(train_y ~ train_x)

# Print the summary of the model

summary(model)

# Make predictions on the test set

predictions <- predict(model, newdata=data.frame(train_x=test_x))

# Compare the actual and predicted values

results <- data.frame(Actual=test_y, Predicted=predictions)
print(results)

# Calculate the Mean Absolute Error

mae <- mean(abs(results$Actual - results$Predicted))
print(paste("Mean Absolute Error:", mae))

# Plot the regression line along with the data points

plot(data$Hours, data$Scores, main="Hours vs Percentage", xlab="Hours Studied", 
     ylab="Percentage Score", pch=19, col="blue")
abline(model, col="red")

# Predict the score for 9.25 hours/day

hours <- data.frame(train_x=9.25)
predicted_score <- predict(model, hours)
print(paste("Predicted score for 9.25 hours/day:", predicted_score))
