# data_setup.R
# author: DrReliability
# last update: 08/09/2014
# this script does the following:
# 1. set working directory
# 2. set download url, zip file and text file names
# 3. check if the data text file is already in the directory, if not, 
#    download from url and unzip into text data file, if yes, skip downloading
# 4. subset data set to include data for the given dates Feb 1, 2007 - Feb 2, 2007
# 5. convert data type for the first two columns to character data type &
#    the rest to numeric data type
# 6. combine first two columns and convert to data time data type using
#    strptime function and store in column 2
# the dataset is now ready for plotting
#=======================================================================
# step 1: set working directory where files will be stored on local computer
setwd("H:/00 exdata-005")
#
# step 2: set the url location and name of the downloaded file
dl.location <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
dl.zipfile <- "./household_power_consumption.zip"
dl.file <- "household_power_consumption.txt"
#
# step 3: if file has not been downloaded, download it from the dl.location
if(!file.exists(dl.file)){
  download.file(dl.location, dl.zipfile)
  unzip(dl.zipfile)
}
# read data into R
df <- read.table(dl.file, header=TRUE, sep=";", na.strings="?")
# check data to make sure they are ok
head(df[,1:3])
# step 4: subset data to data set containing only the dates required
df1 <- df[df[,1]=="1/2/2007" | df[,1]=="2/2/2007",]
head(df1[,1:3])
# step 5: change data to numeric data instead of categorical data
df1[,1] <- as.character(levels(df1[,1]))[df1[,1]]
df1[,2] <- as.character(levels(df1[,2]))[df1[,2]]
# step 6: combine date and time into one data column 0 use the time column
x <- paste(df1[,1],df1[,2])       # merge first and second column data
# use strptime to convert to date time data set and stored in second column
df1[,2] <- data.frame(strptime(x, "%d/%m/%Y %H:%M:%S"))
# check data to make sure that it is merged correctly
# data set df1 is ready for plotting
head(df1[,1:3])
