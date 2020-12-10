#Loading required libraries
library(dplyr)
library(plyr)

#First we have to download the zip file and unzip it in an appropriate folder

url_zip <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipname <- "UCI_HAR_Dataset.zip"
download.file(url_zip, zipname)
unzip(zipname)

#Now, a folder with the name UCI HAR Dataset has been created in our working
#directory with all the unziped information we downloaded. New folders have
#been created and we have to indicate were the needed files are with the 
#correct path. Then, now we will read all the needed files and charge them into 
#different dataframes

#First we will load into R data from train

fname <- "./UCI HAR Dataset/train/subject_train.txt"
subjtrain <- read.table(fname, stringsAsFactors = FALSE)
fname <- "./UCI HAR Dataset/train/X_train.txt"
xtrain <- read.table(fname, stringsAsFactors = FALSE)
fname <- "./UCI HAR Dataset/train/y_train.txt"
ytrain <- read.table(fname, stringsAsFactors = FALSE)

#Then we will load into R data from test

fname <- "./UCI HAR Dataset/test/subject_test.txt"
subjtest <- read.table(fname, stringsAsFactors = FALSE)
fname <- "./UCI HAR Dataset/test/X_test.txt"
xtest <- read.table(fname, stringsAsFactors = FALSE)
fname <- "./UCI HAR Dataset/test/y_test.txt"
ytest <- read.table(fname, stringsAsFactors = FALSE)

#Finally we will load into R activity lables and features

fname <- "./UCI HAR Dataset/activity_labels.txt"
actlabels <- read.table(fname, stringsAsFactors = FALSE)
fname <- "./UCI HAR Dataset/features.txt"
features <- read.table(fname, stringsAsFactors = FALSE)

#And now we can start with the five points asked for this assignment
#
#N1 -> Merges the training and the test sets to create one data set
#
#       First we will create only one data set with the three files for train,
#       Second we will repeat the operation with test files
#       Finally we will merge both dataframes

ds_train <- cbind(subjtrain, ytrain, xtrain)
ds_test <- cbind(subjtest, ytest, xtest)
ds_total <- rbind(ds_train, ds_test)

#N2 -> Extracts only the measurements on the mean and standard deviation for 
#      each measurement
#
#       First we will obtain the columns containing mean or std
#       Second we will sum 2 to each in order to obtain the columns in ds_total
#       Finally we will subset subject, activity and the columns obtained before

descols <- grep("mean|std", features[,2])
descols2 <- c(1,2, descols+2)
extraction <- ds_total[,descols2]

#N3 -> Uses descriptive activity names to name the activities in the data set
#
#Knowing that we stored activities codes and descriptions contained in the file
#activity_labels.txt in the dataset actlabels, we will use function mapvalues
#from the plyr package to change codes by descriptions

extraction[,2] <- mapvalues(extraction[,2], 
                            from = actlabels$V1, to = actlabels$V2)

#N4 -> Appropriately labels the data set with descriptive variable names
#
#First We will use once again descols calculated in N2 in order to catch the
#appropiate column names contained in features dataframe
#Second we will correct those with the repetition of Body word in the varname
#Third we will add name for the subject and activity columns
#Finally we will rename columns of the extraction dataframe

featurenames <- features[descols,2]
featurenames <- gsub(pattern = "BodyBody", replacement = "Body", featurenames)
cnames <- c("subject","activity",featurenames)
names(extraction) <- cnames

#N5 -> From the data set in step 4, creates a second, independent tidy data set 
#with the average of each variable for each activity and each subject.
#
#First we will group extraction dataframe by subject and activity, and 
#summarize all variables with dplyr function summarise_all. The result will be
#added to a new dataframe called extractionAvg
#Second we will add "Avg" to all columnnames except subject and activity to 
#have a correct variable names after having summarized the dataframe

extractionAvg <- extraction %>% group_by(subject,activity) %>%
        summarise_all(mean)
cnamesAvg <- c("subject","activity",paste("Avg",featurenames, sep = ""))
names(extractionAvg) <- cnamesAvg

#Finally, in the submision we are asked to create a txt file with 
#write_table() function using rownames="FALSE" to be uploaded.

write.table(extractionAvg, file = "extractionAvg.txt", row.names = FALSE)