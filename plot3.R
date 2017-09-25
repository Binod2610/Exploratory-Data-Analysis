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
png(filename = ".//Plots//plot3.png",width = 480, height = 480, units = "px")

columnlines <- c("black", "red", "blue")

plot(finalPlottingData$SetTime, finalPlottingData$Sub_metering_1, type="l", col=columnlines[1], xlab="", ylab="Energy sub metering")
lines(finalPlottingData$SetTime, finalPlottingData$Sub_metering_2, col=columnlines[2])
lines(finalPlottingData$SetTime, finalPlottingData$Sub_metering_3, col=columnlines[3])
labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend("topright", legend=labels, col=columnlines, lty="solid")

dev.off()