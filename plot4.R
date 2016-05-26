# The data are modified as follows
#   - all ? are represented as N/A
#   - element named tl (timeline) is added to the list
#   - rows are filtered and only the two days of measures are returned
##
household <- read.table("./household_power_consumption.txt",header=TRUE, sep=";", na.strings="?", as.is=TRUE)
exp <- household[household$Date %in% c("1/2/2007","2/2/2007"),]
exp[,"Global_active_power"] <- as.numeric(exp[,"Global_active_power"])
exp[,"Global_reactive_power"] <- as.numeric(exp[,"Global_reactive_power"])
exp[,"Voltage"] <- as.numeric(exp[,"Voltage"])
exp[,"Global_intensity"] <- as.numeric(exp[,"Global_intensity"])
exp[,"Sub_metering_1"] <- as.numeric(exp[,"Sub_metering_1"])
exp[,"Sub_metering_2"] <- as.numeric(exp[,"Sub_metering_2"])
exp[,"Sub_metering_3"] <- as.numeric(exp[,"Sub_metering_3"])

dtchar <- paste(exp$Date,exp$Time)
tl <- strptime(dtchar,"%d/%m/%Y %H:%M:%S")
exp$tl <- tl 

# opens the device, default size is 480x480
png("plot4.png")

# construts the plots
par(mfcol=c(2,2),mar=c(4,4,2,2))
plot(exp$tl, exp$Global_active_power, type="l", main="",xlab="",ylab="Global Active Power (kilowatts)")
plot(exp$tl,exp$Sub_metering_1,type="l", main="", ylab="Energy sub metering",xlab="")
points(exp$tl,exp$Sub_metering_2,type="l",col="red")
points(exp$tl,exp$Sub_metering_3,type="l",col="blue")  
legend("topright",bty="n",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1))

plot(exp$tl, exp$Voltage, type="l", main="",xlab="datetime",ylab="Voltage")  

plot(exp$tl, exp$Global_reactive_power, type="l", main="",xlab="datetime",ylab="Global reactive power")  

# flushes the plot
dev.off()