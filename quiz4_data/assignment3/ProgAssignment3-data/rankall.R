rankall <- function(outcome, num = "best") {
  ## Read outcome data
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  ## Check that state and outcome are valid
  diseaselist <- c("heart attack","heart failure","pneumonia")
  if (!outcome %in% diseaselist){
    stop("invalid outcome")
  }
  if (outcome == "heart attack") { 
    data <- data[c("Hospital.Name", "State", "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack")]
  }
  else if (outcome == "heart failure"){
    data <- data[c("Hospital.Name", "State", "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure")]
  }
  else {
    data <- data[c("Hospital.Name", "State", "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")]
  }
  colnames(data)[3] <- "Disease.Rate"
  data[, "Disease.Rate"] <- as.numeric(as.character(data[, "Disease.Rate"]))
  data[, "Hospital.Name"] <- as.character(data[, "Hospital.Name"])
  
  Statelist <- as.character(unique(data$State))
  Statelist <- Statelist[order(Statelist)]
  
  ## For each state, find the hospital of the given rank
  final <- data.frame()
  for (i in seq_len(length(Statelist))){
    statedat <- subset(data,State == Statelist[i])
    statedat <- statedat[order(c(statedat$Disease.Rate, statedat$Hospital.Name)), ]
    N <- sum(!is.na(statedat$Disease.Rate))
    if (num == "best"){
      num <- 1
    }
    else if (num =="worst"){
      num <- N
    }
    else {}
    hospital <- statedat[num,"Hospital.Name"]
    tmp <- data.frame(hospital,Statelist[i])
    colnames(tmp) <- c("hospital","state")
    final <- rbind(final,tmp)
  }
  ## Return a data frame with the hospital names and the
  ## (abbreviated) state name
  final
}

