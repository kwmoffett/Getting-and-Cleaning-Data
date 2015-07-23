## Script to Perform Course Project for Getting and Cleaning Data

## This Script does all of the following:

## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Change Working Directory to Location of Data Before Executing Script

## Load R Packages that Make the Rest of the Code Execute Correctly

library(plyr)
library(dplyr)
library(reshape2)

## Merge the Training and Test Datasets to Create One Dataset

## Open Column Names Data for Both Datasets

columnnames <- read.table("features.txt", header = FALSE, colClasses = "character")

## Test Dataset

## Load Test Dataset

testdata <- read.table("./test/X_test.txt")

## Load Labels and Subject Identifiers for Test Data

testlabels <- read.table("./test/y_test.txt")
testsubjectids <- read.table("./test/subject_test.txt")

## Rename Labels and Subject Identifiers into Something Descriptive

testlabels <- rename(testlabels, Activity = V1)
testsubjectids <- rename(testsubjectids, Subject = V1)

## Apply Column Names to Test Data

colnames(testdata) <- columnnames$V2

## Join Labels and Subject Identifiers to Test Data

testdata <- cbind(testdata, testlabels)
testdata <- cbind(testdata, testsubjectids)

## Training Dataset

## Load Training Dataset

trainingdata <- read.table("./train/X_train.txt")

## Load Labels and Subject Identifiers for Training Data

traininglabels <- read.table("./train/y_train.txt")
trainingsubjectids <- read.table("./train/subject_train.txt")

## Rename Labels and Subject Identifiers into Something Descriptive

traininglabels <- rename(traininglabels, Activity = V1)
trainingsubjectids <- rename(trainingsubjectids, Subject = V1)

## Apply Column Names to Training Data

colnames(trainingdata) <- columnnames$V2

## Join Labels and Subject Identifiers to Training Data

trainingdata <- cbind(trainingdata, traininglabels)
trainingdata <- cbind(trainingdata, trainingsubjectids)

## Combine Test and Training Data by Appending

mergeddata <- rbind(testdata, trainingdata)

## Reduce Combined Dataset to Labels, Subject Identifiers, Mean, and Standard Deviation Data

## Get Means, Standard Deviation, Subject Identifiers and Activity Labels Columns from Merged Data

meansdata <- mergeddata[ , grep("-mean()", names(mergeddata), value=TRUE)]
stdevdata <- mergeddata[ , grep("-std()", names(mergeddata), value=TRUE)]
Subject <- mergeddata[ , grep("Subject", names(mergeddata), value=TRUE)]
Activity <- mergeddata[ , grep("Activity", names(mergeddata), value=TRUE)]

## Put Selected Columns into the Reduced Combined Dataset

reduceddata <- cbind(meansdata, stdevdata)
reduceddata <- cbind(reduceddata, Subject)
reduceddata <- cbind(reduceddata, Activity)

## Rename Activities to More Descriptive Names in the Combined Dataset

activitynames <- read.table("activity_labels.txt", header = FALSE, colClasses = "character")
reduceddata$Activity <- factor(reduceddata$Activity, levels = activitynames$V1, labels = activitynames$V2)

## Remove Some Data Frames to Reduce Memory Usage and Increase Computational Efficiency

rm(columnnames, testdata, testlabels, testsubjectids, trainingdata, traininglabels, trainingsubjectids, mergeddata, meansdata, stdevdata)

## Extract the Means for Each of the Activity Means and Standard Deviation Columns by Subject ID

melteddata <- melt(reduceddata, id = c("Activity", "Subject"))
tidydata <- dcast(melteddata, Activity + Subject ~ variable, mean) 
write.table(tidydata, file = "tidy_data.txt", row.names=FALSE)
