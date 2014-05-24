CodeBook for Getting and Cleaning Data Course Assignment
========================================================

Original Data Description
--------------------------------------------------------
Information on the original dataset, including
* Data Set Characteristics
* Counts, Attributes, Missing Value information
* Source

Link: [Human Activity Recognition Using Smartphones Data Set][odd]


Data Collection Description - Source: README.txt
--------------------------------------------------------
>The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

>The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 


Files used 
--------------------------------------------------------

Link: [UCI HAR Dataset][src]

File Name | Description | Size
--------- | ----------- | -------------
X_test.txt | Raw test data, no header or row names | 2947 obs. of 561 variables
y_test.txt | Activity Number for each row in X_test.txt | 2947 obs. of 1 variable
subject_test.txt | Subject ID for each row in X_test.txt | 2947 obs. of 1 variable
X_train.txt | Raw train data, no header or row names | 7352 obs. of 561 variables
y_train.txt | Activity Number for each row in X_train.txt | 7352 obs. of 1 variable
subject_train.txt | Subject ID for each row in X_train.txt | 7352 obs. of 1 variable
activity_labels.txt | Activity lables x-ref with y-test/y-train data | 6 obs. of 2 variables
features.txt | Variable names for columns in X_test/X_train | 561 obs. of 2 variables


Data Cleaning, combining, manipulation in run_analysis.R
--------------------------------------------------------
* Assumes original dataset in zipped format is in the working directory
* Reads in Test & Training data as well as row descriptors and column variable names
* Subsets variable list to contain only those pertaining to mean or standard deviation.  Some variables contained information on frequency means, but these were not needed in the final dataset
* Variable names were cleaned to remove spaces, underscores, parenthesis, etc.  The table below shows both old & new variable names
* Train data & Test data is combined into a single data set
* Subject identification is added to the data set
* Activity labels are added based on the activity numbers, activity numbers are dropped
* Final tidydata.txt is created which contains mean values for all 66 variables by Subject ID & Activity Description

Description of tidydata.txt
-------------------------------------------------------
tidydata.txt has 180 rows and 68 columns.
Each row contains a single subject identifier, activity label, and 66 variables containing the mean observed value for that subject/activity across the entire train & test data set.
The 66 variables are listed below along with information on how to interpret the variable name.

Variable List in tidydata.txt
--------------------------------------------------------
No. | Original Variable Name | New Variable Name | Type
------ | ------- | ------- | ---------
1 |  | activitylabel | factor
2 |  | subjectid | integer
3 | tBodyAcc-mean()-X | tbodyaccmeanx | numeric
 4 | tBodyAcc-mean()-Y | tbodyaccmeany | numeric 
 5 | tBodyAcc-mean()-Z | tbodyaccmeanz | numeric
 6 | tBodyAcc-std()-X | tbodyaccstdx | numeric
 7 | tBodyAcc-std()-Y | tbodyaccstdy | numeric
 8 | tBodyAcc-std()-Z | tbodyaccstdz | numeric
 9 | tGravityAcc-mean()-X | tgravityaccmeanx | numeric
 10 | tGravityAcc-mean()-Y | tgravityaccmeany | numeric
 11 | tGravityAcc-mean()-Z | tgravityaccmeanz | numeric
 12 | tGravityAcc-std()-X | tgravityaccstdx | numeric
 13 | tGravityAcc-std()-Y | tgravityaccstdy | numeric
 14 | tGravityAcc-std()-Z | tgravityaccstdz | numeric
 15 | tBodyAccJerk-mean()-X | tbodyaccjerkmeanx | numeric
 16 | tBodyAccJerk-mean()-Y | tbodyaccjerkmeany | numeric
 17 | tBodyAccJerk-mean()-Z | tbodyaccjerkmeanz | numeric
 18 | tBodyAccJerk-std()-X | tbodyaccjerkstdx | numeric
 19 | tBodyAccJerk-std()-Y | tbodyaccjerkstdy | numeric
 20 | tBodyAccJerk-std()-Z | tbodyaccjerkstdz | numeric
 21 | tBodyGyro-mean()-X | tbodygyromeanx | numeric
 22 | tBodyGyro-mean()-Y | tbodygyromeany | numeric
 23 | tBodyGyro-mean()-Z | tbodygyromeanz | numeric
 24 | tBodyGyro-std()-X | tbodygyrostdx | numeric
 25 | tBodyGyro-std()-Y | tbodygyrostdy | numeric
 26 | tBodyGyro-std()-Z | tbodygyrostdz | numeric
 27 | tBodyGyroJerk-mean()-X | tbodygyrojerkmeanx| numeric 
 28 | tBodyGyroJerk-mean()-Y | tbodygyrojerkmeany | numeric
 29 | tBodyGyroJerk-mean()-Z | tbodygyrojerkmeanz | numeric
 30 | tBodyGyroJerk-std()-X | tbodygyrojerkstdx | numeric
 31 | tBodyGyroJerk-std()-Y | tbodygyrojerkstdy | numeric
 32 | tBodyGyroJerk-std()-Z | tbodygyrojerkstdz | numeric
 33 | tBodyAccMag-mean() | tbodyaccmagmean | numeric
 34 | tBodyAccMag-std() | tbodyaccmagstd | numeric
 35 | tGravityAccMag-mean() | tgravityaccmagmean | numeric
 36 | tGravityAccMag-std() | tgravityaccmagstd | numeric
 37 | tBodyAccJerkMag-mean() | tbodyaccjerkmagmean | numeric
 38 | tBodyAccJerkMag-std() | tbodyaccjerkmagstd | numeric
 39 | tBodyGyroMag-mean() | tbodygyromagmean | numeric
 40 | tBodyGyroMag-std() | tbodygyromagstd | numeric
 41 | tBodyGyroJerkMag-mean() | tbodygyrojerkmagmean| numeric 
 42 | tBodyGyroJerkMag-std() | tbodygyrojerkmagstd | numeric
 43 | fBodyAcc-mean()-X | fbodyaccmeanx | numeric
 44 | fBodyAcc-mean()-Y | fbodyaccmeany | numeric
 45 | fBodyAcc-mean()-Z | fbodyaccmeanz | numeric
 46 | fBodyAcc-std()-X | fbodyaccstdx | numeric
 47 | fBodyAcc-std()-Y | fbodyaccstdy | numeric
 48 | fBodyAcc-std()-Z | fbodyaccstdz | numeric
 49 | fBodyAccJerk-mean()-X | fbodyaccjerkmeanx | numeric 
 50 | fBodyAccJerk-mean()-Y | fbodyaccjerkmeany | numeric
 51 | fBodyAccJerk-mean()-Z | fbodyaccjerkmeanz | numeric
 52 | fBodyAccJerk-std()-X | fbodyaccjerkstdx | numeric
 53 | fBodyAccJerk-std()-Y | fbodyaccjerkstdy | numeric
 54 | fBodyAccJerk-std()-Z | fbodyaccjerkstdz | numeric
 55 | fBodyGyro-mean()-X | fbodygyromeanx | numeric
 56 | fBodyGyro-mean()-Y | fbodygyromeany | numeric
 57 | fBodyGyro-mean()-Z | fbodygyromeanz | numeric
 58 | fBodyGyro-std()-X | fbodygyrostdx | numeric
 59 | fBodyGyro-std()-Y | fbodygyrostdy | numeric
 60 | fBodyGyro-std()-Z | fbodygyrostdz | numeric
 61 | fBodyAccMag-mean() | fbodyaccmagmean | numeric
 62 | fBodyAccMag-std() | fbodyaccmagstd | numeric
 63 | fBodyBodyAccJerkMag-mean() | fbodybodyaccjerkmagmean | numeric
 64 | fBodyBodyAccJerkMag-std() | fbodybodyaccjerkmagstd | numeric
 65 | fBodyBodyGyroMag-mean() | fbodybodygyromagmean | numeric
 66 | fBodyBodyGyroMag-std() | fbodybodygyromagstd | numeric
 67 | fBodyBodyGyroJerkMag-mean() | fbodybodygyrojerkmagmean | numeric
 68 | fBodyBodyGyroJerkMag-std() | fbodybodygyrojerkmagstd | numeric


Variable Descriptions - Source: features_info.txt
--------------------------------------------------------

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values. 
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'


[odd]:http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
[src]:https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
