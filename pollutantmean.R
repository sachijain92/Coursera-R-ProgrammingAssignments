pollutantmean = function(directory, pollutant , id =  1:332 )
{
  directory = paste0("C:\\New folder\\rprog-data-specdata\\", directory, "\\")
  answer = data.frame()
  
  for(i in id)
  {
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
    
  }
  if(pollutant == "nitrate")
  {
    returnval = answer$nitrate
  }
  else
    returnval = answer$sulfate
  
  returnval1 = mean(returnval, na.rm = TRUE) 
  returnval1
  
}