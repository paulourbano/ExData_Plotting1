## Exploratory Data Analysis, Coursera

# Project 1, July 2014

# Read data from file
# RAM usage
# > object.size(data)
# 91853280 bytes
data = read.csv("household_power_consumption.txt", sep=";")

# Converting the Time to "Date" class, allowing plot active
# power over the moments of measument
data$Time = strptime(paste(as.character(data$Date), as.character(data$Time)), "%d/%m/%Y %H:%M:%S")

# Converting Date to "Date" class, allowing comparisons
data$Date = as.Date(data$Date, "%d/%m/%Y")

# Coverting Global Active Power to numeric
data$Global_active_power = as.numeric(data$Global_active_power)

# Converting submetering to numeric
data$Sub_metering_1 = as.numeric(data$Sub_metering_1)
data$Sub_metering_2 = as.numeric(data$Sub_metering_2)
data$Sub_metering_3 = as.numeric(data$Sub_metering_3)

# Converting voltage to numeric
data$Voltage = as.numeric(data$Voltage)

# Converting global reactive power to numeric
data$Global_reactive_power = as.numeric(data$Global_reactive_power)


# Subset data; consider only two day period (1st-2nd) in February 2007
subsetData = subset(data, Date >= as.Date("01/02/2007", "%d/%m/%Y") & Date <= as.Date("02/02/2007", "%d/%m/%Y"))

# Panel with 2 rows and 2 columns
par(mfrow = c(2,2), mar=c(3,4,1,1), oma=c(0,0,0,0))

# First graph
plot(subsetData$Time, subsetData$Global_active_power/1000, type="o", pch=".", ylab = "Global Active Power (kilowatts)", xlab = "", cex.lab = 0.7, cex.axis = 0.8)

# Second graph
plot(subsetData$Time, subsetData$Voltage, type="o", pch=".", ylab = "Voltage", xlab = "datetime", cex.lab = 0.7, cex.axis = 0.8)

# Third graph
plot(subsetData$Time, subsetData$Sub_metering_1, type="o", pch=".", ylab = "Energy submetering", xlab = "", cex.lab = 0.7, cex.axis = 0.7, yaxp=c(0, 30, 3))
points(subsetData$Time, subsetData$Sub_metering_2, type="o", pch=".", col="red")
points(subsetData$Time, subsetData$Sub_metering_3, type="o", pch=".", col="blue")
legend("topright", col=c("black", "red", "blue"),  legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, cex=0.6, bty="n")

# Fourth graph
plot(subsetData$Time, subsetData$Global_reactive_power/1000, type="o", pch=".", ylab = "Global_reactive_power", xlab = "datetime", cex.lab = 0.7, cex.axis = 0.8)

