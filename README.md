***************************************************************************************
***   PEER-GRADED ASSIGNMENT : GETTING AND CLEANING DATA COURSE PROJECT             ***
***                                                                                 ***
***                                 README DOCUMENT                                 ***                             
***************************************************************************************

INDEX
-----

0.- Introduction
1.- What's in the repository
2.- What's in the script


INTRODUCTION
------------

This repository contains the mandatory document demanded in the Project Assignment 
corresponding to week 4 of the Getting and Cleaning Data module inside the Data
Science Specialization of the Johns Hopkins University in Coursera.

The purpose of this assignment is to download the data from the project "Human  
Activity Recognition Using Smartphones Data Set" and convert it to tidy data and  
create a new file summarizing data.

An explanation of the origin of data can be found here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

and the data can be found here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

This original document is:

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. 
Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support 
Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). 
Vitoria-Gasteiz, Spain. Dec 2012
This dataset is distributed AS-IS and no responsibility implied or explicit can be 
addressed to the authors or their institutions for its use or misuse. 
Any commercial use is prohibited.
Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.


WHAT'S IN THE REPOSITORY
------------------------

As is demanded in the assignment, in this repository you will find:
   - README.md         --> The document you are reading now describing whats in the 
                           repository and a description of the script and how to use 
                           it. 

   - CodeBook.md       --> In this document you will find a description of variables,
                           data, and any transformations done to the input files that
                           lead to the final summarized file extractionAvg.txt

   - run_analysis.R    --> R script with the code and the description of actions in 
                           order to obtain the desired result.

   - extractionAvg.txt --> Tidy data set containing the average of all measurements
                           concerning mean or standard deviation calculations
                           for every subject/activity pair.

WHAT'S IN THE SCRIPT
--------------------

All the assignment is done in only one script, run_analysis.R, divided in several 
parts. More detailed explanations are commented inside the script.

Env. Prep --> In order to prepare the environment, in this part we load the required
              libraries (plyr and dplyr), download the zip file on the repository 
              and unzip it. IF YOU RUN THE SCRIPT SEVERAL TIMES, IT'S NOT NECESSARY 
              BUT INTERESTING TO COMMENT LINES FROM 07 TO 10 IN ORDER TO NOT DOWNLOAD 
              AND UNZIP INFORMATION EVERY EXECUTION.

Data Prep --> In order to prepare data for treatment we use required files for 
              subject (containing subjects of the experiment), y (containing 
              activities) and X (containing 561 different variables measured) from
              train subjects and test subjects folders and we load them in a
              different dataframe each of them. We also load in two different
              dataframes activity labels contained in the activity_labels.txt file,
              and name of the variables contained in X that are in the file named
              features.txt.

N1        --> As first part of the assignment, we binded columns of subjects,
              activities and measurements for test and train dataframes, obtaining
              ds_test and ds_train dataframes. Then this two dataframes are merged 
              in order to obtain only one dataframe with all the observations in the
              experiment named ds_total.

N2        --> As second part of the assignment we are asked to extrat only the 
              measurements relating to mean or standard deviation. First we detected
              index for this measurements with grep() function applied to features
              and sum 2 to each, because we binded columns subject and activity to
              ds_total. With the vector of this indexes we selected only desired 
              columns of ds_total and copied to a new dataframe named extraction.

N3        --> As third part of the assignment we had to change activity codes by
              activity descriptions. In order to achieve this, we used the function
              mapvalues of plyr package applied to the second column of extraction
              and changing the values contained in the first column of the dataframe
              actlabels by their description contained on the second column of the
              same dataframe.

N4        --> As fourth part of the assignment we had to add descriptive names to
              the variables in extraction dataframe. Using the indexes detected in
              N2 with the grep() function applied to dataframe features we extracted
              the name of the variables. In the tail of features we detected some 
              names with the word Body duplicated, then we changed "BodyBody" by 
              "Body" using gsub() function. No other duplications or mistakes 
              detected. Then, using function names() we set the name for columns 
              in extraction dataframe.

N5        --> As last part of the assignment we are requested to create a new 
              dataframe with the average values for every pair subject/activity.
              Using the pipe operator (%>%) we took extraction dataframe, grouped
              by subject/activity and finally made the mean to every measurement
              using the summarise_all() function and put it in a new dataframe 
              named extractionAvg. As column names are inherited from extraction
              dataframe, we create new names taking the names of extraction and
              adding "Avg" (except for subject and activity, of course).

CLOSING   --> As part of the submission we are asked to create a tidy data file
              with the write.table() function, and this is how the script ends.     