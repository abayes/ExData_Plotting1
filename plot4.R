##  Setup
setwd("~/DataScienceCert/04-Exploratory Data Analysis/Assignment1/ExData_Plotting1")

## Download files [if necessary]
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if (!file.exists("./exdata-data-household_power_consumption.zip")) {
  download.file(url, destfile = "./exdata-data-household_power_consumption.zip")
}

## Unzip files [if necessary]
if (!file.exists("./exdata-data-household_power_consumption")) {
  unzip("./exdata-data-household_power_consumption.zip")
}

## Load the data
ed <- read.table("./exdata-data-household_power_consumption/household_power_consumption.txt", 
                 sep = ";", na.strings = "?", header = T)

## Get the relevant data
ed <- ed[ed$Date == "1/2/2007" | ed$Date == "2/2/2007", ]
ed$DateTime <- strptime(paste(ed$Date, ed$Time), format = "%d/%m/%Y %H:%M:%S")


## Construct the plots
png(file = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
## Top Left
plot(ed$DateTime, ed$Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power")
## Top Right
plot(ed$DateTime, ed$Voltage, 
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")

## Bottom Left
plot(ed$DateTime, ed$Sub_metering_1, 
     type = "n",
     xlab = "",
     ylab = "Energy sub metering")
lines(ed$DateTime, ed$Sub_metering_1, col = "black")
lines(ed$DateTime, ed$Sub_metering_2, col = "red")
lines(ed$DateTime, ed$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1), col= c("black", "red", "blue"), bty = "n" )

## Bottom Right
plot(ed$DateTime, ed$Global_reactive_power, 
     type = "l",
     xlab = "datetime",
     ylab = "Global_reactive_power")
## Close plot
dev.off()