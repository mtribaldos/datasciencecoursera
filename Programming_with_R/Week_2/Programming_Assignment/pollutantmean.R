
pollutantmean <- function(directory, pollutant, id=1:332) {
    files <- list.files(directory, full.name = TRUE)
    file_data_list <- lapply(files, read.csv)
    alldata <- do.call(rbind, file_data_list)
    
    pollutant_data <- alldata[alldata$ID %in% id,][[pollutant]]
    filtered_data <- pollutant_data[!is.na(pollutant_data)]
        
    mean(filtered_data)
}

