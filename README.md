# Introduction

This repository contains the data for the assignment in the Coursera "Getting and Cleaning Data" course.

## Files

The repository contains the following files:

* 'README.md': This file that gives an overview over the content of the repository
* 'CodeBook.md': The codebook that describes the variables used in the 'tidy.txt' file.
* 'run_analysis.R': The R program that processes the raw data and produces the 'tidy.txt' file.
* 'tidy.txt': The result file written from the 'run_analysis.R' script.

## Function of the 'run_analysis.R' file

1. When the data Zip file has not already been downloaded it will be downloaded into 'dataset.zip'
2. If the 'dataset.zip' file has not already been unpacked it will be unpacked.
3. All required files are loaded into R.
4. All test data and training data are merged together respectively into merged dataframes.
5. All features with mean() and std() are determined.
5. The names of the features are tidied. That is all spaces, dashes, brackets and commas are removed.
5. Only the measurements for mean and standard deviation are kept from the training data and test data.
6. The activity codes are replaced with the readable description.
7. Feature names, activities, subject ids and measurements are merged into one dataframe.
8. The dataframe is grouped by users and activities.
9. The mean is calculated with respect to the groups from the previous step.
9. The new dataframe is written to file.
