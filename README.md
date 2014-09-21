==================================================================
Project as part of Getting and Cleaning Data Course
==================================================================
R script "run_analysis.R" written by Ramakrishna Neti
==================================================================

I. Project Data Set
The dataset includes the following files:
 	1.'features_info.txt': Shows information about the variables used on the feature vector
 	2.'features.txt': List of all features
 	3.'activity_labels.txt': Links the class labels with their activity name
 	4.'train/X_train.txt': Training set
 	5.'train/y_train.txt': Training labels
 	6.'test/X_test.txt': Test set
 	7.'test/y_test.txt': Test labels
 	8.'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is 		   from 1 to 30. 
 	9.'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 		  'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
 	10.'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the 		   total acceleration. 
 	11. 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window 		   sample. The units are radians/second. 

	Notes: 
	• Features are normalized and bounded within [-1,1].
	• Each feature vector is a row on the text file.

II. R script "run_analysis.R" performs the following functions: 

	1.Download the zip file containing the data set from the website 
	  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
	2.Load data from test and training files into R data frames
	3.Use descriptive activity names to name the activities in the data set
	4.Label the data sets appropriately with descriptive activity names 
	5.Merge test and training sets into one data set called MergedData, including the activities
	6.Extract only the measurements on the mean and standard deviation for each measurement
	7.Create a second, independent tidy data set with the average of each variable for each activity and each subject
	8.Upload the tidy data as a txt file created with write.table() using row.name=FALSE

III. R Packages Used in the project
	• "downloader"
	• "data.table"
	• "reshape2" that includes "plyr"

V. Variables (data frames, tables and files used in the R program)
	• testDataSet – data frame containing test data (tBodyAcc, fBodyAcc, tBodyAcc-energy, fBodyAcc-energy, tBodyAcc-iqr,fBodyAcc-iqr tBodyAcc-entropy, fBodyAcc-entropy, tBodyAcc-arCoeff, tBodyAcc-correlation()-X,Z, tBodyAcc-correlation()-Y,Z, 		  tGravityAcc-min()-X, tGravityAcc-max()-X, tBodyAccJerk, tBodyGyro, angle etc.)
	• testDataLabels - data frame containing test data activity labels (STANDING, SITTING, LAYING, WALKING_DOWNSTAIRS,WALKING_UPSTAIRS etc.)
	• testDataSubj - data frame containing test data subjects (subject who performed the activity for each window sample. Its 	  	  range is from 1 to 30)
	• trainDataSet – data frame containing train data  (tBodyAcc, fBodyAcc, tBodyAcc-energy, fBodyAcc-energy, tBodyAcc-iqr, 	  	  fBodyAcc-iqr tBodyAcc-entropy, fBodyAcc-entropy, tBodyAcc-arCoeff, tBodyAcc-correlation()-X,Z, tBodyAcc-correlation()-Y,Z, 	  	  tGravityAcc-min()-X, tGravityAcc-max()-X, tBodyAccJerk, tBodyGyro, angle etc.)
	• trainDataLabels - data frame containing training data activity labels (STANDING, SITTING, LAYING, WALKING_DOWNSTAIRS, 	  	  WALKING_UPSTAIRS etc.)
	• trainDataSubj - data frame containing test data subjects (subject who performed the activity for each window sample. Its 	  	  range is from 1 to 30)
	• testDataLabels$V1 - name the activities in the test data set
	• trainDataLabels$V1 - name the activities in the test data set
	• features – data frame containing descriptive activity name
	• MergedData – data frame that contains data from testDataSet and trainDataSet merged along with activity labels and subjects
	• DT – Data table that contains means and standard deviations for each variable in the test and training data sets.
	• Tidy.txt – this file contains the merged data sets along with the mean and standard deviation values.
 


