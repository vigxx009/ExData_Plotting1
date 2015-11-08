# Read in the data
df <- read.csv('household_power_consumption.txt', header=TRUE, sep=";", na.strings = "?")

# Convert the times
df$DateTime <- strptime(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")
# and dates
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")

# Subset out the dates
subdf <- df[df$Date >= as.Date("2007-02-01") & df$Date <= as.Date("2007-02-02"),]

# Setup the device
png("plot4.png",  width = 480, height = 480)

# We need multiple plots
par(mfrow = c(2, 2))

# Top left
plot(subdf$DateTime, subdf$Global_active_power, type="n", xlab="", ylab="Global Active Power")
lines(subdf$DateTime, subdf$Global_active_power)

# Top right
plot(subdf$DateTime, subdf$Voltage, type="n", xlab="datetime", ylab="Voltage")
lines(subdf$DateTime, subdf$Voltage)

# Bottom left
plot(subdf$DateTime, subdf$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(subdf$DateTime, subdf$Sub_metering_1, col="black")
lines(subdf$DateTime, subdf$Sub_metering_2, col="red")
lines(subdf$DateTime, subdf$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1, 1, 1))

# Bottom right
plot(subdf$DateTime, subdf$Global_reactive_power, type="n", xlab="datetime", ylab="Global_reactive_power")
lines(subdf$DateTime, subdf$Global_reactive_power)

dev.off()
