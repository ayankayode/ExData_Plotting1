##---
##  title: "Plot 1"
##  author: "Kayode Ayankoya"
##  date: "Tuesday, December 2, 2014"
##  output: Plot1.png
##  ---

plot1 <- function(){
  
  ## Set the working directory
  setwd("C:/Users/Lungelwa Wababa/Dropbox/Cousera/Explorative Data Analysis/Project 1")
  
  
  ## Read data from text file indicating that the variables are separated using ";"
  ## When data is being read, the missing data represented 
  ## by "?" is converted into blank space
  mydata <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";" ,
                     strip.white = TRUE, na.strings = c("?",""))

  ## Convert the  Date Column to a Date data type 
  mydata$Date <- as.Date(mydata$Date, format="%d/%m/%Y")
  ## mydata$Time <- strptime(mydata$Time, format= "%H:%M:%S")
  
  ## Subset the data for 2 days only
  mydata <- mydata[which(mydata$Date == as.Date("2007-02-01") | mydata$Date == as.Date("2007-02-02")) ,]
  
  
  ##Create the Plot using png 
  png("plot1.png", width=480, height=480)
  hist(mydata$Global_active_power, col="red", main = "Global Active Power", xlab ="Global Active Power (kilowatts)")
  dev.off()
}