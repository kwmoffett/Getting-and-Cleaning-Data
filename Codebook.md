# Codebook

This is the codebook for the dataset that was generated through the run_analysis.R script. This codebook proceeds in several parts.

# Part One: Introduction

This dataset is ultimately derived from the Human Activity Recognition using Smartphopnes Dataset (version 1.0). This dataset was
acquired from:

1) [Original Data Description-University of California, Irvine](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

This link contains a complete description of the data on which this is based and the process by which it was generated that goes beyond what is discussed in this document.

2) [Accelerometer Smartphone Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

This link contains a direct link to the dataset that forms the basis for the run_analysis.R script.
The *.zip file that is downloaded needs to be unzipped into the directory that you are going to use to run the run_analysis.R script.

# Part Two: Transformations to the Original Data

The zipped file contains two separate datasets at its core: training and test data. For each of these datasets, the following steps were performed:

1) Read in the data (the "X_train.txt" and "X_test.txt" files);

2) Read in two other data frames associated with the test and train data that give subject identifiers ("subject_test.txt" and "subject_train.txt") and the test (training) labels
("y_test.txt" and "y_train.txt").

3) Renamed the subject identifiers (as "Subject") and test (training) labels (as "Subject").

4) Applied the column names that were contained in "features.txt" to the test and train data.

5) For the testing data: combined the testing data with column names to the subject identifiers and test labels into a single data frame.

6) For the training data: combined the training data with column names to the subject identifiers and training labels into a single data frame.

7) Combined the testing and training data by appending the training data to the test data. These datasets were combined into a new data frame (called mergeddata).

8) Reduced the combined dataset (mergeddata) by extracting the means, standard deviations, subject identifiers, and activity identifiers into a new data frame (called reduceddata).

9) Applied the activity names from "activity_labels.txt" to the activity identifiers in the reduced dataset. More specifically, each numeric code that was formerly in Activity now

corresponds to a text-based name for that activity (example: 1=Walking).

10) Melted the reduced dataset based on activity and subject identifiers.

11) Casted the reduced dataset to summarize the mean for each mean and standard deviation column in the dataset by subject and activity identifiers. Since there were 30 subjects and
six activities, there are 180 observations. More specifically, the unit of analysis is the subject-activity. For example, subject one has six observations: subject one, walking;
subject one, walking upstairs; subject one, walking downstairs; subject one, sitting; subject one, standing; and subject one, laying. This organizational structure is continued for the
other 29 subjects.

12) Wrote this casted dataset to a data set entitled "tidy_data.txt."

# Part Three: Brief Data Generating Process Description

Each of the variables in this dataset were ultimately derived from the data sources listed in the introduction. Each person was asked to perform six activities: walking, walking upstairs, 
walking downstairs, sitting, standing, and laying while wearing a smartphone on his or her waist. While each person did so, the researchers captured, "... 3-axial linear acceleration and
3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually" (UC Irvine Human Activity Recognition Webpage 2015). Then, the
following happened:

	"The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 
	readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration 
	and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of 
	features was obtained by calculating variables from the time and frequency domain" (UC Irvine Human Activity Recognition Webpage 2015).

From here, the researcheres selected features from this database that came from:

	"...the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. 
	Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal 
	was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.
	Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these 
	three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). Finally, a Fast Fourier 
	Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to 
	indicate frequency domain signals)" (Accellerometer Smartphone Dataset Features Description File 2015).

From here, each of these variables had a mean measurement (denoted by -Mean()), with many also having a standard deviation measurement (denoted by -std()). For more information about
the data generating process for this dataset, please refer to the Accelerometer Smartphone Dataset Features Description File (2015) and the UC Irvine Human Activity Recognition
Webpage (2015) referenced at the end of this document.

# Part Four: Variable Description

The variables in this dataset are as follows:

## Variable One: Activity

This variable is a textual description of one of six activities that was undertaken during the experiment: walking, walking upstairs, walking downstairs, sitting, standing, and laying.
In the original dataset, these take on values one through six, respectively.

## Variable Two: Subject

This is a numeric identifier for each subject in the dataset. This ranges from one through 30, as there were thirty subjects in the experiment.

## Variables Three through 48: Means for Varying Quantities in the Dataset.

These are the means for the varying quantities that are measured in the dataset by subject and activity. Please refer to Part Three of this document, the Accelerometer Smartphone Dataset
Features Description  File (2015) and the UC Irvine Human Activity Recognition Webpage (2015) referenced at the end of this document for more specified information about how each were
measured. Below are the mean variable names in this dataset:

 [3] "tBodyAcc-mean()-X"               "tBodyAcc-mean()-Y"              
 [5] "tBodyAcc-mean()-Z"               "tGravityAcc-mean()-X"           
 [7] "tGravityAcc-mean()-Y"            "tGravityAcc-mean()-Z"           
 [9] "tBodyAccJerk-mean()-X"           "tBodyAccJerk-mean()-Y"          
[11] "tBodyAccJerk-mean()-Z"           "tBodyGyro-mean()-X"             
[13] "tBodyGyro-mean()-Y"              "tBodyGyro-mean()-Z"             
[15] "tBodyGyroJerk-mean()-X"          "tBodyGyroJerk-mean()-Y"         
[17] "tBodyGyroJerk-mean()-Z"          "tBodyAccMag-mean()"             
[19] "tGravityAccMag-mean()"           "tBodyAccJerkMag-mean()"         
[21] "tBodyGyroMag-mean()"             "tBodyGyroJerkMag-mean()"        
[23] "fBodyAcc-mean()-X"               "fBodyAcc-mean()-Y"              
[25] "fBodyAcc-mean()-Z"               "fBodyAcc-meanFreq()-X"          
[27] "fBodyAcc-meanFreq()-Y"           "fBodyAcc-meanFreq()-Z"          
[29] "fBodyAccJerk-mean()-X"           "fBodyAccJerk-mean()-Y"          
[31] "fBodyAccJerk-mean()-Z"           "fBodyAccJerk-meanFreq()-X"      
[33] "fBodyAccJerk-meanFreq()-Y"       "fBodyAccJerk-meanFreq()-Z"      
[35] "fBodyGyro-mean()-X"              "fBodyGyro-mean()-Y"             
[37] "fBodyGyro-mean()-Z"              "fBodyGyro-meanFreq()-X"         
[39] "fBodyGyro-meanFreq()-Y"          "fBodyGyro-meanFreq()-Z"         
[41] "fBodyAccMag-mean()"              "fBodyAccMag-meanFreq()"         
[43] "fBodyBodyAccJerkMag-mean()"      "fBodyBodyAccJerkMag-meanFreq()" 
[45] "fBodyBodyGyroMag-mean()"         "fBodyBodyGyroMag-meanFreq()"    
[47] "fBodyBodyGyroJerkMag-mean()"     "fBodyBodyGyroJerkMag-meanFreq()"


## Variables 49 through 81: Means of Standard Deviations for Varying Quantities in the Dataset.

These are the standard deviations for the varying quantities that are measured in the dataset by subject and activity. Since these are standard deviations of varying quantities in the
original dataset, there is no easily relatable measurement system that can be applied here. Below are the mean of the standard deviation variable names in this dataset:

[49] "tBodyAcc-std()-X"                "tBodyAcc-std()-Y"               
[51] "tBodyAcc-std()-Z"                "tGravityAcc-std()-X"            
[53] "tGravityAcc-std()-Y"             "tGravityAcc-std()-Z"            
[55] "tBodyAccJerk-std()-X"            "tBodyAccJerk-std()-Y"           
[57] "tBodyAccJerk-std()-Z"            "tBodyGyro-std()-X"              
[59] "tBodyGyro-std()-Y"               "tBodyGyro-std()-Z"              
[61] "tBodyGyroJerk-std()-X"           "tBodyGyroJerk-std()-Y"          
[63] "tBodyGyroJerk-std()-Z"           "tBodyAccMag-std()"              
[65] "tGravityAccMag-std()"            "tBodyAccJerkMag-std()"          
[67] "tBodyGyroMag-std()"              "tBodyGyroJerkMag-std()"         
[69] "fBodyAcc-std()-X"                "fBodyAcc-std()-Y"               
[71] "fBodyAcc-std()-Z"                "fBodyAccJerk-std()-X"           
[73] "fBodyAccJerk-std()-Y"            "fBodyAccJerk-std()-Z"           
[75] "fBodyGyro-std()-X"               "fBodyGyro-std()-Y"              
[77] "fBodyGyro-std()-Z"               "fBodyAccMag-std()"              
[79] "fBodyBodyAccJerkMag-std()"       "fBodyBodyGyroMag-std()"         
[81] "fBodyBodyGyroJerkMag-std()"

# Part Five: Sources

Accelerometer Accelerometer Smartphone Dataset Features Description File 2015. Data Description Document that Describes the Process by which the Data in the Original Dataset were
	Collected. Available as Part of the Accelerometer Smartphone Dataset at (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). Accessed on
	July 23, 2015.

UC Irvine Human Activity Recognition Webpage 2015. Description of the Accelerometer Smartphone Dataset and Download Page. Available at
	(http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). Accessed on July 23, 2015.