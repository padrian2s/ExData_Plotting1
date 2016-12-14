
load_data <- function() {
  filename <- "household_power_consumption.txt"
  dataFrame <- read.table(filename, colClasses=c("character", "character", rep("numeric",7)), na="?", header=TRUE, sep=";")
  dataFrame$Time <- strptime(paste(dataFrame$Date, dataFrame$Time), "%d/%m/%Y %H:%M:%S")
  dataFrame$Date <- as.Date(dataFrame$Date, "%d/%m/%Y")
  dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
  dataFrame <- subset(dataFrame, Date %in% dates)
  return(dataFrame)
}