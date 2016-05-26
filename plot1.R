source("rinput.R")

# This function reads input data from the current directory and plots Global_active_power measures
# The plot is saved into 480x480px (default size) plot1.png file
plot1 <- function() {
  # reads the data
  exp <- rinput("./household_power_consumption.txt")
  
  # opens the png device
  png("plot1.png")
  
  # constructs the plot
  hist(exp$Global_active_power,col="red",xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power")
  
  # flushes the plot
  dev.off()
  TRUE
}


