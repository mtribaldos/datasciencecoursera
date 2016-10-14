
complete <- function(directory, id=1:332) {
    files <- list.files(directory, full.name = TRUE)
    file_data_list <- lapply(files, read.csv)
    alldata <- do.call(rbind, file_data_list)
    
    data <- alldata[alldata$ID %in% id,]
    complete_data <- data[complete.cases(data),]
 
    frequency <- as.data.frame(table(complete_data$ID))
    colnames(frequency) <- c("id", "nobs")

    frequency
}

