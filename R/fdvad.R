#'Final demand decomposition for selected country and sector
#'
#' @param country A number 1:41 for version A, 1:44 for version B, see WIOT$countries.
#' @param sector  A number 1:35 for version A, 1:56 for version B, see WIOT$sectors.
#' @return A list contains title, country, year, sector and the final demand decomposition.
#' @examples
#' get_io(year = 2004, version = "B")
#' construct()
#' fdvad(34,12)
#'
#' fdvad(12,11)
#'
#' @export
#'

fdvad <- function(country=10, sector=15){

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

  # Verification of function input (country and sector)

  if(!( country %in% c(1:length(countries)))){
    message("Wrong country number. Please see WIOT$countries")
    stop()
  }

  if(!( sector %in% c(1:length(sectors)))){
    message("Wrong sector number. Please see WIOT$sectors")
    stop()
  }


  # Defining additional variable

  SN <- S*N # SNxSN is the size of intercountry input-output matrix
  CN <- C*N # CNxSN is the size of the intercountry final demand matrix

  # Checking if construct() function was initiated

  if(length(FD) == 1){
    message("Please run the construct() function first.")
    stop()
  }

  FD1 <- matrix(0,  nrow = SN, ncol = CN)   #creating empty matrix SNxCN
  licz <- (country-1)*S + sector            #counter for selected country and industry
  FD1[licz,] <- FD[licz,]                   #selection of the country/sector final demand

  # Calculation of value added amounts of all countries in the sectoral final demand of selected country

  FD1 <- as.matrix(rowSums(FD1))
  q1 <- VA %*% LeoInv %*% FD1



  # Summation and ordering

  kol <- seq_along(q1)
  q2 <- tapply(q1,rep(kol,each=S)[kol],FUN=sum)

  q2 <- 100*round(q2 / sum(q2), 7)

  rownames(q2) <- countries

  q2 <- q2[order(q2, decreasing=TRUE)]


  # Preparing description of output


  q3 <- list("Decomposition of Final Demand in respect to value added from source countries", countries[country],
             year, sectors[sector], q2)

  names(q3) <- c("Title", "Country","Year", "Sector","FDVAD")

  return(q3)
}
