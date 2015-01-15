
pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  
  joint_data <- vector()
  
  
  for (file_name in list.files(directory)) {        
    path <- paste(c(directory, file_name), collapse="/")
    disjoint_data <- read.csv(path, header=T, sep=",")
    
    if (as.integer(disjoint_data$ID[1]) %in% id){
      joint_data <- rbind(joint_data, read.csv(path, header=T,sep=","))
    }
  } 
  mean(joint_data[, pollutant], na.rm=T)
}

x <- pollutantmean("specdata", "sulfate", 1:10)
x
y <- pollutantmean("specdata", "nitrate", 70:72)
y
z <- pollutantmean("specdata", "nitrate", 23)
z
# write.table(pollutantmean("specdata"), "result.csv")