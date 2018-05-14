library(sqldf)

fi <- file('household_power_consumption.txt')
df <- sqldf("select * from fi where Date in ('1/2/2007','2/2/2007')", file.format = 
                  list(header=TRUE, sep=";"))
close(fi)

png('plot1.png')
hist(df$Global_active_power,col="Red",xlab='Global Active Power (kilowatts)', 
     main='Global Active Power')
dev.off()