# open png graphic device.
png(file="./ExData_Plotting1/plot2.png", width=480,height=480)

# read data from working directory
hpower <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?",colClasses=c(rep("character",2),rep("numeric",7)))

# add  DateTime variable in POSIXlt format
hpower$DateTime <- strptime(paste(hpower$Date,hpower$Time),"%d/%m/%Y %H:%M:%S")

# create a plot for the global active power variable
with(subset(hpower,DateTime >= "2007-02-01" & DateTime < "2007-02-03"),plot(DateTime,Global_active_power,main="",ylab = "Global Active Power (kilowatts)",xlab="",type="l"))

# close the graphics device
dev.off()