## Put comments here that give an overall description of what your
## functions do

##There are two functions makeCacheMatrix, makecachematrix
##makeCacheMatrix consists of set,get,setinv, getinv
##library(MASS) is used to calculate inverse for non squared as well as square matrices
library(MASS)
makeCacheMatrix <- function(x = matrix()) {
  inv<-NULL
  set<-function(y){
                  x<<-y
                  inv<<-NULL
                   }
  get<-function()x               #function to get matrix x 
  setinv<-function(inverse)inv<<-inverse
  getinv<-function(){
                    inver<-ginv(x)
                    inver%%x               #function to obtain inverse of the matrix
                    }
 list(set = set, get = get,
      setinv = setinv,
      getinv = getinv)
}


## write a short comment describing this function
##this is used to get the cache data

cachesolve <- function (x, ...) ##gets cache data
{
  inv<-x$getinv()
  if(lis.null(inv)){                        #checking wheater inverse is NULL
                                    message("getting cached data!")
                                     return(inv)                   #return inverse value
  }
  data<-x$get()
  inv<-solve(data,...)
  x$setinv(inv)
  inv   ##Return a matrix that is the inverse value
}