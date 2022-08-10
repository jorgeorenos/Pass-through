# ciclo para encontrar los n valores mínimos

minimos <- function(x, n){
  
  mins <- c()
  
  for (i in c(1:n)) {
  
    mins[i] <- min(x)
    
    x <- x[x!=min(x)]
    
      
  } 
  
  return(mins)
}
