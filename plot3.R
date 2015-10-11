#read/subset data
classes <- c(rep("character", 2), rep("numeric", 7))
df <- read.table("household_power_consumption.txt", sep = ";", colClasses = classes, header = TRUE, na.strings = "?")
data <- df[df$Date %in% c("1/2/2007", "2/2/2007"), ]
data$Time <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#plot data
png("plot3.png")
plot(data[[2]], data[[7]], type = "n", ylab = "Global Active Power (kilowatts)", xlab = "")
lines(x = data[[2]], y = data[[7]])
lines(x = data[[2]], y = data[[8]], col = "red")
lines(x = data[[2]], y = data[[9]], col = "blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1)
dev.off()
