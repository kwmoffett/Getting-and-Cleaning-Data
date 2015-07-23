The purpose of this file is to state what the R script (run_analysis.R) does. All of the steps for this project were performed using this script. This file is organized into
several parts.

## Part One: Load Required Packages to Execute This Code

This portion of the code loads the packages required to properly execute this code.There are three required R packages to execute this code: plyr, dplyr, and reshape2.
If you do not have these packages installed, please install them prior to running this code using the install.packages() command in R. A failure to install these packages will
most likely result in the code not executing correctly.

## Part Two: Join the Training and Test Datasets (Question One)

This portion of the code combines the training and test databases into one larger dataset. This code will append the training dataset to the test dataset. This was done
because of the research design where 70% of the data exists within the training data, and the remaining 30% is in the test data (Readme file in the Data *.zip file).
Thus, these datasets will ultimately be appended to generate the larger dataset.

Before working on each of the datsets separately prior to combining, I loaded the column names into R.

### Test Dataset

This portion of code loads the test dataset, the test labels associated with this dataset and finally, the subject identifiers associated with this dataset. Each of these are loaded as
separate data frames. Once these data frames are loaded, the labels and subject identifiers were renamed as "Activity" and "Subject," respectively. This is done to generate descriptive 
subheadings for the three data frames (test, test labels and subject identifiers). After doing this, I applied the column names to the test data. Finally, I appended the test labels
and test subject identifiers using the column bind command.

### Training Dataset

This portion of code loads the training dataset, the training labels associated with this dataset and finally, the subject identifiers associated with this dataset. Each of these are 
loaded as separate data frames. Once these data frames are loaded, the labels and subject identifiers were renamed as "Activity" and "Subject," respectively. This is done to generate 
descriptive subheadings for the three data frames (training, training labels and subject identifiers). After doing this, I applied the column names to the test data. Finally, I 
appended the training labels and training subject identifiers using the column bind command.

### Combining the Datasets

Now that the test and training datasets are in a place to where they can be combined, I did so. I used the row binding command (rbind) in R to do this. This command appended the
training dataset to the merged data, adn created a new data frame called "mergeddata."

## Part Three: Extract the Measurements on the Mean and Standard Deviation for Each Measurement (Question Two)

This portion extracts the measurements on the mean, standard deviation, the subject identifiers, and the activity from the merged data. This allows us to obtain a reduced dataset from
the full-sized, merged dataset. To do this, the "grep" command was used to get the mean, standard deviation, subject, and activity columns from the merged data. Each of these were saved
as separate data frames (meansdata, stdevdata, Subject, and Activity). Then, each of these four data frames were combined using a series of column bind commands (cbind) to combine
two of them at a time. The final, resulting data frame was named "reduceddata."

## Part Four: Use Descriptive Activity Names to Name the Activities in the Data Set (Question Three)

This part of the code does two things: 1) reads in the activity labels that were provided in the package containing the dataset as a data frame; and 2) Changes the object type of the
Activity Variable in the reduced dataset from being a numeric variable to being a factor. In changing the object type, the factor names provided in the activity labels data frame
were applied to the Activity variable in the reduced dataset.

## Part Five: Create a Second, Tidy Dataset with the Average of Each Variable for Each Activity and Subject (Question Five)

This last section creates a second, tidy dataset that contains the average of each mean and standard deviation variable for each activity and subject. To do this, I first melted the
dataset to reorganize it by activity and subject. Then, I recast the dataset to generate the mean for each activity (and the mean for the standard deviations), and outputted this
cast data as a dataframe called "tidydata." Finally, I wrote tidydata into a test file entitled "tidy_data.txt." This generates the tidy dataset that was requested in this assignment.

## Final Notes (Question Four)

The variable names that were extracted from the source data were largely retained, with two exceptions: Activity and Subject. These were named as such in earlier portions of the dataset.