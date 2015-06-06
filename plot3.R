# Load data from file in working directory
data <- read.table('household_power_consumption.txt', sep = ';', header = TRUE)

# Subset data for 1/2/2007 and 2/2/2007
set <- data[(data$Date == '1/2/2007' | data$Date == '2/2/2007'),]

# Creat plot 
dateTime <- as.POSIXlt(paste(as.Date(set$Date, format="%d/%m/%Y"), set$Time, sep=" "))
s1 <- as.numeric(as.character(set$Sub_metering_1))
s2 <- as.numeric(as.character(set$Sub_metering_2))
s3 <- as.numeric(as.character(set$Sub_metering_3))
plot(dateTime, s1, type = 'l', col = 'black', xlab = '', ylab = 'Energy sub metering')

# Add 2 another plots
lines(dateTime, s2, type = 'l', col = 'red')
lines(dateTime, s3, type = 'l', col = 'blue')

# Add legend
legend('topright', lty = 1, col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))

# Copy plot to the PNG-file and close graphics device
dev.copy(png, file = 'plot3.png')
dev.off()