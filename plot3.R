# Read in the data
df <- read.csv('household_power_consumption.txt', header=TRUE, sep=";", na.strings = "?")

# Convert the times
df$DateTime <- strptime(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")
# and dates
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")

# Subset out the dates
subdf <- df[df$Date >= as.Date("2007-02-01") & df$Date <= as.Date("2007-02-02"),]

# Setup the device
png("plot3.png",  width = 480, height = 480)

# Bulid the plot
plot(subdf$DateTime, subdf$Sub_metering_1, type="n", xlab="", ylab="Global Active Power (kilowatts)")
lines(subdf$DateTime, subdf$Sub_metering_1, col="black")
lines(subdf$DateTime, subdf$Sub_metering_2, col="red")
lines(subdf$DateTime, subdf$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1, 1, 1))

dev.off()
