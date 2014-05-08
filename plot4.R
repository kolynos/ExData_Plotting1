#load data
data<-read.table(unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt"),nrows=106956, header=T, sep=";",na.strings="?",stringsAsFactors=FALSE)
#set date and time variables
data$Date<-as.Date(data$Date,"%d/%m/%Y")
data<-data[data$Date>as.Date("2007-01-31",format="%Y-%m-%d"),]
data<-data[data$Date<as.Date("2007-02-3",format="%Y-%m-%d"),]
data$Time<-paste(data$Time,as.character(data$Date),sep=" ")
data$Time<-strptime(data$Time,format="%H:%M:%S %Y-%m-%d")
#plot figure
png(filename='plot4.png')
par(mfrow=c(2,2))
#plot top left figure
plot(data$Time,data$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
#plot top right figure
plot(data$Time,data$Voltage,type="l",ylab='Voltage',xlab="datetime")
#plot bottom left figure
plot(data$Time,data$Sub_metering_1,type="l",ylab="Engery sub metering",xlab="")
lines(data$Time,data$Sub_metering_2,type="l",col='red')
lines(data$Time,data$Sub_metering_3,type="l",col='blue')
par(cex=0.75)
legend('topright',box.lwd=0,lty=1,col=(c('black','red','blue')),legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
#plot bottom right figure
plot(data$Time,data$Global_reactive_power,type="l",xlab="datetime")
dev.off()
