#!/usr/bin/env Rscript
# ---------------------------------------------------------------------------
# rscript_demo.R - silly demo R script
# 
# The MIT License (MIT)
#
# Copyright (c) 2014 <your_name>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
# ---------------------------------------------------------------------------
# AUTHOR
# <your_name> - <your_email>
#
# DATE
# xx/xx/xxxx


################### Read Command Line Parameters #############################
suppressPackageStartupMessages(library(optparse))
optionList <- list(
    make_option(c("-n", "--name"), 
              type="character", 
              default="None", 
              help="Your name (Required)"),
 
    make_option(c("-f", "--friend"), 
              type="character", 
              default="None", 
              help="Your friend's name (Optional)")
)

parser <- OptionParser(
  usage="%prog -n your_name", 
  option_list=optionList,
  description = "\nA demo command line Rscript\n\nOutput:\n\tA line"
)

# parse input arguments
arguments <- parse_args(parser, positional_arguments=T)
##############################################################################


###################### Required Packages #####################################
#suppressPackageStartupMessages(library(ggplot2))
##############################################################################


###################### Defined Functions #####################################
### A silly hello function
### The friend variable defaults to None
print_hello <- function(name, friend = "None") {
  
  # write to stdout
  print(paste("Hello", name), stdout())
  
  if (friend == "None") {
    # if there is no value for friend...  
    print(paste("You have no friends"), stdout())
  } else {
    # otherwise, friend is defined
    print(paste("Your friend is", friend), stdout())
  }
}

### You could also have a plotting function
# plot_function <- function() {
#   pdf(file=paste("some_plot", ".pdf", sep = ""), height=9, width=10)
#   # your plot command
#   ggplot(data, aes(x=x, y=y)) + theme_bw()
#   dev.off()
# }
##############################################################################


###################### Call Some Functions ###################################
if (arguments$options$name == "None") {
  # if name is not defined, stop the script and print an error
  stop("Please provide your name")
} else {
  # if name is defined, call the main function
  print_hello(arguments$options$name, arguments$options$friend) 
}

#plot_function()
##############################################################################

