## Getting and Cleaning Data - Coursera - Final Project
### A Run down on run_analysis.R

The R scripts that follows along with its explanations and the steps necessary to execute the aforementioned script is based on the datasets produced as a result of experiment by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto and Xavier Parra regarding **Human Activity Recognition Using Smartphones**.

First thing you need to do is to download either clicking on this [link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

or executing the following command in R-Studio

```{r}
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", mode="wb", destfile = "getdata_projectfiles_UCI HAR Dataset.zip")
```


