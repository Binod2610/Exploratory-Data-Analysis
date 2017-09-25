setwd("C:\\Users\\Vasishtha Prasad\\Desktop\\DataScience\\Exploratory Data Analysis\\Week1\\Assignment")
fileurl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
downloadFileName<-".\\Data\\household_power_consumption.zip"
fileName<-".\\Data\\household_power_consumption.txt"

if (!file.exists(fileName)) {
  download.file(fileurl, downloadFileName)
  unzip(downloadFileName, overwrite = T, exdir = "./Data")
}
plottingData <- read.table(fileName, header=TRUE, sep=";", na.strings="?")

requiredData <- plottingData[plottingData$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <-strptime(paste(requiredData$Date, requiredData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
finalPlottingData <- cbind(SetTime, requiredData)

png(filename = ".//Plots//plot1.png",width = 480, height = 480, units = "px")
hist(requiredData$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
#dev.copy(png,filename = ".//Plots//plot1.png")
dev.off()