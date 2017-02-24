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