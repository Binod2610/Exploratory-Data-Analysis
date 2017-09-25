#Setting Current Working directory, FileUrl, Zip file name, Unzip File name
setwd("C:\\Users\\Vasishtha Prasad\\Desktop\\DataScience\\Exploratory Data Analysis\\Week1\\Assignment")
fileurl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
downloadFileName<-".\\Data\\household_power_consumption.zip"
fileName<-".\\Data\\household_power_consumption.txt"

#Downloading and un zipping the file
if (!file.exists(fileName)) {
  download.file(fileurl, downloadFileName)
  unzip(downloadFileName, overwrite = T, exdir = "./Data")
}

#Retriving data from downloaded file
plottingData <- read.table(fileName, header=TRUE, sep=";", na.strings="?")

#Preparing required data
requiredData <- plottingData[plottingData$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <-strptime(paste(requiredData$Date, requiredData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
finalPlottingData <- cbind(SetTime, requiredData)

#Plotting according to requirement
png(filename = ".//Plots//plot4.png",width = 480, height = 480, units = "px")

par(mfrow=c(2,2))
plot(finalPlottingData$SetTime, finalPlottingData$Global_active_power, type="l", col="green", xlab="", ylab="Global Active Power")
plot(finalPlottingData$SetTime, finalPlottingData$Voltage, type="l", col="orange", xlab="datetime", ylab="Voltage")
plot(finalPlottingData$SetTime, finalPlottingData$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(finalPlottingData$SetTime, finalPlottingData$Sub_metering_2, type="l", col="red")
lines(finalPlottingData$SetTime, finalPlottingData$Sub_metering_3, type="l", col="blue")
labels <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
columnlines <- c("black","red","blue")
legend("topright", bty="n", legend=labels, lty=1, col=columnlines)
plot(finalPlottingData$SetTime, finalPlottingData$Global_reactive_power, type="l", col="blue", xlab="datetime", ylab="Global_reactive_power")

dev.off()