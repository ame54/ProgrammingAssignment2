## Put comments here that give an overall description of what your
## functions do

## Functions designed to calcualte an inverse fo a matrix an dstore result in cahce memory to save computational time for repeat processing

## Write a short comment describing this function
## Holds inverse of a matrix in the cache special object
makeCacheMatrix <- function(x = matrix()) 
{
	m <- NULL
  
  # function to set matrix object
  set <- function(y)  
  {
      x <<- y
      m <<- NULL
  }
  
  get <- function() 
  {
	x
  }
  
  setinverse <- function(inverse) 
  {
      m <<- inverse
  }
  
  # function to get inverse object
  getinverse <- function() 
  {
	m
  }
  
  # returns list of functions
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Write a short comment describing this function
## Calculates the inverse of the matrix returned by make chace function, 
## by either doing calculation or looking into the cache if already done before

cacheSolve <- function(x, ...) 
{
  ## inverse matrix
  m <- x$getinverse()
  
  # Check the cache
  if (!is.null(m)) {
      message("getting cached inverse matrix")
      return(m)
  }
  
  # inverse and cache
  origmatrix <- x$get()
  m <- solve(origmatrix)
  x$setinverse(m)
  m
}
