
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

fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile = "./data/cameras.csv", method = "curl")
print("Downloaded : ")
list.files("./data")

dateDownloaded <- date()
print("on date : ")
dateDownloaded 

sink()
