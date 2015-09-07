complete = function(directory, id = 1:332)
{
  directory = paste0("C:\\New folder\\rprog-data-specdata\\", directory, "\\")
  returnval = data.frame()
  for(i in id)
  {
    answer = data.frame()
    if(i < 10)
    {
      answer = rbind(answer, read.csv(file.path(directory,paste0("00",i,".csv"))))
      
      
    }
    else if(i>9 & i < 100)
    {
      answer = rbind(answer, read.csv( file.path(directory,paste0("0",i,".csv"))))
      
    }
    else
    {
      answer = rbind(answer, read.csv(file.path(directory,paste0(i,".csv"))))
      
    }
    tempanswer = na.omit(answer)
    temp = data.frame(id = i, nobs = nrow(tempanswer))
    returnval = rbind(returnval,temp)
    
  }
  returnval
}