#' Construct technical matrices
#'
#' @return WIOT A list containig input-output table and other parameters. Function adds/updates
#'   Leontieff Inverse L, technical coefficient matrix A, Final Demand matrix, value added per
#'   unit of gross output vector.
#' @examples
#' get_io(year = 2009, version = "B")
#' construct()
#'
#' get_io(2008)
#' construct()
#'
#' @export

construct <- function(){


# Check if WIOT list exists

  if(exists("WIOT") == FALSE){
    message("WIOT data is missing? :-( Please run the get_io() function first.")
    stop()
  }


# Extracting the variables out of the WIOT list

  for(i in 1:length(WIOT)){
    ##extracting the object value
    tempobj=WIOT[[i]]
    ##creating new variable with the original name of the list item
    eval(parse(text=paste(names(WIOT)[[i]],"= tempobj")))
  }


# Defining additional variables

  SN <- S*N # SNxSN is the size of intercountry input-output matrix
  CN <- C*N # CNxSN is the size of the intercountry final demand matrix


# Constructing matrices

  Z <- dataio[1:SN, 1:SN]      #Intercountry input-output matrix
  x <- dataio[S*N+K, 1:(S*N)]  #Total output vector
  w <- dataio[VADrow, 1:(S*N)]   #Value Added vector
  F1 <- dataio[1:SN, (SN+1):(SN+C*N)] #Final demand matrix



# Matrix A gives the intermediate input required per unit of gross output (A is the technical coefficient matrix)

 A <- matrix(nrow=SN, ncol=SN)

 for (i in 1: SN){
   A[i,] <- Z[i,] / x
   }

 A[!is.finite(A)] <- 0



# Summing final demand categories accross countries in Final demand matrix.

 F2 <- sapply(seq(1, ((N*5 - 1)), by=5),function(i) rowSums(F1[,i:(i+4)]))


# Vector v represents the value added generated per unit of gross output

 v <- as.vector(t(w) / x)

 v[!is.finite(v)] <- 0


# Diagonal matrix from value added per unit of gross output

 v1 <- (diag(v))


# Calculating the Leontief Inverse (L is the Leontief coefficient matrix)

 L <- solve(diag(SN) - A)

WIOT$LeoInv <<- L
WIOT$FD <<- F2
WIOT$VA <<- v1
WIOT$AA <<- A
}
