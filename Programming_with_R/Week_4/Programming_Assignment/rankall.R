
nth_hospital <- function(x, num, col) {
    if (num == "worst")
       num <- nrow(x)
    x[order(x[[col]], x$Hospital.Name),][num,]
}


rankall <- function(outcome, num = "best") {
   ## Read outcome data
   col <- paste("Hospital.30.Day.Death..Mortality..Rates.from", outcome, sep=".")
   outcome_data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
   
   outcome_data[[col]] <- as.numeric(outcome_data[[col]])
   outcome_data <- outcome_data[!is.na(outcome_data[[col]]),]

   by(outcome_data, outcome_data$State, function(x) nth_hospital(x, num, col)$Hospital.Name)
}
