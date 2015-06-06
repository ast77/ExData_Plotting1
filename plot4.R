# Load data from file in working directory
data <- read.table('household_power_consumption.txt', sep = ';', header = TRUE)

# Subset data for 1/2/2007 and 2/2/2007
set <- data[(data$Date == '1/2/2007' | data$Date == '2/2/2007'),]

# Create plots
dateTime <- as.POSIXlt(paste(as.Date(set$Date, format="%d/%m/%Y"), set$Time, sep=" "))
s1 <- as.numeric(as.character(set$Sub_metering_1))
s2 <- as.numeric(as.character(set$Sub_metering_2))
s3 <- as.numeric(as.character(set$Sub_metering_3))
par (mfrow = c(2, 2), mar = c(4, 4, 1, 1)) 
with(set, {
      plot(dateTime, as.numeric(as.character(set$Global_active_power)), type = 'l', xlab = '', ylab = 'Global Active Power (kilowatts)')
      plot(dateTime, as.numeric(as.character(set$Voltage)), type = 'l', xlab = 'datetime', ylab = 'Voltage')
      plot(dateTime, s1, type = 'l', col = 'black', xlab = '', ylab = 'Energy sub metering')
      lines(dateTime, s2, type = 'l', col = 'red')
      lines(dateTime, s3, type = 'l', col = 'blue')
      legend('topright', lty = 1, bty = 'n', col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
      plot(dateTime, as.numeric(as.character(set$Global_reactive_power)), type = 'l', xlab = 'datetime', ylab = 'Global_reactive_power')
})

# Copy plot to the PNG-file and close graphics device
dev.copy(png, file = 'plot4.png')
dev.off()