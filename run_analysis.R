run_analysis<-function()
{
SubjectTest<-read.table("subject_test.txt", stringsAsFactors=FALSE)
SubjectTrain<-read.table("subject_train.txt", stringsAsFactors=FALSE)
XTest<-read.table("x_test.txt", stringsAsFactors=FALSE)
YTest<-read.table("y_test.txt", stringsAsFactors=FALSE)
YTrain<-read.table("y_train.txt", stringsAsFactors=FALSE)
XTrain<-read.table("x_train.txt", stringsAsFactors=FALSE)
ActivityLabels<-read.table("activity_labels.txt", stringsAsFactors=FALSE)
Features<-read.table("features.txt", stringsAsFactors=FALSE)
DataX<-rbind(XTest, XTrain)
colnames(DataX) <- Features[, 2]
TargetData<-subset(DataX, select = c(1:6, 41:46, 81:86, 121:126, 161:166, 201, 202, 214, 215, 227, 228, 240, 241, 253, 254, 266:271, 294:296, 345:350, 373:375, 424:429, 452:454, 503, 504, 513, 516, 517, 526, 529, 530, 539, 542, 543, 552, 555:561))
Subjects<-rbind(SubjectTest, SubjectTrain)
colnames(Subjects)<-"Subjects"
Activities<-rbind(YTest, YTrain)
colnames(Activities)<-"Activities"
SubjectsActivities<-cbind(Subjects, Activities)
SubjectsActivities$ActivityName[SubjectsActivities$Activities=="1"]<-"WALKING"
SubjectsActivities$ActivityName[SubjectsActivities$Activities=="2"]<-"WALKING_UPSTAIRS"
SubjectsActivities$ActivityName[SubjectsActivities$Activities=="3"]<-"WALKING_DOWNSTAIRS"
SubjectsActivities$ActivityName[SubjectsActivities$Activities=="4"]<-"SITTING"
SubjectsActivities$ActivityName[SubjectsActivities$Activities=="5"]<-"STANDING"
SubjectsActivities$ActivityName[SubjectsActivities$Activities=="6"]<-"LAYING"
SubjectsActivities<-SubjectsActivities[,-2]
FullData<-cbind(SubjectsActivities, TargetData)
TidyData<-FullData %>%
group_by(Subjects, ActivityName)  %>%
summarise_each(funs(mean))  %>%
print}
