#Task 1: Merges the training and the test sets to create one data set.
      #load all relevant data
      #load features info
      #f-> only 1 (mean x),2 (mean y),4 (std x),5 (std y) relevant
      features <- read.table("./UCI HAR Dataset/features.txt", header = FALSE, col.names = c("featureid", "featurename"))
      #load test set
      xtest <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE)
      ytest <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE, col.names = "activityid")
      subjecttest <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE, col.names = "subject")
      #get variable names from features to xtest
      names(xtest) <- features$featurename
      #load training set
      xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE)
      ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE, col.names = "activityid")
      subjecttrain <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE, col.names = "subject")
      #get variable names from features to xtrain
      names(xtrain) <- features$featurename
      
      
      #merge with cbind(): xtrain and ytrain, merge xtest and ytest, call them mergetest and mergetrain
      test <- cbind(ytest,subjecttest,xtest)
      train <- cbind(ytrain,subjecttrain,xtrain)
      mergedata <- rbind(test,train)

#Task 2+3: 
      #2. Extracts only the measurements on the mean and standard deviation for each measurement.
      #3. Uses descriptive activity names to name the activities in the data set

      activity <- read.table("./UCI HAR Dataset/activity_labels.txt", header = FALSE, col.names = c("activityid", "activityname"))
      mergedata <- merge(activity, mergedata, by="activityid") #get descriptive col names
      selcol <- grep("std|mean", features$featurename) #find the right cols
      selcol <- c(2,3,selcol+3) #add two cols for subject and activityname
      mergedata <- mergedata[,selcol] #select the right cols


#Task 4: Appropriately labels the data set with descriptive variable names.
      #my interpretation is:
      #we have to reshape the var. names using subset to delete out all useless chars
      #I like to leave the "-" in between to easier see what the var means
      #I suppose to leave the f and t at the beginning of var names
      #everything lowercase
      names(mergedata) <- tolower(sub("\\()-|\\()[1-9]$|\\()$|\\()-[1-9].*", "", names(mergedata),))

#Task 5:From the data set in step 4, creates a second, independent tidy data set
#       with the average of each variable for each activity and each subject.
      
      newtidy <- aggregate(x=mergedata,
                           by=list(mergedata$activityname, mergedata$subject),
                           FUN=mean)                        
      names(newtidy) <- c("activityname","subject",names(newtidy[3:81]))
      newtidy <- newtidy[c(1:2,5:83)]
      write.table(newtidy, "newtidy.txt")
    