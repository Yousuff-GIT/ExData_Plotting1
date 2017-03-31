#Loading the required library
library(lubridate)
library(dplyr)
drawPlot4 <- function()
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
  #Partioning the screen to create four graphs in 2 rows and 2 columns
  par(mfrow = c(2, 2))
  #Plotting the four different graphs
  with(Req_HPCDataset, {
    plot(
      timestamp,
      as.numeric(as.character(Global_active_power)),
      xlab = " ",
      ylab = "Global Active Power(Kilowatts)",
      type = "l"
    )
    plot(
      timestamp,
      as.numeric(as.character(Voltage)),
      xlab = "datetime",
      ylab = "Voltage",
      type = "l"
    )
    plot(
      timestamp,
      as.numeric(as.character(Sub_metering_1)),
      xlab = " ",
      ylab = "Energy sub metering",
      type = "l"
    )
    lines(timestamp, as.numeric(as.character(Sub_metering_2)), col = "Red")
    lines(timestamp, as.numeric(as.character(Sub_metering_3)), col = "Blue")
    plot(
      timestamp,
      as.numeric(as.character(Global_reactive_power)),
      xlab = "datetime",
      ylab = "Global_reactive_power",
      type = "l"
    )
  })
  #Copying the graph from the computer screen as a png image
  dev.copy(
    device = png,
    filename = 'plot4.png',
    width = 480,
    height = 480
  )
  #Closing the graphics device
  dev.off()
}
#Invoking the function
drawPlot4()