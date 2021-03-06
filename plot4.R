setwd("/Users/crios93/curso")


datos<-read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

datos1<- subset(datos, Date %in% c("1/2/2007","2/2/2007"))

datos1$Date<-strptime(datos1$Date,"%d/%m/%Y" )

dt <- paste(as.Date(datos1$Date), datos1$Time)
datos1$dt <- as.POSIXct(dt)


par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(datos1, {
  plot(Global_active_power~dt, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="datetime")
  plot(Voltage~dt, type="l", 
       ylab="Voltage", xlab="datetime")
  plot(Sub_metering_1~dt, type="l", 
       ylab="Enery Sub Metering", xlab="datetime")
  lines(Sub_metering_2~dt,col='Red')
  lines(Sub_metering_3~dt,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~dt, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="datetime")
})


dev.copy(png, file="plot4.png", height=480, width=480)