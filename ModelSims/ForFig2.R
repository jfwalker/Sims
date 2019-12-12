library(vioplot)
par(mfrow=c(2,4))

#Short simulations
setwd("/Users/joseph.walker/Desktop/OutlierFinal/ModelSims/")
a = read.csv("ShortSimsParams.txt",header=FALSE)
vioplot(a[,1],a[,2],a[,3],a[,4],a[,5],main="Distribution of Estimated Transition Rates",ylab="Transition Rate",xlab="",names=c("A<->C","A<->G","A<->T","C<->G","C<->T"))
c = t(a[6:9])
barplot(as.matrix(c),ylab="Estimated Frequency",xlab="Replicate",main="Estimated Nucleotide Frequencies")
vioplot(a[,10],main="Gamma Estimates",ylab="alpha",xlab="",names=c(""))
b = read.csv("ShortSimsLikes.txt",header=TRUE)
vioplot(b[,1],ylim=c(-7,-4),main="Estimated Average SSLL",ylab="Average ΔSSLL",xlab="")

#Long Simulations
a = read.csv("LongSimsParams.txt",header=FALSE)
vioplot(a[,1],a[,2],a[,3],a[,4],a[,5],ylim=c(0,2),main="",ylab="Transition Rate",xlab="",names=c("A<->C","A<->G","A<->T","C<->G","C<->T"))
c = t(a[6:9])
barplot(as.matrix(c),ylab="Estimated Frequency",xlab="Replicate",main="")
vioplot(a[,10],main="",ylab="alpha",xlab="",names=c(""))
b = read.csv("LongSimsLikes.txt",header=TRUE)
vioplot(b[,1],ylim=c(-7,-4),main="",ylab="Average ΔSSLL",xlab="")
