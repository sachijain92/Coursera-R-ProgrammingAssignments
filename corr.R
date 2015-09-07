corr <- function(directory, threshold = 0)
{
  tempreturn = vector()
  first = complete(directory)
  directory = paste0("C:\\New folder\\rprog-data-specdata\\", directory, "\\")
  second = subset(first, nobs > threshold)
  extractid = second[, 1]
  for(i in extractid)
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
    answer = na.omit(answer)
    tempreturn = c(tempreturn, cor(answer$sulfate, answer$nitrate))
  }
  tempreturn
}