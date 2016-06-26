
## load library 
library(plyr)


## Load activity labels & changes the value
activity_labels <- read.table("data/UCI HAR Dataset/activity_labels.txt")

## Extract the data for mean and SD
features <- read.table("data/UCI HAR Dataset/features.txt")
f_mean_sd <-  grep("-(mean|std)\\(\\)", features[, 2])
featuresname <- features[f_mean_sd, 2]
featuresname <- gsub('[-()]', '', featuresname)



## read dataset train and test 
subject_train <- read.table("data/UCI HAR Dataset/train/subject_train.txt")
x_train <- read.table("data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("data/UCI HAR Dataset/train/Y_train.txt")

subject_test <- read.table("data/UCI HAR Dataset/test/subject_test.txt")
x_test <- read.table("data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("data/UCI HAR Dataset/test/Y_test.txt")


## replace activity labels
y_train[,1] <- activity_labels[y_train[,1], 2]
y_test[,1] <- activity_labels[y_test[,1], 2]

## extract required columns
x_train <- x_train[,f_mean_sd]
x_test <- x_test[, f_mean_sd]

## combine data
train <- cbind(subject_train, y_train, x_train)
test <- cbind(subject_test, y_test, x_test)
all_data <- rbind(train, test)


## add label
colnames(all_data) <- c("subject", "activity", featuresname)

## Average the columns
avg_data <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 3:68]))


## Write output to tidy.txt
write.table(avg_data, "tidy.txt", row.names = FALSE, quote = FALSE)

