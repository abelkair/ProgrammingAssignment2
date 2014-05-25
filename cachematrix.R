## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## Creates a list of functions which combine to
## cache the inverse of a matrix.
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  
  get <- function() x
  setsolve <- function(solve) m <<-solve
  getsolve <- function() m
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)

}


## Write a short comment describing this function
## Outputs the cached inverse of matrix returned
## by makeCacheMatrix(), if it exists or calculates its own inverse.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getsolve()
  if ( ! is.null(m)) {
    print("getting cached data")
    #return(m)
  }
  else {
    m <- solve(x$get())
    x$setsolve(m) 
  }
  
  return(m)
}
