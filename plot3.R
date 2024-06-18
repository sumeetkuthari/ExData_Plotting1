library(lubridate)
##Read the data
data <- read.table("household_power_consumption.txt",
                   header = TRUE, sep = ";",
                   na.strings = "?")
##Subset the data from Feb 1 ans 2 2007
data <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))
data$DateTime <- dmy_hms(paste(data$Date, data$Time))
png("plot3.png", width = 480, height = 480)
with(data, {
  plot(DateTime,
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
})
dev.off()
message("Created plot3.png")
rm("data")