## Getting and Cleaning Data - Coursera - Final Project
### README file

The goal of this README file is to guide you on how the requirements, for the Getting and Cleaning Data course Final Project by Johns Hopkins Univeristy under Cousera was faithfully fulfilled by this author as will be shown momentarily.

Below is the requirements goal for this project.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The R scripts that follows along with its explanations and the steps necessary to execute it is based on the datasets produced as a result of experiment by *Jorge L. Reyes-Ortiz*, *Davide Anguita*, *Alessandro Ghio*, *Luca Oneto* and *Xavier Parra* regarding [Human Activity Recognition Using Smartphones] (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

First thing you need to do is open your `R-Studio` and after successfully opening it then download the zipped file needed for this activity either by clicking on this [link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

or executing the following command in R-Studio

```{r}
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", mode="wb", destfile = "getdata_projectfiles_UCI HAR Dataset.zip")
```

After you successfully downloded the zipped file, you then create a folder named **data** in the current working directory of your R-Studio. However, if you have that directory already skip this step.

Unzipped the **getdata_projectfiles_UCI HAR Dataset.zip** file in your current working directory. Then after that copy or move the extracted **UCI HAR Dataset** folder inside the **data** folder that you created awhile ago.

Now, we are ready to start with the R script. But before we do that make sure that you install `dplyr` package first. However, if you are very sure that it is already installed the `dplyr` then skip this part.

```{r}
install.packages("dplyr")
```

Once you have `dplyr` package installed in your R-Studio then you are now ready to load the `dplyr` package in your R-Studio.

```{r}
suppressMessages(library(dplyr))
```

Now, we could start reading both the train and test data sets (as how it is organized by the researchers). But first we need to start with the **train** data sets and then after that the **test** data sets. The method applied on the former would be exactly the same as with the latter.

So, let's read into a dataset the *x_train* text file which is the performance training sets for 30 volunteer subjects. 

```{r}
x_train <- read.table("data/UCI HAR Dataset/train/x_train.txt")
```

Then also the *y_train* text file which is the activity perform by each subject like *WALKING*, *LAYING*, *STANDING* etc.

```{r}
y_train <- read.table("data/UCI HAR Dataset/train/y_train.txt")
```

Finally, read in also the *subject_train* text file which contain the id number of each subject that match row per row against *x_train* and *y_train* text files.

```{r}
subject_train <- read.table("data/UCI HAR Dataset/train/subject_train.txt")
```

Combine all data sets using `cbind()` since all data sets has equal number of rows (i.e. 7,352) and therefore will match exactly row per row as aforementioned.

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

We could see from above that there are 7,352 observations and 563 variables. The *x_train* file has 561 variables while both the *y_train* and the *subject_train* each have one.

The first column on the above shown table then is the *subject id* and the second column is the *activity id*. The rest of the columns are other measurements from **x_train** file.

Now, as mentioned earlier we are going to read in the **test** data sets next and apply the same method as the train data set.

Read in the `x_test` file.

```{r}
x_test <- read.table("data/UCI HAR Dataset/test/x_test.txt")
```

Next read in the `y_test` file.

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

If you observe the number of columns/variables (i.e. 563) on above table is exactly the same as that of *train* data sets. However, the number of observations is different, namely, theare are 2,947 observations as compared to 7,352 on *train* data sets. This is because this is different set of subjects but more importantly this is approximately 30% of the volunters were assigned to *test* data sets while approximately 70% were assigned to *train* data sets as devised by the researchers. 

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

    V1 V1.1 tBodyAcc-mean()-X tBodyAcc-mean()-Y
    1   1    5         0.2885845      -0.020294171
    2   1    5         0.2784188      -0.016410568
    3   1    5         0.2796531      -0.019467156
    4   1    5         0.2791739      -0.026200646
    5   1    5         0.2766288      -0.016569655
    6   1    5         0.2771988      -0.010097850
    7   1    5         0.2794539      -0.019640776
    8   1    5         0.2774325      -0.030488303
    9   1    5         0.2772934      -0.021750698
    10  1    5         0.2805857      -0.009960298
    .. ..   ..               ...               ...
   Variables not shown: tBodyAcc-mean()-Z (dbl),
   tBodyAcc-std()-X (dbl), tBodyAcc-std()-Y (dbl),
   tBodyAcc-std()-Z (dbl), tBodyAcc-mad()-X (dbl),
   tBodyAcc-mad()-Y (dbl), tBodyAcc-mad()-Z (dbl),
   tBodyAcc-max()-X (dbl), tBodyAcc-max()-Y (dbl)
   
[**Note:** Some of variables under *Variables not shown* I intentionally did not show to save space.]

So, this time we have now a combine of 10,299 observations but with the same number of variables/columns (i.e. 563).

This fulfills the requirement then the first requirement of this project, namely,  *to merge the training and the test sets to create one data set*.

Now, the second task was to *extract only the measurements on the mean and standard deviation for each measurement* from the merged/combine train and test data sets. However, I personally feel that it is more strategic programming-wise to do it later and instead do the task number four (4) which is to *appropriately labels the data set with descriptive variable names*. This is then what we are going to do first.

In order to do that then I need to read-in first all column names stored in **features.txt**.

```{r}
column_names <- read.table("data/UCI HAR Dataset/features.txt")
```
And then use `colnames()` within the `for..loop` to rename the variables/columns for the combine data sets of train and test data sets.

```{r}
for(i in 1:nrow(column_names)) { 
  colnames(test_train_combine)[i+2] <- as.character(column_names[i,2])
}
```

If you observe the index is always offset by 2 columns `[i+2]` since the first two columns is again the `subject id` and the `activity id` as mentioned earlier.

Using then the `colnames()` for *test_train_combine* data sets we could now see that all the variables are now rename accordingly from *features.txt* except of course again the `acitivity id` and the `subject id` which are both not renamed yet as of this instance.

```{r}
> head(colnames(test_train_combine))
```

    [1] "V1"                "V1"               
    [3] "tBodyAcc-mean()-X" "tBodyAcc-mean()-Y"
    [5] "tBodyAcc-mean()-Z" "tBodyAcc-std()-X" 

```{r}
> tail(colnames(test_train_combine))
```
    [1] "angle(tBodyAccJerkMean),gravityMean)"
    [2] "angle(tBodyGyroMean,gravityMean)"    
    [3] "angle(tBodyGyroJerkMean,gravityMean)"
    [4] "angle(X,gravityMean)"                
    [5] "angle(Y,gravityMean)"                
    [6] "angle(Z,gravityMean)"


