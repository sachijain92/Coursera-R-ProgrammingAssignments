best <- function(state, outcome) {
  ## Read outcome data
  input = read.csv(file='C:\\New folder\\rprog-data-ProgAssignment3-data\\outcome-of-care-measures.csv', colClasses = 'character')
  
  ## Check that state and outcome are valid
  if(!any(state == input$State)) 
  {
    stop('invalid state')
  }
  
  if(outcome == 'heart attack') 
  {
    columnvalue = 11
  }
  else if(outcome == 'heart failure') 
  {
    columnvalue = 17
  }
  else if(outcome == 'pneumonia') 
  {
    columnvalue = 23
  }
  else 
  {
    stop('invalid outcome')
  }
  
  ## Return hospital name in that state with lowest 30-day death
  ## rate
  temp = input[input$State == state, ]
  temp[, columnvalue] = as.numeric(x=temp[, columnvalue])
  
  temp = temp[complete.cases(temp), ]
  Hospitalnames = temp[(temp[, columnvalue] == min(temp[, columnvalue])), ]$Hospital.Name
  
  sort(Hospitalnames)
  Hospitalnames[1]
}
