#' Get input-output data
#'
#' @param year A number indicating the year of the input-output table to be downloaded. There are
#'    17 distinct datasets for version A (1995-2011) and 15 for version B (2000-2014).
#' @param version A character ("A", or "B") indicating the release version of the input-output table
#'    to be downloaded.
#' @return WIOT A list containig input-output table and other parameters, which is an input
#'    for construct() function.
#' @examples
#' get_io(year = 2014, version = "B")
#' get_io(2008)
#' @export

get_io <- function(year=1995, version="A")
{
  if (!(version %in% c("A","B"))){
    stop("Incorrect version input. Please choose A or B.")
  }


  library(repmis)

# preparing the path for data retrival and verifying the input

  if (version == "A"){
    if(!( year %in% c(1995:2008) )){
      stop("Incorrect year. Correct time interval is 1995-2008.")
    }

    path <- paste("https://github.com/DarekScigala/wiod_data/blob/master/WIOD", year, "A.rda?raw=True", sep="")
  }


  if (version == "B"){
    if(!( year %in% c(2000:2014) )){
      stop("Incorrect year. Correct time interval is 2000-2014.")
    }

    path <- paste("https://github.com/DarekScigala/wiod_data/blob/master/WIOD", year, "B.rda?raw=True", sep="")
  }

# Actual data retrieval from Github account

  source_data(path)

  WIOT <<- WIOT
  return(WIOT)
}
