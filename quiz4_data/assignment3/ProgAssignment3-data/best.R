
best <- function(state, outcome) {
  ## Read outcome data
  outcomedata <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  #outcome <- tolower(outcome)
  #inputstate <- state
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
  
  ## Check that state and outcome are valid
  ## Return hospital name in that state with lowest 30-day death
  ## rate
  statedata <- statedata[order(statedata$Disease.Rate, statedata$Hospital.Name), ]
  best <- statedata[1, "Hospital.Name"]
  best 
  
}

