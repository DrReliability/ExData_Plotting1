# plot4.R
# author: DrReliability
# last update: 08/10/2014
# this script does the following:
# 1. run the data_setup.R script to check if the dataset has been 
#    downloaded and data read in.  If not, download from the given url, then
#    subset into the required dataset.  
#    If yes, the data set is then subset for the interval required,
#    and conditioned for use in the plotting
# 2. this plot routine plots a series of four graphs 
#    as indicated in the assignment guideline.
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
#}
# =======================================================================
# Plot4 - plot Energy sub metering vs time
par(mfrow=c(2,2))
# plot at (1,1)
plot(df1[,2],df1[,3], type="l", xlab="", ylab="Global Active Power (kilowatts)")
# plot at (1,2)
plot(df1[,2],df1[,5], type="l", xlab="datetime", ylab="Voltage")
# plot at (2,1)
plot(df1[,2],df1[,7], type="l", col="black", xlab="", ylab="Energy sub metering")
points(df1[,2],df1[,8], type="l", col="red")
points(df1[,2],df1[,9], type="l", col="blue")
legend(x="topright",                    # legend location   
       #       c(names(df1[,7],df1[,8],df1[,9])) # plotting items
       c(names(df1[,7:9])),             # plotting items
       border="black",
       lty=c(1,1),                      # ledend symbols (lines)
       lwd=c(1.0,1.0),                  # line thickness
       bty="n",                          # no legend box border
       col=c("black","red","blue"))     # color for each sub-metering plot
# plot at (2,2)
plot(df1[,2],df1[,4], type="l", xlab="datetime", ylab="Global_reactive_power")
# copy screen plot to png file with (width,height) = (480,480)
fname <- "plot4.png"
if(file.exists(fname)) file.remove(fname)

dev.copy(png, fname, width=480, height=480)
# must close device
dev.off()
