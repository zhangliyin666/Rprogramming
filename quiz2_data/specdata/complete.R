#part2
complete <- function(directory,id=1:332){
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  directory <- "D:/coursera/rprogramming/specdata"
  files_full <- list.files(directory, full.names = TRUE) 
  dat <- data.frame()
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  for (i in id) {
    moni_i <- read.csv(files_full[i])
    nobs <- sum(complete.cases(moni_i))
    tmp <- data.frame(i, nobs)
    dat <- rbind(dat, tmp)
  }
  colnames(dat) <- c("id", "nobs")
  dat
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
}

#test
complete("specdata", 1)
complete("specdata", c(2, 4, 8, 10, 12))
complete("specdata", 30:25)
complete("specdata", 3)
