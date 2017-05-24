
###Load data
x<- read.csv("household_power_consumption.txt", sep=";")

###convert date to date format
x1<-as.Date(x$Date, format="%d/%m/%Y")

x$Date<- x1

###subset to correct dates
x3<- subset(x, Date == "2007-02-02" | Date == "2007-02-01")

###Create new column with date and time
x3$DT <- paste(x3$Date,x3$Time)

x3$DT<- strptime(x3$DT, "%Y-%m-%d %H:%M:%S")

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

GAP <- as.numeric(x3$Global_active_power)
GRP <- as.numeric(x3$Global_reactive_power)
voltage <- as.numeric(x3$Voltage)
subMetering1 <- as.numeric(x3$Sub_metering_1)
subMetering2 <- as.numeric(x3$Sub_metering_2)
subMetering3 <- as.numeric(x3$Sub_metering_3)

par(mfrow = c(2, 2)) 

plot(x3$DT, x3$Global_active_power, type="l", ylab= "Global Active Power (kilowatts)", xlab="")

plot(x3$DT, x3$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(x3$DT, x3$Sub_metering_1, type = "l", xlab ="Energy sub metering")
lines(x3$DT, x3$Sub_metering_2, col="red")
lines(x3$DT, x3$Sub_metering_3, col="blue")
lines(x3$DT, x3$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(x3$DT, GRP, type="l", xlab="datetime", ylab="Global_reactive_power")

def.off()