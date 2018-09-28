complete <- function(directory, id = 1:332) {
  
  result <- data.frame(id = integer(), nobs = integer())
  
  for (current_id in id) {
    
    current_frame <- read.csv(sprintf("%s/%03d.csv", directory, current_id))
    compled_cases_frame <- current_frame[complete.cases(current_frame), ]
    
    result<- rbind(result, list(current_id, nrow(compled_cases_frame)))
    
  }

  result
}