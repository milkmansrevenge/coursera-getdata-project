setwd("C:/Users/Chris/Documents/datasciencecoursera")
dataDir <- "./data"

if(!file.exists(dataDir)) {
  dir.create(dataDir)
}

archiveUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
archive <- paste(dataDir, "/getdata_UCI_HAR.zip", sep = "")

if(!file.exists(archive)) {
  download.file(archiveUrl, destfile = archive, method = "libcurl", mode = "wb")
}

## Load the mapping from activity label to name
activityMapping <- read.table(unz(archive, "UCI HAR Dataset/activity_labels.txt"),
                              col.names = c("ActivityID", "ActivityName"))
activityMapping$ActivityName <- as.character(activityMapping$ActivityName)

## Load the features data (descriptions of the columns in data)
features <- read.table(unz(archive, "UCI HAR Dataset/features.txt"),
                       col.names = c("ColIndex", "FeatureName"))

## Load the test data set
testData <- read.table(unz(archive, "UCI HAR Dataset/test/X_test.txt"))
## Add subject ID for the test data
testData$SubjectID <- read.table(unz(archive, "UCI HAR Dataset/test/subject_test.txt"))[, 1]
## Add activity IDs / class labels for the test data
testData$ActivityID <- read.table(unz(archive, "UCI HAR Dataset/test/y_test.txt"))[, 1]

# Load training data set
trainData <- read.table(unz(archive, "UCI HAR Dataset/train/X_train.txt"))
## Add subject ID for the training data
trainData$SubjectID <- read.table(unz(archive, "UCI HAR Dataset/train/subject_train.txt"))[, 1]
## Add activity ID for the training data
trainData$ActivityID <- read.table(unz(archive, "UCI HAR Dataset/train/y_train.txt"))[, 1]


## Merge test and training data sets
fullData <- rbind(testData, trainData)


## Get the columns with the mean and standard deviation
cols <- grep(".*mean.*|.*std.*", features$FeatureName)
fullData <- fullData[, c(cols, 562, 563)]


## Use descriptive variable names
features <- features[cols, ]
colnames(fullData) <- c(as.character(features$FeatureName), "SubjectID", "ActivityID")


## Add column to data to include the activity name, looking up in activity labels mapping table
fullData$ActivityName <- factor(fullData$ActivityID,
                                levels = activityMapping[,1],
                                labels = activityMapping[,2])

## Average of each variable for each activity and each subject
tidy <- aggregate(fullData, by=list(Activity = fullData$ActivityName, SubjectID=fullData$SubjectID), mean)
## Remove activity name, ID and Subject ID from end of data frame (aggregate function adds columns at the start)
tidy <- tidy[, 1:81]

## Write tidy data set to text file
write.table(tidy, "tidy.txt", row.names = FALSE)
