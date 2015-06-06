# Load data from file in working directory
data <- read.table('household_power_consumption.txt', sep = ';', header = TRUE)

# Subset data for 1/2/2007 and 2/2/2007
set <- data[(data$Date == '1/2/2007' | data$Date == '2/2/2007'),]

# Plot the histogram
hist(as.numeric(as.character(set$Global_active_power)), main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

# Copy plot to the PNG-file and close graphics device
dev.copy(png, file = 'plot1.png')
dev.off()