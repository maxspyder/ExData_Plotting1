powerdata <-read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

selectedPower <- filter(powerdata, powerdata$Date =="1/2/2007" | powerdata$Date =="2/2/2007")
selectedPower$Date <- as.Date(selectedPower$Date, format="%d/%m/%Y")

datetime <- paste(as.Date(selectedPower$Date), selectedPower$Time)
selectedPower$Datetime <- as.POSIXct(datetime)

png("plot2.png", width=480, height=480)

with(selectedPower, {
  plot(Global_active_power~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
})

dev.off()