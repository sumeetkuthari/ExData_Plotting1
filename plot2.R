#library to import
library(lubridate)

##Read the data set
data <- read.table("household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   na.strings = "?")
##Subsetting only the required dates
data <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))
#Converting Date, Time to the correct format
data$DateTime <- dmy_hms(paste(data$Date, data$Time))
##Creating png with required parameters
png("plot2.png", width = 480, height = 480)
with(data, {
  plot(Global_active_power~DateTime,
       type = "l",
       ylab = "Global Active Power (kilowatts)",
       xlab = "")
})
dev.off()
message("Successfully created plot2.png")
rm("data")