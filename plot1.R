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

## Construct the plot
png(file = "plot1.png", width = 480, height = 480)
hist(ed$Global_active_power, 
     breaks = 20, 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()