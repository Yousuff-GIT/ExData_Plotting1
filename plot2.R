#Loading the required library
library(lubridate)
library(dplyr)
drawPlot2 <- function()
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
    as.numeric(as.character(Req_HPCDataset$Global_active_power)),
    xlab = " ",
    ylab = "Global Active Power(Kilowatts)",
    type = "l"
  )
  #Copying the graph from the computer screen as a png image
  dev.copy(
    device = png,
    filename = 'plot2.png',
    width = 480,
    height = 480
  )
  #Closing the graphics device
  dev.off()
}
#Invoking the function
drawPlot2()