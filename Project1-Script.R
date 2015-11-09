setwd("C:\\Users\\Jerome\\Documents\\R\\1511-04ExploratoryDataAnalytics\\ExData_Plotting1")

unzip("Samsung.zip")

train <- read.table(".\\UCI HAR Dataset\\train\\X_train.txt", sep="", header=F)	# Loads X data
trainy <- read.table(".\\UCI HAR Dataset\\train\\Y_train.txt", sep="", header=F)	# Loads Y
subject_train <- read.table(".\\UCI HAR Dataset\\train\\subject_train.txt", sep="", header=F)	# Loads Subject_train 
train_tot <- data.frame(trainy, subject_train, train)	# merge the y and subject data of train with X data

## all the train data are now merged, but aren't labelled yet
## first creating a "dummy" feactures vector of labels for each of the column
features <- c(1:561)

## Concatenating Y and Subject with features to create a single label vector (char)
header <- c("Activity", "Subject", features)
## Forcing header as column names for train data
colnames(train_tot) <- header

### Same operations for test
test <- read.table(".\\UCI HAR Dataset\\test\\X_test.txt", sep="", header=F)	# Loads X data
testy <- read.table(".\\UCI HAR Dataset\\test\\Y_test.txt", sep="", header=F)	# Loads Y
subject_test <- read.table(".\\UCI HAR Dataset\\test\\subject_test.txt", sep="", header=F)	# Loads Subject_train 
test_tot <- data.frame(testy, subject_test, test)	# merge the y and subject data with X data
## Forcing header as column names for test data
colnames(test_tot) <- header

### Now merging train and test
data <- merge(train_tot, test_tot, )

## Now loading the features to use as real names for columns
features1 <- read.table(".\\UCI HAR Dataset\\features.txt", sep="", header=F)	
features <- as.character(features1[,2])	## factors turned into characters

## rebuilding header vector with real names for columns
header <- c("Activity", "Subject", features)
## renaming columns with final names
colnames(data) <- header

### creating a logical vector identifying which cols are either mean or std
featuresLogic <- grepl("mean", features) | grepl("std", features)
str(featuresLogic)
featuresLogic1 <- vector()
featuresLogic1[1:2] <- TRUE
featuresLogic1[3:563] <- featuresLogic

data.clean <- data[, featuresLogic]
str(data.clean)
write.table(data.clean, "data-clean.txt")

featuresLogic
str(data.clean)

