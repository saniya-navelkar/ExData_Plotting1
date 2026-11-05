
# Course Project 1 - Plot 4
# Four Graphs Together

# Read household power consumption dataset
power_data <- read.table(
  "data/household_power_consumption.txt",
  header = TRUE,
  sep = ";",
  na.strings = "?",
  stringsAsFactors = FALSE,
  colClasses = c("character", "character", rep("numeric", 7))
)

# Extract data for February 1 and 2, 2007
power_data <- power_data[
  power_data$Date %in% c("1/2/2007", "2/2/2007"),
]

# Convert Date and Time into datetime
datetime <- strptime(
  paste(power_data$Date, power_data$Time),
  format = "%d/%m/%Y %H:%M:%S"
)

# Open PNG graphics device
png("plot4.png", width = 480, height = 480)

# Divide plotting area into 2 rows and 2 columns
par(mfrow = c(2, 2))

# Plot 1: Global Active Power
plot(
  datetime,
  power_data$Global_active_power,
  type = "l",
  xlab = "",
  ylab = "Global Active Power"
)

# Plot 2: Voltage
plot(
  datetime,
  power_data$Voltage,
  type = "l",
  xlab = "",
  ylab = "Voltage"
)

# Plot 3: Energy Sub Metering
plot(
  datetime,
  power_data$Sub_metering_1,
  type = "l",
  xlab = "",
  ylab = "Energy sub metering"
)

lines(datetime, power_data$Sub_metering_2, col = "red")
lines(datetime, power_data$Sub_metering_3, col = "blue")

legend(
  "topright",
  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
  col = c("black", "red", "blue"),
  lty = 1,
  cex = 0.7
)

# Plot 4: Global Reactive Power
plot(
  datetime,
  power_data$Global_reactive_power,
  type = "l",
  xlab = "datetime",
  ylab = "Global_reactive_power"
)

# Close graphics device
dev.off()
