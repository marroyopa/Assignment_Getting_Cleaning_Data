***************************************************************************************
***   PEER-GRADED ASSIGNMENT : GETTING AND CLEANING DATA COURSE PROJECT             ***
***                                                                                 ***
***                          CODE BOOK extractionAvg.txt                            ***                             
***************************************************************************************

INDEX
-----

0.- INTRODUCTION
1.- TRANSFORMATIONS
2.- VARIABLE NAME CODING EXPLANATION
3.- LIST OF VARIABLES

INTRODUCTION
------------

The purpose of this document is to explain variables, data and transformations done
to the original data files to obtain the tidy data file extractionAvg.txt.

All the original data is captured from the set provided by the document:
 
Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support 
Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). 
Vitoria-Gasteiz, Spain. Dec 2012
This dataset is distributed AS-IS and no responsibility implied or explicit can be 
addressed to the authors or their institutions for its use or misuse. 
Any commercial use is prohibited.
Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

An explanation of the origin of data can be found here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

and the data can be found here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

TRANSFORMATIONS
---------------

Following transformations have been done to original data in order to obtain the file
extractionAvg.txt:
     1.- subject_train.txt, Y_train.txt and X_train.txt have been binded by colums to
         obtain only one record for all train data
     2.- subject_test.txt, Y_test.txt and X_test.txt have been binded by colums to
         obtain only one record for all test data
     3.- Train data and test data have been binded by rows to obtain only one data
         set for all data
     4.- This total data set has been subset to obtain the subject, the activity and
         only the measurements related with mean and standard deviation
     5.- Activity codes have been replaced by activity names
     6.- This total data set has been grouped by pairs subject/activity and all the
         measurements for every pair has been averaged
     7.- Column names have been changed adding "Avg" in the begging to indicate the
         modification done in the grouping
     8.- The file extractionAvg.txt is created with this new grouped data set

VARIABLE NAME CODING EXPLANATION
--------------------------------

First two variables are the identifiers of each line, being the subject of the
subject of the experiment and the activity that the subject was doing during when the
measurements were recorded.

Six different activities are recorded, WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS,
SITTING, STANDING and LAYING.

For the rest of the variables names are build as follows:
     - Avg         --> Indicates that the values corresponds to the mean of all the
                       measurements for a particular subject doing a particular 
                       activity
     - t/f         --> Indicates that measurement corresponds to time domain or 
                       frecuency domain
     - Body/Gravity--> Indicates that the values corresponds to the mean of all the
                       measurements for Body acceleration or due to Gravity
     - Acc/Gyro    --> Indicates measurements taken with the accelerometer or the 
                       gyroscope of the phone used in the experiment.
     - Jerk        --> Indicates that measurements correspond to the body jerk
     - mean/std    --> Indicates that the measurements are mean or standard deviation
                       of the measurements of the experiment
     - X/Y/Z/Mag   --> Indicates that the measurements are corresponding to the X,
                       Y or Z axis, or the magnitud using euclidean norm with other
                       axis measurements.
     - Freq        --> Indicates weighted average of frequency components
                       
LIST OF VARIABLES
-----------------

subject                       --> Subject identifier (numeric 1-30)
activity                      --> Activity description (char)

   All the rest of the variables are values normalized, then numeric [-1,1]

AvgtBodyAcc-mean()-X          --> Avg. of means in time for body on X accelerometer
AvgtBodyAcc-mean()-Y          --> Avg. of means in time for body on Y accelerometer
AvgtBodyAcc-mean()-Z          --> Avg. of means in time for body on Z accelerometer
AvgtBodyAcc-std()-X           --> Avg. of std in time for body on X accelerometer
AvgtBodyAcc-std()-Y           --> Avg. of std in time for body on Y accelerometer
AvgtBodyAcc-std()-Z           --> Avg. of std in time for body on Z accelerometer
AvgtGravityAcc-mean()-X       --> Avg. of means in time for Gravity on X accelerometer
AvgtGravityAcc-mean()-Y       --> Avg. of means in time for Gravity on Y accelerometer
AvgtGravityAcc-mean()-Z       --> Avg. of means in time for Gravity on Z accelerometer
AvgtGravityAcc-std()-X        --> Avg. of std in time for body on X accelerometer
AvgtGravityAcc-std()-Y        --> Avg. of std in time for body on Y accelerometer
AvgtGravityAcc-std()-Z        --> Avg. of std in time for body on Z accelerometer
AvgtBodyAccJerk-mean()-X      --> Avg. of means in time for b. jerk on X accelerometer
AvgtBodyAccJerk-mean()-Y      --> Avg. of means in time for b. jerk on Y accelerometer
AvgtBodyAccJerk-mean()-Z      --> Avg. of means in time for b. jerk on Z accelerometer
AvgtBodyAccJerk-std()-X       --> Avg. of std in time for b. jerk on X accelerometer
AvgtBodyAccJerk-std()-Y       --> Avg. of std in time for b. jerk on Y accelerometer
AvgtBodyAccJerk-std()-Z       --> Avg. of std in time for b. jerk on Z accelerometer
AvgtBodyGyro-mean()-X         --> Avg. of means in time for body on X gyroscope
AvgtBodyGyro-mean()-Y         --> Avg. of means in time for body on Y gyroscope
AvgtBodyGyro-mean()-Z         --> Avg. of means in time for body on Z gyroscope
AvgtBodyGyro-std()-X          --> Avg. of std in time for body on X gyroscope
AvgtBodyGyro-std()-Y          --> Avg. of std in time for body on Y gyroscope
AvgtBodyGyro-std()-Z          --> Avg. of std in time for body on Z gyroscope
AvgtBodyGyroJerk-mean()-X     --> Avg. of means in time for b. jerk on X gyroscope
AvgtBodyGyroJerk-mean()-Y     --> Avg. of means in time for b. jerk on Y gyroscope
AvgtBodyGyroJerk-mean()-Z     --> Avg. of means in time for b. jerk on Z gyroscope
AvgtBodyGyroJerk-std()-X      --> Avg. of std in time for b. jerk on X gyroscope
AvgtBodyGyroJerk-std()-Y      --> Avg. of std in time for b. jerk on Y gyroscope
AvgtBodyGyroJerk-std()-Z      --> Avg. of std in time for b. jerk on Z gyroscope
AvgtBodyAccMag-mean()         --> Avg. of means in time for body magnitude accelerometer
AvgtBodyAccMag-std()          --> Avg. of std in time for body magnitude accelerometer
AvgtGravityAccMag-mean()      --> Avg. of means in time for Gravity magnitude accelerometer
AvgtGravityAccMag-std()       --> Avg. of std in time for Gravity magnitude accelerometer
AvgtBodyAccJerkMag-mean()     --> Avg. of means in time for b. jerk magnitude accelerometer
AvgtBodyAccJerkMag-std()      --> Avg. of std in time for b. jerk magnitude accelerometer
AvgtBodyGyroMag-mean()        --> Avg. of means in time for body magnitude gyroscope
AvgtBodyGyroMag-std()         --> Avg. of std in time for body magnitude gyroscope
AvgtBodyGyroJerkMag-mean()    --> Avg. of means in time for b. jerk magnitude gyroscope
AvgtBodyGyroJerkMag-std()     --> Avg. of std in time for b. jerk magnitude gyroscope
AvgfBodyAcc-mean()-X          --> Avg. of means in freq. for body on X-axis accelerometer
AvgfBodyAcc-mean()-Y          --> Avg. of means in freq. for body on Y-axis accelerometer
AvgfBodyAcc-mean()-Z          --> Avg. of means in freq. for body on Z-axis accelerometer
AvgfBodyAcc-std()-X           --> Avg. of std in freq. for body on X-axis accelerometer
AvgfBodyAcc-std()-Y           --> Avg. of std in freq. for body on Y-axis accelerometer
AvgfBodyAcc-std()-Z           --> Avg. of std in freq. for body on Z-axis accelerometer
AvgfBodyAcc-meanFreq()-X      --> Avg. of means of freq.comp. for body on X-axis accelerometer
AvgfBodyAcc-meanFreq()-Y      --> Avg. of means of freq.comp. for body on Y-axis accelerometer
AvgfBodyAcc-meanFreq()-Z      --> Avg. of means of freq.comp. for body on Z-axis accelerometer
AvgfBodyAccJerk-mean()-X      --> Avg. of means in freq. for b. jerk on X-axis accelerometer
AvgfBodyAccJerk-mean()-Y      --> Avg. of means in freq. for b. jerk on Y-axis accelerometer
AvgfBodyAccJerk-mean()-Z      --> Avg. of means in freq. for b. jerk on Z-axis accelerometer
AvgfBodyAccJerk-std()-X       --> Avg. of std in freq. for b. jerk on X-axis accelerometer
AvgfBodyAccJerk-std()-Y       --> Avg. of std in freq. for b. jerk on Y-axis accelerometer
AvgfBodyAccJerk-std()-Z       --> Avg. of std in freq. for b. jerk on Z-axis accelerometer
AvgfBodyAccJerk-meanFreq()-X  --> Avg. of means of freq.comp. for b. jerk on X-axis accelerometer
AvgfBodyAccJerk-meanFreq()-Y  --> Avg. of means of freq.comp. for b. jerk on X-axis accelerometer
AvgfBodyAccJerk-meanFreq()-Z  --> Avg. of means of freq.comp. for b. jerk on X-axis accelerometer
AvgfBodyGyro-mean()-X         --> Avg. of means in freq. for body on X-axis gyroscope
AvgfBodyGyro-mean()-Y         --> Avg. of means in freq. for body on Y-axis gyroscope
AvgfBodyGyro-mean()-Z         --> Avg. of means in freq. for body on Z-axis gyroscope
AvgfBodyGyro-std()-X          --> Avg. of std in freq. for body on X-axis gyroscope
AvgfBodyGyro-std()-Y          --> Avg. of std in freq. for body on Y-axis gyroscope
AvgfBodyGyro-std()-Z          --> Avg. of std in freq. for body on Z-axis gyroscope
AvgfBodyGyro-meanFreq()-X     --> Avg. of means of freq.comp. for body on X-axis gyroscope
AvgfBodyGyro-meanFreq()-Y     --> Avg. of means of freq.comp. for body on Y-axis gyroscope
AvgfBodyGyro-meanFreq()-Z     --> Avg. of means of freq.comp. for body on Z-axis gyroscope
AvgfBodyAccMag-mean()         --> Avg. of means in freq. for body magnitude accelerometer
AvgfBodyAccMag-std()          --> Avg. of std in freq. for body magnitude accelerometer
AvgfBodyAccMag-meanFreq()     --> Avg. of means of freq.comp. for body magnitude accelerometer
AvgfBodyAccJerkMag-mean()     --> Avg. of means in freq. for b. jerk magnitude accelerometer
AvgfBodyAccJerkMag-std()      --> Avg. of std in freq. for b. jerk magnitude accelerometer
AvgfBodyAccJerkMag-meanFreq() --> Avg. of means of freq.comp. for b. jerk magnitude accelerometer
AvgfBodyGyroMag-mean()        --> Avg. of means in freq. for body magnitude gyroscope
AvgfBodyGyroMag-std()         --> Avg. of std in freq. for body magnitude gyroscope
AvgfBodyGyroMag-meanFreq()    --> Avg. of means of freq.comp. for body magnitude gyroscope
AvgfBodyGyroJerkMag-mean()    --> Avg. of means in freq. for b. jerk magnitude gyroscope
AvgfBodyGyroJerkMag-std()     --> Avg. of std in freq. for b. jerk magnitude gyroscope
AvgfBodyGyroJerkMag-meanFreq()--> Avg. of means of freq.comp. for b. jerk magnitude gyroscope
