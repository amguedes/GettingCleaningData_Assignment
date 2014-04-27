GettingCleaningData_Assignment
==============================

run_analysis.R is organised in the topics of the assignment. 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

Here is the guide for the assignment

- set working directory
- import train and test data into R
- merge X_train, Y_train and subject_train data to form a train_data data frame with all the data regarding the training (train_data and test_data)
- do the same for test data
- combine both data frames (data)
- use the file features.txt to add column names to data
- use grep to extract the columns that have the mean or std of the variables
- reshape data using melt function to be able to get variable means by subject and activity

