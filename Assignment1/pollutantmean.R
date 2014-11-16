#source("pollutantmean.R")
#pollutantmean("specdata", p, 1)

pollutantmean <- function(directory, pollutant, id = 1:332) {

  allpollutantdata <- vector(mode="numeric")
  
  for(fileid in id) {
    # prefix with zeros first
    fileidstr <- paste("000", fileid, sep="")
    
    # get the last three characters
    fileidstr <- substr(fileidstr, nchar(fileidstr)-2, nchar(fileidstr))
    
    filename <- paste(directory, "/", fileidstr, ".csv", sep="")
    
    if(!file.exists(filename)) {
      print(paste("File does not exist", filename))
    }
    else {
      data <- read.csv(filename)
      pollutantdata <- as.vector(data[pollutant][,1])
      allpollutantdata <- append(allpollutantdata, pollutantdata)
    }
  }
  mean(allpollutantdata, na.rm = TRUE)
}
