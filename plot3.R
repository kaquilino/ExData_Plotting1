# open png graphic device.
png(file="./ExData_Plotting1/plot3.png", width=480,height=480)

# read data from working directory
hpower <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?",colClasses=c(rep("character",2),rep("numeric",7)))

# add  DateTime variable in POSIXlt format
hpower$DateTime <- strptime(paste(hpower$Date,hpower$Time),"%d/%m/%Y %H:%M:%S")

# create a plot of the sub metering variables
with(subset(hpower,DateTime >= "2007-02-01" & DateTime < "2007-02-03"),{
   plot(DateTime,Sub_metering_1,ylab="Energy sub metering",xlab="",type="n")
   lines(DateTime,Sub_metering_1)
   lines(DateTime,Sub_metering_2,col="red")
   lines(DateTime,Sub_metering_3,col="blue")
})
legend("topright",lwd=1,col=c("black","red","blue"),legend = c("Sub metering 1","Sub metering 2","Sub metering 3"))

# close the graphics device
dev.off()
