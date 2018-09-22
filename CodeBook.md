title: "Codebook"

## R Markdown

Prerequisites:
- download the data and unzip the Folder (UCI HAR Dataset) to your working directory 
- Please use R Script to perform

About the data
The data represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Here are the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

About R script
The R Script file performs 5 steps:

1. Merge training and test data into one data set
1.1. Read all relevant files the get the subject, features, training set, test set
1.2. merge x and y for test and train (cbind)
1.3. add the subject (cbind)to the training and test data (will be needed later)
1.4. Merge (rbind) the train and test data and give them the correct column names (from features)


2. Extracts only the measurements on the mean and standard deviation for each measurement
2.1 get all columns that contain "mean" or "std" for mean and standard deviation

3. Uses descriptive activity names to name the activities in the data set
3.1. read the activity file
3.2. merge activity file with merged file from step 1

4. Appropriately labels the data set with descriptive variable names
4.1. delete characters that make the columns hard to read
4.2. everything to lower cases
4.3. keep the f and t letters at the beginning to destinguish between variables
4.4. keep the "-" in the middle of the var names for better understanding

5. From the data set in step 4, creates a second, independent tidy data set
5.1. Create a second tidy data set (newtidy) that conaints only the average for each subject/activity
5.2. Save the new data set



About variables (A-Z):
activity: contains the activity data from the downloaded file
features: contains the feature names from the downloaded file
mergedata: is the data frame that adds test to train to get one "merged" data set
newtidy: is the data.frame where for each activity and subject the average of each variable is calculated
selcol: gets the right columns (for standard deviation and mean)
subjecttest, subjecttrain: contain the subject data from the files in the train and test folder
test: is the data frame for xtest+ytest+subjecttest
train: is the data frame for xtrain+ytrain+subjecttrain
xtest, xtrain, ytest, ytrain: contain the data from the files in the train and test folder
