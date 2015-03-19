
library(data.table)
library(plyr)

if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")

unzip(zipfile="./data/Dataset.zip",exdir="./data")
##Merges the training and the test sets to create one data set.

#setwd("C:\\Users\\pmunde\\Documents\\Coursera Files\\GC Data\\Course Project\\CourseProject")

#Read training data set, labels & subjects
train <- read.table(".\\data\\UCI HAR Dataset\\train\\X_train.txt")

labs_train <- read.table(".\\data\\UCI HAR Dataset\\train\\y_train.txt")

subject_train <- read.table(".\\data\\UCI HAR Dataset\\train\\subject_train.txt")

#Read test data set, labels & subjects

test <- read.table(".\\data\\UCI HAR Dataset\\test\\X_test.txt")

labs_test <- read.table(".\\data\\UCI HAR Dataset\\test\\y_test.txt")

subject_test <- read.table(".\\data\\UCI HAR Dataset\\test\\subject_test.txt")

#Read Activity labels 
act_labels <- read.table(".\\data\\UCI HAR Dataset\\activity_labels.txt")
names(act_labels) <- c("Activity", "Activity_Name")


#Binding test & training data sets
subjects <- rbind(subject_train, subject_test)
names(subjects) <- "Subjects"

new_train <- cbind( labs_train, train)

new_test <- cbind( labs_test, test)

merged_set <- rbind(new_train, new_test)

#Read features
features <- read.table(".\\data\\UCI HAR Dataset\\features.txt")
features <- data.frame(features[,2])
features <- t(features)
features <- c("Activity", features)

names(merged_set) <- features

##Extracts only the measurements on the mean and standard deviation for each measurement. 

select_cols <- features[features %like% "mean" |features %like% "std" |features %like% "Activity"]

merged_set <- merged_set[, select_cols]

##Uses descriptive activity names to name the activities in the data set
merged_set2 <- merge(merged_set, act_labels, by.x = "Activity", by.y = "Activity")

merged_set3 <- merged_set2[,-1]

merged_set4 <- cbind(merged_set3, subjects)

##Appropriately labels the data set with descriptive variable names. 

names(merged_set4)<-gsub("^t", "time", names(merged_set4))
names(merged_set4)<-gsub("^f", "frequency", names(merged_set4))
names(merged_set4)<-gsub("Acc", "Accelerometer", names(merged_set4))
names(merged_set4)<-gsub("Gyro", "Gyroscope", names(merged_set4))
names(merged_set4)<-gsub("Mag", "Magnitude", names(merged_set4))
names(merged_set4)<-gsub("BodyBody", "Body", names(merged_set4))

##From the data set in step 4, creates a second, independent tidy data set with the 
##average of each variable for each activity and each subject.
Data <- aggregate(. ~Subjects + Activity_Name, merged_set4, mean)
Data<-Data[order(Data$Subjects,Data$Activity_Name),]
write.table(Data, file = "tidydata.txt",row.name=FALSE)


