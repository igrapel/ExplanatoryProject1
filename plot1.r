###Load data
x<- read.csv("household_power_consumption.txt", sep=";")

###convert date to date format
x1<-as.Date(x$Date, format="%d/%m/%Y")

x$Date<- x1

###subset to correct dates
x2<- subset(x, Date == "2007-02-02" | Date == "2007-02-01")

###change active power column to numeric
y<- as.numeric(levels(x2$Global_active_power))[x2$Global_active_power]

###convert in data frame
x2$Global_active_power<- y


###make plot and save file as png
png('plot1.png', width=480, height = 480, units="px")
hist(x2$Global_active_power, breaks = 11, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts", ylab="Frequency")
dev.off()