##---
##  title: "Plot 2"
##  author: "Kayode Ayankoya"
##  date: "Tuesday, December 2, 2014"
##  output: Plot2.png
##  ---

plot2 <- function(){
  ## Load the Lubridate package that will be used to manipulate date
  library(lubridate)
  
  ## Set the working directory
  setwd("C:/Users/Lungelwa Wababa/Dropbox/Cousera/Explorative Data Analysis/Project 1")
  
  
  
  ## Read data from text file indicating that the variables are separated using ";"
  ## When data is being read, the missing data represented 
  ## by "?" is converted into blank space
  mydata <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";" , 
                     strip.white = TRUE, na.strings = c("?",""))
  
  ## Convert the date column to be a date data type and 
  ## Subset data for 2 days
  mydata$Date <- as.Date(mydata$Date, format="%d/%m/%Y")
  mydata <- mydata[which(mydata$Date == as.Date("2007-02-01") | mydata$Date == as.Date("2007-02-02")) ,]
  
  ## create a new column with full date and time by appending the time column to the date column
  DateTime  <- paste(as.character(mydata$Date), mydata$Time, sep = " ")
  mydata  <- cbind(mydata, DateTime) 
  
  ## Use the lubridate package to convert the new datetime column to date format
  mydata$DateTime <- ymd_hms(mydata$DateTime)
  
  ## Create Plot 2 using the Png Device  
  png("plot2.png", width=480, height=480)
  plot(mydata$DateTime, mydata$Global_active_power, xlab = "", ylab ="Global Active Power (kilowatts)", type="n")
  lines(mydata$DateTime, mydata$Global_active_power, type="l")
  dev.off()
}