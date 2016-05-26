source("rinput.R")

# This function reads input data from the current directory and plots 4 different measures
# The plot is saved into 480x480px (default size) plot4.png file
plot4 <- function() {
  # reads the data
  exp <- rinput("./household_power_consumption.txt")

  # opens the device
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
  TRUE
}