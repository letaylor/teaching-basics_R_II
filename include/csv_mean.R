#!/usr/bin/env Rscript
# ---------------------------------------------------------------------------
# csv_mean.R - silly demo R script
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
    make_option(c("-f", "--file"), 
              type="character", 
              default="None", 
              help="Input csv file. Should have headers. (Required)")
)

parser <- OptionParser(
  usage="%prog -f file", 
  option_list=optionList,
  description = "\nCalculates the mean for each column in a csv file."
)

# parse input arguments
arguments <- parse_args(parser, positional_arguments=T)
##############################################################################


###################### Required Packages #####################################
##############################################################################


###################### Defined Functions #####################################
##############################################################################


###################### Call Some Functions ###################################
if (arguments$options$file == "None") {
  # if name is not defined, stop the script and print an error
  stop("Please provide a file")
} else {
  # read in the data
  dat = read.csv(arguments$options$file, header=T, sep = ",")
  
  # get the mean for each column and transpose the list
  output = t(colMeans(dat))
  
  # write the std err to out
  write.csv(output, stdout(), quote=F, row.names=F)
}
##############################################################################

