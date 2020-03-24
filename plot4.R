library (lubridate)

electricity <- read.table ("./household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
twodays_electric <- subset(electricity, {dmy(Date) == "2007-02-01"| dmy(Date) == "2007-02-02"})

submeter <- lapply(twodays_electric[,c(7:9)], as.numeric)

n <- nrow(twodays_electric)

png("plot4.png", width=480, height=480)

par(mfcol=c(2,2))

##plot 1
plot(c(1:n), as.numeric(twodays_electric$Global_active_power), type = "l", xlab = "", ylab = "Global active power (kilowatts)", xaxt = "n")

axis (side = 1, at = c(1, n/2, n), labels = c("Thu", "Fri", "Sat"))

##plot 2
plot(c(1:n), submeter[[1]], xlab ="", ylab = "Energy Sub Metering", type = "l", xaxt = "n") 

points (c(1:n), submeter[[2]], type = "l", col = "red")

points (c(1:n), submeter[[3]], type = "l", col = "blue")

axis (side = 1, at = c(1, n/2, n), labels = c("Thu", "Fri", "Sat"))

legend ("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "), lty = 1, cex=0.8)

##plot 3
plot(c(1:n), as.numeric(twodays_electric$Voltage), type = "l", xlab = "datetime", ylab = "Voltage", xaxt = "n")

axis (side = 1, at = c(1, n/2, n), labels = c("Thu", "Fri", "Sat"))

##plot 4
plot(c(1:n), as.numeric(twodays_electric$Global_reactive_power), type = "l", xlab = "datetime", ylab = "Global reactive power (kilowatts)", xaxt = "n")

axis (side = 1, at = c(1, n/2, n), labels = c("Thu", "Fri", "Sat"))

##dev.copy(png, file = "plot4.png", width=480, height=480)

dev.off()


