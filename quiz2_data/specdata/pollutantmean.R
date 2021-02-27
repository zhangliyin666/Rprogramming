#part1
pollutantmean <- function(directory,pollutant,id=1:332){
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  directory <- "D:/coursera/rprogramming/specdata"
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  files_full <- list.files(directory, full.names = TRUE) 
  dat <- data.frame()
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  for (i in id) {
    dat <- rbind(dat, read.csv(files_full[i]))
  }
  mean(dat[, pollutant], na.rm = TRUE)
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  ## NOTE: Do not round the result!
}

#test
pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "nitrate", 23)
