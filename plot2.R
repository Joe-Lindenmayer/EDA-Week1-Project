#Read in the Data and Subset for the dates we want to look at
#Dates are dd/mm/yyyy
dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header = TRUE, sep=";", stringsAsFactors = FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]


#plot2
date <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
GAP <- as.numeric(subSetData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(date, GAP, type = "l", xlab = "", ylab="Global Active Power (kilowatts)" )
