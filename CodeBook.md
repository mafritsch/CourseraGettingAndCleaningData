# Code Book

This code book describes the data in the file 'tidy.txt'.

#Used data
The data used in this analysis are taken from the 'Human Activity Recognition Using Smartphones Data Set' at 
[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones][http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones].

#Identifiers

The 'tidy.txt' file contains the following identifier:

* users - The id of the subject which performed the measured actions
* activity - Human readable label for the performed activity taken from the 'activity_labels.txt' file.

All other columns contain the mean of the corresponding raw data as described in features_info.txt, calculated per subject and activity.
That is, for example, the entry with the identifier 'tBodyAccmeanX' in the column with 'user=1' and 'activity=walking' contains the mean of the mean of the body acceleration in X-direction of user 1 for all of his walking activities.