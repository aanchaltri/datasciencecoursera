y_test<-read.table("E:/Coursera/RWorkDir/UCI HAR Dataset/test/y_test.txt")
subject_test<-read.table("E:/Coursera/RWorkDir/UCI HAR Dataset/test/subject_test.txt")
newtest<-cbind(y_test,subject_test)
names(newtest)[1]<-"activity"
names(newtest)[2]<-"subject"

y_train<-read.table("E:/Coursera/RWorkDir/UCI HAR Dataset/train/y_train.txt")
subject_train<-read.table("E:/Coursera/RWorkDir/UCI HAR Dataset/train/subject_train.txt")
newtrain<-cbind(y_train,subject_train)
names(newtrain)[1]<-"activity"
names(newtrain)[2]<-"subject"

newtesttrian<-merge(newtest,newtrain,all=TRUE)

testa<-read.table("E:/Coursera/RWorkDir/UCI HAR Dataset/test/X_test.txt")
traina<-read.table("E:/Coursera/RWorkDir/UCI HAR Dataset/train/X_train.txt")
mergeddata<-merge(testa,traina,all=TRUE)


feature<-read.table("E:/Coursera/RWorkDir/UCI HAR Dataset/features.txt")
Mnewfeature<-grep("\\mean\\(\\)",feature$V2)
Snewfeature<-grep("\\Std\\(\\)",feature$V2)

newmerged<-subset(mergeddata,select=c(1,2,3,41,42,43,81,82,83,121,122,123,
161,162,163,201,214,227,240,253,266,267,268,345,346,347,424,425,426,503,516,
529,542,4,5,6,44,45,46,84,85,86,124,125,126,164,165,166,202,215,228,241,254,
269,270,271,348,349,350,427,428,429,504,517,530,543))

colnames(newmerged)<-c("tBodyAcc-mean()-X",
                      "tBodyAcc-mean()-Y",
                      "tBodyAcc-mean()-Z",
                      "tBodyAcc-std()-X",
                      "tBodyAcc-std()-Y",
                      "tBodyAcc-std()-Z",
                      "tGravityAcc-mean()-X",
                      "tGravityAcc-mean()-Y",
                      "tGravityAcc-mean()-Z",
                      "tGravityAcc-std()-X",
                      "tGravityAcc-std()-Y",
                      "tGravityAcc-std()-Z",
                      "tBodyAccJerk-mean()-X",
                      "tBodyAccJerk-mean()-Y",
                      "tBodyAccJerk-mean()-Z",
                      "tBodyAccJerk-std()-X",
                      "tBodyAccJerk-std()-Y",
                      "tBodyAccJerk-std()-Z",
                      "tBodyGyro-mean()-X",
                      "tBodyGyro-mean()-Y",
                      "tBodyGyro-mean()-Z",
                      "tBodyGyro-std()-X",
                      "tBodyGyro-std()-Y",
                      "tBodyGyro-std()-Z",
                      "tBodyGyroJerk-mean()-X",
                      "tBodyGyroJerk-mean()-Y",
                      "tBodyGyroJerk-mean()-Z",
                      "tBodyGyroJerk-std()-X",
                      "tBodyGyroJerk-std()-Y",
                      "tBodyGyroJerk-std()-Z",
                      "tBodyAccMag-mean()",
                      "tBodyAccMag-std()",
                      "tGravityAccMag-mean()",
                      "tGravityAccMag-std()",
                      "tBodyAccJerkMag-mean()",
                      "tBodyAccJerkMag-std()",
                      "tBodyGyroMag-mean()",
                      "tBodyGyroMag-std()",
                      "tBodyGyroJerkMag-mean()",
                      "tBodyGyroJerkMag-std()",
                      "fBodyAcc-mean()-X",
                      "fBodyAcc-mean()-Y",
                      "fBodyAcc-mean()-Z",
                      "fBodyAcc-std()-X",
                      "fBodyAcc-std()-Y",
                      "fBodyAcc-std()-Z",
                      "fBodyAccJerk-mean()-X",
                      "fBodyAccJerk-mean()-Y",
                      "fBodyAccJerk-mean()-Z",
                      "fBodyAccJerk-std()-X",
                      "fBodyAccJerk-std()-Y",
                      "fBodyAccJerk-std()-Z",
                      "fBodyGyro-mean()-X",
                      "fBodyGyro-mean()-Y",
                      "fBodyGyro-mean()-Z",
                      "fBodyGyro-std()-X",
                      "fBodyGyro-std()-Y",
                      "fBodyGyro-std()-Z",
                      "fBodyAccMag-mean()",
                      "fBodyAccMag-std()",
                      "fBodyBodyAccJerkMag-mean()",
                      "fBodyBodyAccJerkMag-std()",
                      "fBodyBodyGyroMag-mean()",
                      "fBodyBodyGyroMag-std()",
                      "fBodyBodyGyroJerkMag-mean()",
                      "fBodyBodyGyroJerkMag-std()")
newtesttrian$activity[newtesttrian$activity %in% "1"]<-"WALKING"
newtesttrian$activity[newtesttrian$activity %in% "2"]<-"WALKING_UPSTAIRS"
newtesttrian$activity[newtesttrian$activity %in% "3"]<-"WALKING_DOWNSTAIRS"
newtesttrian$activity[newtesttrian$activity %in% "4"]<-"SITTING"
newtesttrian$activity[newtesttrian$activity %in% "5"]<-"STANDING"
newtesttrian$activity[newtesttrian$activity %in% "6"]<-"LAYING"
finalmerge<-cbind(newmerged,newtesttrian)

Amelt<-melt(finalmerge,id=(c("subject","activity")))

Mean_subject<-cast(Amelt,subject~variable,mean)
Mean_Activity<-cast(Amelt,activity~variable,mean)




