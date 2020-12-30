## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
install.packages('MASS')
library(MASS)
makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y){
    x <<- y
    inv <<- NULL
  }
  get <- function() {
    x
  }
  setInverse <- function(inverse){
    inv <-- inverse
  }
  getInverse <- function(){
    inv
  }
  list(set=set,get=get,setInverse=setInverse,getInverse=getInverse)

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  inv <- x$getInverse()
  if(!is.null(inv)){
    message('Getting the cached Data')
    return(inv)
  }
  mat <- x$get()
  inv <- solve(mat,...)
  x$setInverse(inv)
  inv
          ## Return a matrix that is the inverse of 'x'
}

mat1 <- makeCacheMatrix(matrix(c(1,4,7,4,3,8,6,3,2,7,0,3,1,4,7,3),4,4))
mat1$get()
mat1$getInverse()

cacheSolve(mat1)
