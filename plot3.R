# plot3.R
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
# =============================================================================
# although I could have assumed that the table has been read in and conditioned,
# it does not guarantee that the dataset has not be messed up, so it is safer to
# clear the work space and re-read the data and re-subset it again.  It may take
# a little bit more time, but it guarantees that I have the correct data
# =============================================================================
# step 1: make sure that the data set is ready
# make sure the console is clear
rm(list=ls())
# the dataset is always re-read and subset again in case other operations have
# been down to the dataset read in before this plot is run
source("data_setup.R")
# 
# if very sure that the original dataset is still intact and can be used, I 
# can skip the about and use the following to skip the data conditioning:
# =======================================================================
## if the data object "df1" exists and we are sure that we have not messed 
##     it up, that means we can skip the download and data conditioning.
## if "df1" does not exist, then need to do it again.
# if (!exists("df1")) {
#     rm(list=ls())
#     source("data_setu.R")
}
# =======================================================================
# Plot3 - plot Energy sub metering vs time
lname <- c(names(df1[7:9])) # legend names
windows(width=5, height=5)
#dev.new(width=7, height=7)
par(mfrow=c(1,1))
plot(df1[,2],df1[,7], type="l", col="black", xlab="", ylab="Energy sub metering")
points(df1[,2],df1[,8], type="l", col="red")
points(df1[,2],df1[,9], type="l", col="blue")
legend(
       x="topright",                 # legend location   
       lname,                        # legend names
       border="black",               # black box border
       lty=c(1,1),                   # legend symbols (lines)
       lwd=c(1.0,1.0),               # line thickness
       x.intersp=1.0,
       y.intersp=1.35,
       col=c("black","red","blue")) # color for each sub-metering plot
# copy screen plot to png file with (width,height) = (480,480)
fname <- "plot3.png"
if(file.exists(fname)) file.remove(fname)
dev.copy(png, fname, width=480, height=480)
# must close device
dev.off()
