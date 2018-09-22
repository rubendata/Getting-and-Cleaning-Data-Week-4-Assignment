title: "README"

## R Markdown
Getting and Cleaning Data Course Project
Assignent Week 4

In this repo you will find my submission for the Course Project for the Getting and Cleaning Data Coursera course Week 4 Assignment.
1. download the relevant files and unzip it to your R working directory
2. download the R file run_analysis.R into your R working dir.
3. Excecute the run_analysis.R file to generate a tidy data file



About the data
The data represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Here are the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Code explaination
1. The code combines test and training data set and selects some relevant variables (mean and standard deviation).
2. Than the average of these varaibles is calculated for each subject and activity performed.


New dataset
The result of the calculation is saved into a new file.
Keep in mind: Each row represents a mean of several measurements

The code was written based on the instruction of this assignment

The code does the following steps
1. Merge training and test data into one data set
2. Extracts only the measurements on the mean and standard deviation for each measurement
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names
5. From the data set in step 4, creates a second, independent tidy data set

