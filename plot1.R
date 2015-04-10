# read the data
file = "household_power_consumption.txt"
rawData <- read.csv2(file,skip = 66500,nrows = 3200,na.strings = "?")
data<-rawData

# format date and time, then subset the relevant dates
data$time<-strptime(paste(data[,1],data[,2]),"%d/%m/%Y %H:%M:%S")
data$date<-strptime(data[,1],"%d/%m/%Y")
data <- data[data$date == strptime("1/2/2007","%d/%m/%Y") | data$date == strptime("2/2/2007","%d/%m/%Y"),]

# make plot and save
png("plot1.png")
hist(as.numeric(as.character(data[,3])), xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")
dev.off()