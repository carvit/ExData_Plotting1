source("rinput.R")

# This function reads input data from the current directory and plots sub_metering measures
# The plot is saved into 480x480px (default size) plot3.png file
plot3 <- function() {
  # reads the data
  exp <- rinput("./household_power_consumption.txt")
  
  # opens the png device
  png("plot3.png")
  
  # constructs the plot
  plot(exp$tl,exp$Sub_metering_1,type="l", main="", ylab="Energy sub metering",xlab="")
  points(exp$tl,exp$Sub_metering_2,type="l",col="red")
  points(exp$tl,exp$Sub_metering_3,type="l",col="blue")  
  legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1))
  
  # flushes the plot
  dev.off()
  TRUE
}