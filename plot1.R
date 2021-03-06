read_data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
my_data <- subset(read_data, Date == "1/2/2007"| Date == "2/2/2007")
my_data$Global_active_power <- as.numeric(as.character(my_data$Global_active_power))


hist(my_data$Global_active_power, 
     col = 'red', 
     main = "Global Active Power", 
     xlab = 'Global Active Power (kilowatts)')
