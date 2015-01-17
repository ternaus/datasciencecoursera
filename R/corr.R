corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0

        ## Return a numeric vector of correlations
  joint_data <- vector()
    
  for (file_name in list.files(directory)) {        
    path <- paste(c(directory, file_name), collapse="/")    
    data_file <- read.csv(path, header=T,sep=",")
    data_file <- data_file[complete.cases(data_file), ]
    if (nrow(data_file) > threshold) {
      joint_data <- c(joint_data, cor(data_file$nitrate, data_file$sulfate) )  
    }    
  }
  joint_data
}

