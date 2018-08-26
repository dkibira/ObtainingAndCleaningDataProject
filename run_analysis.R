
#set working directory
setwd("c:\\.............\\data")
# read X_training data and store in object xdatatr
xdatatr <- read.table("X_train.txt",sep="")

# read y_training data (labels) and store in object ydatatr
ydatatr <- read.table("y_train.txt",sep="")

# read x_test data and store in object xdatatst
xdatatst <- read.table("X_test.txt",sep="")

# read y test data (labels) and store in object ydatatst
ydatatst <- read.table("y_test.txt",sep="")

# read the train subject data  and store in object sbjtrain
sbjtrain <- read.table("subject_train.txt",sep="")

# read the test subject data and store in object sbjtest
sbjtest <- read.table("subject_test.txt",sep="")

# merge the x training and test data sets and store in object xdat
xdat <- rbind(xdatatr,xdatatst)

# merge the y training and test data sets and store in object ydat
ydat <- rbind(ydatatr,ydatatst)

# merge the subject files into object sbj
sbj <- rbind(sbjtrain,sbjtest)

# read the features (variables) file for the data store in object ftxt
ftxt <- read.table("features.txt", sep="")

# give names to the data (in xdat) which are provded in the second column of ftxt named V2
names(xdat) <- ftxt$V2

# rename xdat and call it object xdat.w.names to eliminate confusion in further programing
xdat.w.names <- xdat

# change the names of variables of sbj and ydat to more readable "subject" and "activity"
names(sbj) <- c("subject")
names(ydat) <- c("activity")

# determine index of data for detemining the mean
indx <- grepl("mean", colnames(xdat.w.names))

# determine the mean column for the data
xdata_mean <- xdat.w.names[indx]

# like wise determine the column of the standard deviation
indx1 <- grepl("std", colnames(xdat.w.names))
xdata_std <- xdat.w.names[indx1]

# merge all data by column and store in object newMgData
newMgData <- cbind(sbj, ydat, xdata_mean, xdata_std)

# provide the names of the activities for better reading in the final merged dataset
i <- 0
for (i in 1:nrow(newMgData)) {
	if (newMgData$activity[i] == 1){
		newMgData$activity[i] <- "WALKING"
	}else if (newMgData$activity[i] == 2){
		newMgData$activity[i] <- "WALKING_UPSTAIRS"
	}else if (newMgData$activity[i] == 3){
		newMgData$activity[i] <- "WALKING_DOWNSTAIRS"
	}else if (newMgData$activity[i] == 4){
		newMgData$activity[i] <- "SITTING"
	}else if (newMgData$activity[i] == 5){
		newMgData$activity[i] <- "STANDING"
	}else {
		newMgData$activity[i] <- "LAYING"
	}
}

# changing names starting with t to time and f to frequency for better readability
library(stringr)
tNames <- sub("^t","time.", colnames(newMgData))
ftNames <- sub("^f","freq.", tNames)
names(newMgData) <- ftNames

# view the top 6 data items
head(newMgData)

# summarize the data using the dplyr package
install.packages("dplyr")
library(dplyr)

# summary of the data
tidyData <- newMgData %>%
group_by(subject, activity) %>%
summarize_all(funs(mean))

# view the head of the data
head(tidyData)

# wwrite the final tidy data to file "tidyData.csv"

write.table (tidyData, file="tidyData.txt", row.name=FALSE)
