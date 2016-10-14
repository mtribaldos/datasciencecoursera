
corr <- function(directory, threshold = 0) {
    files <- list.files(directory, full.name = TRUE)
    file_data_list <- lapply(files, read.csv)
    alldata <- do.call(rbind, file_data_list)

    compl <- complete(directory)
    above_thr <- compl$id[compl$nobs > threshold]

    data <- alldata[alldata$ID %in% above_thr,]
    #aggregate(data, by=list(data$ID), FUN=function(x) cor(x["sulfate"], x["nitrate"]))
    aggregate(data$sulfate, by=list(data$ID), FUN=function(x) mean(x, na.rm=TRUE))
}

