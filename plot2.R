plot2 <- function(data){
    
    figure_path <- "plot2.png"
    
    # png default is 480x480
    png(figure_path)
    
    # Plot line graph for Gloabal Active Power v/s Date time
    plot(data$Date_time, data$Global_active_power, type='l',
         ylab="Global Active Power (kilowatts)", xlab="")
    
    dev.off()
    
}

main <- function(data_path="data"){
    # Assuming that the workspace points to the current directory
    source("save_and_load_data.R")
    data <- save_and_load_data(data_path)
    plot2(data)
}

main()
