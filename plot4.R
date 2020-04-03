library(dplyr)
library(lubridate)

read_data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
my_data <- subset(read_data, Date == "1/2/2007"| Date == "2/2/2007")
my_data$Global_active_power <- as.numeric(as.character(my_data$Global_active_power))
my_data$Date <- dmy(my_data$Date)
my_data$Time <- hms(my_data$Time)
my_data <- mutate(my_data, date_time = make_datetime(
        year(my_data$Date), month(my_data$Date), day(my_data$Date),
        hour(my_data$Time), minute(my_data$Time), second(my_data$Time)))

par(mfcol=c(2,2))

plot(my_data$date_time, my_data$Global_active_power, type = 'l', 
     xlab = "", ylab = "Global Active Power (killowatts)")

plot(my_data$date_time, my_data$Sub_metering_1, type = 'l', 
     col = "black", xlab = "", ylab = "Energy sub metering")
lines(my_data$date_time, my_data$Sub_metering_2, type = 'l', col = "red")
lines(my_data$date_time, my_data$Sub_metering_3, type = 'l', col = "blue")
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = c(1, 1, 1))

plot(my_data$date_time, my_data$Voltage, type = 'l', 
     xlab = "datetime", ylab = "Voltage")

plot(my_data$date_time, my_data$Global_reactive_power, type = 'l', 
     xlab = "datetime", ylab = "Global_reactive_power")

