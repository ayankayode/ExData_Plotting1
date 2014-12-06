##---
##  title: "Plot 4"
##  author: "Kayode Ayankoya"
##  date: "Thursday, December 4, 2014"
##  output: Plot4.png
##  ---
plot4 <- function(){
  
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
  
  ## Setup the canvas for the 4 plots
  png("plot4.png", width=480, height=480)  
  
  ## Setup the canvas for multiple plots
  par(mfrow = c(2,2))
  
  
  ##Insert Plot 1
  plot(mydata$DateTime, mydata$Global_active_power, xlab = "", ylab ="Global Active Power (kilowatts)", type="n")
  lines(mydata$DateTime, mydata$Global_active_power, type="l")
  
  
  ##Insert Plot 2
  plot(mydata$DateTime, mydata$Voltage, xlab = "datetime", ylab ="Voltage", type="n")
  lines(mydata$DateTime, mydata$Voltage, type="l")
  
  
  ##Insert Plot 3
  plot(mydata$DateTime, mydata$Sub_metering_1, xlab = "", ylab ="Energy sub metering", type="n")
  lines(mydata$DateTime, mydata$Sub_metering_1, type="l", col="black")
  lines(mydata$DateTime, mydata$Sub_metering_2, type="l", col = "red")
  lines(mydata$DateTime, mydata$Sub_metering_3, type="l", col="blue")
  legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), col = c("black","red","blue"))
  
  
  
  ##Insert Plot4
  plot(mydata$DateTime, mydata$Global_reactive_power, ylab = "Global_reactive_power", xlab = "datetime", type="n")
  lines(mydata$DateTime, mydata$Global_reactive_power, type="l")
  dev.off()
}