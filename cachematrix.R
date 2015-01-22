## This function is divided in two parts . The first takes a matrix, that you need
## to define, calculate the inverse and store the result in the cache.
## The second part of that function return the inverse, picking it frome the cache,
## if it's present, or simply calculating it.


makeCacheMatrix <- function(x = matrix()) {
        cache <- NULL
        
        setMatrix <- function(val) {
                x <<- val
                cache <<- NULL
        }
        
        getMatrix <- function() {
                x
        }
        
        cacheInverse <- function(solve) {
                cache <<- solve
        }

        getInverse <- function() {
                cache
        }
        
        list(setMatrix = setMatrix, getMatrix = getMatrix, cacheInverse = cacheInverse, getInverse = getInverse)

}


cacheSolve <- function(x, ...) {
        
        inverse <- x$getInverse()
        
        if(!is.null(inverse)) {
                message("getting cached data")
                return(inverse)
        }
        
        data <- x$getMatrix()
        inverse <- solve(data)
        x$cacheInverse(inverse)
        
        inverse
        
}
