library(sqldf)

features<-read.table("UCI HAR Dataset/features.txt")
features2<-as.vector(features[,2])
#read training set data
subject_train<-read.table("UCI HAR Dataset/train/subject_train.txt",col.names="subject")
X_train<-read.table("UCI HAR Dataset/train/X_train.txt",col.names=features2)
Y_train<-read.table("UCI HAR Dataset/train/Y_train.txt",col.names="Y")
#merge training dataset
train<-cbind(subject_train,Y_train,X_train)

#read test set data
subject_test<-read.table("UCI HAR Dataset/test/subject_test.txt",col.names="subject")
X_test<-read.table("UCI HAR Dataset/test/X_test.txt",col.names=features2)
Y_test<-read.table("UCI HAR Dataset/test/Y_test.txt",col.names="Y")
#merge test dataset
test<-cbind(subject_test,Y_test,X_test)

#test uniqueness subject_ID's training and test set
unique(train$subject)
unique(test$subject)
match(unique(train$subject),unique(test$subject))
#no overlap between subject_ID's, can just merge the 2 files

#merge training and test sets
raw_data<-rbind(train,test)


#extract columns containing "std" or "mean"
columns<-colnames(raw_data)
lookup1<-"mean()"
lookup_mean<-grep(lookup1,colnames(raw_data))
lookup2<-"std()"
lookup_std<-grep(lookup2,colnames(raw_data))
lookup3<-c(1,lookup_mean,lookup_std)
tidy_data_1<-raw_data[,lookup3]

#calculate the average of all measurements per subject, remove the group column (which is created automaticly)
tidy_data_2<-aggregate(tidy_data_1, by=list(tidy_data_1$subject), FUN=mean)[,-1]

write.table(tidy_data_2,"tidy_data_2.txt")
