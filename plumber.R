#
# This is a Plumber API. You can run the API by clicking
# the 'Run API' button above.
#
# Find out more about building APIs with Plumber here:
#
#    https://www.rplumber.io/
#

library(plumber)
library(epanetReader)
library(tidyr)

n1 <- read.inp("Hanoi_CMH_Scenario-1.inp")

# Enable CORS Filtering
#' @filter cors
cors <- function(req,res)
{
  res$setHeader("Access-Control-Allow-Origin","*")
  if(req$REQUEST_METHOD == "OPTIONS")
  {
    res$setHeader("Access-Control-Allow-Origin","POST")
    res$setHeader("Access-Control-Allow-Headers",req$HTTP_ACCESS_CONTROL_REQUEST_HEADERS)
    res$status <- 200
    return (list())
  }
  else
  {
    plumber::forward()
  }
}



#* @apiTitle Water Pipes API
#* @apiDescription Components of the pipes include material roughness and diameter 
#* @get /pipes
function() {
  n1$Pipes
}


#* @apiTitle Pipeline Junctions 
#* @apiDescription Water Pipeline Junction Display values 
#* @get /junctions
function(){
  n1$Junctions
}

#* @apiTitle Reservoirs 
#* @apiDescription Reservoirs Description
#* @get /reservoirs
function(){
  n1$Reservoirs
}

#* @apiTitle Coordinates
#* @apiDescription Coordinates Description
#* @get /coordinates
function(){
  n1$Coordinates
}

#* @apiTitle Backdrop
#* @apiDescription Backdrop Description
#* @get /backdrop
function(){
  n1$Backdrop
}

#* @apiTitle Times
#* @apiDescription Times Description
#* @get /backdrop
function(){
  n1$Times
}

#* @apiTitle Reactions
#* @apiDescription Reactions Description
#* @get /reactions
function(){
  n1$Reactions
}

#* @apiTitle Energy
#* @apiDescription Energy
#* @get /energy
function(){
  n1$Energy
}




#* @preempt cors
#* @get /myroute
myRoute <- function() {
  # Do some CORS requests!
}






