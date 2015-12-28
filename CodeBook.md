# Code book for tidy.txt
  
  
## Study design
The data set was obtained to complete an assignment in week three of the Getting and Cleaning Data Coursera Course [1].
The raw data set was from a link provided by the course [2] but originally came from Anguita et al. [3].
For more detail on how the raw data was collected see the UCI Machine Learning Repository Page [4].
It was split up into test data and training data but was merged as part of the assignment.
  
## Description of variables

The tidy data is the average of each variable for each activity and each subject from the data set collected by Anguita et al.
  
* Activity
  * The name of the activity being performed in this observation
  * There are six activities in total: Walking, walking upstairs, walking downstairs, sitting, standing, laying
* SubjectID
  * The ID of the subject performing the activity
  * There are thirty subjects in total, numbered from 1 through to 30
* The other 80 variables are averages of what was collected by Anguita et al., see [4] for a detailed explanation
  
## References  
[1] https://www.coursera.org/learn/data-cleaning  
[2] https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
[3] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012  
[4] http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
