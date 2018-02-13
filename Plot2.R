#loading  data into R with fewer rows (containing desired dates)
data<-read.table("C:/Users/Ann/Desktop/Data_Scientist/household_power_consumption.txt", header = TRUE, sep=';',nrows =72000 ,na.strings = '?', colClasses = 'character')

#Changing date's format
data$Date<-as.Date(data$Date, format='%d/%m/%Y')
data$Time<-format(strptime(data$Time, format='%H:%M:%S'), '%H:%M:%S')

#subseting dataset - just two dates 
x<-data[data$Date>='2007-02-01'&data$Date<='2007-02-02',]
str(x)

#Creating new variable 'Datefull' to have date in desired format
x$Datefull<-paste(x$Date,x$Time, sep = ' ')
x$Datefull<-strptime(x$Datefull, '%Y-%m-%d %H:%M:%S')

#Changing class of desired variable
x$Global_active_power<-as.numeric(x$Global_active_power)

#Checking for missing values
sum(is.na(x$Global_active_power))

#Creating a plot
plot(x$Datefull, x$Global_active_power, type = 'l',xlab='', ylab = 'Global Active Power (kilowatts)')

#saving diagram as png file
dev.copy(png, 'plot2.png')
dev.off()


