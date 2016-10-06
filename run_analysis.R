#########################################################
# Project "Getting and Cleaning Data; Course 3, Coursera
#########################################################

# this script and additional information are available on:
# www.github.com/Maddocent/Getting_Cleaning_Data

# dataset can be downloaded from:
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# see additional information on this dataset the README.md  and the 
# CodeBook.md document in the repository in the github repo above.

#date: January 2016
# Author: Dr. Marc A.T. Teunis

# code adapted from: github.com/sudar

#################################################
# STEP 1: Installing packages used in this script
#################################################

# If required packages are not present then install them.
# code from https://class.coursera.org/getdata-008/forum/thread?thread_id=247#post-1074
if("dplyr" %in% rownames(installed.packages()) == FALSE) {install.packages("dplyr")};library(dplyr)
if("tidyr" %in% rownames(installed.packages()) == FALSE) {install.packages("tidyr")};library(tidyr)
if("curl" %in% rownames(installed.packages()) == FALSE) {install.packages("curl")};library(tidyr)
if("gdata" %in% rownames(installed.packages()) == FALSE) {install.packages("gdata")};library(tidyr)

library(curl)
library(tidyr)
library(dplyr)
library(gdata)

############################################
# Step 2: Getting the Data
############################################

# If the dataset is not present in the current working directory then download it
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if (!file.exists("UCI HAR Dataset")) {
  if (!file.exists("UCI_data")) {
    dir.create("UCI_data")
  }
  download.file(fileUrl, destfile="UCI_data/har.zip", method="libcurl")
  unzip("UCI_data/har.zip", exdir = ".")
}

# the downloaded files should appear in your working directory in a 
# directory called "UCI HAR Dataset"

#########################################################################
# Step 3 - Merging the the training and the test sets to create one data set.
#########################################################################

# loading the training dataset
data_train_features <- read.table("UCI HAR Dataset//train/X_train.txt", comment.char="")
data_train_subjects <- read.table("UCI HAR Dataset//train/subject_train.txt", 
                                  col.names=c("Subject"))
data_train_activity <- read.table("UCI HAR Dataset/train//y_train.txt", 
                                  col.names=c("Activity"))

#combining the train datasets
train_data <- cbind(data_train_subjects, data_train_activity, data_train_features)

# loading the test dataset
data_test_features <- read.table("UCI HAR Dataset//test/X_test.txt", comment.char="")
data_test_subjects <- read.table("UCI HAR Dataset/test/subject_test.txt", 
                                 col.names=c("Subject"))
data_test_activity <- read.table("UCI HAR Dataset/test//y_test.txt", 
                                 col.names=c("Activity"))

test_data <- cbind(data_test_subjects, data_test_activity, data_test_features)

# rowbind both train and test data
all_data <- rbind(train_data, test_data)


###########################################################################
# Step 4 - Extracting only the measurements with mean and standard deviation 
#for each measurement.
##########################################################################
# read features
variables_list <- read.table("UCI HAR Dataset//features.txt", 
                           col.names = c("VarID", "VarName"))
variables <- c(as.vector(variables_list[, "VarName"]))

# creating the independent variables 
independentVars <- c("Subject", "Activity")

# creating a list of all variables
allVarNames <- c(independentVars, variables) 
allVarNames

# filtering only features that has mean or std in the name and 
# including the independent vars
selected_vars_ids <- grepl("Subject|Activity|mean|std", allVarNames) & 
  !grepl("meanFreq", allVarNames)
selected_data = all_data[, selected_vars_ids]

names(selected_data)
selected_vars_ids
#################################################################
# Step 5 - Uses descriptive activity names to name the activities 
# in the data set
#################################################################
# reading the txt file that contains the activities and the labels
activities <- read.table("UCI HAR Dataset//activity_labels.txt") 
           
# changing the names of the "activities" data.frame
names(activities) <- c("ActivityID", "ActivityName")

# a for-loop that takes the "ActivityID" and replaces it for the associated
# new label "ActivityName" 
for (i in 1:nrow(activities)) {
  selected_data$Activity[activities$ActivityID == activities[i, 
          "ActivityID"]] <- as.character(activities[i, "ActivityName"])
}

#############################################################################
# step 6 - Appropriately labelling of variable names of the 
# data set with descriptive variable names.
############################################################################
# making the feature names more descriptive
# creating a vector that contains only the variable names for 
# "selectedvars_ids == TRUE
selected_vars_names <- allVarNames[selected_vars_ids]

#substitutng the old variable names for new more descriptive names
# the details of the feature descriptions can  ben found in the file:
# "

selected_vars_names <- gsub("\\(\\)", "", selected_vars_names)
selected_vars_names <- gsub("Acc", "-acceleration", selected_vars_names)
selected_vars_names <- gsub("Mag", "-Magnitude", selected_vars_names)
selected_vars_names <- gsub("^t(.*)$", "\\1-time", selected_vars_names)
selected_vars_names <- gsub("^f(.*)$", "\\1-frequency", selected_vars_names)
selected_vars_names <- gsub("(Jerk|Gyro)", "-\\1", selected_vars_names)
selected_vars_names <- gsub("BodyBody", "Body", selected_vars_names)
selected_vars_names <- tolower(selected_vars_names)

#checking the filered feature names
selected_vars_names

# assigning new names to all variables: 
names(selected_data) <- selected_vars_names

# changing the class of "selected_data" 
selected_data <- tbl_df(selected_data)

# changing the type of the variables:
selected_data$subject <- as.factor(selected_data$subject)
selected_data$activity <- as.factor(selected_data$activity)

# checking the filtered data.frame
names(selected_data)
str(selected_data)
head(selected_data)
print(selected_data)

###########################################################
# step 7 - From the data set in step 4, creates a second, 
#independent tidy data set with the average of each variable 
#for each activity and each subject.
###########################################################

tidy_data <- tbl_df(selected_data) %>% 
  group_by(subject, activity) %>% 
  summarise_each(funs(mean))
  

# Saving the data files "selected_data" and "tidy_data" into 2 files
write.table(selected_data, file="./UCI_data/selected_data.txt", 
            row.name=FALSE)

write.table(tidy_data, file="./UCI_data/tidy_data.txt", 
            row.name=FALSE)


keep(selected_data, tidy_data, activities, sure = TRUE)








