# open png graphic device.
png(file="./ExData_Plotting1/plot4.png", width=480,height=480)

# read data from working directory
hpower <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

# add DateTime variable in POSIXlt format
hpower$DateTime <- strptime(paste(hpower$Date,hpower$Time),"%d/%m/%Y %H:%M:%S")

# subset data to specific dates 
hpower <- hpower[hpower$DateTime>="2007-02-01" & hpower$DateTime<"2007-02-03",]

par(mfrow=c(2,2))

# Global Active Power plot
with(subset(hpower,!is.na(Global_active_power)),plot(DateTime,Global_active_power,main="",ylab = "Global Active Power",xlab="",type="l"))

# Voltage plot
with(subset(hpower,!is.na(Voltage)),plot(DateTime,Voltage,main="",xlab="datetime",type="l"))         

# Sub Metering Plot
with(subset(hpower,DateTime >= "2007-02-01" & DateTime < "2007-02-03"),{
   plot(DateTime,Sub_metering_1,ylab="Energy sub metering",xlab="",type="n")
   lines(DateTime,Sub_metering_1)
   lines(DateTime,Sub_metering_2,col="red")
   lines(DateTime,Sub_metering_3,col="blue")
})
legend("topright",lwd=1,col=c("black","red","blue"),legend = c("Sub metering 1","Sub metering 2","Sub metering 3"),bty="n")

# Global Reactive Power plot
with(subset(hpower,!is.na(Global_reactive_power)),plot(DateTime,Global_reactive_power,main="",xlab="datetime",type="l"))

# close the graphics device
dev.off()
