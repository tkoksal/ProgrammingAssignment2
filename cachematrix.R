## Put comments here that give an overall description of what your
## functions do

## The first function, makeCacheMatrix(), creates a list of 4 functions
## that do the following:
#   1. set the value of a matrix
#   2. get the value of the matrix
#   3. set the value of the inverse matrix
#   4. get the value of the inverse matrix

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
    get <- function() x
    setinv <- function(inverse) inv <<- inverse
    getinv <- function() inv
    list(set = set, get = get,
         setinv = setinv,
         getinv = getinv)
}

## cacheSolve() function computes the inverse of a matrix and when
## the function is called for the second time, the inverse is 
## retreived from the cache...

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    inv <- x$getinv()
    if(!is.null(inv)) {
        message("retrieving value from cache")
        return(inv)
    }
    data <- x$get()
    inv <- solve(data, ...)
    x$setinv(inv)
    inv
}

#### Testing cacheSolve()

#Call the makeCacheMarix() function and assign it to 'm'
m <- makeCacheMatrix()

#use m's set function to create a matrix
m$set(rbind(c(1, -1/4), c(-1/4, 1)))

#use m's get function to retrieve the matrix created 
(c <- m$get())

#pass the list m to the cacheSolve() function: the inverse
#  matrix should be returned
cacheSolve(m)

#pass the list m to the cacheSolve() function a second time
# the inverse should be retreived from the cache accompanied by
# a message "retrieving value from cache" 
cacheSolve(m)

# Test that the resulting matrix is indeed the inverse.
# matrix multiplication of a marix by its inverse should be 
# equal to the identity matrix

c_inverse <- cacheSolve(m)
c %*% c_inverse # multiplication of the matrix by its inverse

### Reference:

# The testing procedure imitated from Adam Gruer's post on 
# the discussion forums
