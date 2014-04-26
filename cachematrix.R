## In these functions,we are caching the computational values & saving time .

## First function-i.e makeCacheMatrix here we are creating special matrix,which 
##contains functions (a) set the value of the matrix (b)get the value of matrix
##(c)set the value of the solve(i.e Inverse mean) (d) get the value of the solve
##(i.e Inverse mean)
##Second function-cacheSolve , it calculates the Inverse matrix of the special
##matrix(as defined above),function first checks whether the Inverse is already
##calculated, if it is ,then it will fetch it from cache & will not compute it again
##and return the prevoiusly stored value,otherwise it calculates the Inverse matrix
##and store it in cache by setInverse function & returns the value .

## Creating special matrix

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setInverse <- function(solve) m <<- solve
        getInverse <- function() m
        list(set = set, get = get,
             setInverse = setInverse,
             getInverse = getInverse)
}
## calculating Inverse matrix of special matrix through cache or computation.

cacheSolve <- function(x, ...) {
         m <- x$getInverse()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setInverse(m)
        m
}
