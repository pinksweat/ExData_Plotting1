setwd("/Users/crios93/curso")


datos<-read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

datos1<- subset(datos, Date %in% c("1/2/2007","2/2/2007"))

datos1$Date<-strptime(datos1$Date,"%d/%m/%Y" )

hist(datos1$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", ylab= "Frequency" , main ="Global Active Power" )

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()