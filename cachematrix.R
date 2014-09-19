## functions for work with matrices that cache theirs inverses

## create an OOP-style matrix object thac can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
  solved = NULL
  matrix = x
  
  set = function(m){
    matrix <<- m
    solved <<- NULL
  }
  
  get = function() matrix
  
  setsolve = function(s) solved <<- s
  
  getsolve = function() solved
  
  list(set = set, get=get, setsolve = setsolve, getsolve = getsolve)
}

# computes inverse of makeCacheMatrix' matrix
cacheSolve <- function(x, ...) {
        if(!is.null(x$getsolve())){
          return(x$getsolve())
        }
        
        s = solve(x$get())
        x$setsolve(s)
        
        s
}
