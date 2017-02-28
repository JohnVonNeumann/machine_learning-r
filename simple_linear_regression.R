# Simple Linear Regression

# Import the datasets
dataset = read.csv('Salary_Data.csv') # due to only having two columns, no need to select columns

#Splitting dataset for use in testing and training
library(caTools)
set.seed(123)
split = sample.split( dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE) # split = true pertains to the 2/3 figure we param'd above
test_set = subset(dataset, split == FALSE) # split = false indicates we wish to allocate the remaining 1/3 of data to test

#The library we are using takes care of scaling for us

#Fitting Simple Linear Regression to the Training Set
regressor(Salary ~ YearsExperience, data = training_set,
          xlab = "Years Experience",
          ylab = "Salary",
          main = "Years Experience vs Salary (Training Set)"
          )