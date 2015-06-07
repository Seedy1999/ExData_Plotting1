######################################################
#   Program to recreate Plot 3 for Course Project 1  #
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
png(filename = "plot3.png", width = 480, height = 480, units = "px")

with(powerData, {plot(Time, Sub_metering_1, xlab = "", ylab = "",type = "n")
                points(Time, Sub_metering_1, type = "l", col = "black")
                points(Time, Sub_metering_2, type = "l", col = "red")
                points(Time, Sub_metering_3, type = "l", col = "blue")
        title(ylab = "Energy sub metering")

        legend("topright", legend = c("Sub metering 1", "Sub metering 2", "Sub metering 3"), 
                lty = 1, col = c("black","red","blue"))
})

dev.off()
