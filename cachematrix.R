## the "makeCacheMatrix" is a constructor functionfunction whose main goal
## is to reduce overhead by storing commonly used information by other 
## functions such as the "cacheSolve" function below.
## the "make..." function is a set of functions which combine to
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

## the :cacheSolve" function outputs
## the cached inverse of matrix returned by "makeCacheMatrix()",
## if it exists or calculates its own inverse otherwise.

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
