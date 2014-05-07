#calculate only 24*2*60 rows & skipped others.
HP<-read.table(file="E:/Coursera/RWorkDir/Power/HPC.txt",sep=";",skip=66637,nrows=2880,col.names=colnames(read.table("E:/Coursera/RWorkDir/Power/HPC.txt",nrow=1,header=TRUE,sep=";")))
HP$Date1<-paste(HP$Date,HP$Time)
HP$Date1<-strptime(HP$Date1,"%d/%m/%Y %H:%M:%S")
HPN<-HP[,c(3,4,5,6,7,8,9,10)]
library(datasets)
hist(HPN$Global_active_power,col="red",xlab="Global Active Power (Kilowatts)",main=paste("Global Active Power"))
dev.copy(png,file="E:/Coursera/RWorkDir/EDA1/plot1.png")
dev.off()
