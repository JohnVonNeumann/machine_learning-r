# Data Preprocessing
# No need to import libs as RStudio largely takes care of that for us.

# Import the datasets
dataset = read.csv('Data.csv')

# Taking care of missing data
# Cleaning Age column
dataset$Age = ifelse(is.na(dataset$Age), # using dataset var, we target the Age column and cells that are N/A
                     ave(dataset$Age, FUN = function(x) mean(x, na.rm = TRUE)), # we wish to average all N/A cells with a inbuilt mean function
                     dataset$Age) # we apply the changes to the Age column 

# Cleaning Salary column
dataset$Salary = ifelse(is.na(dataset$Salary), #same process as last block, just pertaining to Salary changes
                        ave(dataset$Salary, FUN = function(x) mean(x, na.rm = TRUE)),
                        dataset$Salary)


# Encoding cat data.
# Encode Country column
dataset$Country = factor(dataset$Country,     # factor allows us to simply swap cat for num
                         levels = c('France', 'Spain', 'Germany'), # c creates a vector, it is built into r, here we create a vector with our feature names
                         labels = c(1, 2, 3)) # and we align the c cat vector with the num data we wish 

#Encode Purchased column
dataset$Purchased = factor(dataset$Purchased, # same as previous block
                           levels = c('No', 'Yes'),
                           labels = c(0, 1))

#Splitting dataset for use in testing and training
# Installed caTools package
library(caTools)
set.seed(123)
split = sample.split( dataset$Purchased, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE) # split = true pertains to the 0.8 figure we param'd above
test_set = subset(dataset, split == FALSE) # split = false indicates we wish to allocate the remaining 20% of data to test

#Feature Scaling
training_set[, 2:3] = scale(training_set[, 2:3]) # in a prev iteration, we recieved an error for lack of num data, 
test_set[, 2:3] = scale(test_set[, 2:3])         #so we scale the training + test purchased data (indep var we wish to know more about)
                                                 #against colums 2-3, our salary and age values that need to be brought in line in order to produce results with