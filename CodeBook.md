CodeBook for Getting and Cleaning Data Course Assignment
========================================================

Original Data Description
--------------------------------------------------------
Information on the original dataset, including
* Data Set Characteristics
* Counts, Attributes, Missing Value information
* Source

Available [here][odd]


Data Collection Description
--------------------------------------------------------
>The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each >person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing >a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3>-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video>-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% >of the volunteers was selected for generating the training data and 30% the test data. 
>
>The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in >fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, >which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body >acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a >filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating >variables from the time and frequency domain. See 'features_info.txt' for more details. 

>Source - "README.txt" file accompanying original dataset


Files used 
--------------------------------------------------------

[Source][src]

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


Data Cleaning, combining, manipulation
--------------------------------------------------------
* Assumes original dataset in zipped format is in the working directory
* Reads in Test & Training data as well as row descriptors and column variable names
* Subsets variable list to contain only those pertaining to mean or standard deviation.  Some variables contained information on frequency means, but these were not needed in the final dataset
* Variable names were cleaned to remove spaces, underscores, parenthesis, etc.  The table below shows both old & new variable names
* Train data & Test data is combined into a single data set
* Subject identification is added to the data set
* Activity labels are added based on the activity numbers, activity numbers are dropped
* Final tidydata.txt is created which contains mean values for all 66 variables by Subject ID & Activity Description


Variable List in tidydata.txt
--------------------------------------------------------
No. | Original Variable Name | New Variable Name
------ | ------- | -------
1 | tBodyAcc-mean()-X | tbodyaccmeanx 
 2 | tBodyAcc-mean()-Y | tbodyaccmeany 
 3 | tBodyAcc-mean()-Z | tbodyaccmeanz 
 4 | tBodyAcc-std()-X | tbodyaccstdx 
 5 | tBodyAcc-std()-Y | tbodyaccstdy 
 6 | tBodyAcc-std()-Z | tbodyaccstdz 
 7 | tGravityAcc-mean()-X | tgravityaccmeanx 
 8 | tGravityAcc-mean()-Y | tgravityaccmeany 
 9 | tGravityAcc-mean()-Z | tgravityaccmeanz 
 10 | tGravityAcc-std()-X | tgravityaccstdx 
 11 | tGravityAcc-std()-Y | tgravityaccstdy 
 12 | tGravityAcc-std()-Z | tgravityaccstdz 
 13 | tBodyAccJerk-mean()-X | tbodyaccjerkmeanx 
 14 | tBodyAccJerk-mean()-Y | tbodyaccjerkmeany 
 15 | tBodyAccJerk-mean()-Z | tbodyaccjerkmeanz 
 16 | tBodyAccJerk-std()-X | tbodyaccjerkstdx 
 17 | tBodyAccJerk-std()-Y | tbodyaccjerkstdy 
 18 | tBodyAccJerk-std()-Z | tbodyaccjerkstdz 
 19 | tBodyGyro-mean()-X | tbodygyromeanx 
 20 | tBodyGyro-mean()-Y | tbodygyromeany 
 21 | tBodyGyro-mean()-Z | tbodygyromeanz 
 22 | tBodyGyro-std()-X | tbodygyrostdx 
 23 | tBodyGyro-std()-Y | tbodygyrostdy 
 24 | tBodyGyro-std()-Z | tbodygyrostdz 
 25 | tBodyGyroJerk-mean()-X | tbodygyrojerkmeanx 
 26 | tBodyGyroJerk-mean()-Y | tbodygyrojerkmeany 
 27 | tBodyGyroJerk-mean()-Z | tbodygyrojerkmeanz 
 28 | tBodyGyroJerk-std()-X | tbodygyrojerkstdx 
 29 | tBodyGyroJerk-std()-Y | tbodygyrojerkstdy 
 30 | tBodyGyroJerk-std()-Z | tbodygyrojerkstdz 
 31 | tBodyAccMag-mean() | tbodyaccmagmean 
 32 | tBodyAccMag-std() | tbodyaccmagstd 
 33 | tGravityAccMag-mean() | tgravityaccmagmean 
 34 | tGravityAccMag-std() | tgravityaccmagstd 
 35 | tBodyAccJerkMag-mean() | tbodyaccjerkmagmean 
 36 | tBodyAccJerkMag-std() | tbodyaccjerkmagstd 
 37 | tBodyGyroMag-mean() | tbodygyromagmean 
 38 | tBodyGyroMag-std() | tbodygyromagstd 
 39 | tBodyGyroJerkMag-mean() | tbodygyrojerkmagmean 
 40 | tBodyGyroJerkMag-std() | tbodygyrojerkmagstd 
 41 | fBodyAcc-mean()-X | fbodyaccmeanx 
 42 | fBodyAcc-mean()-Y | fbodyaccmeany 
 43 | fBodyAcc-mean()-Z | fbodyaccmeanz 
 44 | fBodyAcc-std()-X | fbodyaccstdx 
 45 | fBodyAcc-std()-Y | fbodyaccstdy 
 46 | fBodyAcc-std()-Z | fbodyaccstdz 
 47 | fBodyAccJerk-mean()-X | fbodyaccjerkmeanx 
 48 | fBodyAccJerk-mean()-Y | fbodyaccjerkmeany 
 49 | fBodyAccJerk-mean()-Z | fbodyaccjerkmeanz 
 50 | fBodyAccJerk-std()-X | fbodyaccjerkstdx 
 51 | fBodyAccJerk-std()-Y | fbodyaccjerkstdy 
 52 | fBodyAccJerk-std()-Z | fbodyaccjerkstdz 
 53 | fBodyGyro-mean()-X | fbodygyromeanx 
 54 | fBodyGyro-mean()-Y | fbodygyromeany 
 55 | fBodyGyro-mean()-Z | fbodygyromeanz 
 56 | fBodyGyro-std()-X | fbodygyrostdx 
 57 | fBodyGyro-std()-Y | fbodygyrostdy 
 58 | fBodyGyro-std()-Z | fbodygyrostdz 
 59 | fBodyAccMag-mean() | fbodyaccmagmean 
 60 | fBodyAccMag-std() | fbodyaccmagstd 
 61 | fBodyBodyAccJerkMag-mean() | fbodybodyaccjerkmagmean 
 62 | fBodyBodyAccJerkMag-std() | fbodybodyaccjerkmagstd 
 63 | fBodyBodyGyroMag-mean() | fbodybodygyromagmean 
 64 | fBodyBodyGyroMag-std() | fbodybodygyromagstd 
 65 | fBodyBodyGyroJerkMag-mean() | fbodybodygyrojerkmagmean 
 66 | fBodyBodyGyroJerkMag-std() | fbodybodygyrojerkmagstd 


Variable Descriptions - From features_info.txt in source zip file
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
