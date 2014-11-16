#source("corr.R")
#corr("specdata", 10)

corr <- function(directory, threshold = 0) {
  
  correlations <- vector(mode="numeric")
  
  for(filename in list.files(directory, full.names = TRUE, pattern = "*.csv")) {
    data <- read.csv(filename)
    data <- data[which(!is.na(data$sulfate) & !is.na(data$nitrate)),] # exclude missing values
    if(nrow(data) > threshold) { #only consider if threshold is met
      correlation <- cor(data$sulfate, data$nitrate)
      correlations <- append(correlations, correlation)
    }
  }
  correlations
}