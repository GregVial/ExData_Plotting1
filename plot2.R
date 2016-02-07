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
png(filename="plot2.png")

## Create the graph
par(mfrow = c(1,1))
plot(hpc$DateTime,hpc$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

## Close the device
dev.off()

