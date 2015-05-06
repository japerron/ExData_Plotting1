subsetData <- function(){
     setwd("D:/R/Coursera Exploratory Data Analysis")
     data.all <- read.table ("exdata/household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", stringsAsFactors=FALSE)     
     data.subset <- data.all[data.all$Date=="1/2/2007",]
     data.subset <- rbind(data.subset, data.all[data.all$Date=="2/2/2007",])
     rm(data.all)
     gc()     
     data.subset<-cbind(stringsAsFactors=FALSE,my.DateTime.ch=paste0(data.subset[,1], " ", data.subset[,2]), data.subset)
}
plot1 <- function() {
     png('plot1.png')
     hist(data.subset$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
     dev.off()
}