###Load data
x<- read.csv("household_power_consumption.txt", sep=";")

###convert date to date format
x1<-as.Date(x$Date, format="%d/%m/%Y")

x$Date<- x1

###subset to correct dates
x3<- subset(x, Date == "2007-02-02" | Date == "2007-02-01")

###change active power column to numeric
y<- as.numeric(levels(x3$Global_active_power))[x3$Global_active_power]

###convert in data frame
x3$Global_active_power<- y

###Create new column with date and time
x3$DT <- paste(x3$Date,x3$Time)

###Convert to correct time format
x3$DT <- strptime(x3$DT, "%Y-%m-%d %H:%M:%S")

###Plot
plot(x3$DT, x3$Global_active_power, type="l", ylab= "Global Active Power (kilowatts)", xlab="")