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
png(filename = ".//Plots//plot2.png",width = 480, height = 480, units = "px")

plot(finalPlottingData$SetTime, finalPlottingData$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()