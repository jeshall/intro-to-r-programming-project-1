corr <- function(directory, threshold=0) {
  
  complete_cases_frame <- complete(directory)
  threshold_met_frame <- complete_cases_frame[complete_cases_frame$nobs > threshold, ]
  result <- numeric()
  
  if(nrow(threshold_met_frame) > 0) {
  
    
    for (current_id in threshold_met_frame$id) {
      current_frame <- read.csv(sprintf("%s/%03d.csv", directory, current_id))
      result <- append(result, cor(current_frame$sulfate ,current_frame$nitrate, use = "complete.obs", method = "pearson"))
    }
  }
  
  result
}