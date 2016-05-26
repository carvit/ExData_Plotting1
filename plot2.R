source("rinput.R")

# This function reads input data from the current directory and plots Global_active_power measures
# The plot is saved into 480x480px (default size) plot2.png file
plot2 <- function() {
  # reads the data
  exp <- rinput("./household_power_consumption.txt")
  
  # opens the png device
  png("plot2.png")
  
  # constructs the plot
  plot(exp$tl, exp$Global_active_power, type="l", main="",xlab="",ylab="Global Active Power (kilowatts)")
  
  # flushes the plot
  dev.off()
  TRUE
}
