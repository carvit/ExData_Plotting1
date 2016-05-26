# This function reads the data from the input file and returns it in the data.frame
## 
# The data are modified as follows
#   - all ? are represented as N/A
#   - element named tl (timeline) is added to the list
#   - rows are filtered and only the two days of measures are returned
##
# The functions takes one parameter - filepath to the data source file
rinput <- function(filename) {
  household <- read.table(filename,header=TRUE, sep=";", na.strings="?", as.is=TRUE)
  
  household[,"Global_active_power"] <- as.numeric(household[,"Global_active_power"])
  household[,"Global_reactive_power"] <- as.numeric(household[,"Global_reactive_power"])
  household[,"Voltage"] <- as.numeric(household[,"Voltage"])
  household[,"Global_intensity"] <- as.numeric(household[,"Global_intensity"])
  household[,"Sub_metering_1"] <- as.numeric(household[,"Sub_metering_1"])
  household[,"Sub_metering_2"] <- as.numeric(household[,"Sub_metering_2"])
  household[,"Sub_metering_3"] <- as.numeric(household[,"Sub_metering_3"])
  

  dtchar <- paste(household$Date,household$Time)
  tl <- strptime(dtchar,"%d/%m/%Y %H:%M:%S")
  household$tl <- tl 
  
  household$Date <- as.Date(household$Date,"%d/%m/%Y")
  
  toExplore <- subset(household, Date >= as.Date('2007-02-01',"%Y-%m-%d") & Date <= as.Date('2007-02-02',"%Y-%m-%d"))
  toExplore
} 