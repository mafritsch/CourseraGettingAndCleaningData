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
3. All required files are loaded into R. These are:
4. The names of the features are tidied. That is all characters are lowercase and spaces, dashes and brackets are removed.
5. The activity codes are replaced with the readable description.
6. Feature names, activities and subjects are combined into one dataframe for training and test data, respectively.
7. Training dataframe and test dataframe are merged into one dataframe.
8. Only the measurements for mean and standard deviation are kept from the merged dataframe.
9. From the dataframe in 8. the result dataframe is created which contains the average of each variable for each activity and each subject.
