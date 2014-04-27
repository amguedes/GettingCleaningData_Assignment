## set working directory and import data to R

setwd("/Volumes/Ana Stuff/PhD/Courses/Coursera Getting and Cleaning Data/Assignment/UCI HAR Dataset")

train_set = read.table("./train/X_train.txt")
train_lab = read.table("./train/Y_train.txt")
subject_train = read.table("./train/subject_train.txt")

test_set = read.table("./test/X_test.txt")
test_lab = read.table("./test/Y_test.txt")
subject_test = read.table("./test/subject_test.txt")

## merge all data on each suset of data. Now I have one dataset for training and another for test
train_data = cbind(train_lab, subject_train, train_set)
test_data = cbind(test_lab, subject_test, test_set)

## based on the features, get proper column names for each dataset
features = read.table("./features.txt")
add_feature = data.frame(V1 = "a", V2 = 'lab')
add_feature2 = data.frame(V1 = "b", V2 = 'subject')
features = rbind(add_feature2, features)
features = rbind(add_feature, features)

colnames(train_data) = features$V2
colnames(test_data) = features$V2

## merge train and test data to a new variable called data
### 1. Merges the training and the test sets to create one data set.
data = rbind(train_data, test_data)

### 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

[A-z]* [Mm][Ee][Aa][Nn] | [Ss][Tt][Dd]

data_subset = data[grep("[Mm][Ee][Aa][Nn]|[Ss][Tt][Dd]", colnames(data))]

## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names. 

data$lab = gsub("1", "walking", data$lab)
data$lab = gsub("2", "walking_upstairs", data$lab)
data$lab = gsub("3", "walking_downstairs", data$lab)
data$lab = gsub("4", "sitting", data$lab)
data$lab = gsub("5", "standing", data$lab)
data$lab = gsub("6", "laying", data$lab)

## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

require(plyr)
colMeans by subject 

table = xtabs(subject ~ ., data = data)
summary = ddply(data, .(subject), summarize, sum = mean(count))
