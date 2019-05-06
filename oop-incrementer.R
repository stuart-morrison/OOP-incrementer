#### An object oriented incrementer function
incrementer <- function(start = 1, step = 1,
                        minimum = NA, maximum = NA) {
    
    # Create a new environment and construct attributes
    x_envir <- new.env()
    assign(x = "value", envir = x_envir, value = start)
    assign(x = "start", envir = x_envir, value = start)
    assign(x = "step", envir = x_envir, value = step)
    assign(x = "minimum", envir = x_envir, value = minimum)
    assign(x = "maximum", envir = x_envir, value = maximum)
    
    # Set a incremental additional method
    up <- function() {
        eval(expr = substitute(expr = value <- min(value + step, maximum, na.rm = TRUE)), envir = x_envir)
        return(x_envir$value)
    }
    
    # Set a incremental subtraction method
    down <- function() {
        eval(expr = substitute(expr = value <- max(value - step, minimum, na.rm = TRUE)), envir = x_envir)
        return(x_envir$value)
    }
    
    # Return a sequence from the first non-zero value to the current value
    seq <- function() {
        if (x_envir$value == 0) {
            return(NULL)
        } else if (x_envir$value > 0) {
            return(seq.int(from = (x_envir$start), to = x_envir$value, by = x_envir$step))
        } else {
            return(seq.int(from = (x_envir$start), to = x_envir$value, by = -1 * x_envir$step))
        }
        
    }
    
    # Set the current value to the start value
    reset <- function() {
        eval(expr = substitute(expr = value <- start), envir = x_envir)
    }
    
    # Assign methods to the environment
    assign(x = "up", envir = x_envir, value = up)
    assign(x = "down", envir = x_envir, value = down)
    assign(x = "seq", envir = x_envir, value = seq)
    assign(x = "reset", envir = x_envir, value = reset)
    
    # Set the class to an incrementer type
    class(x_envir) <- c("incrementer")
    
    # Return the environment as an object
    return(x_envir)
    
}

# Set the default method to print incrementer types
print.incrementer <- function(x) {
    print(x$value)
}


