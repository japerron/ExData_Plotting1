subsetData3 <- function(){
     setwd("D:/R/Coursera Exploratory Data Analysis")
     data.all <- read.table ("exdata/household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", stringsAsFactors=FALSE)     
     data.subset <- data.all[data.all$Date=="1/2/2007",]
     data.subset <- rbind(data.subset, data.all[data.all$Date=="2/2/2007",])
     rm(data.all)
     gc()     
     data.subset<-cbind(stringsAsFactors=FALSE,my.DateTime.ch=paste0(data.subset[,1], " ", data.subset[,2]), data.subset)
     data.subset<-cbind(stringsAsFactors=FALSE,my.DateTime=strptime(data.subset$my.DateTime.ch, format="%d/%m/%Y %H:%M:%S"), data.subset)
}
plot3 <- function() {
     png('plot3.png')
     plot(data.subset$my.DateTime, data.subset$Sub_metering_1, type="l",  ylab="Energy sub metering",  xlab="")
     lines(data.subset$my.DateTime, data.subset$Sub_metering_2, type="l", col="red")
     lines(data.subset$my.DateTime, data.subset$Sub_metering_3, type="l", col="blue")
     legend(x="topright", y=10, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), lwd=c(1.5,1.5, 1.5),col=c("black","red","blue"))
     
     dev.off()
}