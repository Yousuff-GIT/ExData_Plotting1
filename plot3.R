#Loading the required library
library(lubridate)
library(dplyr)
drawPlot3 <- function()
{
  #Reading the dataset
  HPCDataset <-
    read.table(file = "household_power_consumption.txt",
               header = T,
               sep = ";")
  #Converting the Date column as Date type
  HPCDataset$Date <- dmy(HPCDataset$Date)
  #Subsetting the required rows
  Req_HPCDataset <-
    subset(HPCDataset,
           (
             HPCDataset$Date >= "2007-02-01" & HPCDataset$Date <= "2007-02-02"
           ))
  #Adding a new column called timestamp to the existing dataset
  Req_HPCDataset <-
    mutate(Req_HPCDataset, timestamp = as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
  #Plotting the graph with lines
  plot(
    Req_HPCDataset$timestamp,
    as.numeric(as.character(Req_HPCDataset$Sub_metering_1)),
    xlab = " ",
    ylab = "Energy sub metering",
    type = "l"
  )
  #annotating (adding) Sub_metering_2 into the plot
  lines(Req_HPCDataset$timestamp, as.numeric(as.character(Req_HPCDataset$Sub_metering_2)), col =
          "Red")
  #annotating (adding) Sub_metering_3 into the plot
  lines(Req_HPCDataset$timestamp, as.numeric(as.character(Req_HPCDataset$Sub_metering_3)), col =
          "Blue")
  #Adding description for different lines in the graph
  legend(
    'topright',
    c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
    lty = c(1, 1, 1),
    lwd = c(1, 1, 1),
    col = c("Black", "Red", "Blue")
  )
  #Copying the graph from the computer screen as a png image
  dev.copy(
    device = png,
    filename = 'plot3.png',
    width = 480,
    height = 480
  )
  #Closing the graphics device
  dev.off()
}
#Invoking the function
drawPlot3()