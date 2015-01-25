This document describes steps that run_analysis.R performs.

Author: Vladimir Iglovikov

This script creates tidy daaset from the raw data of the "Human Activity Recognition Using Smartphones Dataset
Version 1.0".

Data is availible at the https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Description from the README.txt of the dataset
----
Human Activity Recognition Using Smartphones Dataset
Version 1.0
----
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
----

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
----

* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label.
* An identifier of the subject who carried out the experiment.

----
----


# Steps that script actually performs
 1. Extracts data from the test dataset. (X_test.txt)
 2. Extracts data from the train dataset. (X_train.txt)
 3. Extracts regiemes in which measuremnts were performed (walking, walking upstairs, walking downstairs, sitting, standing, laying). (y_test.txt, y_train.txt)
 4. Extracts names of the performed measurements (features.txt)
 5. Replaces keycode for the different regiems by actual words that this keycode describes. (1, 2, 3, 4, 5, 6) => (walking, walking upstairs, walking downstairs, sitting, standing, laying)
 6. Merges test and train data.
 7. Stores only columns that store mean and std measurements.
 8. Cleans columnnames from brackets and - signs, althoug keeps camel notation to make it easier to read.
 9. Creates and stores " independent tidy data set with the average of each variable for each activity and each subject."
 
 ----
 
 Description of the columns can be found in the CodeBook.md
 
