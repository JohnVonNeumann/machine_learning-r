# Data Preprocessing
# No need to import libs as RStudio largely takes care of that for us.

# Import the datasets
dataset = read.csv('Data.csv')
dataset = dataset[, 2:3]

#Splitting dataset for use in testing and training
# Installed caTools package
library(caTools)
set.seed(123)
split = sample.split( dataset$Purchased, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE) # split = true pertains to the 0.8 figure we param'd above
test_set = subset(dataset, split == FALSE) # split = false indicates we wish to allocate the remaining 20% of data to test

#Feature Scaling
#training_set[, 2:3] = scale(training_set[, 2:3]) # in a prev iteration, we recieved an error for lack of num data, 
#test_set[, 2:3] = scale(test_set[, 2:3])         #so we scale the training + test purchased data (indep var we wish to know more about)
#against colums 2-3, our salary and age values that need to be brought in line in order to produce results with