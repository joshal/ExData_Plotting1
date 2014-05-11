plot3 <- function(data){
    
    figure_path <- "plot3.png"
    
    # png default is 480x480
    png(figure_path)
    
    # Plot multiple graphs for Sub metering v/s Date time on single plot
    plot(data$Date_time, data$Sub_metering_1, type='l', xlab="",
         ylab="Energy sub metering")
    lines(data$Date_time, data$Sub_metering_2, type='l', col='red')
    lines(data$Date_time, data$Sub_metering_3, type='l', col='blue')
    legend("topright", lty=1, col = c("black", "red", "blue"), 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    dev.off()
    
}

main <- function(data_path="data"){
    # Assuming that the workspace points to the current directory
    source("save_and_load_data.R")
    data <- save_and_load_data(data_path)
    plot3(data)
}

main()
