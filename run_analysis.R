library(dplyr)
setwd(".")
filename <- "dataset.zip"
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

##Check that file does not exist, download the file and extract into data subdirecory
if (!file.exists("filename")){
download.file(fileurl, destfile=".\\dataset.zip", method="curl")
}

##When not yet extracted, extract Zip-file
if(!file.exists(".\\UCI HAR Dataset")) {
  unzip(filename, exdir = ".") 
}
##Load test data into R
testdata <- read.table(".\\UCI HAR Dataset\\test\\X_test.txt", sep="")
testactivity <- read.table(".\\UCI HAR Dataset\\test\\y_test.txt", sep="")
testuser <- read.table(".\\UCI HAR Dataset\\test\\subject_test.txt", sep="")

##Load train data into R
traindata <- read.table(".\\UCI HAR Dataset\\train\\X_train.txt", sep="")
trainactivity <- read.table(".\\UCI HAR Dataset\\train\\y_train.txt", sep="") 
trainuser <- read.table(".\\UCI HAR Dataset\\train\\subject_train.txt", sep="")

##Load descriptive data into R
features <- read.table(".\\UCI HAR Dataset\\features.txt", sep="")
activitynames <- read.table(".\\UCI HAR Dataset\\activity_labels.txt", sep="")

##Merge all datasets together
alldata <- bind_rows(testdata, traindata)
allactivity <- bind_rows(testactivity, trainactivity)
allusers <- bind_rows(testuser, trainuser)

## Search for all measurements with mean() and value()
searchednames <- grep("(.*std\\(\\).*)|(.*mean\\(\\).*)", features$V2)

##Tidy feature titles
tidyfeatures <- function(x) {
  gsub("[,()_-]","", x)
}
tidyfeatures <- sapply(features$V2, tidyfeatures)

##Replace Activity ID with activity names
allactivity$V1 <- factor(allactivity$V1, levels=activitynames[,1], labels = activitynames[,2])

##Add feature names to measured data
colnames(alldata) <- tidyfeatures

## Only keep features with mean and standard deviation
alldata <- alldata[, searchednames]

##Add title to activity frame
colnames(allactivity) <- c("activity")

##Add title to subjects frame
colnames(allusers) <- c("users")

##Combine all columns to one dataframe
completeframe <- bind_cols(allusers, allactivity, alldata)
completeframe$users <- as.factor(completeframe$users)

##Calulate the average of the measurements per user and activity
groupedframe <- group_by(completeframe, users, activity)
meanresult <- summarise_each(groupedframe, funs(mean), 3:68)

##Write result to file
write.table(meanresult, file="tidy.txt", quote=FALSE,row.names = FALSE)
