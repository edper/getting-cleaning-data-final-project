## Codebook for Getting and Cleaning Data Final Project

###Experimental Design and Background###

The experimental design and background is taken from the [source](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) of this study regarding the study of **Human Activity Recognition Using Smartphones** done by *Jorge L. Reyes-Ortiz*, *Davide Anguita*, *Alessandro Ghio*, *Luca Oneto* and *Xavier Parra*. And to quote from the source:

*"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.*

*The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain."*


###Raw Data###

The source data could be donwloaded from this [link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) which approximately **61MB** in size.

There are several files on the above zipped file. But it is mainly divided into two groups of files as per the design of this study, namely, the **train** and **test** data sets. For example the **x_train.txt** and **x_test.txt** contains the performance sets of the 70% and 30% of the subjects respectively.  And the **y_train.txt** and **y_test.txt** contains the sets of activity perform by agai 70% and 30% of the subjects respectively. As mentioned above there are 30 subjects on this experiments. Also **activity_label.txt** contains the activity description of the subject, namely, *WALKING*, *WALKING_UPSTAIRS*, *WALKING_DOWNSTARS*, *SITTING*, *STANDING* and *LAYING*. 

The measurement variables are group according to **time** and **frequency** domains. Thus variable names under time domain is prefixed with letter 't' and variable names under frequency domain are prefixed with letter 'f'. Both under time and frequency domains there are four major group of measurements, namely, **3-axial linear accelerations**, **3-axial angular velocity**, **body jerks** and the **magnitude** of the three dimensional signals. Accelerations (which is the rate of velocity with respect to time) are measured in **m/s** (meter per second) in which gravitational force 'g' (9.8 m/s^2) is deducted for accuracy. Angular velocity is measured in **radians per second**.

**Measurement abbreviations meaning**

The researcher of this study uses abbreviations to for naming their measurement variables/columns (561 of them). And below are the meaning of each abbreviations.

    t             ->  Time Domain
    f             ->  Frequency Domain
    Body          ->  Human body
    Acc           ->  Acceleration
    Jerk          ->  Human body jerk
    Gyro          ->  Gyroscope
    Mag           ->  Magnitude
    Gravity       ->  Gravitational pull
    X/Y/Z         ->  refers to the direction of movements which either in X-axis, Y-axis or Z-axis
    mean()        ->  Mean value
    std()         ->  Standard deviation
    mad()         ->  Median absolute deviation 
    max()         ->  Largest value in array
    min()         ->  Smallest value in array
    sma()         ->  Signal magnitude area
    energy()      ->  Energy measure. Sum of the squares divided by the number of values. 
    iqr()         ->  Interquartile range 
    entropy()     ->  Signal entropy
    arCoeff()     ->  Autorregresion coefficients with Burg order equal to 4
    correlation() ->  Correlation coefficient between two signals
    maxInds()     ->  Index of the frequency component with largest magnitude
    meanFreq()    ->  Weighted average of the frequency components to obtain a mean frequency
    skewness()    ->  Skewness of the frequency domain signal 
    kurtosis()    ->  Kurtosis of the frequency domain signal 
    bandsEnergy() ->  Energy of a frequency interval within the 64 bins of the FFT of each window.
    angle()       ->  Angle between two vectors
    

    
###The process of obtaining the tidy data###

After downloading the zipped file as mentioned above I started working on files needed for each set (i.e. train and test sets). I first merged **x_train.txt** (which is the performance training sets for 30 subjects), **y_train.txt** (which is the activity performed by each subject) and **subject_train.txt** (which is the subject info). After merging the three files for training sets, I got the following result below which has 7,352 observations and 563 variables (including subject id and activity id).

     Source: local data frame [7,352 x 563]

     V1 V1.1      V1.2           V2         V3         V4
     1   1    5 0.2885845 -0.020294171 -0.1329051 -0.9952786
     2   1    5 0.2784188 -0.016410568 -0.1235202 -0.9982453
     3   1    5 0.2796531 -0.019467156 -0.1134617 -0.9953796
     4   1    5 0.2791739 -0.026200646 -0.1232826 -0.9960915
     5   1    5 0.2766288 -0.016569655 -0.1153619 -0.9981386
     6   1    5 0.2771988 -0.010097850 -0.1051373 -0.9973350
     7   1    5 0.2794539 -0.019640776 -0.1100221 -0.9969210
     8   1    5 0.2774325 -0.030488303 -0.1253604 -0.9965593
     9   1    5 0.2772934 -0.021750698 -0.1207508 -0.9973285
     10  1    5 0.2805857 -0.009960298 -0.1060652 -0.9948034
     .. ..   ..       ...          ...        ...        ...


I did the same also for the test sets merging the three files (i.e. x_text.txt, y_test.txt, subject_test.txt) accordingly. And I got the following results below which has 2,947 observations and still 563 variables.

     Source: local data frame [2,947 x 563]

     V1 V1.1      V1.2          V2          V3         V4
     1   2    5 0.2571778 -0.02328523 -0.01465376 -0.9384040
     2   2    5 0.2860267 -0.01316336 -0.11908252 -0.9754147
     3   2    5 0.2754848 -0.02605042 -0.11815167 -0.9938190
     4   2    5 0.2702982 -0.03261387 -0.11752018 -0.9947428
     5   2    5 0.2748330 -0.02784779 -0.12952716 -0.9938525
     6   2    5 0.2792199 -0.01862040 -0.11390197 -0.9944552
     7   2    5 0.2797459 -0.01827103 -0.10399988 -0.9958192
     8   2    5 0.2746005 -0.02503513 -0.11683085 -0.9955944
     9   2    5 0.2725287 -0.02095401 -0.11447249 -0.9967841
     10  2    5 0.2757457 -0.01037199 -0.09977589 -0.9983731
     .. ..   ..       ...         ...         ...        ...

And then merge the two row-by-row and got the total of 10,299 observations and having 563 variables.

    Source: local data frame [10,299 x 563]

    V1 V1.1      V1.2           V2         V3         V4
    1   1    5 0.2885845 -0.020294171 -0.1329051 -0.9952786
    2   1    5 0.2784188 -0.016410568 -0.1235202 -0.9982453
    3   1    5 0.2796531 -0.019467156 -0.1134617 -0.9953796
    4   1    5 0.2791739 -0.026200646 -0.1232826 -0.9960915
    5   1    5 0.2766288 -0.016569655 -0.1153619 -0.9981386
    6   1    5 0.2771988 -0.010097850 -0.1051373 -0.9973350
    7   1    5 0.2794539 -0.019640776 -0.1100221 -0.9969210
    8   1    5 0.2774325 -0.030488303 -0.1253604 -0.9965593
    9   1    5 0.2772934 -0.021750698 -0.1207508 -0.9973285
    10  1    5 0.2805857 -0.009960298 -0.1060652 -0.9948034
    .. ..   ..       ...          ...        ...        ...
    Variables not shown: V5 (dbl), V6 (dbl), V7 (dbl), V8
    (dbl), V9 (dbl), V10 (dbl), V11 (dbl), V12 (dbl), V13
    (dbl), V14 (dbl), V15 (dbl), V16 (dbl), V17 (dbl), V18

I then rename all columns based on *features.txt* file and manually as well for *subject_id* and *activity_id*. And after that I need to include the activity description (e.g. WALKING, SITTING etc) instead of just the *activity_id* using *activity_labels.txt*. Then finally I need to filter only those variables that has mean and standard deviation labels in which left me with **82** variables as shown below. However, **79** of which are the measurement variables.

    Source: local data frame [10,299 x 82]

    activity_id subject_id tBodyAcc-mean()-X
              1          7         0.3016485
              1          5         0.3433592
              1          6         0.2696745
              1         23         0.2681938
              1          7         0.3141912
              1          7         0.2032763
              1         11         0.2590250
              1          6         0.1992710
              1         10         0.1844691
              1         11         0.2523332
    ..         ...        ...               ...
    Variables not shown: tBodyAcc-mean()-Y (dbl),
    tBodyAcc-mean()-Z (dbl), tBodyAcc-std()-X (dbl),
    tBodyAcc-std()-Y (dbl), tBodyAcc-std()-Z (dbl),
    ..         ...        ...               ...
    fBodyBodyGyroJerkMag-meanFreq() (dbl), activity_name
    (fctr)
    
Below are the **82** extracted variables ready for tidy data set.

    [1] "activity_id"                    
    [2] "subject_id"                     
    [3] "tBodyAcc-mean()-X"              
    [4] "tBodyAcc-mean()-Y"              
    [5] "tBodyAcc-mean()-Z"              
    [6] "tBodyAcc-std()-X"               
    [7] "tBodyAcc-std()-Y"               
    [8] "tBodyAcc-std()-Z"               
    [9] "tGravityAcc-mean()-X"           
    [10] "tGravityAcc-mean()-Y"           
    [11] "tGravityAcc-mean()-Z"           
    [12] "tGravityAcc-std()-X"            
    [13] "tGravityAcc-std()-Y"            
    [14] "tGravityAcc-std()-Z"            
    [15] "tBodyAccJerk-mean()-X"          
    [16] "tBodyAccJerk-mean()-Y"          
    [17] "tBodyAccJerk-mean()-Z"          
    [18] "tBodyAccJerk-std()-X"           
    [19] "tBodyAccJerk-std()-Y"           
    [20] "tBodyAccJerk-std()-Z"           
    [21] "tBodyGyro-mean()-X"             
    [22] "tBodyGyro-mean()-Y"             
    [23] "tBodyGyro-mean()-Z"             
    [24] "tBodyGyro-std()-X"              
    [25] "tBodyGyro-std()-Y"              
    [26] "tBodyGyro-std()-Z"              
    [27] "tBodyGyroJerk-mean()-X"         
    [28] "tBodyGyroJerk-mean()-Y"         
    [29] "tBodyGyroJerk-mean()-Z"         
    [30] "tBodyGyroJerk-std()-X"          
    [31] "tBodyGyroJerk-std()-Y"          
    [32] "tBodyGyroJerk-std()-Z"          
    [33] "tBodyAccMag-mean()"             
    [34] "tBodyAccMag-std()"              
    [35] "tGravityAccMag-mean()"       
    [36] "tGravityAccMag-std()"           
    [37] "tBodyAccJerkMag-mean()"         
    [38] "tBodyAccJerkMag-std()"          
    [39] "tBodyGyroMag-mean()"            
    [40] "tBodyGyroMag-std()"             
    [41] "tBodyGyroJerkMag-mean()"        
    [42] "tBodyGyroJerkMag-std()"         
    [43] "fBodyAcc-mean()-X"              
    [44] "fBodyAcc-mean()-Y"              
    [45] "fBodyAcc-mean()-Z"              
    [46] "fBodyAcc-std()-X"               
    [47] "fBodyAcc-std()-Y"               
    [48] "fBodyAcc-std()-Z"               
    [49] "fBodyAcc-meanFreq()-X"          
    [50] "fBodyAcc-meanFreq()-Y"          
    [51] "fBodyAcc-meanFreq()-Z"          
    [52] "fBodyAccJerk-mean()-X"          
    [53] "fBodyAccJerk-mean()-Y"          
    [54] "fBodyAccJerk-mean()-Z"          
    [55] "fBodyAccJerk-std()-X"           
    [56] "fBodyAccJerk-std()-Y"           
    [57] "fBodyAccJerk-std()-Z"           
    [58] "fBodyAccJerk-meanFreq()-X"      
    [59] "fBodyAccJerk-meanFreq()-Y"      
    [60] "fBodyAccJerk-meanFreq()-Z"      
    [61] "fBodyGyro-mean()-X"             
    [62] "fBodyGyro-mean()-Y"             
    [63] "fBodyGyro-mean()-Z"             
    [64] "fBodyGyro-std()-X"              
    [65] "fBodyGyro-std()-Y"              
    [66] "fBodyGyro-std()-Z"              
    [67] "fBodyGyro-meanFreq()-X"         
    [68] "fBodyGyro-meanFreq()-Y"         
    [69] "fBodyGyro-meanFreq()-Z"         
    [70] "fBodyAccMag-mean()"             
    [71] "fBodyAccMag-std()"              
    [72] "fBodyAccMag-meanFreq()"         
    [73] "fBodyBodyAccJerkMag-mean()"     
    [74] "fBodyBodyAccJerkMag-std()"      
    [75] "fBodyBodyAccJerkMag-meanFreq()" 
    [76] "fBodyBodyGyroMag-mean()"        
    [77] "fBodyBodyGyroMag-std()"         
    [78] "fBodyBodyGyroMag-meanFreq()"    
    [79] "fBodyBodyGyroJerkMag-mean()"    
    [80] "fBodyBodyGyroJerkMag-std()"     
    [81] "fBodyBodyGyroJerkMag-meanFreq()"
    [82] "activity_name"

Again those variables that has *'Acc'* for Accelerations are measured in terms of **meters per second** (m/s) and those variables that have *'Gyro'* for angular velocity are measured in **radians per second**.

Before computing the summary of these variables above *activity_id* has to be removed first because we have now *activity_name* as shown above.

Finally, we need to compute the average or mean of the **79** measurement variables group by **activity_name** and **subject_id**. Using `summary_each()` function along with `group_by()` in `dplyr` we come up with the summary all extracted measurement variables again group according to **activity_name** and **subject_id**.

```{r}
test_train_measurements_mean <- dplyr::summarise_each(dplyr::group_by(test_train_extract, activity_name, subject_id),funs(mean))
```

With that we are left with 180 observations and 81 variables. The 180 is the number of activities (6) in combination with the number of subjects (30) or 6 x 30. We therefore got the summary of all extracted variables group by *activity_name* and *subject_id*. Along with that we computed the average or `mean()` of all the 79 measurement variables as shown above.

Source: local data frame [180 x 81]

      activity_name subject_id tBodyAcc-mean()-X
      1         LAYING          1         0.2215982
      2         LAYING          2         0.2813734
      3         LAYING          3         0.2755169
      4         LAYING          4         0.2635592
      5         LAYING          5         0.2783343
      6         LAYING          6         0.2486565
      7         LAYING          7         0.2501767
      8         LAYING          8         0.2612543
      9         LAYING          9         0.2591955
      10        LAYING         10         0.2802306
      ..           ...        ...               ...
      Variables not shown: tBodyAcc-mean()-Y (dbl),
      tBodyAcc-mean()-Z (dbl), tBodyAcc-std()-X (dbl),
      tBodyAcc-std()-Y (dbl), tBodyAcc-std()-Z (dbl),

Looking at the bottom part of the data set we have.

```{r}
tail(test_train_measurements_mean)
```

    activity_name subject_id tBodyAcc-mean()-X
    WALKING_UPSTAIRS      25         0.2779954
    WALKING_UPSTAIRS      26         0.2726914
    WALKING_UPSTAIRS      27         0.2657703
    WALKING_UPSTAIRS      28         0.2620058
    WALKING_UPSTAIRS      29         0.2654231
    WALKING_UPSTAIRS      30         0.2714156

This then match the requirement for a tidy data which says  **each variable forms a column**, **each observation forms a row** and **each type of observational unit forms a table**. And this is specifically a **WIDE** form of tidy data. (Note: (See README.md for detail explanation on why this is a tidy data)


###Reference###

*Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.*

Wickham, H. (2014, September 10). Tidy Data. Retrieved August 23, 2015, from http://vita.had.co.nz/papers/tidy-data.pdf 

