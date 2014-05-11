plot4 <- function(data){
    
    figure_path <- "plot4.png"
    
    # png default is 480x480
    png(figure_path)
    
    # Plot multiple graphs
    par(mfrow=c(2,2))
    
    plot(data$Date_time, data$Global_active_power, type='l',
         ylab="Global Active Power (kilowatts)", xlab="")
    
    plot(data$Date_time, data$Voltage, type="l", ylab="Voltage", xlab="datetime")
    
    plot(data$Date_time, data$Sub_metering_1, type='l', xlab="",
         ylab="Energy sub metering")
    lines(data$Date_time, data$Sub_metering_2, type='l', col='red')
    lines(data$Date_time, data$Sub_metering_3, type='l', col='blue')
    legend("topright", lty=1, col = c("black", "red", "blue"), 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           bty = "n")
    
    plot(data$Date_time, data$Global_reactive_power, type="l",
         ylab="Global_reactive_power", xlab="datetime")
    
    dev.off()
    
}

main <- function(data_path="data"){
    # Plot line graph for Gloabal Active Power v/s Date time
    source("save_and_load_data.R")
    data <- save_and_load_data(data_path)
    plot4(data)
}

main()
