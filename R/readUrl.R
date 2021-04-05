readUrl <- function(url, destfile1) {
  out <- tryCatch(
    {
      message("Trying to download.")
      download.file(url, destfile=destfile1 , mode="wb")
    },
    error=function(cond) {
      message(paste("URL does not seem to exist:", url))
      message("Here's the original error message:")
      message(cond)
    },
    warning=function(cond) {
      message(paste("URL caused a warning:", url))
      message("Here's the original warning message:")
      message(cond)
    }
    )    
  return(out)
}