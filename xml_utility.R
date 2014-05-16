
# check that the data dir exists, if not, exit
if (!file.exists("/Users/geo/Code/octocats/Coursera_Getting_Cleaning_Data/")) {
        stop("Directory /Users/geo/Code/octocats/Coursera_Getting_Cleaning_Data/ does not exist.")
    }

# set the working directory 
setwd("/Users/geo/Code/octocats/Coursera_Getting_Cleaning_Data/")

sink("sink_utility.txt")

# check that the data dir exists, if not, create it
if (!file.exists("/Users/geo/Code/octocats/Coursera_Getting_Cleaning_Data/data/")) {
        dir.create("/Users/geo/Code/octocats/Coursera_Getting_Cleaning_Data/data/")
        # set the working directory 
#setwd("/Users/geo/Code/octocats/Coursera_Getting_Cleaning_Data/data")
    }

# fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata/data/restaurants.xml"
download.file(fileUrl, destfile = "./data/restaurants.xml", method = "curl")

print("Downloaded : ")
list.files("./data")

dateDownloaded <- date()
print("on date : ")
dateDownloaded 

library(XML)
doc <- xmlTreeParse(fileUrl, useInternal=TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)
names(rootNode)

#rootNode[[1]][[5]]

#xmlSApply(rootNode, xmlValue)
#ZIPS <- xpathSApply(rootNode, "//zipcode", xmlValue)
xpathSApply(rootNode, "//zipcode", xmlValue)

sink()
