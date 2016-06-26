# Getting-and-Cleaning-Data-Course-Project

The R script, run_analysis.R, does the following:

1.  Load the required library, plyr
2.  Load the acitivity into "activity_lables"
3.  Load the features data and extract the required columns list
4.  Load the training and test datasets into following variables
    - subject_train, x_train, y_train
    - subject_test, x_test, y_test
5.  Replace actvitiy labels in y_train, y_test
6.  Filter required columns for analysis in x_train, x_test
7.  Combine the train and test filter datasets into all_data
8.  Assign labls to all_data
9.  Use ddply() to calculate the means of the analysis columns
10.  Write the result to tidy.txt
