#read/subset data
classes <- c(rep("character", 2), rep("numeric", 7))
df <- read.table("household_power_consumption.txt", sep = ";", colClasses = classes, header = TRUE, na.strings = "?")
data <- df[df$Date %in% c("1/2/2007", "2/2/2007"), ]
data$Time <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#plot data
png("plot2.png")
plot(data[[2]], data[[3]], type = "n", ylab = "Global Active Power (kilowatts)", xlab = "")
lines(x = data[[2]], y = data[[3]])
dev.off()
