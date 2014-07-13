## Exploratory Data Analysis, Coursera

# Project 1, July 2014

# Read data from file
# RAM usage
# > object.size(data)
# 91853280 bytes
data = read.csv("household_power_consumption.txt", sep=";")

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

# Plot the histogram of Global Active Power, in kilowatts
hist(subsetData$Global_active_power/1000, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red", cex.lab = 0.7)

# As shown below, neither the original nor the subset data
# have a range to include values greater that 4 kilowatts; in
# this way, the graph in the assigment description is out of
# range.
# > summary(subsetData$Global_active_power)
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 73.0   123.0   493.0   571.3   807.2  3691.0
# > summary(data$Global_active_power)
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 1.0   118.0   278.0   556.3   740.0  4187.0