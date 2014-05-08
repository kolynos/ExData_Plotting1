#load data
data<-read.table(unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt"),nrows=106956, header=T, sep=";",na.strings="?",stringsAsFactors=FALSE)
#set date and time variables
data$Date<-as.Date(data$Date,"%d/%m/%Y")
data<-data[data$Date>as.Date("2007-01-31",format="%Y-%m-%d"),]
data<-data[data$Date<as.Date("2007-02-3",format="%Y-%m-%d"),]
data$Time<-paste(data$Time,as.character(data$Date),sep=" ")
data$Time<-strptime(data$Time,format="%H:%M:%S %Y-%m-%d")
#plot figure
png(filename='plot1.png')
hist(data$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()