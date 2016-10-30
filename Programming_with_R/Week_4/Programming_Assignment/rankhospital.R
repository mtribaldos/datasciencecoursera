rankhospital <- function(state, outcome, num = "best") {
   ## Read outcome data
   col <- paste("Hospital.30.Day.Death..Mortality..Rates.from", outcome, sep=".")
   outcome_data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
   
   state_outcome <- outcome_data[outcome_data$State == state,]
   state_outcome[[col]] <- as.numeric(state_outcome[[col]])
   state_outcome <- state_outcome[!is.na(state_outcome[[col]]),]
   sorted <- state_outcome[order(state_outcome[[col]], state_outcome$Hospital.Name),]

   if (num == "worst") 
       num <- nrow(sorted)
       
   sorted[num,]$Hospital.Name
}
