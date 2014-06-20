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

<<<<<<< HEAD
#### Testing cacheSolve()

#Call the makeCacheMarix() function and assign it to 'm'
=======
#Call the makeVector() function and assign it to 'm'
>>>>>>> b827b3b3781a620592f09e526615b556b45ef804
m <- makeCacheMatrix()

#use m's set function to create a matrix
m$set(rbind(c(1, -1/4), c(-1/4, 1)))

#use m's get function to retrieve the matrix created 
m$get()

#pass the list m to the cacheSolve() function: the inverse
#  matrix should be returned
cacheSolve(m)

#pass the list m to the cacheSolve() function a second time
# the inverse should be retreived from the cache accompanied by
# a message "retrieving value from cache" 
cacheSolve(m)

<<<<<<< HEAD
### Reference:

# The testing procedure imitated from Adam Gruer's post on 
# the discussion forums
=======

>>>>>>> b827b3b3781a620592f09e526615b556b45ef804
