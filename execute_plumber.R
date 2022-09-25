# execute_plumber.R
# Execute plumber 
plumber::plumb(file='plumber.R')$run(host = '0.0.0.0', swagger = TRUE ,port = 8080)
