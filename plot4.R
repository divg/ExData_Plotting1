#Ensure data file is in Working Directory
#setwd("C://Users//KKD//Documents//GitHub//ExData_Plotting1")
#Load data from file into df
hp <- read.table(file = "household_power_consumption.txt", header=T, sep=";", na.strings="?")
#Subset
housingPwr <- subset(hp, (Date == "1/2/2007") | (Date == "2/2/2007"))
housingPwr$DateTime = strptime(paste(housingPwr$Date, housingPwr$Time), "%d/%m/%Y %H:%M:%S")
housingPwr <- transform(housingPwr, Date = as.Date(Date, "%d/%m/%Y"))
#Create plot and write to png file
png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow=c(2,2))
plot(housingPwr$Global_active_power ~ as.POSIXct(housingPwr$DateTime), type="l", xlab="", ylab="Global Active Power")
plot(housingPwr$Voltage ~ as.POSIXct(housingPwr$DateTime), type="l", xlab="datetime", ylab="Voltage")
plot(housingPwr$Sub_metering_1 ~ as.POSIXct(housingPwr$DateTime), type="l", xlab="", ylab="Energy sub metering")
lines(housingPwr$Sub_metering_2 ~ as.POSIXct(housingPwr$DateTime), col="Red")
lines(housingPwr$Sub_metering_3 ~ as.POSIXct(housingPwr$DateTime), col="Blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("Black", "Red", "Blue"), lty=1, bty="n")
plot(housingPwr$Global_reactive_power ~ as.POSIXct(housingPwr$DateTime), type="l", xlab="datetime", ylab="Global_reactive_power")
#close device 
dev.off()
