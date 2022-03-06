library(readxl)
vipcsv <- read.csv(file.choose(),header=T) 
summary(vipcsv)  
  
colnames(vipcsv) <- c("ac_id","disposal_type","card_type","dist","avg_sal","unemp_rate","entrepreneur_no","trans_sum","loan_amount","loan_status")  
vipcsv[!complete.cases(vipcsv),]

vipcsv[,!complete.cases(vipcsv)]
## If any missing values are there omit them

vipcsv <- na.omit(vipcsv,na.action=TRUE)

##selecting only numerical data and removing ac_id column

mydata <- vipcsv[,c(5,8,6,7,9)]
mydata
boxplot(mydata)
boxplot(mydata[,c(5)])
plot(mydata[,c(5)])
mydata <- scale(mydata[,1:5])
mydata



wss <- (nrow(mydata)-1)*sum(apply(mydata,2,var))
wss


for(i in 2:15)wss[i]<- sum(fit=kmeans(mydata,centers=i,15)$withinss)
plot(1:15,wss,type="b",main="15 clusters",xlab="no. of cluster",ylab="with clsuter sum of squares")

plot(1:15,wss,type="b",main="15 clusters",xlab="no. of cluster",ylab="with clsuter sum of squares")
fit <- kmeans(mydata,3)
fit
fit$withinss
fit$betweenss
fit$cluster

plot(mydata,col=fit$cluster,pch=15)
points(fit$centers,col=1:8,pch=3)


library(cluster)
#install.packages("fpc")
library(fpc)
plotcluster(mydata,fit$cluster)
points(fit$centers,col=1:8,pch=16)
plotcluster(mydata,fit$cluster)
points(fit$centers,col=1:8,pch=16)

clusplot(mydata, fit$cluster, color=TRUE, shade=TRUE, labels=2, lines=0)

mydata <- vipcsv[,c(5:10)]
mydata <- data.frame(mydata,fit$cluster)
cluster_mean <- aggregate(mydata[,1:6],by = list(fit$cluster),FUN = mean)
cluster_mean

clusplot(mydata, fit$cluster, color=TRUE, shade=TRUE, labels=2, lines=0)
plot(mydata,col=fit$cluster,pch=15)
points(fit$centers,col=1:8,pch=3)
