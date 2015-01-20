rankall <- function(outcome, num="best") {
	#read data
	data_file1 <- read.csv("outcome-of-care-measures.csv", header=T, na.strings="Not Available")

	#check outcome
	outcomes <- c("heart failure", "heart attack", "pneumonia")
	if (!(outcome %in% outcomes)) {
		stop("invalid outcome")
	}

	splitted_data <- split(data_file1, data_file1$State)

	result = vector()

	for (state_data in splitted_data) {		
		if (outcome == "heart attack") {		
			data_file <- state_data[!is.na(state_data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack), ]
			a <- sapply(data_file$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack, as.matrix)
			b <- sapply(a, as.numeric)
			data_file <- data_file[order(b, data_file$Hospital.Name), ]		
		}
		else if (outcome == "heart failure") {
			data_file <- state_data[!is.na(state_data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure), ]
			a <- sapply(data_file$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure, as.matrix)
			b <- sapply(a, as.numeric)
			data_file <- data_file[order(b, data_file$Hospital.Name), ]				
		}
		else if (outcome == "pneumonia") {
			data_file <- state_data[!is.na(state_data$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia), ]
			a <- sapply(data_file$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia, as.matrix)
			b <- sapply(a, as.numeric)		
			data_file <- data_file[order(b, data_file$Hospital.Name), ]				
		}	
		if (num == "best") {
			temp <- as.vector(data_file$Hospital.Name)[1]	
		}
		else if (num == "worst") {
			temp <- as.vector(data_file$Hospital.Name)[nrow(data_file)]	
		}
		else {
			temp <- as.vector(data_file$Hospital.Name)[num]
		}
		state <- as.vector(state_data$State)[1]
		result <- rbind(result, c(temp, state))
		
	}
	
	colnames(result) <- c("hospital", "state")
	as.data.frame(result)
	
}


# head(rankall("heart attack", 20), 10)
# tail(rankall("pneumonia", "worst"), 3)
tail(rankall("heart failure"), 10)