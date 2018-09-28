pollutantmean <- function(directory, pollutant, id = 1:332) {
  pollutants <- c()
  
  for (current_id in id) {
    current_frame <- read.csv(sprintf("./%s/%03d.csv", directory, current_id))
    pollutants <- append(pollutants, current_frame[pollutant])
  }
  
  mean(unlist(pollutants), na.rm = TRUE)
}