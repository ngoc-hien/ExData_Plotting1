data <- read.table("household_power_consumption.txt", header = TRUE, 
                   sep = ";", na.strings = "?", skip = 66636, nrows = 2880, 
                   colClasses = c("character", "character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
colnames(data) <- c("CDate","CTime","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
data$DateTime <- strptime(paste(data$CDate, data$CTime), format = "%d/%m/%Y %H:%M:%S")

hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.copy(png, "plot1.png")
dev.off()