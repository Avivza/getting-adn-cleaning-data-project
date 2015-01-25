library(dplyr)

activity<-read.table("activity_labels.txt")             #Reading the Activity data
features<-read.table("features.txt")                    #Reading the Features data

#read test data
setwd("./test")
test_x<-read.table("X_test.txt")
test_y<-read.table("y_test.txt",sep=",")
test_subject<-read.table("subject_test.txt")

setwd("../")                                            #back to the upper directory

#read train data
setwd("./train")
train_x<-read.table("X_train.txt")
train_y<-read.table("y_train.txt",sep=",")
train_subject<-read.table("subject_train.txt")

x<-rbind(test_x,train_x)                                #merging x data of test and train


meancol<-grep("mean()",features[,2])                    #colums that deal with "mean"
stdcol<-grep("std()",features[,2])                      #colums that deals with "STD"
col<-c(meancol,stdcol)                                  #all the colums indexes that deald with mean and std
data<-x[,col]                                           #data from onlu the above colums

y<-rbind(test_y,train_y)                                #merging activity from test and train 
sub<-rbind(test_subject,train_subject)                  #merging subject from test and train 
names(data)<-features[col,2]                            #adding features names
data$Subject<-sub[,1]                                   #adding subjects with the title "Subject"
data$Activity<-y[,1]                                    #adding activities with the title "Activity"
data[,81]<-activity[unlist(data[,81]),2]                #transforming activity numbers to names
grouped_by_Sub_Act<-group_by(data,Subject,Activity)     #grouping data by subject and activity
sec_ds<-summarise_each(grouped_by_Sub_Act,funs(mean))   #summarizing the grouped data


