### Program assumes the data is in the current working directory
### fn = "getdata-projectfiles-UCI HAR Dataset.zip"
fn<-"getdata-projectfiles-UCI HAR Dataset.zip"


### Unzip to working directory
unzip(fn)


### Read Training Data
xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt",header=FALSE)
ytrain <- read.table("./UCI HAR Dataset/train/Y_train.txt",header=FALSE)


### Read Test Data
xtest <- read.table("./UCI HAR Dataset/test/X_test.txt",header=FALSE)
ytest <- read.table("./UCI HAR Dataset/test/Y_test.txt",header=FALSE)


### Read Activity Labels
activitylabels <- read.table("./UCI HAR Dataset/activity_labels.txt",header=FALSE)


### Read Feature Labels
featurelabels <- read.table("./UCI HAR Dataset/features.txt",header=FALSE)


### Read Subject Identifiers
testsubjects <- read.table("./UCI HAR Dataset/test/subject_test.txt",header=FALSE)
trainsubjects <- read.table("./UCI HAR Dataset/train/subject_train.txt",header=FALSE)



### Add feature labels to test and train datasets

colnames(xtest)<-featurelabels[,2]
colnames(xtrain)<-featurelabels[,2]


### Select only columns pertaining to mean() and std()
meanvars<-featurelabels[grep("mean()",featurelabels[,2],fixed=TRUE),][,1]
stdvars<-featurelabels[grep("std()",featurelabels[,2],fixed=TRUE),][,1]
columnnums<-sort(c(meanvars,stdvars))

xtestspecificcols<-xtest[,columnnums]
xtrainspecificcols<-xtrain[,columnnums]

### Clean column names, removing spaces, underscores, parenthesis, and uppercase letters
cnames<-sub("\\()","",gsub("-","",tolower(colnames(xtestspecificcols))))
colnames(xtestspecificcols)<-cnames
colnames(xtrainspecificcols)<-cnames


### combine train and test .. data, activity, and subject
dataspecificcols<-rbind(xtestspecificcols,xtrainspecificcols)
subjects<-rbind(testsubjects,trainsubjects)
activitynum<-rbind(ytest,ytrain)

alldata<-cbind(activitynum,subjects,dataspecificcols)
colnames(alldata)[1:2]<-c("activitynum","subjectid")


### Add row labels based on activitylabels data
alldata$activitylabel<-"None"
for (i in 1:6) {
    alldata$activitylabel[alldata$activitynum==i]<-as.character(activitylabels[i,2])
}

### Reorder columns, drop activitynum, store in tidydata1
tidydata1<-cbind(alldata$activitylabel,alldata[,c(-1,-69)])
colnames(tidydata1)[1]<-"activitylabel"


### Create second dataset with average of each variable by activity & subject
tidydata2<-aggregate(tidydata1[3:68],by=list(tidydata1$activitylabel,tidydata1$subjectid),mean)
colnames(tidydata2)[1:2]<-c("activitylabel","subjectid")

### Check rows of tidydata2
table(tidydata1$activitylabel,tidydata1$subjectid)
sum(table(tidydata1$activitylabel,tidydata1$subjectid)>0)


### Export tidydata2 to a tab-delimited txt file for upload to Coursera
write.table(tidydata2, "tidydata.txt", sep="\t",row.names=FALSE)

