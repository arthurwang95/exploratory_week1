library (lubridate)

electricity <- read.table ("./household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)

twodays_electric <- subset(electricity, {dmy(Date) == "2007-02-01"| dmy(Date) == "2007-02-02"})

n <- nrow(twodays_electric)

plot(c(1:n), as.numeric(twodays_electric$Global_active_power), type = "l", xlab = "", ylab = "Global Active Power (kilowatts)", xaxt = "n")

axis (side = 1, at = c(1, n/2, n), labels = c("Thu", "Fri", "Sat"))

dev.copy (png, file = "plot2.png", width=480, height=480)

dev.off()
