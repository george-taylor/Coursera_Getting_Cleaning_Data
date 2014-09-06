# check that the data file exists, if not, exit
if (!file.exists("/Users/geo/Code/octocats/Coursera_Getting_Cleaning_Data/ss06hid.csv")) {
          stop("Directory /Users/geo/Code/octocats/Coursera_Getting_Cleaning_Data/ss06hid.csv does not exist.")
    }

# set the working directory 
setwd("/Users/geo/Code/octocats/Coursera_Getting_Cleaning_Data/")

# read the csv file and place in data frame
housing <- read.csv("ss06hid.csv")

# what are the column names of the dataset?
names(housing)

# what are the dimensions the dataset?
dim(housing)

# Extract the first 2 rows of the data frame and print them to the console. 
housing[1:2,]

# extract the property value column "VAL", column 37
property_value <- housing[,37]
# filter out the NAs
good <- complete.cases(property_value)
# what is the max value ? should be 24, corresponding to $1,000,000 +
max(property_value[good])
# How many properties are worth $1,000,000 or more? 
sum(property_value[good] == 24)

# which libraries/packages are currently loaded?
path.package()
# if need be: install.packages("XML")
library(XML)

## fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
## doc <- xmlTreeParse(fileUrl, useInternal=TRUE)
doc <- xmlTreeParse("./restaurants.xml", useInternal=TRUE)
rootNode <- xmlRoot(doc)


########################################################################################
########################################################################################
########################################################################################
########################################################################################

# How many missing values are in the Ozone column of this data frame?
ozone <- housing[,1]
good <- complete.cases(ozone)
missing <- length(ozone) - length(ozone[good])
missing

# What is the mean of the Ozone column in this dataset? Exclude missing values (coded as NA) from this calculation.
mean(ozone[good])

# Extract the subset of rows of the data frame where Ozone values are above 31 and Temp values are above 90. 
# What is the mean of Solar.R in this subset?
# get the Ozone, Solar.R and Temp columns from the dataframe
columns <- c(1,2,4)
triad <- housing[,columns]
names(triad)
good <- complete.cases(triad)
hold <- triad[good, ][,1:3]

o <- hold[,1] > 31
t <- hold[,3] > 90

mean(hold[t,2])

# What is the mean of "Temp" when "Month" is equal to 6? 
columns <- c(4,5)
duple <- housing[,columns]  
names(duple)
month <- duple[,2] == 6
mean(duple[month,1])

# What was the maximum ozone value in the month of May (i.e. Month = 5)?
columns <- c(1,5)
duple <- housing[,columns]  
names(duple)
good <- complete.cases(duple)
hold <- duple[good, ][,1:2]

month_subset <- hold[,2] == 5
ozone_vector <- hold[month_subset,1]
max(ozone_vector) 

