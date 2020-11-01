## Creating a custom matrix "vector",
## which has the following 4 functions
## get, set, setinverse, getinverse
makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) inv <<- inverse
  getinverse <- function() inv
  list(get = get, set = set,
       setinverse = setinverse, 
       getinverse = getinverse)
}


## Computes and caches the inverse for the
## special matrix defined using the function above
cacheSolve <- function(x, ...) {
  inv <- x$getinverse()
  if(!is.null(inv)) {
    message("Getting cached inverse of a matrix")
    return(m)
  }
  
  matrix <- x$get()
  inv <- solve(matrix, ...)
  x$setinverse(inv)
  inv
}
