library(readxl)
vipcsv <- read.csv(file.choose(),header=T) 
summary(vipcsv)  

colnames(vipcsv) <- c("ac_id","disposal_type","card_type","dist","avg_sal","unemp_rate","entrepreneur_no","trans_sum","loan_amount","loan_status")  
vipcsv[!complete.cases(vipcsv),]

vipcsv[,!complete.cases(vipcsv)]
## If any missing values are there omit them

vipcsv <- na.omit(vipcsv,na.action=TRUE)

##selecting only numerical data and removing ac_id column
mydata <- vipcsv[,c(5,9,6,7)]
mydata
boxplot(mydata)
boxplot(mydata[,c(2)])
plot(mydata[,c(2)])
mydata <- scale(mydata[,1:4])
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
points(fit$centers,col=1:7,pch=3)


library(cluster)
#install.packages("fpc")
library(fpc)
plotcluster(mydata,fit$cluster)
points(fit$centers,col=1:8,pch=16)
plotcluster(mydata,fit$cluster)
points(fit$centers,col=1:8,pch=16)
clusplot(mydata, fit$cluster, color=TRUE, shade=TRUE, labels=2, lines=0)
mydata <- vipcsv[,c(5:9)]
mydata <- data.frame(mydata,fit$cluster)
cluster_mean <- aggregate(mydata[,1:6],by = list(fit$cluster),FUN = mean)
cluster_mean
clusplot(mydata, fit$cluster, color=TRUE, shade=TRUE, labels=2, lines=0)

plot(mydata,col=fit$cluster,pch=15)
points(fit$centers,col=1:8,pch=3)

loan <- c(16,161,5)

loan_percent=round((100*loan)/sum(loan), 1)
pie(loan,labels=loan_percent,main= "without transaction" , col=rainbow(3))
legend("topright",c("VIP","GOOD","RISKY"),cex=0.8,fill=rainbow(3))

trans <- c(8,43,5)

trans_percent=round((100*loan)/sum(trans), 1)
pie(trans,labels=trans_percent,main= "transaction" , col=rainbow(5))
legend("topright",c("VIP","GOOD","RISKY"),cex=0.8,fill=rainbow(5))
dev.off()
plot(rnorm(50),rnorm(50))
