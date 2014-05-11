plot1 <- function(data){
    
    figure_path <- "plot1.png"
    
    png(figure_path)
    
    # Plot histogram of Global Active Power
    hist(data$Global_active_power, main="Global Active Power", ylab="Frequency",
         xlab="Global Active Power (kilowatts)", col="red")
    
    dev.off()
}

main <- function(data_path="data"){
    # Assuming that the workspace points to the current directory
    source("save_and_load_data.R")
    data <- save_and_load_data(data_path)
    plot1(data)
}

main()