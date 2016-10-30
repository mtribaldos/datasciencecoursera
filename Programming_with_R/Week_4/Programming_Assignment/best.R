best <- function(state, outcome) {
   ## Read outcome data
   col <- paste("Hospital.30.Day.Death..Mortality..Rates.from", outcome, sep=".")
   outcome_data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
 
   state_outcome <- outcome_data[outcome_data$State == state,]
   pn <- as.numeric(state_outcome[[col]])
   min_occ <- state_outcome[pn == min(pn, na.rm = T), 2]
   sort(min_occ)
}
