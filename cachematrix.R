## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  inversa <- NULL
  set <- function(y) {
    x <<- y
    inversa <<- NULL
  }
  get <- function(){x}
  setInversa <- function(inversacalculada)(inversa <<- inversacalculada)
  getInversa <- function() (inversa)
  list(set = set, get = get,
       setInversa = setInversa,
       getInversa = getInversa)
}
}
