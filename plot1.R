#Read in the Data and Subset for the dates we want to look at
#Dates are dd/mm/yyyy
dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header = TRUE, sep=";", stringsAsFactors = FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

#plot1

GAP <- as.numeric(subSetData$Global_active_power)
png("plot1.png", width=480, height=480)
hist(GAP, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
