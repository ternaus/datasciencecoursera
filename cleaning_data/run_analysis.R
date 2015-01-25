# this scirpt creates tidy dataset from the raw data collected in the work:
# Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity 
# Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop 
# of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012


library(plyr)

path = getwd()

#test data collection
x.test <- read.table(paste(c(path, "UCI HAR Dataset/test/X_test.txt"), collapse="/"))
# subject.test <- read.table(paste(c(path, "UCI HAR Dataset/test/subject_test.txt"), collapse="/"))
y.test <- read.table(paste(c(path, "UCI HAR Dataset/test/y_test.txt"), collapse="/"))

# train data collection

x.train <- read.table(paste(c(path, "UCI HAR Dataset/train/X_train.txt"), collapse="/"))
# subject.train <- read.table(paste(c("UCI HAR Dataset/train/subject_train.txt"), collapse="/"))
y.train <- read.table(paste(c("UCI HAR Dataset/train/y_train.txt"), collapse="/"))


features <- read.table(paste(c("UCI HAR Dataset/features.txt"), collapse="/"))

#replace keycode 1-6 into walking, walking upstairs, walking downstairs, sitting, standing, laying

activity.labels <- c("1"="walking", "2"="walking upstairs", "3"="walking downstairs", "4"="sitting", "5"="standing", "6"="laying")

x.test <- cbind(revalue(as.character(y.test$V1), activity.labels), x.test)
x.train <- cbind(revalue(as.character(y.train$V1), activity.labels), x.train)

colnames(x.test) <- c("regieme", as.vector(features$V2))
colnames(x.train) <- c("regieme", as.vector(features$V2))

mean.std <-rbind(x.test, x.train)

rm(x.test)
rm(x.train)
rm(y.test)
rm(y.train)

#filter, so that only regieme, mean() and std() are stored
mean.std <- mean.std[grep("regieme|mean\\(\\)|std\\(\\)", colnames(mean.std))]

#remove brackets and "-" from the names of the columns
colnames(mean.std) <- sapply(colnames(mean.std), function(x) {gsub("\\(|\\)|-", "", x)})

#now we will create another data frame, with the average of each variable for each activity and each subject
mean.mean.std <- t(sapply(split(mean.std, mean.std$regieme), function(x) colMeans(x[, 2:ncol(x)])))

mean.mean.std <- cbind(c("laying", "sitting", "standing", "walking", "walking downstairs", "walking updtairs"), mean.mean.std)
colnames(mean.mean.std)[1] <- "regieme"
write.table(mean.mean.std, "mean_mean_std.txt", row.name=FALSE)