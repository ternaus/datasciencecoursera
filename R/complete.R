complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases
  joint_data <- vector()
  
  
  for (file_name in list.files(directory)) {        
    path <- paste(c(directory, file_name), collapse="/")    
    data_file <- read.csv(path, header=T,sep=",")
    data_file <- data_file[complete.cases(data_file), ]
    joint_data <- rbind(joint_data, data_file)

  } 
  result <- vector()
  for (ID in id){
    x <- joint_data$ID == ID
    nobs <- nrow(joint_data[x, ])
    result <- rbind(result, c(ID, nobs))
  }

  result <- data.frame(result)
  colnames(result) <- c("id", "nobs")
  result
}
