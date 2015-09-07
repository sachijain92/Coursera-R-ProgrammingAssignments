rankall <- function(outcome, num = "best")
{
  ## Read outcome data
  input= read.csv(file='C:\\New folder\\rprog-data-ProgAssignment3-data\\outcome-of-care-measures.csv', colClasses = 'character')
  resultret = list()
  
  ## Check that state and outcome are valid
  
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
  
  uniquestates <- sort(unique(input$State))
  
  
  
  ## Return hospital name in that state with lowest 30-day death
  ## rate
  for(state in uniquestates) 
  {
    temp = input[input$State == state, ]
    temp[, columnvalue] = as.numeric(x=temp[, columnvalue])    
    temp = temp[complete.cases(temp), ]
    
    # print(num)
    
    if(num == "best") 
    {
      tempnum = 1
    }
    else if(num == "worst") 
    {
      tempnum = nrow(temp)
    }
    else if(is.numeric(x=num)) 
    {
      if(num < 1 || num > nrow(temp)) 
      {
        resultret <- rbind(resultret, list( NA,  state))
        next
      }
      else tempnum <- num
      
    }
    else 
    {
      stop('invalid num')
    }
    temp = temp[order(temp[,columnvalue], temp$Hospital.Name), ]
    Hospitalnames = temp[tempnum, ]$Hospital.Name
    resultret = rbind(resultret, list( Hospitalnames[1], state))
  }
  resultret = as.data.frame(x=resultret)
  colnames(x=resultret) = c('hospital', 'state')
  resultret
}
