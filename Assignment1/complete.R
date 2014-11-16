#source("complete.R")
#complete("specdata", id = 1:332)

complete <- function(directory, id = 1:332) {
  
  output <- data.frame(matrix(ncol = 2, nrow = 0))
  
  for(fileid in id) {
    # prefix with zeros first
    fileidstr <- paste("000", fileid, sep="")
    
    # get the last three characters
    fileidstr <- substr(fileidstr, nchar(fileidstr)-2, nchar(fileidstr))

    filename <- paste(directory, "/", fileidstr, ".csv", sep="")
    if(file.exists(filename)) {
      data <- read.csv(filename)
      count <- nrow(data[which(!is.na(data$sulfate) & !is.na(data$nitrate)),])
      newrow <- c(fileid,count)
      output <- rbind(output, newrow)
    }
  }
  names(output) <- c("id", "nobs")
  output
}