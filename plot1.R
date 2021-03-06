#Ensure data file is in Working Directory
#setwd("C://Users//KKD//Documents//GitHub//ExData_Plotting1")
#Load data from file into df
hp <- read.table(file = "household_power_consumption.txt", header=T, sep=";", na.strings="?")
#Subset
housingPwr <- subset(hp, (Date == "1/2/2007") | (Date == "2/2/2007"))
housingPwr$DateTime = strptime(paste(housingPwr$Date, housingPwr$Time), "%d/%m/%Y %H:%M:%S")
housingPwr <- transform(housingPwr, Date = as.Date(Date, "%d/%m/%Y"))
#Create plot and write to png file
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(housingPwr$Global_active_power, col="Red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
#close device 
dev.off()
