    suppressMessages(library(dplyr))

    # Combine subject_train or the subject for the training sets
    # then y_train which is the activity number that the subject performed
    # and finally the x_train which is the performed training sets for each subject
    x_train <- read.table("data/UCI HAR Dataset/train/x_train.txt")
    y_train <- read.table("data/UCI HAR Dataset/train/y_train.txt")
    subject_train <- read.table("data/UCI HAR Dataset/train/subject_train.txt")
    train_all <- cbind(subject_train, y_train, x_train)

# Combine subject_test or the subject for the test sets
# then y_test which is the activity number that the subject performed
# and finally the x_test which is the performed test sets for each subject

x_test <- read.table("data/UCI HAR Dataset/test/x_test.txt")
y_test <- read.table("data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("data/UCI HAR Dataset/test/subject_test.txt")
test_all <- cbind(subject_test, y_test, x_test)

# Combine both training and test sets
test_train_combine <- rbind(train_all, test_all)

# read in all column names from features.txt
column_names <- read.table("data/UCI HAR Dataset/features.txt")

# rename all columns  of the merged train and test sets
# using features.txt or column_names data frame
# starting on the 3rd column since the first column 
# is the subject id and the activity number
for(i in 1:nrow(column_names)) { 
  colnames(test_train_combine)[i+2] <- as.character(column_names[i,2])
}

# rename columns 1 and 2 for the combine train and test data sets
# which are the subject_id and activity_id (or activity number) respectively
colnames(test_train_combine)[1:2] <- c("subject_id", "activity_id")

# read in activity labels
activity_labels <- read.table("data/UCI HAR Dataset/activity_labels.txt")

# rename activity label two columns to activity_id and activity_name respectively
colnames(activity_labels) <- c("activity_id", "activity_name")

# merge extracted data with activity labels
test_train_combine <- merge(test_train_combine, activity_labels)

# Extract the variables that has the mean and standard deviation meaurments
# including the subject id and activity number (for merging later on)
col_mean_std <- grep("std()|mean()", colnames(test_train_combine))
test_train_extract <- test_train_combine[ ,c(1:2,col_mean_std)]

# remove activity_id variable 
# so that it would not be included 
# in the computation of mean later on
test_train_extract <- test_train_extract[,-match("activity_id",colnames(test_train_extract))]
  
# Get the mean for all measurements 
# that has both mean and standard labels
# group by activity name and subject id
# summarize_each so that all measurement columns 
# (i.e. columans with mean and std labels) will be measured
test_train_measurements_mean <- summarise_each(group_by(test_train_extract, activity_name, subject_id),funs(mean))

# rename all variables by adding the word 'mean'
# except subject_id and activity_name
colnames(test_train_measurements_mean)[c(-1,-2)] <- paste0(colnames(test_train_measurements_mean)[c(-1,-2)],"_mean")

# write the result to a text file
write.table(test_train_measurements_mean, file = "all_test_train_measurements_mean.txt", row.names = FALSE)
