subsetData2 <- function(){
     setwd("D:/R/Coursera Exploratory Data Analysis")
     data.all <- read.table ("exdata/household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", stringsAsFactors=FALSE)     
     data.subset <- data.all[data.all$Date=="1/2/2007",]
     data.subset <- rbind(data.subset, data.all[data.all$Date=="2/2/2007",])
     rm(data.all)
     gc()     
     data.subset<-cbind(stringsAsFactors=FALSE,my.DateTime.ch=paste0(data.subset[,1], " ", data.subset[,2]), data.subset)
     data.subset<-cbind(stringsAsFactors=FALSE,my.DateTime=strptime(data.subset$my.DateTime.ch, format="%d/%m/%Y %H:%M:%S"), data.subset)
}
plot2 <- function() {
     png('plot2.png')
     plot(data.subset$my.DateTime, data.subset$Global_active_power, type="l",  ylab="Global Active Power (kilowatts)",  xlab="")     
     dev.off()
}