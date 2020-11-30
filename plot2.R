setwd("/Users/crios93/curso")


datos<-read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

datos1<- subset(datos, Date %in% c("1/2/2007","2/2/2007"))

datos1$Date<-strptime(datos1$Date,"%d/%m/%Y" )

dt <- paste(as.Date(datos1$Date), datos1$Time)
datos1$dt <- as.POSIXct(dt)

with(datos1, plot(dt, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
