data <- read.table("household_power_consumption.txt", header = TRUE, 
                   sep = ";", na.strings = "?", skip = 66636, nrows = 2880, 
                   colClasses = c("character", "character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
colnames(data) <- c("CDate","CTime","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
data$DateTime <- strptime(paste(data$CDate, data$CTime), format = "%d/%m/%Y %H:%M:%S")

par(mfrow = c(2,2), mar = c(4,4,1,1))
plot(data$DateTime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
plot(data$DateTime, data$Voltage, type = "l", xlab = "DateTime", ylab = "Voltage")
plot(data$DateTime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col="red" )
lines(data$DateTime, data$Sub_metering_3, col="blue" )
legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col = c("black","red","blue"), lty = c(1,1,1), bty = "n")
plot(data$DateTime, data$Global_reactive_power, type = "l", xlab = "DateTime", ylab = "Global_rective_power")

dev.copy(png, "plot4.png")
dev.off()
