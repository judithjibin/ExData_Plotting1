library(dplyr)

table <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.string = "?", colClasses = c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'))

table$Date <- as.Date(table$Date, format = "%d/%m/%Y")

data <- subset(table, Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
data <- data[complete.cases(data), ]


DateTime <- paste(as.Date(data$Date), data$Time)
data$DateTime <- as.POSIXct(DateTime)

par(mfcol = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))

with(data, {
	plot(Global_active_power ~ DateTime, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")
	plot(Sub_metering_1 ~ DateTime, type = "l", xlab = "", ylab = "Energy Sub metering")
	lines(Sub_metering_2 ~ DateTime, col = "red")
	lines(Sub_metering_3 ~ DateTime, col = "blue")
	legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
	plot(Voltage ~ DateTime, type = "l")
	plot(Global_reactive_power ~ DateTime, type = "l")
	})
	
dev.copy(png, "plot4.png", height = 480, width = 480)
dev.off()	

