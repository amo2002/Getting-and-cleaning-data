# load needed library
library(reshape2)

# Set the default dirctory

dir.create(file.path(getwd(), "Getting-and-cleaning-data"))
setwd("~/Getting-and-cleaning-data")

# Load the data
subjectTrain = read.csv("UCI HAR Dataset/train/subject_train.txt", sep="", header=FALSE)

subjectTest = read.csv("UCI HAR Dataset/test/subject_test.txt", sep="", header=FALSE)

# x_train
xTrainData = read.csv("UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE)

# y_train
yTrainData = read.csv("UCI HAR Dataset/train/y_train.txt", sep="", header=FALSE)

# x_test
xTestData = read.csv("UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE)

# y_test
yTestData = read.csv("UCI HAR Dataset/test/y_test.txt", sep="", header=FALSE)

# add column name for subject files
names(subjectTrain) <- "subjectID"

names(subjectTest) <- "subjectID"

# add column names for measurement files
featureNames =read.csv("UCI HAR Dataset/features.txt")
names(xTrainData) <- featureNames$V2
names(xTestData) <- featureNames$V2

# add column name for label files
names(yTrainData) <- "activity"
names(yTestData) <- "activity"

# 1.Merges the training and the test sets to create one data set.

testData <- cbind(subjectTest, yTestData,xTestData)
trainData <- cbind(subjectTrain,yTrainData,xTrainData)
trainTestData <- rbind(trainData, testData)

# 2.Extracts only the measurements on the mean and standard deviation for each measurement. 

meanColumns <- grepl("mean\\(\\)", names(trainTestData)) |  grepl("std\\(\\)", names(trainTestData))

# Keep subjectID ,  activity columns
meanColumns[1:2] <- TRUE

# remove other columns
trainTestData <- trainTestData[, meanColumns]

# 3.Uses descriptive activity names to name the activities in the data set
# 4.Appropriately labels the data set with descriptive variable names. 


trainTestData$activity <- factor(trainTestData$activity, labels=c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))

# 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


# melt the data 
meltedData <- melt(trainTestData, id=c("subjectID","activity"))
tidyData <- dcast(meltedData, subjectID + activity ~ variable, mean)

# write the result as  a.csv file
write.csv(tidyData, "tidyData.csv", row.names=FALSE)

# write the result as text

write.table(tidyData, "tidyData.txt", sep="\t")







