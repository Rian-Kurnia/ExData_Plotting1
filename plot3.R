library(sqldf)

fi <- file('household_power_consumption.txt')
df <- sqldf("select * from fi where Date in ('1/2/2007','2/2/2007')", file.format = 
                  list(header=TRUE, sep=";"))
close(fi)

x <- paste(df$Date,df$Time)
z <- strptime(x, "%d/%m/%Y %H:%M:%S")
Sys.setlocale("LC_TIME","en_US.UTF-8")

png('plot3.png')
plot(z, df$Sub_metering_1, type='l', col='Black', xlab='', ylab='Energy sub metering')
legend("topright", c('Sub_metering_1','Sub_metering_2', 'Sub_metering_3'), 
       lty = c(1,1,1), col=c('Black','Red','Blue'))
lines(z, df$Sub_metering_2, col='Red')
lines(z, df$Sub_metering_3, col='Blue')
dev.off()