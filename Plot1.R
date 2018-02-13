#loading  data into R with fewer rows (containing desired dates)
data<-read.table("C:/Users/Ann/Desktop/Data_Scientist/household_power_consumption.txt", header = TRUE, sep=';',nrows =72000 ,na.strings = '?', colClasses = 'character')
#Changing date's format
data$Date<-as.Date(data$Date, format='%d/%m/%Y')
#subseting dataset - just two dates 
x<-data[data$Date>='2007-02-01'&data$Date<='2007-02-02',]
#Changing class of desired variable
x$Global_active_power<-as.numeric(x$Global_active_power)
#Creating histogram
hist(x$Global_active_power, col = 'red', main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)', ylim=c(0,1200))
#saving diagram as png file
dev.copy(png, 'plot1.png')
dev.off()