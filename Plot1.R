powerdata <-read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

selectedPower <- filter(powerdata, powerdata$Date =="1/2/2007" | powerdata$Date =="2/2/2007")
selectedPower$Date <- as.Date(selectedPower$Date, format="%d/%m/%Y")

png("plot1.png", width=480, height=480)

hist(selectedPower$Global_active_power, main = "Global Active Power", xlab="Global Active Power (kilowatts)", 
     ylab="Frequency", col="Red")

dev.off()