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


###convert from factors to numeric
x3$Sub_metering_1 <- as.numeric(levels(x3$Sub_metering_1))[x3$Sub_metering_1]
x3$Sub_metering_2 <- as.numeric(levels(x3$Sub_metering_2))[x3$Sub_metering_2]
x3$Sub_metering_3 <- as.numeric(levels(x3$Sub_metering_3))[x3$Sub_metering_3]

png('plot3.png', width=480, height = 480, units="px")

plot(x3$DT, x3$Sub_metering_1, type = "l", xlab ="Energy sub metering")
lines(x3$DT, x3$Sub_metering_2, col="red")
lines(x3$DT, x3$Sub_metering_3, col="blue")
lines(x3$DT, x3$Sub_metering_3, col="blue")
legend("topright", lty=1, col= c("black", "red", "blue"), legend =c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
