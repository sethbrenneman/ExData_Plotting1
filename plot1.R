#read/subset data
classes <- c(rep("character", 2), rep("numeric", 7))
df <- read.table("household_power_consumption.txt", sep = ";", colClasses = classes, header = TRUE, na.strings = "?")
data <- df[df$Date %in% c("1/2/2007", "2/2/2007"), ]
data$Time <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#plot data
par(mfrow = c(1,1))
png("plot1.png")
hist(data[[3]], col = "orange", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()