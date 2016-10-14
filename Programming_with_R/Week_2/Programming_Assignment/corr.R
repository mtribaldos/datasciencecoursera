
corr <- function(directory, threshold = 0) {
    files <- list.files(directory, full.name = TRUE)
    file_data_list <- lapply(files, read.csv)
    alldata <- do.call(rbind, file_data_list)
 
    above_thr <- complete(directory)$nobs > threshold

    data <- alldata[above_thr,]
}

