#calculate only 24*2*60 rows & skipped others.
HP<-read.table(file="E:/Coursera/RWorkDir/Power/HPC.txt",sep=";",skip=66637,nrows=2880,col.names=colnames(read.table("E:/Coursera/RWorkDir/Power/HPC.txt",nrow=1,header=TRUE,sep=";")))
HP$Date1<-paste(HP$Date,HP$Time)
HP$Date1<-strptime(HP$Date1,"%d/%m/%Y %H:%M:%S")
library(datasets)
HPN<-HP[,c(3,4,5,6,7,8,9,10)]
with(HPN,plot(Date1,Global_active_power,type="l",xlab="",ylab="Global Active Power (Kilowatts)"))
dev.copy(png,file="E:/Coursera/RWorkDir/EDA1/plot2.png")
dev.off()