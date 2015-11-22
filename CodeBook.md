---
title: "CodeBook"
author: "Ahmed Amoumene"
date: "November 21, 2015"
output: html_document
---

Code Book

Subject and Activity

These are the variables  used in the solution :

    Subject: the integer subject ID.
    Activity: the string activity name:
    WALKING
    WALKING_UPSTAIRS
    WALKING_DOWNSTAIRS
    SITTING
    STANDING
    LAYING


Soource files

    features.txt: Names of features.
    activity_labels.txt: Names and IDs for each of the  activities.
    X_train.txt:observations of the features.
    X_test.txt:observations of the  features.
    y_train.txt: ID of the activity.
    y_test.txt:ID of the activity.
    subject_train.txt: ID of the volunteer.
    subject_test.txt:  ID of the volunteer.
    
    
Feature Selection 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'

  
Target data table used in run_analysis.R

    subjectTrain = subject_train.txt
    subjectTest = subject_test.txt
    xTrainData = X_train.txt
    yTrainData = y_train.txt
    xTestData = X_test.txt
    yTestData = y_test.txt
    trainTestData contain the merged data from testData and tainData 
    testData contain merged from subjectTest, yTestData,xTestData
    trainData contain merged data from  subjectTrain,yTrainData,xTrainData
    meanColumns: Only columns with the measurements on the mean and standard deviation for each measurement
    trainTestData: Contain a cleaned data without the uncessary columns
    meltedData:Independent tidy data set with the average of each variable for each activity and each subject
    tidyData: the metledData with the average of each variable for each activity and each subjec

Solution:
    Merged the training and the test sets to create one data set.
    Extracted only the measurements on the mean and standard deviation for each measurement. 
    Useed descriptive activity names to name the activities in the data set and appropriately labeled the data set     with descriptive variable names. 
    Created a tidy data set, tidyData.csv with the average of each variable for each activity and each subject 

Notes:
    data from the Inertial Signals were not used
    Before running the script your should download and unzip the files into a dierctory called          
    "Getting-and-cleaning-data"

    
