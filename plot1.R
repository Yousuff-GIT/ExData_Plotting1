#Loading the required library
library(lubridate)
drawPlot1 <- function()
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
  
  #Plotting the histogram
  hist(
    x = as.numeric(as.character(Req_HPCDataset$Global_active_power)),
    main = "Global Active Power",
    col = "Red",
    xlab = "Global Active Power(Kilowatts)"
  )
  #Copying the graph from the computer screen as a png image
  dev.copy(
    device = png,
    filename = 'plot1.png',
    width = 480,
    height = 480
  )
  #Closing the graphics device
  dev.off()
}
#Invoking the function
drawPlot1()