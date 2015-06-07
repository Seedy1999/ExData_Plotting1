######################################################
#   Program to recreate Plot 2 for Course Project 1  #
#            Exploratory Data Analysis               #
######################################################

# read data and put in usable form

filename <- "household_power_consumption.txt"
timeZone <- Sys.timezone()

data <- read.table(filename, 
                   header = TRUE, 
                   sep = ";", 
                   na.strings = "?", 
                   colClasses = c("character", "character", "numeric", 
                                  "numeric", "numeric", "numeric", 
                                  "numeric", "numeric", "numeric"))


powerData <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
rm(list = "data")

datetime <- paste(powerData$Date, powerData$Time, sep = " ")

powerData$Date <- as.Date(strptime(powerData$Date, format = "%d/%m/%Y", tz = timeZone))
powerData$Time <- as.POSIXct(strptime(datetime, format = "%d/%m/%Y %H:%M:%S", tz = timeZone))



# make the plot

png(filename = "plot2.png", width = 480, height = 480, units = "px")

with(powerData, plot(Time, Global_active_power, 
     xlab = "",
     ylab = "Global Active Power (kilowatts)",
     type = "l"))

dev.off()     
