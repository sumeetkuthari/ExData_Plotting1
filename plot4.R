#library required
library(lubridate)

##Reading the data
data <- read.table("household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   na.strings = "?")
##Subsetting the required dates
data <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))
##Get Date, Time in correct format
data$DateTime <- dmy_hms(paste(data$Date, data$Time))

##Creating the png with the required name and size
png("plot4.png", width = 480, height = 480)
## Will be 2x2 subplots,
## Plotted column by column
par(mfcol = c(2, 2))
with(data, {
  plot(Global_active_power~DateTime, #Same as plot1
       type = "l",
       ylab = "Global Active Power",
       xlab = "")
  plot(DateTime, #Same as plot2
       Sub_metering_1,
       type = "l",
       ylab = "Energy sub metering",
       xlab = "")
  lines(DateTime,
        Sub_metering_2,
        type = "l",
        col = "red")
  lines(DateTime,
        Sub_metering_3,
        type = "l",
        col = "blue")
  legend("topright",
         c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         col = c("black", "red", "blue"),
         lty = 1)
  plot(DateTime, #Voltage vs Datetime
       Voltage,
       type = "l",
       xlab = "datetime",
       ylab = "Voltage")
  plot(DateTime, ##Reactive power vs Datetime
       Global_reactive_power,
       type = "l",
       xlab = "datetime",
       ylab = "Global Reactive Power")
})
dev.off()
message("Created plot4.png")
rm("data")