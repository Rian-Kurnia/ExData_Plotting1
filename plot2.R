library(sqldf)

fi <- file('household_power_consumption.txt')
df <- sqldf("select * from fi where Date in ('1/2/2007','2/2/2007')", file.format = 
                  list(header=TRUE, sep=";"))
close(fi)

x <- paste(df$Date,df$Time)
z <- strptime(x, "%d/%m/%Y %H:%M:%S")
Sys.setlocale("LC_TIME","en_US.UTF-8")

png('plot2.png')
plot(z,df$Global_active_power,type='l', xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

#id_ID.UTF-8