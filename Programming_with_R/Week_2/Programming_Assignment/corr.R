
corr <- function(directory, threshold = 0) {
    files <- list.files(directory, full.name = TRUE)
    file_data_list <- lapply(files, read.csv)
    alldata <- do.call(rbind, file_data_list)

    compl <- complete(directory)
    above_thr <- compl$id[compl$nobs > threshold]

    data <- alldata[alldata$ID %in% above_thr,]
    result <- ddply(data, "ID", function(x) cor(x$sulfate, x$nitrate, use="complete.obs"))
    result$V1
}

