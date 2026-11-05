
# Course Project 1 - Plot 1
# Global Active Power Histogram

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

# Open PNG graphics device
png("plot1.png", width = 480, height = 480)

# Create histogram
hist(
  power_data$Global_active_power,
  col = "red",
  main = "Global Active Power",
  xlab = "Global Active Power (kilowatts)",
  ylab = "Frequency"
)

# Close graphics device
dev.off()
