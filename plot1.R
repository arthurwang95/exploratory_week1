library (lubridate)

electricity <- read.table ("./household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)

twodays_electric <- subset(electricity, {dmy(Date) == "2007-02-01"| dmy(Date) == "2007-02-02"})

hist (as.numeric(twodays_electric$Global_active_power), col = "red", main = "Global Active Power", xlab = "Global active power (kilowatts)", ylab = "Frequency")

dev.copy (png, file = "plot1.png", width=480, height=480)

dev.off()