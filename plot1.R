# open png graphic device.
png(file="./ExData_Plotting1/plot1.png", width=480,height=480)

# read data from working directory
hpower <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?",colClasses=c(rep("character",2),rep("numeric",7)))

# change date to POSIXlt format
hpower$Date <- strptime(hpower$Date,"%d/%m/%Y")

# create a histogram for the global active power variable
with(subset(hpower,Date=="2007-02-01" | Date=="2007-02-02"),hist(Global_active_power,main="Global Active Power",xlab = "Global Active Power (kilowatts)",col="Red"))

# close the graphics device
dev.off()
