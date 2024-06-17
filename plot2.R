##Read the data
data <- read.table("household_power_consumption.txt",
                   header = TRUE, sep = ";",
                   na.strings = "?")
##Subset the data from Feb 1 ans 2 2007
data <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))
#converting Date to as.Date format
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
dateTime <- paste(data$Date, data$Time)
data$DateTime <- as.POSIXct(dateTime)
png("plot2.png", width = 480, height = 480)
with(data, {
  plot(Global_active_power~DateTime,
       type = "1",
       ylab = "Global Active Power (kilowatts)",
       xlab = "")
})
dev.off()