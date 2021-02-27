rankhospital <- function(state, outcome, num = "best") {
  ## Read outcome data
  outcomedata <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  ## Check that state and outcome are valid
  if (!state %in% outcomedata[["State"]]){
    stop("invalid state")
  }
  diseaselist <- c("heart attack","heart failure","pneumonia")
  if (!outcome %in% diseaselist){
    stop("invalid outcome")
  }
  statedata <- subset(outcomedata,State == state)
  if (outcome == "heart attack") { 
    statedata <- statedata[c("Hospital.Name", "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack")]
  }
  else if (outcome == "heart failure"){
    statedata <- statedata[c("Hospital.Name", "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure")]
  }
  else {
    statedata <- statedata[c("Hospital.Name", "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")]
  }
  colnames(statedata) <- c("Hospital.Name", "Disease.Rate")
  statedata[, "Disease.Rate"] <- as.numeric(as.character(statedata[, "Disease.Rate"]))
  statedata[, "Hospital.Name"] <- as.character(statedata[, "Hospital.Name"])
  statedata <- statedata[order(statedata$Disease.Rate, statedata$Hospital.Name), ] 
  
  ## Return hospital name in that state with the given rank
  ## 30-day death rate
  N <- sum(!is.na(statedata$Disease.Rate))
  if (num == "best"){
    num <- 1
  }
  else if (num == "worst"){
    num <- N
  }
  else{}
  
  Hospital <- statedata[num, "Hospital.Name"]
  Hospital

}
