library (lubridate)

electricity <- read.table ("./household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
twodays_electric <- subset(electricity, {dmy(Date) == "2007-02-01"| dmy(Date) == "2007-02-02"})

submeter <- lapply(twodays_electric[,c(7:9)], as.numeric)

n <- nrow(twodays_electric)

plot(c(1:n), submeter[[1]], xlab ="", ylab = "Energy Sub Metering", type = "l", xaxt = "n") 

points (c(1:n), submeter[[2]], type = "l", col = "red")

points (c(1:n), submeter[[3]], type = "l", col = "blue")

axis (side = 1, at = c(1, n/2, n), labels = c("Thu", "Fri", "Sat"))

legend ("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "), lty = 1, cex = 0.8)

dev.copy (png, file = "plot3.png", width=480, height=480)

dev.off()
