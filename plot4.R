## setwd("Coursera/Exploratory Data Analysis")

## Read and clean data set:
exdata=read.table("household_power_consumption.txt",sep=";",header=TRUE)
exdata$Date<-as.Date(exdata$Date, format="%d/%m/%Y")
exdata<-subset(exdata, Date=="2007-02-01" | Date=="2007-02-02")
exdata$Date<-strptime(paste(as.character(exdata$Date), 
                            as.character(exdata$Time)),
                      format="%Y-%m-%d %H:%M:%S",tz="Europe/Paris")
exdata<-exdata[-2]
names(exdata)[1]<-"datetime"
exdata$Global_active_power<-as.numeric(
        as.character(exdata$Global_active_power))
exdata$Sub_metering_1<-as.numeric(
        as.character(exdata$Sub_metering_1))
exdata$Sub_metering_2<-as.numeric(
        as.character(exdata$Sub_metering_2))
exdata$Voltage<-as.numeric(
        as.character(exdata$Voltage))
exdata$Global_reactive_power<-as.numeric(
        as.character(exdata$Global_reactive_power))

## Create and save png graph:
png('plot4.png')

par(mfcol=c(2,2),mar=c(5,4.1,4,2.2),pty="m",bg=NA)

plot(exdata$datetime,exdata$Global_active_power,type="l",xlab="",
     ylab="Global Active Power")

plot(exdata$datetime,exdata$Sub_metering_1,type="n",xlab="",
     ylab="Energy sub metering")
lines(exdata$datetime,exdata$Sub_metering_1)
lines(exdata$datetime,exdata$Sub_metering_2,col="red")
lines(exdata$datetime,exdata$Sub_metering_3,col="blue")
legend("topright",legend=names(exdata)[6:8],
       lty=1,col=c("black","red","blue"),bty="n")

plot(exdata$datetime,exdata$Voltage,type="l",xlab="datetime",ylab="Voltage")

plot(exdata$datetime,exdata$Global_reactive_power,type="l",xlab="datetime",
     ylab="Global_reactive_power")

dev.off()