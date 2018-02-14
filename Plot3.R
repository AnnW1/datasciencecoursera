#loading  data into R with fewer rows (containing desired dates)
data<-read.table("C:/Users/Ann/Desktop/Data_Scientist/household_power_consumption.txt", header = TRUE, sep=';',nrows =72000 ,na.strings = '?', colClasses = 'character')

#Changing date's format
data$Date<-as.Date(data$Date, format='%d/%m/%Y')
data$Time<-format(strptime(data$Time, format='%H:%M:%S'), '%H:%M:%S')

#subseting dataset - just two dates 
x<-data[data$Date>='2007-02-01'&data$Date<='2007-02-02',]

#Creating new variable 'Datefull' to have date in desired format
x$Datefull<-paste(x$Date,x$Time, sep = ' ')
x$Datefull<-strptime(x$Datefull, '%Y-%m-%d %H:%M:%S')

#Changing class of desired variable
x$Sub_metering_1<-as.numeric(x$Sub_metering_1)
x$Sub_metering_2<-as.numeric(x$Sub_metering_2)
x$Sub_metering_3<-as.numeric(x$Sub_metering_3)
str(x)

png('plot3.png', width = 600, height = 600)

#Creating a plot
plot(x$Datefull, x$Sub_metering_1, type = 'l', xlab = '', ylab = 'Energy sub metering')
lines(x$Datefull, x$Sub_metering_2, col='red')
lines(x$Datefull, x$Sub_metering_3, col='blue')
legend('topright',  lty = 1, col = c('black', 'red', 'blue'), legend = colnames(x)[7:9])


dev.off()




