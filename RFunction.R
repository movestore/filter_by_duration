library('move2')
library('lubridate')

rFunction <- function(data,rel,valu,uni)
{
  Sys.setenv(tz="UTC")
  
  if (is.null(units) | is.null(rel) | is.null(valu)) logger.info("One of your parameters has not been set. This will lead to an error.")
  
  logger.info(paste("You have requested to filter the data set to include only data of individuals with duration", rel, valu, uni, "."))
  
  if (uni == "locs" )
  {
    id_data <- table(mt_track_id(data))
    if (rel=="above") 
    {
      if (any(as.vector(id_data > valu))) result <- data[mt_track_id(data) %in% names(id_data)[as.vector(id_data > valu)],] else result <- NULL
    }
    if (rel=="below") 
    {
      if (any(as.vector(id_data < valu))) result <- data[mt_track_id(data) %in% names(id_data)[as.vector(id_data < valu)],] else result <- NULL
    }
  } else
  {
    data.split <- split(data,mt_track_id(data))
    dt <- lapply(data.split, function(x) time_length(interval(start=min(mt_time(x)),end=max(mt_time(x))),unit=uni))
    
    if (rel=="above") 
    {
      if (any(dt>valu)) result <- data[mt_track_id(data) %in% names(dt)[dt>valu],] else result <- NULL
    }
    if (rel=="below") 
    {
      if (any(dt<valu)) result <- data[mt_track_id(data) %in% names(dt)[dt<valu],] else result <- NULL
    }
  }
  
  if (is.null(result)) len.res <- 0 else len.res <- mt_n_tracks(result)
  len.all <- mt_n_tracks(data)

  if (is.null(result)) logger.info("None of your individuals have the required amount of locations/data duration. Result NULL.") else logger.info(paste("The selected data set retains ", len.res, "(of the originally",len.all, ") individuals, totalling", nrow(result),"(of the originally",nrow(data),") locations."))
  
  return(result)
}

  
  
  
  
  
  
  
  
  
  
