## Getting and Cleaning Data - Coursera - Final Project
### README file

The goal of this README file is to guide you not only how to run successfully the **run_analysis.R** file but also on how the requirements, for the Getting and Cleaning Data course Final Project by Johns Hopkins Univeristy under Cousera was successfully fulfilled (using the aforementioned R script) by this author as will be shown momentarily.

Below is the requirements goal for this project.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

This README file then is subdivided mainly into two, namely, running successfully the *run_analysis.R* in your R-studio environment and a very detail run down on every line of code of *run_analysis.R*.

**A. Running r_analysis.R successfully in your R-studio**

+ Open your R-Studio. In my case I am running *R-studio version 0.99.467* and *R version 3.2.1*.
+ Assumming you don't have dataset for this experiment you can either download the zipped file needed for this activity either by clicking on this [link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
+ Or if not you can download it from your R-studio with the following command. 
```{r} 
     download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", mode="wb", destfile = "getdata_projectfiles_UCI HAR Dataset.zip")
```
+ Create a folder named **data** in the current working directory of your R-Studio. However, if you have that directory already skip this step.
+ Unzipped the **getdata_projectfiles_UCI HAR Dataset.zip** file.
+ Copy or move the extracted **UCI HAR Dataset** folder *inside* the **data** folder that you created awhile ago.
+ Install the `dplyr` R packages if you have not done already. In my case I am running `dplyr` *version 0.4.2*
```{r}
    install.packages("dplyr")
```
+ Remove `plyr` package since it could cause error when we call `dplyr` functions that are similar. Although I prefixed my `dplyr` commands with `dplyr::` I don't just want to take chances.
```{r}
   if (is.element("package:plyr", search())) { detach("package:plyr") }
```
+ Download the **run_analysis.R**
+ If you have already a **run_analysis.R** file in your current working directory for your R-Studio, please rename it for the meantime. You can of course re-name my own **run_analysis.R** file into whatever filename you want also.
+ Finally you can `source()` *run_analysis.R* to execute it.
```{r}
    source("run_analysis.R")
```
+ You can view the text file **final_project_measurements_mean.txt** using a text editor (e.g. notepad++). However it is best to view it in `View()` function. But first you need to read-in the text file first then view it.
```{r}
    tidy_data <- read.table("final_project_measurements_mean.txt", header = T)
    View(tidy_data)
```


The R scripts that follows along with its explanations and the steps necessary to execute it is based on the datasets produced as a result of experiment by *Jorge L. Reyes-Ortiz*, *Davide Anguita*, *Alessandro Ghio*, *Luca Oneto* and *Xavier Parra* regarding [Human Activity Recognition Using Smartphones] (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

**B. A line-by-line commentary on r_analysis.R**

First a word of note. Although the main bulk of the script here is found in *run_analysis.R* there are other commands that I added for the purpose of illustration and clarifications on what happened every line of the code. 

So, let's imagine that we run run_analysis.R **line-by-line** and again with added R commands for illustration and clarification.

To make sure that the `dplyr` package is loaded, let's start with the `library()` to load the `dplyr` but we will check first if it is not loaded then we load `dplyr` otherwise the program proceed to the next line.

```{r}
if (is.element("package:dplyr", search())) 
{ 
  suppressMessages(library(dplyr)) 
}
```

Next we need to read-in both the **train** and **test** data sets (as how it is organized by the researchers). But first we need to start with the **train** data sets and then after that the **test** data sets. The method applied on the former would be exactly the same as with the latter.

So, let's read-in to a dataset the *x_train* text file which is the performance training sets for 30 volunteer subjects. 

```{r}
x_train <- read.table("data/UCI HAR Dataset/train/x_train.txt")
```

Then also the *y_train* text file which is the activity perform by each subject like *WALKING*, *LAYING*, *STANDING* etc.

```{r}
y_train <- read.table("data/UCI HAR Dataset/train/y_train.txt")
```

Finally, read-in also the *subject_train* text file which contain the id number of each subject that match row per row against *x_train* and *y_train* text files.

```{r}
subject_train <- read.table("data/UCI HAR Dataset/train/subject_train.txt")
```

We will then combine all data sets using `cbind()` since all data sets has equal number of rows (i.e. 7,352) and therefore will match exactly row-per-row as aforementioned.

```{r}
train_all <- cbind(subject_train, y_train, x_train)
```

Now, using `dplyr`'s `tbl_df`

```{r}
tbl_df(train_all)
```

We have now this preview of the combined data sets of *x_train*, *y_train* and *subject_train*.

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
    Variables not shown: V5 (dbl), V6 (dbl), V7 (dbl), V8
    (dbl), V9 (dbl), V10 (dbl), V11 (dbl), V12 (dbl), V13
    (dbl), V14 (dbl), V15 (dbl), V16 (dbl), V17 (dbl), V18
    (dbl), V19 (dbl), V20 (dbl), V21 (dbl), V22 (dbl), V23

[**Note:** Some of variables under *Variables not shown* I intentionally did not show to save space.]

We could see from above that there are **7,352** observations and **563** variables. The *x_train* file has *561* variables while both the *y_train* and the *subject_train* each have *one*.

The first column on the above shown table then is the *subject id* and the second column is the *activity id*. The rest of the columns are other measurements from **x_train** file.

Now, as mentioned earlier we are going to read-in the **test** data sets next and apply the same method as the **train** data set.

Read-in the `x_test` file.

```{r}
x_test <- read.table("data/UCI HAR Dataset/test/x_test.txt")
```

Next read-in the `y_test` file.

```{r}
y_test <- read.table("data/UCI HAR Dataset/test/y_test.txt")
```

And finally the `subject_test` file.

```{r}
subject_test <- read.table("data/UCI HAR Dataset/test/subject_test.txt")
```
And just like the **train** data sets we need to combine all test files to make up one file for **test** data set.

```{r}
test_all <- cbind(subject_test, y_test, x_test)
```

Now, using `dplyr`'s `tbl_df`

```{r}
tbl_df(test_all)
```

We have now this preview of the combined data sets of *x_test*, *y_test* and *subject_test*.

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
    Variables not shown: V5 (dbl), V6 (dbl), V7 (dbl), V8
    (dbl), V9 (dbl), V10 (dbl), V11 (dbl), V12 (dbl), V13
    (dbl), V14 (dbl), V15 (dbl), V16 (dbl), V17 (dbl), V18

[**Note:** Some of variables under *Variables not shown* I intentionally did not show to save space.]

If you observe the number of columns/variables (i.e. 563) on above table is exactly the same as that of *train* data sets. However, the number of observations is different, namely, theare are **2,947** observations as compared to 7,352 on *train* data sets. This is because it is a different set of subjects but more importantly this is approximately 30% of the volunters were assigned to *test* data sets while approximately 70% were assigned to *train* data sets as devised by the researchers. 

After combining the train and test files separately into one data sets each, it's now time to combine them both. However, it will not be combine column-wise but row-wise since these are separate observations for both train and test data sets with exactly the same number of columns/variables. So, with that we need to use `rbind` command.

```{r}
test_train_combine <- rbind(train_all, test_all)
```

Now, using `dplyr`'s `tbl_df` again.

```{r}
tbl_df(test_train_combine)
```

We have now this preview of the combined data sets of both test and train data sets.

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
   
[**Note:** Some of variables under *Variables not shown* I intentionally did not show to save space.]

So, this time we have now a combine of **10,299** observations but with the same number of variables/columns (i.e. 563).

This fulfills the requirement then for the first requirement of this project, namely,  *to merge the training and the test sets to create one data set*.

Now, the second task was to *extract only the measurements on the mean and standard deviation for each measurement* from the merged/combine train and test data sets. However, I personally feel that it is more strategic programming-wise to do it later and instead do the task number four (4) which is to *appropriately labels the data set with descriptive variable names*. This is then what we are going to do first.

In order to do that then I need to read-in first all column names stored in **features.txt** file.

```{r}
column_names <- read.table("data/UCI HAR Dataset/features.txt")
```
And then use `colnames()` within the `for..loop` to rename the variables/columns for the combine data sets of train and test data sets using *features.txt* which contain all the measurement variables.

```{r}
for(i in 1:nrow(column_names)) { 
  colnames(test_train_combine)[i+2] <- as.character(column_names[i,2])
}
```

If you observe the index is always offset by 2 columns `[i+2]` since the first two columns is again the `subject id` and the `activity id` (as mentioned earlier) and therefore we started at column three (3). Now, it is time to rename the firt two columns (i.e. V1 and V1.1) to `subject_id` and `activity_id`.

```{r}
colnames(test_train_combine)[1:2] <- c("subject_id", "activity_id")
```

Using then the `colnames()` for *test_train_combine* data sets we could now see that all the variables are now rename accordingly from *features.txt* and also now the first two columns are also renamed.

```{r}
 head(colnames(test_train_combine))
```

    [1] "subject_id"        "activity_id"
    [3] "tBodyAcc-mean()-X" "tBodyAcc-mean()-Y"
    [5] "tBodyAcc-mean()-Z" "tBodyAcc-std()-X" 

```{r}
 tail(colnames(test_train_combine))
```
    [1] "angle(tBodyAccJerkMean),gravityMean)"
    [2] "angle(tBodyGyroMean,gravityMean)"    
    [3] "angle(tBodyGyroJerkMean,gravityMean)"
    [4] "angle(X,gravityMean)"                
    [5] "angle(Y,gravityMean)"                
    [6] "angle(Z,gravityMean)"

This now completes task number four (4) which again to *appropriately labels the data set with descriptive variable names*.

Next task would be task number (3) which is to *use descriptive activity names to name the activities in the data set*.
In order to do that we need to read in the **activity labels** file first which contains the activity description (e.g. WALKING, SITTING, STANDING etc) for the experiment.

```{r}
 activity_labels <- read.table("data/UCI HAR Dataset/activity_labels.txt")
```
Rename then variables/column names of *activity_labels* data set for merging later on. 

```{r}
 colnames(activity_labels) <- c("activity_id", "activity_name")
```

Then use `merge()` function to merge both *test_train_combine* and *activity_labels* data sets to now include activity name aside from activity id.

```{r}
 test_train_combine <- merge(test_train_combine, activity_labels)
```

We have now **564** observations in our *test_train_combine* dataset because it now include `activity_name`.

```{r}
dim(test_train_combine)
```
    [1] 10299   564

Now, let's see if *activity_name* values are now included in our data set as required for requirement number three (3) on this project.

```{r}
head(test_train_combine[,c("subject_id","activity_id","activity_name")])
```

    subject_id activity_id activity_name
             7           1       WALKING
             5           1       WALKING
             6           1       WALKING
            23           1       WALKING
             7           1       WALKING
             7           1       WALKING

```{r}
tail(test_train_combine[,c("subject_id","activity_id","activity_name")])
```

    subject_id activity_id activity_name
             4           6        LAYING
            17           6        LAYING
            20           6        LAYING
            17           6        LAYING
            24           6        LAYING
            12           6        LAYING
           
As we could see activity names now are descriptive and that now then meets the requirement for task number three (3).

Now, let's move on to the penultimate task, namely, task number two (2) which is to *extract only the measurements on the mean and standard deviation for each measurement*.

First since we need to only extract measurement that has mean and standard deviation tag on it then we will use `grep()` function in order to get those variables that has either `mean()` or `std()` tags.

```{r}
col_mean_std <- grep("std()|mean()", colnames(test_train_combine))
```

Using the extracted index numbers above for the variables/column names we desired, we then extract all those variables/columns from the *test_train_combine* data sets.

```{r}
test_train_extract <- test_train_combine[ ,c(1:2,col_mean_std,564)]
```

Now, using `dplyr`'s `tbl_df` again to view our new extracted data sets.

```{r}
tbl_df(test_train_extract)
```

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

If you observe we have the same number of observations as the original combine data sets however we have fewer variables/columns, namely, **82** of them including the *activity_id*, *subject_id* and *activity_name* at the end.

To be specific we now have these columns.

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

Now, we don't need activity_id anymore since we have now *activity_name*. This is also in preparation for a tidy data set not to mention that it violates the 3NF (3rd normal form) in relational database theory which says that there should be no transitional dependence on non-keys to other non-keys. In this case *activity_name* is transitionally dependent on *activity_id* instead of directly depedent on the primary key although imaginary at this point and optional for this project.

So, we need to remove *activity_id* variable then from our latest data set.

```{r}
test_train_extract <- test_train_extract[,-match("activity_id",colnames(test_train_extract))]
```

Using `dim()` we can now see that we are left with **81** variables/columns from 82 before this.

```{r}
dim(test_train_extract)
```
    [1] 10299    81

This now concludes task number two (2) whic again to *extract only the measurements on the mean and standard deviation for each measurement*.

So, for the final task which is to *creates a second, independent tidy data set with the average of each variable for each activity and each subject* we will now proceed.

Our goal then is that we need to create a unique combination of both *activity name* and *subject* to meet one of the criteria set by [Hadley Wickham](http://vita.had.co.nz/papers/tidy-data.pdf) on his paper regarding tidy data that **each observation forms a row**.

In order to do that we need to group according to `activity_name` and `subject_id` and then compute the average for all measurements. With that we could use `dplyr`'s `group_by()` to group by *activity name* and *subject id* and then `summary_each()` in order to hit two birds with one stone so to speak.

```{r}
test_train_measurements_mean <- dplyr::summarise_each(dplyr::group_by(test_train_extract, activity_name, subject_id),funs(mean))
```

Using `dim()` we have now **180** observations with **81** variables/columns.

```{r}
dim(test_train_measurements_mean)
```
    [1] 180  81

Since, there are 6 possible activities (e.g. WALKING, SITTING, LAYING, STANDING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS) and since there are 30 subjects on this experiment therefore we have 180 (i.e. 6 x 30) unique combinations of activity and subject which meets one of the criteria for tidy data set that *each observation forms a row*. Additionally, it meets the requirement for this project which is to group the tidy data set by *activity name* and *subject id*.

Now, let's view our final data set using `head()` and `tail()`.

```{r}
head(test_train_measurements_mean)
```

    activity_name subject_id  tBodyAcc-mean()-X
           LAYING          1          0.2215982
           LAYING          2          0.2813734
           LAYING          3          0.2755169
           LAYING          4          0.2635592
           LAYING          5          0.2783343
           LAYING          6          0.2486565

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

You can also use `View()` to view the whole final data set although some columns will not be included.

```{r}
View(test_train_measurements_mean)
```
    
As we can see every unique pair of activity and subject is represented along with the corresponding measurements for each.

Now, one of the criteria for tidy data set according to Wickham again is that **each type of observational unit forms a table** also was meet with this table. Since this is all about *Human Activity Recognition Using Smartphones* then this contitues one table that comprises all the observations therein. However, if there also activities of an animal that was observed then that would constitute a separate table and if included here would not meet the aforementioned criteria.
Finally, one of the criteria of tidy data set according to Wickham again is that **each variable forms a colum**. In this regard this could be debatable and probably could be argued convincingly in both ends. However, since one of the criteria of a tidy data as set by the Professor on this subject, namely, that either wide or long form is acceptable as data set. Then it could be argued that this meets the criteria of a **WIDE** form tidy data set. We can make make it to a narrow form but its success to make it tidy could be elusive. For example we could put together those variables/columns that has vectors X,Y and Z. However, there are variables/columns that has no vectors and that could spell disaster observations-wise because the number of observations of those having vectors is at least three times larger than those have none. Secondly, we could probably merge according to time and frequency domains. But it could mean creating two tables separately for two observations and that could violate rule for a tidy data, namely, that *each type of observational unit forms a table*.

Now, for the final line of our code we have to write to a text file.

```{r}
write.table(test_train_measurements_mean, file = "final_project_measurements_mean.txt", row.names = FALSE)
```

As noted ealier on this document you can view the text file **final_project_measurements_mean.txt** using a text editor (e.g. notepad++) or you can view it in `View()` function after reading-in the text file.

```{r}
    tidy_data <- read.table("final_project_measurements_mean.txt", header = T)
    View(tidy_data)
```
