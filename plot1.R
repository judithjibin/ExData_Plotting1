library(dplyr)

table <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.string = "?", colClasses = c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'))

table$Date <- as.Date(table$Date, format = "%d/%m/%Y")
table <- subset(table, Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
table <- table[complete.cases(table), ]


hist(table$Global_active_power, xlab = "Global Active Power(kilowatts)", main = "Global Active Power", col = "red")

dev.copy(png, "plot1.png", width = 480, height = 480)
dev.off()