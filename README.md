## Getting and Cleaning Data - Coursera - Final Project
### A Run down on run_analysis.R

The R scripts that follows along with its explanations and the steps necessary to execute it is based on the datasets produced as a result of experiment by *Jorge L. Reyes-Ortiz*, *Davide Anguita*, *Alessandro Ghio*, *Luca Oneto* and *Xavier Parra* regarding [Human Activity Recognition Using Smartphones] (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

First thing you need to do is to download either by clicking on this [link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

or executing the following command in R-Studio

```{r}
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", mode="wb", destfile = "getdata_projectfiles_UCI HAR Dataset.zip")
```

After you successfully downloded the zipped file is you create a folder named **data** in the current working directory of your R-Studio. However, if you have that directory already skip this step.

Unzipped the *getdata_projectfiles_UCI HAR Dataset.zip* file in your current working directory. Then after that transfer the **UCI HAR Dataset** under the *data* folder that you created awhile ago (or long ago if you have it already before).

Now, we are ready to start with the R script. But before we do that make sure that you install `dplyr` otherwise if not you need to install it.

```{r}
install.packages("dplyr")
```

