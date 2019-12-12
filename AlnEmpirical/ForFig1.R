par(mfrow=c(1,1))

setwd("/Users/joseph.walker/Desktop/Outliers/OutlierSims/EmpiricalExamples/Carnivory/")
e = read.csv("ForRCarnivoryGWLL",header=FALSE)
f = t(e)
g = sort(f)
plot(g)

setwd("/Users/joseph.walker/Desktop/Outliers/OutlierSims/EmpiricalExamples/Carnivory/")
a = read.csv("ForRcorrectedCarnivory",header=FALSE)
b = t(a)
d = sort(b)
plot(d)

boxplot(f)

abline(v=sd(d)*2)

test <- lm(b~f)
plot(b,f,pch=16,cex=0.75,xlab="Average ΔSSLL",ylab="ΔGWLL",main="Carnivorous Caryophyllales")

lines(loess.smooth(b,f))
abline(v=0.00573640793106435,col="red",lty=2)
abline(h=16.6355830000866,col="red",lty=2)
abline(h=33.0578789999527,col="blue",lty=2)
abline(v=0.011831739083734,col="blue",lty=2)
abline(h=0,lty=2)


#abline(v=sd(d)*2)
#abline(v=sd(d)*-2)
#abline(h=sd(g)*2)
#abline(h=sd(g)*-2)

