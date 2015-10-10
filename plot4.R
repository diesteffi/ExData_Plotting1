## Set the working directory for this session to the folder that contains the
## assignment data
setwd("~/Documents/Documents/Programming/Exploratory/Week 1/ExData_Plotting1")

## Load the data into R
power<-read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")

## Format column names
namesnew<-tolower(names(power))
namesnew<-gsub(names, "_", "")
namesnew<-gsub( "_", "", namesnew)
names(power)<-namesnew
rm(namesnew)

## Subset for the dates "2007-02-01" and "2007-02-02"
power$date<-as.character(power$date)
power$time<-as.character(power$time)
power<-power[power$date=="1/2/2007"|power$date=="2/2/2007",]

## Format date and time
power$date<-strptime(paste(power$date, power$time, sep=" " ), 
                           format="%d/%m/%Y %H:%M:%S")
power<-power[,c(1,3:length(names(power)))]

## Create plot

png(filename='plot4.png') #default is 480x480 pixel
par(mfrow=c(2,2))

##plot 1
plot(power$date,power$globalactivepower,
     type='l',
     xlab='',
     ylab= 'Global Active Power')

##plot 2
plot(power$date,power$voltage,
     type='l',
     xlab='',
     ylab= 'Voltage')

##plot 3
plot(power$date,power$submetering1,
     type='n',
     xlab='',
     ylab= 'Energy sub metering')

points(power$date,power$submetering1,
       type='l',
       col='black')

points(power$date,power$submetering2,
       type='l',
       col='red')

points(power$date,power$submetering3,
       type='l',
       col='blue')

legend('topright', 
       legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
       lwd=2,
       col=c('black','red','blue'))

##plot 4
plot(power$date,power$globalreactivepower,
     type='l',
     xlab='',
     ylab= 'Global_reactive_power')

dev.off()

