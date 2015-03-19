This file attempts to explain the data, its components i.e it's variables and details the list of steps taken to generate a tidy data set from this main data.

Data Sources:
    Original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
    Original description of the dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Data Collection:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.


List of files in the dataset:


    'README.txt'

    'features_info.txt': Shows information about the variables used on the feature vector.

    'features.txt': List of all features.

    'activity_labels.txt': Links the class labels with their activity name.

    'train/X_train.txt': Training set.

    'train/y_train.txt': Training labels.

    'test/X_test.txt': Test set.
	
		'test/y_test.txt': Test labels.
	
The Process:

The script run_analysis.R reads in each of the data sets - train and test. Using the list of files above, the labels are appropriately applied to both the data sets. Then, these are merged to form a bigger dataset. The acitivity labels are applied so that column specifies which activity it is - eg 'WALKING' or 'STANDING'. Like Activity labels, subjects are also added onto the dataset. A subset of the dataset is chosen such that only the mean and std deviation variables are included. 
The final step calculates the mean of each measure for every subject, for every activity.
