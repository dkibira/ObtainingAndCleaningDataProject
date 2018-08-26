# ObtainingAndCleaningDataProject
Asignment on obianing and cleabning data

read X_training data and store in object xdatatr

read y_training data (labels) and store in object ydatatr

read x_test data and store in object xdatatst

read y test data (labels) and store in object ydatatst

read the train subject data  and store in object sbjtrain

read the test subject data and store in object sbjtest

merge the x training and test data sets and store in object xdat

merge the y training and test data sets and store in object ydat

merge the subject files into object sbj

read the features (variables) file for the data store in object ftxt

give names to the data (in xdat) which are provded in the second column of ftxt named V2

rename xdat and call it object xdat.w.names to eliminate confusion in further programing

change the names of variables of sbj and ydat to more readable "subject" and "activity"

determine index of data for detemining the mean

determine the mean column for the data

like wise determine the column of the standard deviation

merge all data by column and store in object newMgData

provide the names of the activities for better reading in the final merged dataset

changing names starting with t to time and f to frequency for better readability

summarize the data using the dplyr package

summary of the data
