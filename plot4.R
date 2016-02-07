## Update the following line to set proper working directory
workdir<-"C:/Users/vialgre/Desktop/DataScience/Exploratory Data Analysis/Week 1"
setwd(workdir)

## Load the data
filename <- "household_power_consumption.txt"
colnames <- read.csv2(filename,header=F,nrows=1, stringsAsFactors = F,na.strings = "?")
hpc <- read.csv2(filename,skip=66637,nrows=2879,dec=".")
names(hpc) <- colnames
hpc$DateTime <- paste(hpc$Date,hpc$Time)
hpc$DateTime <- strptime(hpc$DateTime, "%d/%m/%Y %H:%M:%S")

## Open the device
png(filename="plot4.png")

## Create the graph
par(mfrow = c(1,1))
par(mfrow = c(2,2))
with(hpc, {
  plot(hpc$DateTime,hpc$Global_active_power,type="l",xlab="",ylab="Global Active Power")
  plot(hpc$DateTime,hpc$Voltage,type="l",xlab="datetime",ylab="Voltage")
  with(hpc, {
    plot(hpc$DateTime,hpc$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
    lines(hpc$DateTime,hpc$Sub_metering_2,type="l",col="red")
    lines(hpc$DateTime,hpc$Sub_metering_3,type="l",col="blue")
    legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1)
  })
  plot(hpc$DateTime,hpc$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
  #mtext... (needs to setup oma=c(0,0,2,0)
})

## Close the device
dev.off()
