## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## create a object thats class is matrix that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
  mat <- NULL
  temp <- function(y) {
    x <<- y
    mat <<- NULL
  }
  use <- function() x
  tempInv <- function(inverse) mat <<- inverse
  useInv <- function() mat
  list(temp = temp,
  use = use,
  tempInv = tempInv,
  useInv = useInv)
}


## Write a short comment describing this function
## compute the inverse of the matrix created by the function above

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  mat <- x$useInv()
  if(!is.null(mat)){
        message("getting cached data")
        return(mat)
  }
  my_mat <- x$use()
  mat <- solve(my_mat, ...)
  x$tempInv(mat)
  mat
}