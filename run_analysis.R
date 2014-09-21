## This R script "run_analysis.R" performs the following functions: 
# 1.  Download the zip file containing the data set from the website https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
# 2.	Load data from test and training files into R data frames
# 3.	Use descriptive activity names to name the activities in the data set
# 4.	Label the data sets appropriately with descriptive activity names 
# 5.	Merge test and training sets into one data set called MergedData, including the activities
# 6.	Extract only the measurements on the mean and standard deviation for each measurement
# 7.	Create a second, independent tidy data set as a txt file created with write.table() using row.name=FALSE
#     with the average of each variable for each activity and each subject

## Installed packages "downloader", "data.table" and "reshape2" that includes "plyr"
## 1.Download the zip file containing the data set
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileUrl, destfile = "Dataset.zip")
    # trying URL 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
    # Content type 'application/zip' length 62556944 bytes (59.7 Mb)
    # opened URL
    # downloaded 59.7 Mb
##  unzip the dowloaded file
    unzip("Dataset.zip")
## 2.Load data from test and training files into R data frames
    testDataSet <- read.table("./UCI HAR Dataset/test/X_test.txt",header=FALSE)
    testDataLabels <- read.table("./UCI HAR Dataset/test/y_test.txt",header=FALSE)
    testDataSubj <- read.table("./UCI HAR Dataset/test/subject_test.txt",header=FALSE)
    trainDataSet <- read.table("./UCI HAR Dataset/train/X_train.txt",header=FALSE)
    trainDataLabels <- read.table("./UCI HAR Dataset/train/y_train.txt",header=FALSE)
    trainDataSubj <- read.table("./UCI HAR Dataset/train/subject_train.txt",header=FALSE)
## 3.Use descriptive activity names to name the activities in the data set
    activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt",header=FALSE,colClasses="character")
    testDataLabels$V1 <- factor(testDataLabels$V1,levels=activityLabels$V1,labels=activityLabels$V2)
    trainDataLabels$V1 <- factor(trainDataLabels$V1,levels=activityLabels$V1,labels=activityLabels$V2)
# 4.Label the data sets appropriately with descriptive activity names 
    features <- read.table("./UCI HAR Dataset/features.txt",header=FALSE,colClasses="character")
    colnames(testDataSet)<-features$V2
    colnames(trainDataSet)<-features$V2
    colnames(testDataLabels)<-c("Activity Label")
    colnames(trainDataLabels)<-c("Activity Label")
    colnames(testDataSubj)<-c("Subject")
    colnames(trainDataSubj)<-c("Subject")
# 5.Merge test and training sets into one data set called MergedData, including the activities
    testDataSet<-cbind(testDataSet,testDataLabels)
    testDataSet<-cbind(testDataSet,testDataSubj)
    trainDataSet<-cbind(trainDataSet,trainDataLabels)
    trainDataSet<-cbind(trainDataSet,trainDataSubj)
    MergedData<-rbind(testDataSet,trainDataSet)
# 6.Extract only the measurements on the mean and standard deviation for each measurement
    MeanOfMergedData<-sapply(MergedData,mean,na.rm=TRUE) 
    SDofMergedData<-sapply(MergedData,sd,na.rm=TRUE) 
# 7.Create a second, independent tidy data set as a txt file created with write.table() using row.name=FALSE
#   with the average of each variable for each activity and each subject 
    DT <- data.table(MergedData) 
    tidy<-DT[,lapply(.SD,mean),by="Activity Label,Subject"] 
    write.table(tidy,file="tidy.txt",sep=",",row.names = FALSE) 

