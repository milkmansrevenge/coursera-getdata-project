# coursera-getdata-project
At a high level, the run_analysis.R file performs the following steps:  
1. Downloads the file with the accelerometer data
2. Reads in the test data, including the identifier for the test subject and activity being performed for each observation
3. Reads in the training data, including the identifier for the test subject and activity being performed for each observation
4. Merges the test data and training data set
5. Removes and columns for variables that aren't a mean or standard deviation
6. Adds in the relevant variable names to the column headings
7. Adds in the activity name for each observation by looking up in the activity labels mapping file
8. Calculates the average of each variable for each activity and each subject
9. Saves the table in Step 8 to a text file
