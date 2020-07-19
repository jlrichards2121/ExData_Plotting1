## Plot 1
# Read data
header <- read.table(unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt"), nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE)
data <- read.table(unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt"), header=T, sep=";", skip=66636, nrows=2880, na.strings="?")
colnames(data)<-unlist(header)

# Graph
png("plot1.png")
hist(data$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
dev.off()