#Read in the Data and Subset for the dates we want to look at
#Dates are dd/mm/yyyy
dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header = TRUE, sep=";", stringsAsFactors = FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

#plot4
date <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
Volt <- as.numeric(subSetData$Voltage)
GAP <- as.numeric(subSetData$Global_active_power)
GRP <- as.numeric(subSetData$Global_reactive_power)
Sub1 <- as.numeric(subSetData$Sub_metering_1)
Sub2 <- as.numeric(subSetData$Sub_metering_2)
Sub3 <- as.numeric(subSetData$Sub_metering_3)
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

plot(date, GAP, type = "l", xlab = "", ylab="Global Active Power" )

plot(date, Volt, type = "l", xlab = "", ylab="Voltage")

plot(date, Sub1, type = "l", xlab = "", col = "dark gray", ylab="Energy sub metering")
lines(date, Sub2, type = "l", col = "red")
lines(date, Sub3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("dark gray", "red", "blue"),bty="o")

plot(date, GRP, type = "l", xlab = "datetime", ylab="Global_reactive_power")
