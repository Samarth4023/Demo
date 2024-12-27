# R script for data visualization and linear regression on a dataset
# Loading necessary libraries
library(ggplot2)

# Create a sample dataset
set.seed(123)
data <- data.frame(
  advertising = runif(100, min = 50, max = 300),
  sales = rnorm(100, mean = 100, sd = 15)
)

# Visualize the data
ggplot(data, aes(x = advertising, y = sales)) +
  geom_point(color = 'blue') +
  geom_smooth(method = 'lm', se = FALSE, color = 'red') +
  labs(title = "Advertising vs Sales", x = "Advertising Expenditure", y = "Sales") +
  theme_minimal()

# Linear regression
model <- lm(sales ~ advertising, data = data)
summary(model)

# Predict sales for new data
new_data <- data.frame(advertising = c(150, 200, 250))
predictions <- predict(model, newdata = new_data)
print(predictions)
