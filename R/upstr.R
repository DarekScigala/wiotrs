#'Level of upstreamness
#'
#' @param country A number 1:41 for version A, 1:44 for version B, see WIOT$countries.
#' @param sector  A number 1:35 for version A, 1:56 for version B, see WIOT$sectors.
#' @return Level of upstreamness for selected country and sector / all sectors in the country
#'         / the same sector in all countries / all sectors in all countries.
#' @examples
#' get_io(year = 2004, version = "B")
#' construct()
#' upstr(34,12)
#'
#' upstr()
#'
#' upstr(,45)
#'
#' @export
#'

upstr <- function(country = NA, sector = NA){
  # Check if WIOT list exists

  if(exists("WIOT") == FALSE){
    message("WIOT data is missing? :-( Please use get_io() function.")
    stop()
  }

  # Extracting the variables out of the WIOT list

  for(i in 1:length(WIOT)){
    ##extracting the object value
    tempobj=WIOT[[i]]
    ##creating new variable with the original name of the list item
    eval(parse(text=paste(names(WIOT)[[i]],"= tempobj")))
  }

  # Verification of function inputs

  if(!( country %in% c(1:length(countries), NA))){
    message("Wrong country number. Please see WIOT$countries")
    stop()
  }

  if(!( sector %in% c(1:length(sectors), NA))){
    message("Wrong sector number. Please see WIOT$sectors")
    stop()
  }

  # Defining additional variable

  SN <- S*N # SNxSN is the size of intercountry input-output matrix
  CN <- C*N # CNxSN is the size of the intercountry final demand matrix
  x <- dataio[S*N+K, 1:(S*N)]  #Total output vector

  # Checking if construct() function was initiated

  if(length(FD) == 1){
    message("Please run the construct() function first.")
    stop()
  }

  # Manipulation of matrices (Ghosh inverse index, BB)

  BB <- (t(t(AA)*x)/x)
  BB[!is.finite(BB)] <- 0
  up <- solve ( diag(SN) - BB ) %*% matrix(1, nrow=SN)

  # Preparing columns for output

  kr <- rep(countries, each = S)
  sr <- rep(sectors, N)

  # Constructing output , four cases

  # 1. For all sectors and countries

  if( (is.na(country)) & (is.na(sector) ) ){
    up <- data.frame(kr,sr,up)
  }

  #2. For specific country and specific sector

  if( (!is.na(country)) & (!is.na(sector) ) ){
    up <- data.frame(countries[country],sectors[sector],up[(country-1)*S+sector, ])
  }

  #3. For specific country and all sectors

  if( (!is.na(country)) & (is.na(sector) ) ){
    up <- data.frame(kr,sr,up)[ ((country-1)*S+1) : (country*S),]
  }

  #4. For specific sector and all countries

  if( (is.na(country)) & (!is.na(sector) ) ){
    up <- data.frame(kr,sr,up)
    up <- subset(up, sr == sectors[sector])
  }

  names(up) <- c("Country", "Sector", "Upstreamness")
  row.names(up) <- NULL

  return(up)

}
