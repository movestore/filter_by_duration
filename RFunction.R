library('move')
library('lubridate')

rFunction <- function(data,rel,valu,uni)
{
  Sys.setenv(tz="UTC")
  
  if (is.null(units) | is.null(rel) | is.null(valu)) logger.info("One of your parameters has not been set. This will lead to an error.")
  
  logger.info(paste("You have requested to filter the data set to include only data of individuals with duration", rel, valu, uni, "."))
  
  if (uni == "locs" )
  {
    if (rel=="above") 
    {
      if (any(as.vector(n.locs(data) > valu))) result <- data[[as.vector(n.locs(data) > valu)]] else result <- NULL
    }
    if (rel=="below") 
    {
      if (any(as.vector(n.locs(data) < valu))) result <- data[[as.vector(n.locs(data) < valu)]] else result <- NULL
    }
  } else
  {
    data.split <- move::split(data)
    dt <- lapply(data.split, function(x) time_length(interval(start=min(timestamps(x)),end=max(timestamps(x))),unit=uni))
    
    if (rel=="above") 
    {
      if (any(dt>valu)) result <- data[[dt>valu]] else result <- NULL
    }
    if (rel=="below") 
    {
      if (any(dt<valu)) result <- data[[dt<valu]] else result <- NULL
    }
  }
  
  if (is.null(result)) len.res <- 0 else len.res <- n.indiv(result)
  len.all <- n.indiv(data)

  if (is.null(result)) logger.info("None of your individuals have the required amount of locations/data duration. Result NULL.") else logger.info(paste("The selected data set retains ", len.res, "(of the originally",len.all, ") individuals, totalling", length(result),"(of the originally",length(data),") locations."))
  
  return(result)
}

  
  
  
  
  
  
  
  
  
  
