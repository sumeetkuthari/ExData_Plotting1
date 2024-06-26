##Read the data
data <- read.table("household_power_consumption.txt",
                   header = TRUE, sep = ";",
                   na.strings = "?")
##Subset the data from Feb 1 ans 2 2007
data <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))
#converting Date to as.Date format
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
#formatting the png
png("plot1.png", width = 480, height = 480)
#creating the histogram with the required parameters
hist(data$Global_active_power, col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
#off
dev.off()