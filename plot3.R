setwd("/Users/crios93/curso")


datos<-read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

datos1<- subset(datos, Date %in% c("1/2/2007","2/2/2007"))

datos1$Date<-strptime(datos1$Date,"%d/%m/%Y" )

dt <- paste(as.Date(datos1$Date), datos1$Time)
datos1$dt <- as.POSIXct(dt)


with(datos1, {
  plot(Sub_metering_1~dt, type="l",
       ylab="Energy Sub metering", xlab="")
  lines(Sub_metering_2~dt,col="red")
  lines(Sub_metering_3~dt,col="blue")
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()