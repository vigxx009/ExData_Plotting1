# Read in the data
df <- read.csv('household_power_consumption.txt', header=TRUE, sep=";", na.strings = "?")

# Convert the dates
df$DateTime <- paste(df$Date, df$Time)
df$DateTime <- as.Date(df$DateTime, format = "%d/%m/%Y %H:%M:%S")

# Subset out the dates
subdf <- df[df$DateTime >= as.Date("2007-02-01") & df$DateTime <= as.Date("2007-02-02"),]

# Setup the device
png("plot1.png",  width = 480, height = 480)

# Bulid the plot
hist(subdf$Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")

dev.off()
