
# Course Project 1 - Plot 3
# Energy Sub Metering

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
png("plot3.png", width = 480, height = 480)

# Plot Sub Metering 1
plot(
  datetime,
  power_data$Sub_metering_1,
  type = "l",
  xlab = "",
  ylab = "Energy sub metering"
)

# Add Sub Metering 2
lines(
  datetime,
  power_data$Sub_metering_2,
  col = "red"
)

# Add Sub Metering 3
lines(
  datetime,
  power_data$Sub_metering_3,
  col = "blue"
)

# Add legend
legend(
  "topright",
  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
  col = c("black", "red", "blue"),
  lty = 1
)

# Close graphics device
dev.off()
