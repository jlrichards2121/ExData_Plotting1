## Plot 2
# Read data
header <- read.table(unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt"), nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE)
data <- read.table(unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt"), header=T, sep=";", skip=66636, nrows=2880, na.strings="?")
colnames(data)<-unlist(header)
data$Date <- as.Date(data$Date,format = c("%d/%m/%Y"))
data$Time <- strptime(data$Time,format = "%H:%M:%S")
data[1:1440,"Time"] <- format(data[1:1440,"Time"],"2007-02-01 %H:%M:%S")
data[1441:2880,"Time"] <- format(data[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

# Graph
png("plot2.png")
plot(data$Time,data$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()