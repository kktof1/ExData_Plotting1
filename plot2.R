library(dplyr)
library(lubridate)

read_data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
my_data <- subset(read_data, Date == "1/2/2007"| Date == "2/2/2007")
my_data$Date <- dmy(my_data$Date)
my_data$Time <- hms(my_data$Time)
my_data <- mutate(my_data, date_time = make_datetime(
        year(my_data$Date), month(my_data$Date), day(my_data$Date),
        hour(my_data$Time), minute(my_data$Time), second(my_data$Time)))

plot(my_data$date_time, my_data$Global_active_power, type = 'l', 
     xlab = "", ylab = "Global Active Power (killowatts)")

# paste(as.character(my_data$Date[3]), as.character(my_data$Time[3]), sep = " ")
# my_data$Date <- as.Date(strptime(my_data$Date, "%d/%m/%Y"))
# my_data$Time <- as.Date(strptime(my_data$Time, "%d/%m/%Y"))

