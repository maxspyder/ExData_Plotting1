powerdata <-read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

selectedPower <- filter(powerdata, powerdata$Date =="1/2/2007" | powerdata$Date =="2/2/2007")
selectedPower$Date <- as.Date(selectedPower$Date, format="%d/%m/%Y")

datetime <- paste(as.Date(selectedPower$Date), selectedPower$Time)
selectedPower$Datetime <- as.POSIXct(datetime)

png("plot3.png", width=480, height=480)

with(selectedPower, {
  plot(Sub_metering_1~Datetime, type="l", ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()