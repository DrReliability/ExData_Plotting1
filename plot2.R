# plot2.R
# author: DrReliability
# last update: 08/10/2014
# this script does the following:
# 1. run the data_setup.R script to check if the dataset has been 
#    downloaded and data read in.  If not, download from the given url, then
#    subset into the required dataset.  
#    If yes, the data set is then subset for the interval required,
#    and conditioned for use in the plotting
# 2. this plot routine plots a line graph of the "Global Active Power" vs 
#    datetime as indicated in the assignment guideline.
# step 1: make sure that the data set is ready
# make sure the console is clear
rm(list=ls())
# the dataset is always re-read and subset again in case other operations have
# been down to the dataset read in before this plot is run
source("data_setup.R")
# 
# Plot2 - plot Global active power vs time
# plot Global Active Power vs datetime
par(mfrow=c(1,1))
plot(df1[,2],df1[,3], type="l", xlab="", ylab="Global Active Power (kilowatts)")
# copy screen plot to png file with (width,height) = (480,480)
fname <- "plot1.png"
if(file.exists(fname)) file.remove(fname)
# copy the screen plot to a png file with specified size
# if plot is written directly to file without going to screen, use the following
# png("plot1.png", width=480, height=480) 
dev.copy(png, fname, width=480, height=480)
# must close device
dev.off()

