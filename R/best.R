best <- function(state, outcome) {
	#read data
	data_file <- read.csv("outcome-of-care-measures.csv", header=T)
	#check state
	states <- unique(data_file$State)
	if (!(state %in% states)) {
		stop("invalid state")
	}
	#check outcome
	outcomes <- c("heart failure", "heart attack", "pneumonia")
	if (!(outcome %in% outcomes)) {
		stop("invalid outcome")
	}
	#find best 
	#filter state
	data_file <- data_file[(data_file$State == state), ]
	if (outcome == "heart attack") {		
		data_file <- data_file[data_file$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack != "Not Available", ]
		a <- sapply(data_file$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack, as.matrix)
		b <- sapply(a, as.numeric)
		data_file <- data_file[order(b, data_file$Hospital.Name), ]		

	}
	else if (outcome == "heart failure") {
		data_file <- data_file[data_file$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure != "Not Available", ]
		a <- sapply(data_file$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure, as.matrix)
		b <- sapply(a, as.numeric)
		data_file <- data_file[order(b, data_file$Hospital.Name), ]				
	}
	else if (outcome == "pneumonia") {
		data_file <- data_file[data_file$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia != "Not Available", ]
		a <- sapply(data_file$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia, as.matrix)
		b <- sapply(a, as.numeric)		
		data_file <- data_file[order(b, data_file$Hospital.Name), ]				
	}	
	as.vector(data_file$Hospital.Name)[1]
}
