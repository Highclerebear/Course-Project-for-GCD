# Getting and Cleaning Data

## Course Project

This file describes how you should use the script provided.

##The script performs the following actions:

- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement.
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names.
- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##How to use this script:
Copy this script in your working directory.
Run the script

Note: This will automatically download & extract the data set and perform the operations mentioned above. The output will be a .txt file called "tidydata"
It uses the packages plyr and data.table. Please ensure that you have these packages installed
