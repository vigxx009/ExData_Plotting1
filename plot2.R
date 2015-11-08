# Read in the data
df <- read.csv('household_power_consumption.txt', header=TRUE, sep=";", na.strings = "?")

# Convert the times
df$DateTime <- strptime(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")
# and dates
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")

# Subset out the dates
subdf <- df[df$Date >= as.Date("2007-02-01") & df$Date <= as.Date("2007-02-02"),]

# Setup the device
png("plot2.png",  width = 480, height = 480)

# Bulid the plot
plot(subdf$DateTime, subdf$Global_active_power, type="n", xlab="", ylab="Global Active Power (kilowatts)")
lines(subdf$DateTime, subdf$Global_active_power)

dev.off()
