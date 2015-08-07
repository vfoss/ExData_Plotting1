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

## Create and save png graph:
png('plot2.png')

par(bg=NA)
plot(exdata$datetime,exdata$Global_active_power,type="l",xlab="",
     ylab="Global Active Power (kilowatts)")

dev.off()