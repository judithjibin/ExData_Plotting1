library(dplyr)

table <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.string = "?", colClasses = c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'))

table$Date <- as.Date(table$Date, format = "%d/%m/%Y")

data <- subset(table, Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
data <- data[complete.cases(data), ]


DateTime <- paste(as.Date(data$Date), data$Time)
data$DateTime <- as.POSIXct(DateTime)


plot(data$Global_active_power ~ data$DateTime, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)", col = "red")

dev.copy(png, "plot2.png", width = 480, height = 480)
dev.off()
