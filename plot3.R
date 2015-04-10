# read the data
file = "household_power_consumption.txt"
rawData <- read.csv2(file,skip = 66500,nrows = 3200,na.strings = "?")
data<-rawData

# format date and time, then subset the relevant dates
data$time<-strptime(paste(data[,1],data[,2]),"%d/%m/%Y %H:%M:%S")
data$date<-strptime(data[,1],"%d/%m/%Y")
data <- data[data$date == strptime("1/2/2007","%d/%m/%Y") | data$date == strptime("2/2/2007","%d/%m/%Y"),]

# make plot and save
png("plot3.png")
plot(data$time, as.numeric(as.character(data[,7])), xlab = "", ylab = "Energy sub metering", type = "l")
lines(data$time, as.numeric(as.character(data[,8])), col = "red")
lines(data$time, as.numeric(as.character(data[,9])), col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black","red","blue"), lty = 1)
dev.off()