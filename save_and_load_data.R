save_and_load_data <- function(data_path, use_saved_file=TRUE) {
    # data_path: The directory where data is stored
    # use_saved_file: A boolean as to whether to recalculate the data frame to be loaded
    
    # Path to the power consumption data file
    data_file_path <- file.path(data_path, "household_power_consumption.txt")
    
    # Path to the output data frame
    output_data_frame_path <- file.path(data_path, "required_data_frame")
    
    if (!file.exists(output_data_frame_path) || !use_saved_file){
        data <- extract_data(data_file_path)
        save(data, file=output_data_frame_path)
    }

    load(output_data_frame_path)
    
    data
}

extract_data <- function(data_file_path){
    # Find lines for 1/2/2007 and 2/2/2007
    lines <- grep('^[1-2]/2/2007', readLines(data_path))
    
    # Extract headers
    headers <- read.table(data_path, nrows=1, sep=";", stringsAsFactors=FALSE)
    # Extract only relevant data
    data <- read.table(data_path, sep=";", na.strings="?", skip=lines[1], 
                       nrows=length(lines), comment.char = "")
    # Assign headers
    colnames(data) <- headers
    # Add a Date_time column
    data$Date_time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
    data
}