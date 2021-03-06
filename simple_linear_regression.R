# Simple Linear Regression

# Import the datasets
dataset = read.csv('Salary_Data.csv') # due to only having two columns, no need to select columns

#Splitting dataset for use in testing and training
library(caTools) # we call them explicitly to ensure that should script be run elsewhere, it will pull what it needs
set.seed(123)
split = sample.split( dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE) # split = true pertains to the 2/3 figure we param'd above
test_set = subset(dataset, split == FALSE) # split = false indicates we wish to allocate the remaining 1/3 of data to test

#The library we are using takes care of scaling for us

#Fitting Simple Linear Regression to the Training Set, call summary(regressor) for num info
regressor = lm(formula = Salary ~ YearsExperience, #lm is linearmodels method
               data = training_set) #trained on training_set

# Predicting the test set results
# my try = test_set_results = predict.lm(regressor, newdata = test_set)
y_pred = predict(regressor, newdata = test_set)

# Visualising training set results, run: install.packages('ggplot2')
library(ggplot2) # we call them explicitly to ensure that should script be run elsewhere, it will pull what it needs
ggplot() +
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary),
             colour = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            colour = 'blue') +
  ggtitle('Salary vs Experience (Training Set)') +
  xlab('Years of Experience') +
  ylab('Salary')

# Visualising test set results
library(ggplot2) # we call them explicitly to ensure that should script be run elsewhere, it will pull what it needs
ggplot() +
  geom_point(aes(x = test_set$YearsExperience, y = test_set$Salary),
             colour = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            colour = 'blue') +
  ggtitle('Salary vs Experience (Test Set)') +
  xlab('Years of Experience') +
  ylab('Salary')