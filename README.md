## Getting and Cleaning Data - Coursera - Final Project
### A Run down on run_analysis.R

The R scripts that follows along with its explanations and the steps necessary to execute it is based on the datasets produced as a result of experiment by *Jorge L. Reyes-Ortiz*, *Davide Anguita*, *Alessandro Ghio*, *Luca Oneto* and *Xavier Parra* regarding [Human Activity Recognition Using Smartphones] (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

First thing you need to do is open your `R-Studio` and after that download the zipped file needed for this activity either by clicking on this [link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

or executing the following command in R-Studio

```{r}
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", mode="wb", destfile = "getdata_projectfiles_UCI HAR Dataset.zip")
```

After you successfully downloded the zipped file, you then create a folder named **data** in the current working directory of your R-Studio. However, if you have that directory already skip this step.

Unzipped the **getdata_projectfiles_UCI HAR Dataset.zip** file in your current working directory. Then after that copy or transfer the extracted **UCI HAR Dataset** folder inside the **data** folder that you created awhile ago (or long ago if you have it already before).

Now, we are ready to start with the R script. But before we do that make sure that you install `dplyr` package first otherwise if not you need to install it.

```{r}
install.packages("dplyr")
```

If you are sure that you have `dplyr` package installed in your R-Studio then you are now ready to load the `dplyr` package in your R-Studio.

```{r}
suppressMessages(library(dplyr))
```

Read into a dataset the *x_train* text file which is the performance training sets for 30 volunteer subjects. 

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

Using `dplyr`'s `tbl_df`

```{r}
tbl_df(train_all)
```

I have this preview of the combined data sets of *x_train*, *y_train* and *subject_train*.

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

