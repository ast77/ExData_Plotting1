# Load data from file in working directory
data <- read.table('household_power_consumption.txt', sep = ';', header = TRUE)

# Subset data for 1/2/2007 and 2/2/2007
set <- data[(data$Date == '1/2/2007' | data$Date == '2/2/2007'),]

# Create plot
dateTime <- as.POSIXlt(paste(as.Date(set$Date, format="%d/%m/%Y"), set$Time, sep=" "))
globAP <- as.numeric(as.character(set$Global_active_power))
plot (dateTime, globAP, type = 'l', xlab = '', ylab = 'Global Active Power (kilowatts)')

# Copy plot to the PNG-file and close graphics device
dev.copy(png, file = 'plot2.png')
dev.off()