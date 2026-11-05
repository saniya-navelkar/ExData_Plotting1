
# Course Project 1 - Plot 2
# Global Active Power over Time

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
png("plot2.png", width = 480, height = 480)

# Create time series plot
plot(
  datetime,
  power_data$Global_active_power,
  type = "l",
  xlab = "",
  ylab = "Global Active Power (kilowatts)"
)

# Close graphics device
dev.off()
